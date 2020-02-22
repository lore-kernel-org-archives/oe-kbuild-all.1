Content-Type: multipart/mixed; boundary="===============4940561577972275296=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+882 bytes kernel size regression] [i386-tinyconfig] [6d572cf419] parse_integer: sane integer parsing
Date: Sat, 22 Feb 2020 09:00:37 +0800
Message-ID: <5e507d35.N1ao71CRQBSkxs5r%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4940561577972275296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +882 bytes kernel size regression due to commit:

commit: 6d572cf419620608f2cf510c4903fb9bb0fdf538 (parse_integer: sane integ=
er parsing)
https://github.com/Villemoes/linux parse-integer

Details as below (size data is obtained by `nm --size-sort vmlinux`):

1a60eddf: linux/overflow.h: make it self-contained
6d572cf4: parse_integer: sane integer parsing

+--------------------------+----------+----------+-------+
|          symbol          | 1a60eddf | 6d572cf4 | delta |
+--------------------------+----------+----------+-------+
| nm.T.__parse_integer     | 0        | 714      | 714   |
| bzImage                  | 440400   | 440912   | 512   |
| nm.d.max_negative_values | 0        | 64       | 64    |
| nm.d.max_positive_values | 0        | 64       | 64    |
| nm.d.max_acc_table       | 0        | 40       | 40    |
+--------------------------+----------+----------+-------+



Thanks,
Kbuild test robot

--===============4940561577972275296==--

