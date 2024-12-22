Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FC13C3CD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734861292; cv=none; b=ql7y8UVkcglLGzS/9iyIF2xs5FMCqiMs7JA0aE0HMLNqjO1dxyjwyNXZ64Rlj7+7b/Cfqe70hcifXmv//F1nEqBsDpMlF/zxWOPAmg9zcaY0rr0XFpGvF5+e1Q576pzNx0AUC7S/E5Z6VEftZWgMMl5Rvu0+xrHLECi5MFfciLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734861292; c=relaxed/simple;
	bh=GGeXgbbJF8PcQ2KIZSCB0IYlVvYA4KPNDRszuIrkKLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VK+4D7O/SxiEzFR9amx4IN3XxosZd6/7dBXyroEMHpU1zS4HVCu8OvEYqKrSOLAgUcxTfdMYsgrTTVjU7fEJAcEh9xJI3esptxOPR6Zc/WT4K4y0eSq7X/UU0iyC3wOadfhme2lVZ4EDQP4rXswAHqgQKFOYI7ZPCkpYoF35jYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXto3MvJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXto3MvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734861290; x=1766397290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGeXgbbJF8PcQ2KIZSCB0IYlVvYA4KPNDRszuIrkKLY=;
  b=RXto3MvJNoySx5DaWu5Jx5AR6e8Ff88leZH17bDj2BA5XYQhrHymuV0c
   FBF3hJiAGp+pn/MsT+/lHmbrK7pdCFA4Ca1x/3BidIJiGLBKrdfi+ssty
   PjAVKHJNWkbrDDyumGWR02FyL7UUoIKdmn0EvuxBgdc0Py89jgSk1OJJ1
   JmPXiCqm/BwPb5O6wGTXH9dbDjiQi66GBjcb6HBiuuqaeSBgQra+y5MaK
   eDaZ/SUgrIpipFiouAgDRljPNpodkb0gkd2YJSbMjbxOgX9SAxbHG1iZk
   e4fO3SL12Xqnz4ZLAVHH5gv3j1AALlv96/wYLKsIJmL+nVY4lAEczlsLa
   w==;
X-CSE-ConnectionGUID: x1B4KhflSYKHRWH026CYFQ==
X-CSE-MsgGUID: IUXnExE4Ttqt5BffSJoj1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34631897"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="34631897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 01:54:47 -0800
X-CSE-ConnectionGUID: xewPkMQ1SkCabupMUIeTAQ==
X-CSE-MsgGUID: hrFAvQ8FQfmSNVwwaAj/jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98782922"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2024 01:54:47 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPIfc-0002pR-0A;
	Sun, 22 Dec 2024 09:54:44 +0000
Date: Sun, 22 Dec 2024 17:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or
 struct member 'msu_base' not described in 'msc'
