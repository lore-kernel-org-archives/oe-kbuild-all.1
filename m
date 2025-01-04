Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446FF22EE4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 00:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735951239; cv=none; b=f/FBMNaRd0YWzduk0R2izuT5B6OHpgAl5DYX7ngXHRPo/Qo1mpQjC7C9BQxEKGyBtSyr0vKYpwKbj1jjJHs7BdRm2SM8arSqIpMJJBec3bbwBLIdWEHffT9bQYi3efwTC7UkOi3ogAVpguIac433uLx2LC1cTXgQ7RYY1FoF5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735951239; c=relaxed/simple;
	bh=JxDTOVJEetlPn+OSXsBVpTz7l/i7KZVE2MhSxV26lPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKBZs4PfTMIL5Qgq2fQ4XfhBdRCitfJ5AvCUtk0fyI75IGVuNuwd7KlO+Z4q5Gwuu5k/Nd8QeEVN0jJHkPLF29XliOOhOuqKNQ6dyz9TakSHIrqurCpk1C8jv3HOJT7tS9KxouM2aCluSH461yZ1f8DEq3U2iOZrrEN8q1v0vz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLea1sJD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLea1sJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735951237; x=1767487237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxDTOVJEetlPn+OSXsBVpTz7l/i7KZVE2MhSxV26lPM=;
  b=eLea1sJDXflOhpmD+RW5OC4v4Dg6h7y82AD/0rrYzllGkvYRBRoVzsev
   2f6v9k2w3EjsaiHYHsGl4gXN0I3EDyF35WG76VYvgRe0DWJYjoPbRk31b
   E+fm9rS/io/51iaY5HvEMC1kP/YywOf6WrvD4j7XQrlFSROK6Rxc8R762
   tId4Y+2Hvz9PO3gCFhZz6TmNA6o8Wb1GPxnoajvS2tjCF6pg/RRxuGnWK
   H+srM2T0LbPl78mrXOdfeylt/XIR/5YM7MFHGrZQ7t9uYzwutoGO8AEB6
   y2mhrGsJXgVhmg/H1G+xslZKcu9DIi3clF26O0lH5Y8l+k05y9ZhhYVoC
   Q==;
X-CSE-ConnectionGUID: 7vF+66dFTemgnLeE5CTnXA==
X-CSE-MsgGUID: 4F5NhXB4TF6/uf/e8qF/6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36212941"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="36212941"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 16:40:37 -0800
X-CSE-ConnectionGUID: dlF7VHAsQHGAanGRyRNmjA==
X-CSE-MsgGUID: +evGh6BPQlyhXXys5nR8oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102414923"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 16:40:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTsDR-000AUF-0w;
	Sat, 04 Jan 2025 00:40:33 +0000
Date: Sat, 4 Jan 2025 08:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or
 struct member 'orig_addr' not described in 'msc'
