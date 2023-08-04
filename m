Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026168F7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691146345; x=1722682345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bZBCAtJL481k+o6K48xEqkYbwUR0VkGrI2WdHJEmD00=;
  b=WvyivXaqBRigJ30IT0feNuovp+gi7o5MVMv4O7ZuGkGRrxi+ZAyVQ73S
   oW5ZvpbzCedIDMungbzekW09LN3jPZBGyfnmrODRaDa9GUWVvHtuJJbiE
   U0eCdW/kamsrpVXocmpqyswyyrplRb/QgW6LOwSVmXAmm1Kru/qzTfepM
   KUaGqJk/Gwj+la7Z5m/oLpsab8kwV4jE2icckDeiKgUO5YD/XysBkCkCG
   sWFX5v21Iyav5/BokvlRiUKWZjEzEypm2ModcVD5xq8pylDvEWVFaZRIe
   bgQj1W+QOzz3iLoKnxAYZ/9XQpcEZIEJezYSBeLylVX/V2UgeePfpRmWi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436447888"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="436447888"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 03:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="723620963"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="723620963"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Aug 2023 03:52:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRsPv-0002nv-0d;
	Fri, 04 Aug 2023 10:52:23 +0000
Date: Fri, 4 Aug 2023 18:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH RESEND v2 2/2] zram: charge the compressed RAM to the
 page's memcgroup
Message-ID: <202308041836.UMnKFgHZ-lkp@intel.com>
References: <20230804075751.208045-1-hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804075751.208045-1-hezhongkun.hzk@bytedance.com>