Message-ID: <202412221735.BHvca0mr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: aac8da65174a35749fcf21dbca4c1be314b562b5 intel_th: msu: Start handling IRQs
date:   6 years ago
config: x86_64-randconfig-071-20241209 (https://download.01.org/0day-ci/archive/20241222/202412221735.BHvca0mr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221735.BHvca0mr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221735.BHvca0mr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c:54: warning: Function parameter or struct member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:96: warning: bad line: 
>> drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or struct member 'msu_base' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or struct member 'iter_list' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:131: warning: Function parameter or struct member 'do_irq' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:966: warning: Function parameter or struct member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:966: warning: Function parameter or struct member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:966: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'


vim +131 drivers/hwtracing/intel_th/msu.c

ba82664c134ef7 Alexander Shishkin 2015-09-22   40  
ba82664c134ef7 Alexander Shishkin 2015-09-22   41  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   42   * struct msc_window - multiblock mode window descriptor
ba82664c134ef7 Alexander Shishkin 2015-09-22   43   * @entry:	window list linkage (msc::win_list)
ba82664c134ef7 Alexander Shishkin 2015-09-22   44   * @pgoff:	page offset into the buffer that this window starts at
ba82664c134ef7 Alexander Shishkin 2015-09-22   45   * @nr_blocks:	number of blocks (pages) in this window
ba82664c134ef7 Alexander Shishkin 2015-09-22   46   * @block:	array of block descriptors
ba82664c134ef7 Alexander Shishkin 2015-09-22   47   */
ba82664c134ef7 Alexander Shishkin 2015-09-22   48  struct msc_window {
ba82664c134ef7 Alexander Shishkin 2015-09-22   49  	struct list_head	entry;
ba82664c134ef7 Alexander Shishkin 2015-09-22   50  	unsigned long		pgoff;
ba82664c134ef7 Alexander Shishkin 2015-09-22   51  	unsigned int		nr_blocks;
ba82664c134ef7 Alexander Shishkin 2015-09-22   52  	struct msc		*msc;
ba82664c134ef7 Alexander Shishkin 2015-09-22   53  	struct msc_block	block[0];
ba82664c134ef7 Alexander Shishkin 2015-09-22  @54  };
ba82664c134ef7 Alexander Shishkin 2015-09-22   55  
ba82664c134ef7 Alexander Shishkin 2015-09-22   56  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   57   * struct msc_iter - iterator for msc buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   58   * @entry:		msc::iter_list linkage
ba82664c134ef7 Alexander Shishkin 2015-09-22   59   * @msc:		pointer to the MSC device
ba82664c134ef7 Alexander Shishkin 2015-09-22   60   * @start_win:		oldest window
ba82664c134ef7 Alexander Shishkin 2015-09-22   61   * @win:		current window
ba82664c134ef7 Alexander Shishkin 2015-09-22   62   * @offset:		current logical offset into the buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   63   * @start_block:	oldest block in the window
ba82664c134ef7 Alexander Shishkin 2015-09-22   64   * @block:		block number in the window
ba82664c134ef7 Alexander Shishkin 2015-09-22   65   * @block_off:		offset into current block
ba82664c134ef7 Alexander Shishkin 2015-09-22   66   * @wrap_count:		block wrapping handling
ba82664c134ef7 Alexander Shishkin 2015-09-22   67   * @eof:		end of buffer reached
ba82664c134ef7 Alexander Shishkin 2015-09-22   68   */
ba82664c134ef7 Alexander Shishkin 2015-09-22   69  struct msc_iter {
ba82664c134ef7 Alexander Shishkin 2015-09-22   70  	struct list_head	entry;
ba82664c134ef7 Alexander Shishkin 2015-09-22   71  	struct msc		*msc;
ba82664c134ef7 Alexander Shishkin 2015-09-22   72  	struct msc_window	*start_win;
ba82664c134ef7 Alexander Shishkin 2015-09-22   73  	struct msc_window	*win;
ba82664c134ef7 Alexander Shishkin 2015-09-22   74  	unsigned long		offset;
ba82664c134ef7 Alexander Shishkin 2015-09-22   75  	int			start_block;
ba82664c134ef7 Alexander Shishkin 2015-09-22   76  	int			block;
ba82664c134ef7 Alexander Shishkin 2015-09-22   77  	unsigned int		block_off;
ba82664c134ef7 Alexander Shishkin 2015-09-22   78  	unsigned int		wrap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22   79  	unsigned int		eof;
ba82664c134ef7 Alexander Shishkin 2015-09-22   80  };
ba82664c134ef7 Alexander Shishkin 2015-09-22   81  
ba82664c134ef7 Alexander Shishkin 2015-09-22   82  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   83   * struct msc - MSC device representation
ba82664c134ef7 Alexander Shishkin 2015-09-22   84   * @reg_base:		register window base address
ba82664c134ef7 Alexander Shishkin 2015-09-22   85   * @thdev:		intel_th_device pointer
ba82664c134ef7 Alexander Shishkin 2015-09-22   86   * @win_list:		list of windows in multiblock mode
4e0eaf239fb33e Alexander Shishkin 2019-05-03   87   * @single_sgt:		single mode buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   88   * @nr_pages:		total number of pages allocated for this buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   89   * @single_sz:		amount of data in single mode
ba82664c134ef7 Alexander Shishkin 2015-09-22   90   * @single_wrap:	single mode wrap occurred
ba82664c134ef7 Alexander Shishkin 2015-09-22   91   * @base:		buffer's base pointer
ba82664c134ef7 Alexander Shishkin 2015-09-22   92   * @base_addr:		buffer's base address
ba82664c134ef7 Alexander Shishkin 2015-09-22   93   * @user_count:		number of users of the buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   94   * @mmap_count:		number of mappings
ba82664c134ef7 Alexander Shishkin 2015-09-22   95   * @buf_mutex:		mutex to serialize access to buffer-related bits
ba82664c134ef7 Alexander Shishkin 2015-09-22   96  
ba82664c134ef7 Alexander Shishkin 2015-09-22   97   * @enabled:		MSC is enabled
ba82664c134ef7 Alexander Shishkin 2015-09-22   98   * @wrap:		wrapping is enabled
ba82664c134ef7 Alexander Shishkin 2015-09-22   99   * @mode:		MSC operating mode
ba82664c134ef7 Alexander Shishkin 2015-09-22  100   * @burst_len:		write burst length
ba82664c134ef7 Alexander Shishkin 2015-09-22  101   * @index:		number of this MSC in the MSU
ba82664c134ef7 Alexander Shishkin 2015-09-22  102   */
ba82664c134ef7 Alexander Shishkin 2015-09-22  103  struct msc {
ba82664c134ef7 Alexander Shishkin 2015-09-22  104  	void __iomem		*reg_base;
aac8da65174a35 Alexander Shishkin 2019-05-03  105  	void __iomem		*msu_base;
ba82664c134ef7 Alexander Shishkin 2015-09-22  106  	struct intel_th_device	*thdev;
ba82664c134ef7 Alexander Shishkin 2015-09-22  107  
ba82664c134ef7 Alexander Shishkin 2015-09-22  108  	struct list_head	win_list;
4e0eaf239fb33e Alexander Shishkin 2019-05-03  109  	struct sg_table		single_sgt;
ba82664c134ef7 Alexander Shishkin 2015-09-22  110  	unsigned long		nr_pages;
ba82664c134ef7 Alexander Shishkin 2015-09-22  111  	unsigned long		single_sz;
ba82664c134ef7 Alexander Shishkin 2015-09-22  112  	unsigned int		single_wrap : 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  113  	void			*base;
ba82664c134ef7 Alexander Shishkin 2015-09-22  114  	dma_addr_t		base_addr;
ba82664c134ef7 Alexander Shishkin 2015-09-22  115  
ba82664c134ef7 Alexander Shishkin 2015-09-22  116  	/* <0: no buffer, 0: no users, >0: active users */
ba82664c134ef7 Alexander Shishkin 2015-09-22  117  	atomic_t		user_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  118  
ba82664c134ef7 Alexander Shishkin 2015-09-22  119  	atomic_t		mmap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  120  	struct mutex		buf_mutex;
ba82664c134ef7 Alexander Shishkin 2015-09-22  121  
ba82664c134ef7 Alexander Shishkin 2015-09-22  122  	struct list_head	iter_list;
ba82664c134ef7 Alexander Shishkin 2015-09-22  123  
ba82664c134ef7 Alexander Shishkin 2015-09-22  124  	/* config */
ba82664c134ef7 Alexander Shishkin 2015-09-22  125  	unsigned int		enabled : 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  126  				wrap	: 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  127  				do_irq	: 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  128  	unsigned int		mode;
ba82664c134ef7 Alexander Shishkin 2015-09-22  129  	unsigned int		burst_len;
ba82664c134ef7 Alexander Shishkin 2015-09-22  130  	unsigned int		index;
ba82664c134ef7 Alexander Shishkin 2015-09-22 @131  };
ba82664c134ef7 Alexander Shishkin 2015-09-22  132  

:::::: The code at line 131 was first introduced by commit
:::::: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
