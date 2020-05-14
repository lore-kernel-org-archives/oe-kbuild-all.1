Content-Type: multipart/mixed; boundary="===============2898188497598203282=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+668 bytes kernel size regression] [i386-tinyconfig] [65c908b7bd] dma-mapping: add a dma_ops_bypass flag to struct device
Date: Thu, 14 May 2020 20:51:04 +0800
Message-ID: <5ebd3eb8.71OxYACs5U9Z+zn7%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2898188497598203282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +668 bytes kernel size regression due to commit:

commit: 65c908b7bd08144e5298258920f61255aa7628ee (dma-mapping: add a dma_op=
s_bypass flag to struct device)
git://git.infradead.org/users/hch/misc.git dma-bypass.4

Details as below (size data is obtained by `nm --size-sort vmlinux`):

4861c37e: dma-mapping: inline the fast path dma-direct calls
65c908b7: dma-mapping: add a dma_ops_bypass flag to struct device

+---------------------------------+----------+----------+-------+
|             symbol              | 4861c37e | 65c908b7 | delta |
+---------------------------------+----------+----------+-------+
| bzImage                         | 439680   | 439840   | 160   |
| nm.t.dma_alloc_direct           | 0        | 103      | 103   |
| nm.t.dma_map_direct             | 0        | 102      | 102   |
| nm.T.dma_get_sgtable_attrs      | 84       | 135      | 51    |
| nm.T.dma_mmap_attrs             | 84       | 135      | 51    |
| nm.T.dma_free_attrs             | 73       | 113      | 40    |
| nm.T.dma_alloc_attrs            | 76       | 113      | 37    |
| nm.T.dma_map_resource           | 100      | 132      | 32    |
| nm.T.dma_max_mapping_size       | 38       | 65       | 27    |
| nm.T.dma_map_sg_attrs           | 69       | 95       | 26    |
| nm.T.dma_get_required_mask      | 50       | 73       | 23    |
| nm.T.dma_can_mmap               | 33       | 52       | 19    |
| nm.T.dma_cache_sync             | 56       | 75       | 19    |
| nm.T.dma_sync_sg_for_cpu        | 56       | 75       | 19    |
| nm.T.dma_sync_sg_for_device     | 56       | 75       | 19    |
| nm.T.dma_sync_single_for_cpu    | 56       | 75       | 19    |
| nm.T.dma_sync_single_for_device | 56       | 75       | 19    |
| nm.T.dma_unmap_page_attrs       | 61       | 80       | 19    |
| nm.T.dma_unmap_resource         | 61       | 80       | 19    |
| nm.T.dma_unmap_sg_attrs         | 61       | 80       | 19    |
| nm.T.dma_map_page_attrs         | 226      | 231      | 5     |
+---------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot

--===============2898188497598203282==--