Message-ID: <202501040807.ZVUTsBOH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 092f47c383adbff4d873dcb7f0887954bd407a08 intel_th: msu: Preserve pre-existing buffer configuration
date:   5 years ago
config: parisc-randconfig-r016-20230411 (https://download.01.org/0day-ci/archive/20250104/202501040807.ZVUTsBOH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040807.ZVUTsBOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040807.ZVUTsBOH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c:77: warning: Function parameter or struct member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:122: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or struct member 'msu_base' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or struct member 'mbuf_priv' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or struct member 'work' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or struct member 'orig_addr' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or struct member 'orig_sz' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or struct member 'iter_list' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:164: warning: Function parameter or struct member 'do_irq' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:1282: warning: Function parameter or struct member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1282: warning: Function parameter or struct member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1282: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'


vim +164 drivers/hwtracing/intel_th/msu.c

ba82664c134ef7 Alexander Shishkin 2015-09-22  104  
ba82664c134ef7 Alexander Shishkin 2015-09-22  105  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22  106   * struct msc - MSC device representation
ba82664c134ef7 Alexander Shishkin 2015-09-22  107   * @reg_base:		register window base address
ba82664c134ef7 Alexander Shishkin 2015-09-22  108   * @thdev:		intel_th_device pointer
615c164da0eb42 Alexander Shishkin 2019-07-05  109   * @mbuf:		MSU buffer, if assigned
615c164da0eb42 Alexander Shishkin 2019-07-05  110   * @mbuf_priv		MSU buffer's private data, if @mbuf
ba82664c134ef7 Alexander Shishkin 2015-09-22  111   * @win_list:		list of windows in multiblock mode
4e0eaf239fb33e Alexander Shishkin 2019-05-03  112   * @single_sgt:		single mode buffer
aad14ad3cf3a63 Alexander Shishkin 2019-05-03  113   * @cur_win:		current window
ba82664c134ef7 Alexander Shishkin 2015-09-22  114   * @nr_pages:		total number of pages allocated for this buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22  115   * @single_sz:		amount of data in single mode
ba82664c134ef7 Alexander Shishkin 2015-09-22  116   * @single_wrap:	single mode wrap occurred
ba82664c134ef7 Alexander Shishkin 2015-09-22  117   * @base:		buffer's base pointer
ba82664c134ef7 Alexander Shishkin 2015-09-22  118   * @base_addr:		buffer's base address
ba82664c134ef7 Alexander Shishkin 2015-09-22  119   * @user_count:		number of users of the buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22  120   * @mmap_count:		number of mappings
ba82664c134ef7 Alexander Shishkin 2015-09-22  121   * @buf_mutex:		mutex to serialize access to buffer-related bits
ba82664c134ef7 Alexander Shishkin 2015-09-22  122  
ba82664c134ef7 Alexander Shishkin 2015-09-22  123   * @enabled:		MSC is enabled
ba82664c134ef7 Alexander Shishkin 2015-09-22  124   * @wrap:		wrapping is enabled
ba82664c134ef7 Alexander Shishkin 2015-09-22  125   * @mode:		MSC operating mode
ba82664c134ef7 Alexander Shishkin 2015-09-22  126   * @burst_len:		write burst length
ba82664c134ef7 Alexander Shishkin 2015-09-22  127   * @index:		number of this MSC in the MSU
ba82664c134ef7 Alexander Shishkin 2015-09-22  128   */
ba82664c134ef7 Alexander Shishkin 2015-09-22  129  struct msc {
ba82664c134ef7 Alexander Shishkin 2015-09-22  130  	void __iomem		*reg_base;
aac8da65174a35 Alexander Shishkin 2019-05-03  131  	void __iomem		*msu_base;
ba82664c134ef7 Alexander Shishkin 2015-09-22  132  	struct intel_th_device	*thdev;
ba82664c134ef7 Alexander Shishkin 2015-09-22  133  
615c164da0eb42 Alexander Shishkin 2019-07-05  134  	const struct msu_buffer	*mbuf;
615c164da0eb42 Alexander Shishkin 2019-07-05  135  	void			*mbuf_priv;
615c164da0eb42 Alexander Shishkin 2019-07-05  136  
615c164da0eb42 Alexander Shishkin 2019-07-05  137  	struct work_struct	work;
ba82664c134ef7 Alexander Shishkin 2015-09-22  138  	struct list_head	win_list;
4e0eaf239fb33e Alexander Shishkin 2019-05-03  139  	struct sg_table		single_sgt;
aad14ad3cf3a63 Alexander Shishkin 2019-05-03  140  	struct msc_window	*cur_win;
ba82664c134ef7 Alexander Shishkin 2015-09-22  141  	unsigned long		nr_pages;
ba82664c134ef7 Alexander Shishkin 2015-09-22  142  	unsigned long		single_sz;
ba82664c134ef7 Alexander Shishkin 2015-09-22  143  	unsigned int		single_wrap : 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  144  	void			*base;
ba82664c134ef7 Alexander Shishkin 2015-09-22  145  	dma_addr_t		base_addr;
092f47c383adbf Alexander Shishkin 2019-07-05  146  	u32			orig_addr;
092f47c383adbf Alexander Shishkin 2019-07-05  147  	u32			orig_sz;
ba82664c134ef7 Alexander Shishkin 2015-09-22  148  
ba82664c134ef7 Alexander Shishkin 2015-09-22  149  	/* <0: no buffer, 0: no users, >0: active users */
ba82664c134ef7 Alexander Shishkin 2015-09-22  150  	atomic_t		user_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  151  
ba82664c134ef7 Alexander Shishkin 2015-09-22  152  	atomic_t		mmap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  153  	struct mutex		buf_mutex;
ba82664c134ef7 Alexander Shishkin 2015-09-22  154  
ba82664c134ef7 Alexander Shishkin 2015-09-22  155  	struct list_head	iter_list;
ba82664c134ef7 Alexander Shishkin 2015-09-22  156  
ba82664c134ef7 Alexander Shishkin 2015-09-22  157  	/* config */
ba82664c134ef7 Alexander Shishkin 2015-09-22  158  	unsigned int		enabled : 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  159  				wrap	: 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  160  				do_irq	: 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  161  	unsigned int		mode;
ba82664c134ef7 Alexander Shishkin 2015-09-22  162  	unsigned int		burst_len;
ba82664c134ef7 Alexander Shishkin 2015-09-22  163  	unsigned int		index;
ba82664c134ef7 Alexander Shishkin 2015-09-22 @164  };
ba82664c134ef7 Alexander Shishkin 2015-09-22  165  

:::::: The code at line 164 was first introduced by commit
:::::: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
