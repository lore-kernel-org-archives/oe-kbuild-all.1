Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8673195
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707226331; cv=none; b=tc31ZnOYv78xR5El7VQaSnb7db38+FU7VfW0JnO4MUU5zBmYudqN4m7wwP/5pC6/VsPHyhwuxB29DuBIi7+3PF4L/B73DL+2LZFgwXoTRjmkoNDU4JPiboRhP9JbBmHDvjRJZazmIgQEVqaFR3vLsgPqRPh6XUk+r9zL0CEVn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707226331; c=relaxed/simple;
	bh=QBwDsbh1+S8mFwHW5IooDdMttQ2TcsjFHG4Sx/8T4jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lb+A6p9YrKguGMQV8w/JqYgrD6Xv9XDcJR9JG0SoubDmutZuFHnf6ys1K3l4E97V2UBvxLk5ETcUstb1DIlFN1sqXP6YsonuEGweMTemBRwd0GWuHPc11PZEVzOX3yVJycLP67XVPJhBFOASfG9ZdawF5Li3WEc7FjmLYQqOTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2e0jjqN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2e0jjqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707226329; x=1738762329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QBwDsbh1+S8mFwHW5IooDdMttQ2TcsjFHG4Sx/8T4jQ=;
  b=M2e0jjqN9vj/uBYoJvFP9bTVBpOjWDwfcZ8yxIxEibkguXPjqDC5IRzf
   jUOIK94SYiiO6y3wItbJrPR9//c2cz/eRBOG2UQZprylMhlt/rMhXS2E7
   mLjUWK+dg42H/mj7EcgyYTxzkhwfi+/qdKeBeWkfEAmuSJcXN76geQTCc
   qMuMrtE6QQHq2hE7gIauWrNVCMnOP8Xe6PxzQDfjQRFHDHmyTFh+5ZB8P
   tV0tFFNEXwmzxiIQwQFtjEaKJL4n4UMlPtSMqO43WmcnudsuXtYkLd+9n
   U9Y35jU4TP0HO1hdmSAAdz4/CQjIi7RxR1qW2EQqZXxyn/Bke26r5wXhK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="3706828"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="3706828"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 05:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5640778"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2024 05:32:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXLYR-0001QI-1g;
	Tue, 06 Feb 2024 13:32:03 +0000
Date: Tue, 6 Feb 2024 21:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Danilo Krummrich <dakr@redhat.com>
Subject: [linux-next:master 4231/4465]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1955: warning: Function
 parameter or struct member 'gsp' not described in 'nvkm_gsp_radix3_sg'
Message-ID: <202402062106.cfArbjsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac139fc7db67968e5061715508b5fc4aa7c40c56
commit: 34e659f34a7559ecfd9c1f5b24d4c291f3f54711 [4231/4465] drm/nouveau: nvkm_gsp_radix3_sg() should use nvkm_gsp_mem_ctor()
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240206/202402062106.cfArbjsv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402062106.cfArbjsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062106.cfArbjsv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1442: warning: Function parameter or struct member 'priv' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1442: warning: Function parameter or struct member 'fn' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1442: warning: Function parameter or struct member 'repv' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1442: warning: Function parameter or struct member 'repc' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1815: warning: Function parameter or struct member 'gsp' not described in 'r535_gsp_libos_init'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1955: warning: Function parameter or struct member 'gsp' not described in 'nvkm_gsp_radix3_sg'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1955: warning: Function parameter or struct member 'sgt' not described in 'nvkm_gsp_radix3_sg'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1955: warning: Function parameter or struct member 'size' not described in 'nvkm_gsp_radix3_sg'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1955: warning: Function parameter or struct member 'rx3' not described in 'nvkm_gsp_radix3_sg'


vim +1955 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

