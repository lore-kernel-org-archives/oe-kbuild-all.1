Content-Type: multipart/mixed; boundary="===============6799886792631078991=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+4007 bytes kernel size regression] [i386-tinyconfig] [3389d7a0a4] iov_iter: Add ITER_MAPPING
Date: Tue, 19 May 2020 09:14:14 +0800
Message-ID: <5ec332e6.aGUilRYkVdIxfCfy%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6799886792631078991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +4007 bytes kernel size regression due to commit:

commit: 3389d7a0a4d77044d7a575f009d07cd6dc48452f (iov_iter: Add ITER_MAPPIN=
G)
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git fscac=
he-iter

Details as below (size data is obtained by `nm --size-sort vmlinux`):

1bcfb218: fscache: Remove the I/O operation manager
3389d7a0: iov_iter: Add ITER_MAPPING

+-------------------------------------+----------+----------+-------+
|               symbol                | 1bcfb218 | 3389d7a0 | delta |
+-------------------------------------+----------+----------+-------+
| bzImage                             | 439552   | 440864   | 1312  |
| nm.T.iov_iter_get_pages             | 589      | 939      | 350   |
| nm.T.iov_iter_get_pages_alloc       | 715      | 1062     | 347   |
| nm.T.csum_and_copy_to_iter          | 1027     | 1304     | 277   |
| nm.T.csum_and_copy_from_iter        | 844      | 1094     | 250   |
| nm.T.csum_and_copy_from_iter_full   | 654      | 900      | 246   |
| nm.T.iov_iter_for_each_range        | 352      | 582      | 230   |
| nm.T._copy_to_iter                  | 778      | 996      | 218   |
| nm.T._copy_from_iter                | 560      | 772      | 212   |
| nm.T._copy_from_iter_nocache        | 560      | 772      | 212   |
| nm.T.iov_iter_copy_from_user_atomic | 425      | 635      | 210   |
| nm.T.iov_iter_npages                | 445      | 654      | 209   |
| nm.T.iov_iter_advance               | 436      | 638      | 202   |
| nm.T._copy_from_iter_full           | 399      | 595      | 196   |
| nm.T._copy_from_iter_full_nocache   | 399      | 595      | 196   |
| nm.T.iov_iter_gap_alignment         | 328      | 516      | 188   |
| nm.T.iov_iter_alignment             | 329      | 494      | 165   |
| nm.T.iov_iter_zero                  | 661      | 817      | 156   |
| nm.T.iov_iter_mapping               | 0        | 47       | 47    |
| nm.t.xas_retry                      | 0        | 30       | 30    |
| nm.t.memzero_page                   | 0        | 25       | 25    |
| nm.t.csum_block_add                 | 0        | 23       | 23    |
| nm.T.iov_iter_revert                | 200      | 210      | 10    |
| nm.T.dup_iter                       | 70       | 78       | 8     |
| nm.T.iov_iter_single_seg_count      | 41       | 44       | 3     |
| nm.t.csum_and_memcpy                | 43       | 40       | -3    |
+-------------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot

--===============6799886792631078991==--

