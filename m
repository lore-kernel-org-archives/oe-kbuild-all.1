Content-Type: multipart/mixed; boundary="===============7223050389619953987=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+742 bytes kernel size regression] [i386-tinyconfig] [dff9e53ca2] iov_iter: add copy_struct_from_iter()
Date: Mon, 11 May 2020 12:38:00 +0800
Message-ID: <5eb8d6a8.OepWDaFbRU8MR+/d%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7223050389619953987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +742 bytes kernel size regression due to commit:

commit: dff9e53ca2b049d3c35fe2576283093abd1030c8 (iov_iter: add copy_struct=
_from_iter())
https://github.com/osandov/linux.git rwf-encoded

Details as below (size data is obtained by `nm --size-sort vmlinux`):

22398e84: btrfs: remove unused function heads_to_leaves
dff9e53c: iov_iter: add copy_struct_from_iter()

+----------------------------+----------+----------+-------+
|           symbol           | 22398e84 | dff9e53c | delta |
+----------------------------+----------+----------+-------+
| nm.T.copy_struct_from_iter | 0        | 742      | 742   |
| bzImage                    | 439392   | 439776   | 384   |
+----------------------------+----------+----------+-------+



Thanks,
Kbuild test robot

--===============7223050389619953987==--