176fdcbddfd288 Ben Skeggs 2023-09-19  1922  
88a2b4d34a64bb Timur Tabi 2023-11-22  1923  /**
88a2b4d34a64bb Timur Tabi 2023-11-22  1924   * nvkm_gsp_radix3_sg - build a radix3 table from a S/G list
88a2b4d34a64bb Timur Tabi 2023-11-22  1925   *
88a2b4d34a64bb Timur Tabi 2023-11-22  1926   * The GSP uses a three-level page table, called radix3, to map the firmware.
88a2b4d34a64bb Timur Tabi 2023-11-22  1927   * Each 64-bit "pointer" in the table is either the bus address of an entry in
88a2b4d34a64bb Timur Tabi 2023-11-22  1928   * the next table (for levels 0 and 1) or the bus address of the next page in
88a2b4d34a64bb Timur Tabi 2023-11-22  1929   * the GSP firmware image itself.
88a2b4d34a64bb Timur Tabi 2023-11-22  1930   *
88a2b4d34a64bb Timur Tabi 2023-11-22  1931   * Level 0 contains a single entry in one page that points to the first page
88a2b4d34a64bb Timur Tabi 2023-11-22  1932   * of level 1.
88a2b4d34a64bb Timur Tabi 2023-11-22  1933   *
88a2b4d34a64bb Timur Tabi 2023-11-22  1934   * Level 1, since it's also only one page in size, contains up to 512 entries,
88a2b4d34a64bb Timur Tabi 2023-11-22  1935   * one for each page in Level 2.
88a2b4d34a64bb Timur Tabi 2023-11-22  1936   *
88a2b4d34a64bb Timur Tabi 2023-11-22  1937   * Level 2 can be up to 512 pages in size, and each of those entries points to
88a2b4d34a64bb Timur Tabi 2023-11-22  1938   * the next page of the firmware image.  Since there can be up to 512*512
88a2b4d34a64bb Timur Tabi 2023-11-22  1939   * pages, that limits the size of the firmware to 512*512*GSP_PAGE_SIZE = 1GB.
88a2b4d34a64bb Timur Tabi 2023-11-22  1940   *
88a2b4d34a64bb Timur Tabi 2023-11-22  1941   * Internally, the GSP has its window into system memory, but the base
88a2b4d34a64bb Timur Tabi 2023-11-22  1942   * physical address of the aperture is not 0.  In fact, it varies depending on
88a2b4d34a64bb Timur Tabi 2023-11-22  1943   * the GPU architecture.  Since the GPU is a PCI device, this window is
88a2b4d34a64bb Timur Tabi 2023-11-22  1944   * accessed via DMA and is therefore bound by IOMMU translation.  The end
88a2b4d34a64bb Timur Tabi 2023-11-22  1945   * result is that GSP-RM must translate the bus addresses in the table to GSP
88a2b4d34a64bb Timur Tabi 2023-11-22  1946   * physical addresses.  All this should happen transparently.
88a2b4d34a64bb Timur Tabi 2023-11-22  1947   *
88a2b4d34a64bb Timur Tabi 2023-11-22  1948   * Returns 0 on success, or negative error code
88a2b4d34a64bb Timur Tabi 2023-11-22  1949   *
88a2b4d34a64bb Timur Tabi 2023-11-22  1950   * See kgspCreateRadix3_IMPL
88a2b4d34a64bb Timur Tabi 2023-11-22  1951   */
176fdcbddfd288 Ben Skeggs 2023-09-19  1952  static int
34e659f34a7559 Timur Tabi 2024-02-02  1953  nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
176fdcbddfd288 Ben Skeggs 2023-09-19  1954  		   struct nvkm_gsp_radix3 *rx3)
176fdcbddfd288 Ben Skeggs 2023-09-19 @1955  {
176fdcbddfd288 Ben Skeggs 2023-09-19  1956  	u64 addr;
176fdcbddfd288 Ben Skeggs 2023-09-19  1957  
176fdcbddfd288 Ben Skeggs 2023-09-19  1958  	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--) {
176fdcbddfd288 Ben Skeggs 2023-09-19  1959  		u64 *ptes;
34e659f34a7559 Timur Tabi 2024-02-02  1960  		size_t bufsize;
34e659f34a7559 Timur Tabi 2024-02-02  1961  		int ret, idx;
176fdcbddfd288 Ben Skeggs 2023-09-19  1962  
34e659f34a7559 Timur Tabi 2024-02-02  1963  		bufsize = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
34e659f34a7559 Timur Tabi 2024-02-02  1964  		ret = nvkm_gsp_mem_ctor(gsp, bufsize, &rx3->mem[i]);
34e659f34a7559 Timur Tabi 2024-02-02  1965  		if (ret)
34e659f34a7559 Timur Tabi 2024-02-02  1966  			return ret;
176fdcbddfd288 Ben Skeggs 2023-09-19  1967  
176fdcbddfd288 Ben Skeggs 2023-09-19  1968  		ptes = rx3->mem[i].data;
176fdcbddfd288 Ben Skeggs 2023-09-19  1969  		if (i == 2) {
176fdcbddfd288 Ben Skeggs 2023-09-19  1970  			struct scatterlist *sgl;
176fdcbddfd288 Ben Skeggs 2023-09-19  1971  
176fdcbddfd288 Ben Skeggs 2023-09-19  1972  			for_each_sgtable_dma_sg(sgt, sgl, idx) {
176fdcbddfd288 Ben Skeggs 2023-09-19  1973  				for (int j = 0; j < sg_dma_len(sgl) / GSP_PAGE_SIZE; j++)
176fdcbddfd288 Ben Skeggs 2023-09-19  1974  					*ptes++ = sg_dma_address(sgl) + (GSP_PAGE_SIZE * j);
176fdcbddfd288 Ben Skeggs 2023-09-19  1975  			}
176fdcbddfd288 Ben Skeggs 2023-09-19  1976  		} else {
176fdcbddfd288 Ben Skeggs 2023-09-19  1977  			for (int j = 0; j < size / GSP_PAGE_SIZE; j++)
176fdcbddfd288 Ben Skeggs 2023-09-19  1978  				*ptes++ = addr + GSP_PAGE_SIZE * j;
176fdcbddfd288 Ben Skeggs 2023-09-19  1979  		}
176fdcbddfd288 Ben Skeggs 2023-09-19  1980  
176fdcbddfd288 Ben Skeggs 2023-09-19  1981  		size = rx3->mem[i].size;
176fdcbddfd288 Ben Skeggs 2023-09-19  1982  		addr = rx3->mem[i].addr;
176fdcbddfd288 Ben Skeggs 2023-09-19  1983  	}
176fdcbddfd288 Ben Skeggs 2023-09-19  1984  
176fdcbddfd288 Ben Skeggs 2023-09-19  1985  	return 0;
176fdcbddfd288 Ben Skeggs 2023-09-19  1986  }
176fdcbddfd288 Ben Skeggs 2023-09-19  1987  

:::::: The code at line 1955 was first introduced by commit
:::::: 176fdcbddfd288408ce8571c1760ad618d962096 drm/nouveau/gsp/r535: add support for booting GSP-RM

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