Hi Zhongkun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/memcg-Add-support-for-zram-object-charge/20230804-155952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230804075751.208045-1-hezhongkun.hzk%40bytedance.com
patch subject: [RFC PATCH RESEND v2 2/2] zram: charge the compressed RAM to the page's memcgroup
config: arc-randconfig-r002-20230801 (https://download.01.org/0day-ci/archive/20230804/202308041836.UMnKFgHZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041836.UMnKFgHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041836.UMnKFgHZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/block/zram/zram_drv.c:36:
   include/linux/memcontrol.h:1886:5: warning: no previous prototype for 'obj_cgroup_charge_zram' [-Wmissing-prototypes]
    1886 | int obj_cgroup_charge_zram(struct obj_cgroup *objcg, gfp_t gfp,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:1892:6: warning: no previous prototype for 'obj_cgroup_uncharge_zram' [-Wmissing-prototypes]
    1892 | void obj_cgroup_uncharge_zram(struct obj_cgroup *objcg, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/zram/zram_drv.c: In function 'zram_recompress':
>> drivers/block/zram/zram_drv.c:1706:17: error: implicit declaration of function 'obj_cgroup_get'; did you mean 'obj_cgroup_put'? [-Werror=implicit-function-declaration]
    1706 |                 obj_cgroup_get(objcg);
         |                 ^~~~~~~~~~~~~~
         |                 obj_cgroup_put
   cc1: some warnings being treated as errors


vim +1706 drivers/block/zram/zram_drv.c

  1596	
  1597	#ifdef CONFIG_ZRAM_MULTI_COMP
  1598	/*
  1599	 * This function will decompress (unless it's ZRAM_HUGE) the page and then
  1600	 * attempt to compress it using provided compression algorithm priority
  1601	 * (which is potentially more effective).
  1602	 *
  1603	 * Corresponding ZRAM slot should be locked.
  1604	 */
  1605	static int zram_recompress(struct zram *zram, u32 index, struct page *page,
  1606				   u32 threshold, u32 prio, u32 prio_max)
  1607	{
  1608		struct zcomp_strm *zstrm = NULL;
  1609		struct obj_cgroup *objcg;
  1610		unsigned long handle_old;
  1611		unsigned long handle_new;
  1612		unsigned int comp_len_old;
  1613		unsigned int comp_len_new;
  1614		unsigned int class_index_old;
  1615		unsigned int class_index_new;
  1616		u32 num_recomps = 0;
  1617		void *src, *dst;
  1618		int ret;
  1619	
  1620		handle_old = zram_get_handle(zram, index);
  1621		if (!handle_old)
  1622			return -EINVAL;
  1623	
  1624		comp_len_old = zram_get_obj_size(zram, index);
  1625		/*
  1626		 * Do not recompress objects that are already "small enough".
  1627		 */
  1628		if (comp_len_old < threshold)
  1629			return 0;
  1630	
  1631		ret = zram_read_from_zspool(zram, page, index);
  1632		if (ret)
  1633			return ret;
  1634	
  1635		class_index_old = zs_lookup_class_index(zram->mem_pool, comp_len_old);
  1636		/*
  1637		 * Iterate the secondary comp algorithms list (in order of priority)
  1638		 * and try to recompress the page.
  1639		 */
  1640		for (; prio < prio_max; prio++) {
  1641			if (!zram->comps[prio])
  1642				continue;
  1643	
  1644			/*
  1645			 * Skip if the object is already re-compressed with a higher
  1646			 * priority algorithm (or same algorithm).
  1647			 */
  1648			if (prio <= zram_get_priority(zram, index))
  1649				continue;
  1650	
  1651			num_recomps++;
  1652			zstrm = zcomp_stream_get(zram->comps[prio]);
  1653			src = kmap_atomic(page);
  1654			ret = zcomp_compress(zstrm, src, &comp_len_new);
  1655			kunmap_atomic(src);
  1656	
  1657			if (ret) {
  1658				zcomp_stream_put(zram->comps[prio]);
  1659				return ret;
  1660			}
  1661	
  1662			class_index_new = zs_lookup_class_index(zram->mem_pool,
  1663								comp_len_new);
  1664	
  1665			/* Continue until we make progress */
  1666			if (class_index_new >= class_index_old ||
  1667			    (threshold && comp_len_new >= threshold)) {
  1668				zcomp_stream_put(zram->comps[prio]);
  1669				continue;
  1670			}
  1671	
  1672			/* Recompression was successful so break out */
  1673			break;
  1674		}
  1675	
  1676		/*
  1677		 * We did not try to recompress, e.g. when we have only one
  1678		 * secondary algorithm and the page is already recompressed
  1679		 * using that algorithm
  1680		 */
  1681		if (!zstrm)
  1682			return 0;
  1683	
  1684		if (class_index_new >= class_index_old) {
  1685			/*
  1686			 * Secondary algorithms failed to re-compress the page
  1687			 * in a way that would save memory, mark the object as
  1688			 * incompressible so that we will not try to compress
  1689			 * it again.
  1690			 *
  1691			 * We need to make sure that all secondary algorithms have
  1692			 * failed, so we test if the number of recompressions matches
  1693			 * the number of active secondary algorithms.
  1694			 */
  1695			if (num_recomps == zram->num_active_comps - 1)
  1696				zram_set_flag(zram, index, ZRAM_INCOMPRESSIBLE);
  1697			return 0;
  1698		}
  1699	
  1700		/* Successful recompression but above threshold */
  1701		if (threshold && comp_len_new >= threshold)
  1702			return 0;
  1703	
  1704		objcg  = zram_get_obj_cgroup(zram, index);
  1705		if (objcg) {
> 1706			obj_cgroup_get(objcg);
  1707			if (obj_cgroup_charge_zram(objcg, GFP_KERNEL, comp_len_new)) {
  1708				zcomp_stream_put(zram->comps[prio]);
  1709				obj_cgroup_put(objcg);
  1710				return -ENOMEM;
  1711			}
  1712		}
  1713	
  1714		/*
  1715		 * No direct reclaim (slow path) for handle allocation and no
  1716		 * re-compression attempt (unlike in zram_write_bvec()) since
  1717		 * we already have stored that object in zsmalloc. If we cannot
  1718		 * alloc memory for recompressed object then we bail out and
  1719		 * simply keep the old (existing) object in zsmalloc.
  1720		 */
  1721		handle_new = zs_malloc(zram->mem_pool, comp_len_new,
  1722				       __GFP_KSWAPD_RECLAIM |
  1723				       __GFP_NOWARN |
  1724				       __GFP_HIGHMEM |
  1725				       __GFP_MOVABLE);
  1726		if (IS_ERR_VALUE(handle_new)) {
  1727			zcomp_stream_put(zram->comps[prio]);
  1728			obj_cgroup_uncharge_zram(objcg, comp_len_new);
  1729			obj_cgroup_put(objcg);
  1730			return PTR_ERR((void *)handle_new);
  1731		}
  1732	
  1733		dst = zs_map_object(zram->mem_pool, handle_new, ZS_MM_WO);
  1734		memcpy(dst, zstrm->buffer, comp_len_new);
  1735		zcomp_stream_put(zram->comps[prio]);
  1736	
  1737		zs_unmap_object(zram->mem_pool, handle_new);
  1738	
  1739		zram_free_page(zram, index);
  1740		zram_set_handle(zram, index, handle_new);
  1741		zram_set_obj_size(zram, index, comp_len_new);
  1742		zram_set_priority(zram, index, prio);
  1743		zram_set_obj_cgroup(zram, index, objcg);
  1744	
  1745		atomic64_add(comp_len_new, &zram->stats.compr_data_size);
  1746		atomic64_inc(&zram->stats.pages_stored);
  1747	
  1748		return 0;
  1749	}
  1750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
