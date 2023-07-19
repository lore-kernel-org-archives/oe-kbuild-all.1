Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87EF18E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 02:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689734848; x=1721270848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MG3ItOIR7jGPvoN/RBCp4Fn/D6/jI4aJ6sdWbpa67VY=;
  b=fh/wb9hHtbUgXfts2C6VfqfaV16XXw7y6NLI21tfTD6X7a5kLlxEI+lR
   Cl3ruXVadcNswtyd52joMWL9ekGi1dE3hO6tvGeN7D1xeM2j898HvwLsT
   /sJPrmi5+8g6FfEFy/aWn2wVdoXP1ThJXEJr9igvbUd1X7orthO9zkJFQ
   WQXIhMME4ENloTbvVPFy6NSQD2u3SdFLYjz38VXBXaTbO7SQhg/1dBfaZ
   QKyOsOtjQquU3Yktcs/4EVOtBbaIcjaeByJGQdhYPlw6wQ6mX8wRovteq
   9PFZEFO0c4ETPDsDsDA6K7QeMQHPgqBg6YXNh842rXDwVjZoVS0vQwRrr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366400729"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="366400729"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847907102"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="847907102"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 19:47:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLxDp-00045F-16;
	Wed, 19 Jul 2023 02:47:25 +0000
Date: Wed, 19 Jul 2023 10:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 08/21] zram: Migrate to acomp compression API
Message-ID: <202307191030.nugASaPS-lkp@intel.com>
References: <20230718125847.3869700-9-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-9-ardb@kernel.org>

