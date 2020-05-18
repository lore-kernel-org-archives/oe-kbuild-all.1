Content-Type: multipart/mixed; boundary="===============2328126447090119683=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+4007 bytes kernel size regression] [i386-tinyconfig] [652db5cdcb] iov_iter: Add ITER_MAPPING
Date: Mon, 18 May 2020 13:13:32 +0800
Message-ID: <20200518051332.GA63251@6d04b22bb103>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2328126447090119683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +4007 bytes kernel size regression due to commit:

commit: 652db5cdcb574c6f8dee8693abb4e0ebc3d1245e (iov_iter: Add ITER_MAPPIN=
G)
url: https://github.com/0day-ci/linux/commits/David-Howells/fscache-cachefi=
les-Rewrite-the-I-O-interface-in-terms-of-kiocb-iov_iter/20200505-100335

Details as below (size data is obtained by `nm --size-sort vmlinux`):

db3d1801: afs: Make afs_zap_data() static
652db5cd: iov_iter: Add ITER_MAPPING

+-------------------------------------+----------+----------+-------+
|               symbol                | db3d1801 | 652db5cd | delta |
+-------------------------------------+----------+----------+-------+
| bzImage                             | 440320   | 441632   | 1312  |
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


--===============2328126447090119683==--

