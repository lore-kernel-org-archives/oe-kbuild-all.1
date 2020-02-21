Content-Type: multipart/mixed; boundary="===============1161182391750380489=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+1515 bytes kernel size regression] [i386-tinyconfig] [b8b6f49af5] vfs: syscalls: Add create_automount() and remove_automount()
Date: Fri, 21 Feb 2020 11:09:08 +0800
Message-ID: <20200221030855.GA131417@e50d7db646c3>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1161182391750380489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +1515 bytes kernel size regression due to commit:

commit: b8b6f49af56bdc39d8ad5a21f8a933b779edd9b3 (vfs: syscalls: Add create=
_automount() and remove_automount())
url: https://github.com/0day-ci/linux/commits/David-Howells/vfs-syscalls-Ad=
d-create_automount-and-remove_automount/20200221-103921

Details as below (size data is obtained by `nm --size-sort vmlinux`):

dff527e7: m68k: Switch to asm-generic/hardirq.h
b8b6f49a: vfs: syscalls: Add create_automount() and remove_automount()

+---------------------------------+----------+----------+-------+
|             symbol              | dff527e7 | b8b6f49a | delta |
+---------------------------------+----------+----------+-------+
| nm.T.__se_sys_remove_mountpoint | 0        | 358      | 358   |
| nm.T.sys_remove_mountpoint      | 0        | 358      | 358   |
| bzImage                         | 440272   | 440560   | 288   |
| nm.T.__se_sys_create_mountpoint | 0        | 236      | 236   |
| nm.T.sys_create_mountpoint      | 0        | 236      | 236   |
| nm.T.vfs_remove_mountpoint      | 0        | 127      | 127   |
| nm.t.may_delete                 | 156      | 220      | 64    |
| nm.T.vfs_create_mountpoint      | 0        | 61       | 61    |
| nm.T.vfs_rename                 | 635      | 693      | 58    |
| nm.t.retry_estale               | 0        | 23       | 23    |
| nm.D.sys_call_table             | 1756     | 1764     | 8     |
| nm.T.do_unlinkat                | 352      | 355      | 3     |
| nm.T.do_symlinkat               | 131      | 129      | -2    |
| nm.T.do_rmdir                   | 272      | 270      | -2    |
| nm.T.do_mknodat                 | 347      | 345      | -2    |
| nm.t.do_renameat2               | 809      | 805      | -4    |
| nm.T.do_mkdirat                 | 144      | 137      | -7    |
+---------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot


--===============1161182391750380489==--