Hi Ard,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.5-rc2 next-20230718]
[cannot apply to rw-ubifs/next rw-ubifs/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/crypto-scomp-Revert-add-support-for-deflate-rfc1950-zlib/20230718-210600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20230718125847.3869700-9-ardb%40kernel.org
patch subject: [RFC PATCH 08/21] zram: Migrate to acomp compression API
config: x86_64-buildonly-randconfig-r001-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191030.nugASaPS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191030.nugASaPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191030.nugASaPS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/zram/zram_drv.c: In function 'zram_recompress':
>> drivers/block/zram/zram_drv.c:1581:15: warning: unused variable 'src' [-Wunused-variable]
    1581 |         void *src, *dst;
         |               ^~~


vim +/src +1581 drivers/block/zram/zram_drv.c

a0b81ae7a4ff8a7 Christoph Hellwig  2023-04-11  1561  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1562  #ifdef CONFIG_ZRAM_MULTI_COMP
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1563  /*
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1564   * This function will decompress (unless it's ZRAM_HUGE) the page and then
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1565   * attempt to compress it using provided compression algorithm priority
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1566   * (which is potentially more effective).
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1567   *
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1568   * Corresponding ZRAM slot should be locked.
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1569   */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1570  static int zram_recompress(struct zram *zram, u32 index, struct page *page,
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1571  			   u32 threshold, u32 prio, u32 prio_max)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1572  {
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1573  	struct zcomp_strm *zstrm = NULL;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1574  	unsigned long handle_old;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1575  	unsigned long handle_new;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1576  	unsigned int comp_len_old;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1577  	unsigned int comp_len_new;
7c2af309abd24ff Alexey Romanov     2022-11-09  1578  	unsigned int class_index_old;
7c2af309abd24ff Alexey Romanov     2022-11-09  1579  	unsigned int class_index_new;
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1580  	u32 num_recomps = 0;
84b33bf7888975d Sergey Senozhatsky 2022-11-09 @1581  	void *src, *dst;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1582  	int ret;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1583  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1584  	handle_old = zram_get_handle(zram, index);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1585  	if (!handle_old)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1586  		return -EINVAL;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1587  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1588  	comp_len_old = zram_get_obj_size(zram, index);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1589  	/*
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1590  	 * Do not recompress objects that are already "small enough".
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1591  	 */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1592  	if (comp_len_old < threshold)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1593  		return 0;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1594  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1595  	ret = zram_read_from_zspool(zram, page, index);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1596  	if (ret)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1597  		return ret;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1598  
7c2af309abd24ff Alexey Romanov     2022-11-09  1599  	class_index_old = zs_lookup_class_index(zram->mem_pool, comp_len_old);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1600  	/*
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1601  	 * Iterate the secondary comp algorithms list (in order of priority)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1602  	 * and try to recompress the page.
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1603  	 */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1604  	for (; prio < prio_max; prio++) {
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1605  		if (!zram->comps[prio])
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1606  			continue;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1607  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1608  		/*
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1609  		 * Skip if the object is already re-compressed with a higher
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1610  		 * priority algorithm (or same algorithm).
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1611  		 */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1612  		if (prio <= zram_get_priority(zram, index))
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1613  			continue;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1614  
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1615  		num_recomps++;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1616  		zstrm = zcomp_stream_get(zram->comps[prio]);
29b6967174757a8 Ard Biesheuvel     2023-07-18  1617  		ret = zcomp_compress(zstrm, page, &comp_len_new);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1618  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1619  		if (ret) {
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1620  			zcomp_stream_put(zram->comps[prio]);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1621  			return ret;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1622  		}
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1623  
7c2af309abd24ff Alexey Romanov     2022-11-09  1624  		class_index_new = zs_lookup_class_index(zram->mem_pool,
7c2af309abd24ff Alexey Romanov     2022-11-09  1625  							comp_len_new);
7c2af309abd24ff Alexey Romanov     2022-11-09  1626  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1627  		/* Continue until we make progress */
4942cf6ad07c487 Sergey Senozhatsky 2022-11-09  1628  		if (class_index_new >= class_index_old ||
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1629  		    (threshold && comp_len_new >= threshold)) {
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1630  			zcomp_stream_put(zram->comps[prio]);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1631  			continue;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1632  		}
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1633  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1634  		/* Recompression was successful so break out */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1635  		break;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1636  	}
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1637  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1638  	/*
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1639  	 * We did not try to recompress, e.g. when we have only one
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1640  	 * secondary algorithm and the page is already recompressed
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1641  	 * using that algorithm
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1642  	 */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1643  	if (!zstrm)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1644  		return 0;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1645  
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1646  	if (class_index_new >= class_index_old) {
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1647  		/*
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1648  		 * Secondary algorithms failed to re-compress the page
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1649  		 * in a way that would save memory, mark the object as
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1650  		 * incompressible so that we will not try to compress
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1651  		 * it again.
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1652  		 *
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1653  		 * We need to make sure that all secondary algorithms have
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1654  		 * failed, so we test if the number of recompressions matches
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1655  		 * the number of active secondary algorithms.
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1656  		 */
a55cf9648d3de48 Sergey Senozhatsky 2022-11-09  1657  		if (num_recomps == zram->num_active_comps - 1)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1658  			zram_set_flag(zram, index, ZRAM_INCOMPRESSIBLE);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1659  		return 0;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1660  	}
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1661  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1662  	/* Successful recompression but above threshold */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1663  	if (threshold && comp_len_new >= threshold)
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1664  		return 0;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1665  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1666  	/*
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1667  	 * No direct reclaim (slow path) for handle allocation and no
6aa4b839e7a481c Christoph Hellwig  2023-04-11  1668  	 * re-compression attempt (unlike in zram_write_bvec()) since
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1669  	 * we already have stored that object in zsmalloc. If we cannot
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1670  	 * alloc memory for recompressed object then we bail out and
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1671  	 * simply keep the old (existing) object in zsmalloc.
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1672  	 */
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1673  	handle_new = zs_malloc(zram->mem_pool, comp_len_new,
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1674  			       __GFP_KSWAPD_RECLAIM |
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1675  			       __GFP_NOWARN |
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1676  			       __GFP_HIGHMEM |
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1677  			       __GFP_MOVABLE);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1678  	if (IS_ERR_VALUE(handle_new)) {
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1679  		zcomp_stream_put(zram->comps[prio]);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1680  		return PTR_ERR((void *)handle_new);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1681  	}
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1682  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1683  	dst = zs_map_object(zram->mem_pool, handle_new, ZS_MM_WO);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1684  	memcpy(dst, zstrm->buffer, comp_len_new);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1685  	zcomp_stream_put(zram->comps[prio]);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1686  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1687  	zs_unmap_object(zram->mem_pool, handle_new);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1688  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1689  	zram_free_page(zram, index);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1690  	zram_set_handle(zram, index, handle_new);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1691  	zram_set_obj_size(zram, index, comp_len_new);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1692  	zram_set_priority(zram, index, prio);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1693  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1694  	atomic64_add(comp_len_new, &zram->stats.compr_data_size);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1695  	atomic64_inc(&zram->stats.pages_stored);
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1696  
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1697  	return 0;
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1698  }
84b33bf7888975d Sergey Senozhatsky 2022-11-09  1699  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
