Content-Type: multipart/mixed; boundary="===============5476804285006077803=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+821 bytes kernel size regression] [i386-tinyconfig] [44f9a39ceb] driver core: Expose device link details in sysfs
Date: Tue, 19 May 2020 03:31:40 +0800
Message-ID: <20200518193140.GA30482@ce0684605f63>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5476804285006077803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +821 bytes kernel size regression due to commit:

commit: 44f9a39ceb6b0ae7e12f40697b45aa759ff9207a (driver core: Expose devic=
e link details in sysfs)
url: https://github.com/0day-ci/linux/commits/Saravana-Kannan/driver-core-E=
xpose-device-link-details-in-sysfs/20200518-150746

Details as below (size data is obtained by `nm --size-sort vmlinux`):

93d2e432: of: platform: Batch fwnode parsing when adding all top level devi=
ces
44f9a39c: driver core: Expose device link details in sysfs

+--------------------------------------+----------+----------+-------+
|                symbol                | 93d2e432 | 44f9a39c | delta |
+--------------------------------------+----------+----------+-------+
| nm.T.device_link_add                 | 570      | 915      | 345   |
| bzImage                              | 439616   | 439840   | 224   |
| nm.t.device_link_dev_release         | 0        | 175      | 175   |
| nm.d.devlink_class                   | 0        | 60       | 60    |
| nm.t.kref_put                        | 0        | 41       | 41    |
| nm.T.device_links_driver_cleanup     | 95       | 127      | 32    |
| nm.t.__device_links_no_driver        | 84       | 111      | 27    |
| nm.t.flags_show                      | 0        | 21       | 21    |
| nm.r.devlink_group                   | 0        | 20       | 20    |
| nm.T.device_del                      | 490      | 510      | 20    |
| nm.t.__device_link_del               | 54       | 72       | 18    |
| nm.T.device_links_check_suppliers    | 165      | 183      | 18    |
| nm.d.dev_attr_flags                  | 0        | 16       | 16    |
| nm.t.devlink_class_init              | 0        | 15       | 15    |
| nm.T.device_link_remove              | 59       | 74       | 15    |
| nm.T.device_links_driver_bound       | 226      | 241      | 15    |
| nm.T.device_link_del                 | 23       | 34       | 11    |
| nm.T.device_links_no_driver          | 73       | 82       | 9     |
| nm.T.device_links_busy               | 86       | 95       | 9     |
| nm.T.device_links_unbind_consumers   | 122      | 131      | 9     |
| nm.d.devlink_attrs                   | 0        | 8        | 8     |
| nm.d.devlink_groups                  | 0        | 8        | 8     |
| nm.t.__device_links_queue_sync_state | 103      | 109      | 6     |
| nm.t.device_reorder_to_tail          | 77       | 80       | 3     |
| nm.t.device_is_dependent             | 95       | 98       | 3     |
| nm.R.linux_banner                    | 164      | 163      | -1    |
| nm.t.__device_link_free_srcu         | 44       | 24       | -20   |
| nm.t.device_link_put_kref            | 29       | 0        | -29   |
| nm.t.device_link_drop_managed        | 33       | 0        | -33   |
+--------------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot


--===============5476804285006077803==--

