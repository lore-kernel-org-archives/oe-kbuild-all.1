Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C73D82
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695122891; x=1726658891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2dAqJ9+gSlvtFbO5qEpMHNqfi35U2zHu3R+qLEw+ZPk=;
  b=Ws3cAnFdZQTkq6geSsE55/+tYw965y0r72FqDKP1ZlA3KpzCAAG7l6vH
   1EPrMFKnQ9F//Xp8bfWqEB8fEuopaFzGuiF7IPg/F0qt7J4P4Nszsy+gk
   E7Wfx6WeP4KAbv9tdosFZXfIxCJWWZKRXDsqlv3TNHMbZ4JMGHulK91B0
   ZyAyLWsQ9JnG1OMEMMtT4+1pfJAFGThi6SvUQYg89ojvURrjmYp19WzgB
   ON5/PEZ+GlyMFccUS3pbtqN+jBKSpj3yM8K/JlG3WPAPVtunFEBPJgx8L
   IMYW+PnMAYU8av9Q8giLTyGLtm0V917+JDpnCyRg0O73NUioUQkcUkEQ3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="410843867"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="410843867"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 04:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861502110"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="861502110"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2023 04:28:07 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiYth-0007He-0T;
	Tue, 19 Sep 2023 11:28:05 +0000
Date: Tue, 19 Sep 2023 19:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: include/linux/dma-mapping.h:416:36: warning: array subscript i is
 outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'}
Message-ID: <202309191958.UBw1cjXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 kbuild: Enable -fstrict-flex-arrays=3
date:   4 months ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191958.UBw1cjXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191958.UBw1cjXk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/skbuff.h:28,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/ethernet/marvell/sky2.c:18:
   drivers/net/ethernet/marvell/sky2.c: In function 'sky2_rx_unmap_skb':
>> include/linux/dma-mapping.h:416:36: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     416 | #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/sky2.c:1257:17: note: in expansion of macro 'dma_unmap_page'
    1257 |                 dma_unmap_page(&pdev->dev, re->frag_addr[i],
         |                 ^~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/marvell/sky2.c:41:
   drivers/net/ethernet/marvell/sky2.h:2198:25: note: while referencing 'frag_addr'
    2198 |         dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT];
         |                         ^~~~~~~~~
   drivers/net/ethernet/marvell/sky2.c: In function 'sky2_rx_submit':
>> drivers/net/ethernet/marvell/sky2.c:1202:59: warning: array subscript i is outside array bounds of 'const dma_addr_t[0]' {aka 'const long long unsigned int[]'} [-Warray-bounds=]
    1202 |                 sky2_rx_add(sky2, OP_BUFFER, re->frag_addr[i], PAGE_SIZE);
         |                                              ~~~~~~~~~~~~~^~~
   drivers/net/ethernet/marvell/sky2.h:2198:25: note: while referencing 'frag_addr'
    2198 |         dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT];
         |                         ^~~~~~~~~
   drivers/net/ethernet/marvell/sky2.c: In function 'sky2_rx_map_skb':
>> drivers/net/ethernet/marvell/sky2.c:1222:30: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
    1222 |                 re->frag_addr[i] = skb_frag_dma_map(&pdev->dev, frag, 0,
         |                 ~~~~~~~~~~~~~^~~
   drivers/net/ethernet/marvell/sky2.h:2198:25: note: while referencing 'frag_addr'
    2198 |         dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT];
         |                         ^~~~~~~~~
>> include/linux/dma-mapping.h:416:36: warning: array subscript i is outside array bounds of 'dma_addr_t[0]' {aka 'long long unsigned int[]'} [-Warray-bounds=]
     416 | #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/sky2.c:1233:17: note: in expansion of macro 'dma_unmap_page'
    1233 |                 dma_unmap_page(&pdev->dev, re->frag_addr[i],
         |                 ^~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/sky2.h:2198:25: note: while referencing 'frag_addr'
    2198 |         dma_addr_t      frag_addr[ETH_JUMBO_MTU >> PAGE_SHIFT];
         |                         ^~~~~~~~~


vim +416 include/linux/dma-mapping.h

d9d200bcebc1f6 Marek Szyprowski    2020-05-13  410  
00085f1efa387a Krzysztof Kozlowski 2016-08-03  411  #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
00085f1efa387a Krzysztof Kozlowski 2016-08-03  412  #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
00085f1efa387a Krzysztof Kozlowski 2016-08-03  413  #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
00085f1efa387a Krzysztof Kozlowski 2016-08-03  414  #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
0495c3d367944e Alexander Duyck     2016-12-14  415  #define dma_map_page(d, p, o, s, r) dma_map_page_attrs(d, p, o, s, r, 0)
0495c3d367944e Alexander Duyck     2016-12-14 @416  #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
ed6ccf10f24bdf Christoph Hellwig   2018-12-26  417  #define dma_get_sgtable(d, t, v, h, s) dma_get_sgtable_attrs(d, t, v, h, s, 0)
ed6ccf10f24bdf Christoph Hellwig   2018-12-26  418  #define dma_mmap_coherent(d, v, c, h, s) dma_mmap_attrs(d, v, c, h, s, 0)
c9eb6172c328dd Christoph Hellwig   2017-08-27  419  

:::::: The code at line 416 was first introduced by commit
:::::: 0495c3d367944e4af053983ff3cdf256b567b053 dma: add calls for dma_map_page_attrs and dma_unmap_page_attrs

:::::: TO: Alexander Duyck <alexander.h.duyck@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
