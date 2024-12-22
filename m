Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663517B505
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734897445; cv=none; b=ALrrBwUcca6ebukZ0pvpBo/WVXy6AhDrsGUOj1oM2f84Ue12XojGBkPy9HLRZRNObkrq9J8uvMoiVscNSvKIUSmG8K2LGidKdqG4fQuKh7BnguV91hWFd4gVSLLNSxeQm2wuHq0hgxvfqPKToIBumD6mOUDCoctbXVxS67XLg4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734897445; c=relaxed/simple;
	bh=yrq0ml2F2rAN0ydkdjW6Y15hzVY8yW8FDsZPZCfI3R4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAecP0uihWeuRgOoPtDen5RqiTy4MaTz7uBrAX/qjLcr7uNL8buSDzpSdiHFZje0xgIqoJ16ATVY6vNpkLQcinjCF61r2jpHcgod1Yf7mKgf6s4DAgKvv9FdEjYfaTcyQLh6xOn+hWVFJ8RiHj/Dphd9GRGij0uUC167LuTU2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mor/S4DQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mor/S4DQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734897444; x=1766433444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrq0ml2F2rAN0ydkdjW6Y15hzVY8yW8FDsZPZCfI3R4=;
  b=mor/S4DQTFq0Am/9oT/UOCfH+FaM6UGz4xZT4+IxLrXsI6ax/qI9f/hX
   a3tJQiMyYHJVYQJ7JTiy9cpidDUuKnV9DKMoMOMdzBc8WNMNgJZYH0cO3
   0lcSUCr/Gkc+v6pU5isbBGvNolMCsuYWKEScj1rHJ4zRyv+IMsLTDWeYz
   Ax3z7mhyC9RgInAwMaFf9NTMXJNDVoGjM3MNr2WDZk2i8USt4d8g9NAO0
   MOSb1+IYcmmivPifsmhvu8VyYgaCm6RbYPXGWV61KGW4CnAXOispQ4EFg
   Ah0RebnIge9v6Z9709DIDSG5dcDf0UbLYpW8ObmPOi8bOjvMwxwbVBT5r
   A==;
X-CSE-ConnectionGUID: llYf05xeSz2JiMnwbxJjqw==
X-CSE-MsgGUID: tDcmutm1TJqCI/3dGt91nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35082979"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35082979"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 11:57:21 -0800
X-CSE-ConnectionGUID: RCmWqVYMSTqAlvnn1oPhLA==
X-CSE-MsgGUID: zSrCPZnxTnOIWJzRnAIxCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122303172"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2024 11:57:19 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPS4j-00038Q-1Y;
	Sun, 22 Dec 2024 19:57:17 +0000
Date: Mon, 23 Dec 2024 03:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or
 struct member 'multi_is_broken' not described in 'msc'
