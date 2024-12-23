Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B822F7462
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 01:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734916231; cv=none; b=WAGCOuVlgXV6Z4zGUSp/NVPvXy4kONgUK64O5c8OR1YTx0ztN4DHa3ZZhLjU4YeXX1zsE70CaGCax3xVJSH5YEpxFE7Q3mugZV3gHfc7q85V2HuDdbRwMSV/u2/45URFgeBRMWnr7AyEN9xxXz8OWRq3qFJy3m2npEsLXlt0e+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734916231; c=relaxed/simple;
	bh=XavwR6IbyPY9X/PJleIJsKdanFT7+MB75ZEuFTm9mRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YA8zuIZnQkayYnNdM9jdwT8757/nUg0oWrpETesBBtY6KAldqNcD0kSSOaJ3axefnE03aaWNs24+sL2aKsYS6LZQeaRdepm6H2Z/K2Hw6kohIiAz3JHO/+LQORvfAZyRweIATb/xlGdo29NW+PfuL2tSMjOw/9KKpTM2dDzGzF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iS9lXAyp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iS9lXAyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734916229; x=1766452229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XavwR6IbyPY9X/PJleIJsKdanFT7+MB75ZEuFTm9mRE=;
  b=iS9lXAypKe7vp/Bpdt5Bnk2cw4TrhKHOKoVCLqQ5utZyQoZ6RmlwInLl
   kPyafgcT+nBKtu9vL4sAGbQloUW9oCsrxw8PrRtIsm+0J2YZKL4YyXFDm
   Zw0M9W6qs2wWFRqsZsMgPQPbVQy9ToQB/gEqfKoOC4SJRemZg40dPnije
   CKWz5qnh4FtDSZdW02n1bkUQTI8CjjbOMA++0tXmP8xNwrX9NPQky8cyT
   MEObvRdPUb9lljI4wzuKjwssBVIezqYLDqB/rY3xNnn66iwrKc9Yf+Uvj
   51AofeWl4VvtZGyhPa/+iD8nOMxSBNgu1+3NgiNOz4hirDcRt1VPyi+uq
   A==;
X-CSE-ConnectionGUID: xmQb6yIJRxiRoUxtOjaRgg==
X-CSE-MsgGUID: JTf1Y6JhQgSZBLcTzo1OWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35504202"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35504202"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 17:10:29 -0800
X-CSE-ConnectionGUID: vWJGvYGDRVS4KIVshaWw3g==
X-CSE-MsgGUID: nc7VqJy8TMexATYPQPCHWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="103942273"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Dec 2024 17:10:26 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPWxk-0003Jz-1m;
	Mon, 23 Dec 2024 01:10:24 +0000
Date: Mon, 23 Dec 2024 09:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: drivers/hwtracing/intel_th/msu.c:162: warning: Function parameter or
 struct member 'mbuf_priv' not described in 'msc'
Message-ID: <202412230908.tbKuk3Gl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: 615c164da0eb42cbfb1688cb429cc4d5039db5d8 intel_th: msu: Introduce buffer interface
date:   5 years ago
config: x86_64-randconfig-071-20241209 (https://download.01.org/0day-ci/archive/20241223/202412230908.tbKuk3Gl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230908.tbKuk3Gl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230908.tbKuk3Gl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c:77: warning: Function parameter or struct member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:122: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:162: warning: Function parameter or struct member 'msu_base' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:162: warning: Function parameter or struct member 'mbuf_priv' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:162: warning: Function parameter or struct member 'work' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:162: warning: Function parameter or struct member 'iter_list' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:162: warning: Function parameter or struct member 'do_irq' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:1276: warning: Function parameter or struct member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1276: warning: Function parameter or struct member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1276: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'


vim +162 drivers/hwtracing/intel_th/msu.c

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
ba82664c134ef7 Alexander Shishkin 2015-09-22  146  
ba82664c134ef7 Alexander Shishkin 2015-09-22  147  	/* <0: no buffer, 0: no users, >0: active users */
ba82664c134ef7 Alexander Shishkin 2015-09-22  148  	atomic_t		user_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  149  
ba82664c134ef7 Alexander Shishkin 2015-09-22  150  	atomic_t		mmap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  151  	struct mutex		buf_mutex;
ba82664c134ef7 Alexander Shishkin 2015-09-22  152  
ba82664c134ef7 Alexander Shishkin 2015-09-22  153  	struct list_head	iter_list;
ba82664c134ef7 Alexander Shishkin 2015-09-22  154  
ba82664c134ef7 Alexander Shishkin 2015-09-22  155  	/* config */
ba82664c134ef7 Alexander Shishkin 2015-09-22  156  	unsigned int		enabled : 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  157  				wrap	: 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  158  				do_irq	: 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  159  	unsigned int		mode;
ba82664c134ef7 Alexander Shishkin 2015-09-22  160  	unsigned int		burst_len;
ba82664c134ef7 Alexander Shishkin 2015-09-22  161  	unsigned int		index;
ba82664c134ef7 Alexander Shishkin 2015-09-22 @162  };
ba82664c134ef7 Alexander Shishkin 2015-09-22  163  

:::::: The code at line 162 was first introduced by commit
:::::: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
