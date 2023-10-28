Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB91718B1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bti9YNf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698537168; x=1730073168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R3ePuL4vq+sAzBWIYdj4gVbm4UTl4lP7m7iJEL0Vt+U=;
  b=Bti9YNf1bTjY3/xQ9JUSQEfhc6KbmF7kdSGgLESUygZVNA7u6fi9k4+G
   It8EcCqyF4vpHrBjVvXxHgpY3AUTD/Cy0Z8+3+0v9ejD//MKHmDoH7jsn
   Rsj6nSp/YmE5zLX4JjITBAqHeqM6UEoNBGb97wpdpA0cAcHEn1zV3V5OT
   xxWDOLh3no61UQRX+5hhoxZ3/v81d1NEHjyC9jjHXYOfsNLqcHDN0WCKK
   BDiNbPA/Ot++2kUtg6a27XNOR6dgSlHzGj/62gSD3rEASgxFMYSxpl0mo
   MMUwTbGAhjeEaA8zvryLKFdwyFVMzMDADvC3/ABiy10OWuGRPxGeh16C4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="454390467"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="454390467"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 16:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="1007077007"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="1007077007"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Oct 2023 16:52:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwt6f-000CBX-2R;
	Sat, 28 Oct 2023 23:52:41 +0000
Date: Sun, 29 Oct 2023 07:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/11] shmem: add large folio support to the write
 path
Message-ID: <202310290726.C5ndh95F-lkp@intel.com>
References: <20231028211518.3424020-11-da.gomez@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028211518.3424020-11-da.gomez@samsung.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20231027]
[cannot apply to linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Gomez/XArray-add-cmpxchg-order-test/20231029-051730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231028211518.3424020-11-da.gomez%40samsung.com
patch subject: [RFC PATCH 10/11] shmem: add large folio support to the write path
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231029/202310290726.C5ndh95F-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290726.C5ndh95F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290726.C5ndh95F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:1652: warning: Function parameter or member 'sbinfo' not described in 'shmem_mapping_size_order'


vim +1652 mm/shmem.c

  1633	
  1634	/**
  1635	 * shmem_mapping_size_order - Get maximum folio order for the given file size.
  1636	 * @mapping: Target address_space.
  1637	 * @index: The page index.
  1638	 * @size: The suggested size of the folio to create.
  1639	 *
  1640	 * This returns a high order for folios (when supported) based on the file size
  1641	 * which the mapping currently allows at the given index. The index is relevant
  1642	 * due to alignment considerations the mapping might have. The returned order
  1643	 * may be less than the size passed.
  1644	 *
  1645	 * Like __filemap_get_folio order calculation.
  1646	 *
  1647	 * Return: The order.
  1648	 */
  1649	static inline unsigned int
  1650	shmem_mapping_size_order(struct address_space *mapping, pgoff_t index,
  1651				 size_t size, struct shmem_sb_info *sbinfo)
> 1652	{
  1653		unsigned int order = ilog2(size);
  1654	
  1655		if ((order <= PAGE_SHIFT) ||
  1656		    (!mapping_large_folio_support(mapping) || !sbinfo->noswap))
  1657			return 0;
  1658	
  1659		order -= PAGE_SHIFT;
  1660	
  1661		/* If we're not aligned, allocate a smaller folio */
  1662		if (index & ((1UL << order) - 1))
  1663			order = __ffs(index);
  1664	
  1665		order = min_t(size_t, order, MAX_PAGECACHE_ORDER);
  1666	
  1667		/* Order-1 not supported due to THP dependency */
  1668		return (order == 1) ? 0 : order;
  1669	}
  1670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
