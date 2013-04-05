
(cl:in-package :asdf)

(defsystem "tabletop_object_detector-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :arm_navigation_msgs-msg
               :geometry_msgs-msg
               :household_objects_database_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "TabletopDetectionResult" :depends-on ("_package_TabletopDetectionResult"))
    (:file "_package_TabletopDetectionResult" :depends-on ("_package"))
    (:file "Table" :depends-on ("_package_Table"))
    (:file "_package_Table" :depends-on ("_package"))
  ))