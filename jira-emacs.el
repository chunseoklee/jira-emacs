(require 'url)
(require 'url-http)
(require 'json)

(defvar jira-issue-url "http://10.113.136.204/jira/rest/api/2/issue/")
(defvar jira-project-url "http://10.113.136.204/jira/rest/api/2/project/")
(defvar jira-search-url "http://10.113.136.204/jira/rest/api/2/search?jql=")
(defvar myid "chunseok.lee")
(defvar myproject "TCAR")


(defun jira-get-all-issues (projectname)
  (let ((url-request-method "GET")
        (hexstr (url-hexify-string projectname))
        ;; FIXME : IDK proper auth method
        ;; this extra header requests userid/password and set cookie
        (url-request-extra-headers
         '(("Authorization: Basic" . "AA"))))
    (url-retrieve (concat jira-search-url "project=" hexstr "&fields=*none") 
                  (lambda (status) (switch-to-buffer (current-buffer))))))

(defun jira-get-project (str)
  (let ((url-request-method "GET")
        (hexstr (url-hexify-string str))
        ;; FIXME : IDK proper auth method
        ;; this extra header requests userid/password and set cookie
        (url-request-extra-headers
         '(("Authorization: Basic" . "AA"))))
    (url-retrieve (concat jira-project-url hexstr) 
                  (lambda (status) (switch-to-buffer (current-buffer))))))

(defun jira-get-issue (str)
  (let ((url-request-method "GET")
        (hexstr (url-hexify-string str))
        ;; FIXME : IDK proper auth method
        ;; this extra header requests userid/password and set cookie
        (url-request-extra-headers
         '(("Authorization: Basic" . "AA"))))
    (url-retrieve (concat jira-issue-url hexstr) 
                  (lambda (status) (switch-to-buffer (current-buffer))))))