Message-ID: <202412230356.PsvGLzNk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcde95ce32b666478d6737219caa4f8005a8f201
commit: 397c7729665a3b07a7b4ce7215173df8e9112809 intel_th: Disallow multi mode on devices where it's broken
date:   4 years, 9 months ago
config: arm64-randconfig-003-20241212 (https://download.01.org/0day-ci/archive/20241223/202412230356.PsvGLzNk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230356.PsvGLzNk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230356.PsvGLzNk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c:77: warning: Function parameter or struct member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:122: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'msu_base' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'mbuf_priv' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'work' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'orig_addr' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'orig_sz' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'iter_list' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'do_irq' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:165: warning: Function parameter or struct member 'multi_is_broken' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:1283: warning: Function parameter or struct member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1283: warning: Function parameter or struct member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1283: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'


vim +165 drivers/hwtracing/intel_th/msu.c

615c164da0eb42 Alexander Shishkin 2019-07-05   55  
ba82664c134ef7 Alexander Shishkin 2015-09-22   56  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   57   * struct msc_window - multiblock mode window descriptor
ba82664c134ef7 Alexander Shishkin 2015-09-22   58   * @entry:	window list linkage (msc::win_list)
ba82664c134ef7 Alexander Shishkin 2015-09-22   59   * @pgoff:	page offset into the buffer that this window starts at
615c164da0eb42 Alexander Shishkin 2019-07-05   60   * @lockout:	lockout state, see comment below
615c164da0eb42 Alexander Shishkin 2019-07-05   61   * @lo_lock:	lockout state serialization
ba82664c134ef7 Alexander Shishkin 2015-09-22   62   * @nr_blocks:	number of blocks (pages) in this window
fa52b3fe5e9383 Alexander Shishkin 2019-06-27   63   * @nr_segs:	number of segments in this window (<= @nr_blocks)
bbbc08a154a175 Alexander Shishkin 2019-06-27   64   * @_sgt:	array of block descriptors
ba39bd8306057f Alexander Shishkin 2019-05-03   65   * @sgt:	array of block descriptors
ba82664c134ef7 Alexander Shishkin 2015-09-22   66   */
ba82664c134ef7 Alexander Shishkin 2015-09-22   67  struct msc_window {
ba82664c134ef7 Alexander Shishkin 2015-09-22   68  	struct list_head	entry;
ba82664c134ef7 Alexander Shishkin 2015-09-22   69  	unsigned long		pgoff;
615c164da0eb42 Alexander Shishkin 2019-07-05   70  	enum lockout_state	lockout;
615c164da0eb42 Alexander Shishkin 2019-07-05   71  	spinlock_t		lo_lock;
ba82664c134ef7 Alexander Shishkin 2015-09-22   72  	unsigned int		nr_blocks;
fa52b3fe5e9383 Alexander Shishkin 2019-06-27   73  	unsigned int		nr_segs;
ba82664c134ef7 Alexander Shishkin 2015-09-22   74  	struct msc		*msc;
bbbc08a154a175 Alexander Shishkin 2019-06-27   75  	struct sg_table		_sgt;
bbbc08a154a175 Alexander Shishkin 2019-06-27   76  	struct sg_table		*sgt;
ba82664c134ef7 Alexander Shishkin 2015-09-22  @77  };
ba82664c134ef7 Alexander Shishkin 2015-09-22   78  
ba82664c134ef7 Alexander Shishkin 2015-09-22   79  /**
ba82664c134ef7 Alexander Shishkin 2015-09-22   80   * struct msc_iter - iterator for msc buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   81   * @entry:		msc::iter_list linkage
ba82664c134ef7 Alexander Shishkin 2015-09-22   82   * @msc:		pointer to the MSC device
ba82664c134ef7 Alexander Shishkin 2015-09-22   83   * @start_win:		oldest window
ba82664c134ef7 Alexander Shishkin 2015-09-22   84   * @win:		current window
ba82664c134ef7 Alexander Shishkin 2015-09-22   85   * @offset:		current logical offset into the buffer
ba82664c134ef7 Alexander Shishkin 2015-09-22   86   * @start_block:	oldest block in the window
ba82664c134ef7 Alexander Shishkin 2015-09-22   87   * @block:		block number in the window
ba82664c134ef7 Alexander Shishkin 2015-09-22   88   * @block_off:		offset into current block
ba82664c134ef7 Alexander Shishkin 2015-09-22   89   * @wrap_count:		block wrapping handling
ba82664c134ef7 Alexander Shishkin 2015-09-22   90   * @eof:		end of buffer reached
ba82664c134ef7 Alexander Shishkin 2015-09-22   91   */
ba82664c134ef7 Alexander Shishkin 2015-09-22   92  struct msc_iter {
ba82664c134ef7 Alexander Shishkin 2015-09-22   93  	struct list_head	entry;
ba82664c134ef7 Alexander Shishkin 2015-09-22   94  	struct msc		*msc;
ba82664c134ef7 Alexander Shishkin 2015-09-22   95  	struct msc_window	*start_win;
ba82664c134ef7 Alexander Shishkin 2015-09-22   96  	struct msc_window	*win;
ba82664c134ef7 Alexander Shishkin 2015-09-22   97  	unsigned long		offset;
57b69a1f66486d Alexander Shishkin 2019-07-05   98  	struct scatterlist	*start_block;
57b69a1f66486d Alexander Shishkin 2019-07-05   99  	struct scatterlist	*block;
ba82664c134ef7 Alexander Shishkin 2015-09-22  100  	unsigned int		block_off;
ba82664c134ef7 Alexander Shishkin 2015-09-22  101  	unsigned int		wrap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  102  	unsigned int		eof;
ba82664c134ef7 Alexander Shishkin 2015-09-22  103  };
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
397c7729665a3b Alexander Shishkin 2020-03-17  160  				do_irq	: 1,
397c7729665a3b Alexander Shishkin 2020-03-17  161  				multi_is_broken : 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  162  	unsigned int		mode;
ba82664c134ef7 Alexander Shishkin 2015-09-22  163  	unsigned int		burst_len;
ba82664c134ef7 Alexander Shishkin 2015-09-22  164  	unsigned int		index;
ba82664c134ef7 Alexander Shishkin 2015-09-22 @165  };
ba82664c134ef7 Alexander Shishkin 2015-09-22  166  

:::::: The code at line 165 was first introduced by commit
:::::: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
