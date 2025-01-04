Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFAD1DDEA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736010548; cv=none; b=Z58Fl+HsGWAwszqVs97SFR2Atth9WKvg5cjIuMHAmqgGJdyRXDT0JWM2h2t8biMoo4IHoz0Wn5wd4i/aZTjA9EEEqpy6FVDVNFz8vms+ynBemTf+9zDj0QiW8/BXRn/2h8gJE1m67sc9Ve8q99rW4YZFQwobXxWClYwXbURmgqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736010548; c=relaxed/simple;
	bh=Y0YrV7ile9sA2QU8mhJWUoeovHYaLn/T2EynKijqAng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/8D/c4COhXy0Vems7y91g+BTNB5Kh0VY+qJA5XmdnTMf9RQMJtSj287iDVnclOIMZJpm4rYE+QK+iQMBfcMrjTX9WH6ZqRZrgn0bv5+GAoz3DXDXcbWuzQ2WtSZh3+hrLNMBfg84ndDxkgL3WOOxAQl6uRNu/Ayv4jDW+cwtG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=feXPl+cN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="feXPl+cN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736010547; x=1767546547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y0YrV7ile9sA2QU8mhJWUoeovHYaLn/T2EynKijqAng=;
  b=feXPl+cN/qbbliRvbyvHEjigIawOURrTsz5xajUy+HmKDtZ0BP3YWkfI
   6c2Ztce/G8duASsTEhq1oQ0gLh62+1/j0+dtJEZNEsD2VRGwq38VB8qTR
   CrJbf0QsDaBFNSMKXsUaOiueMzCJM13f2UE/jjGNfSavaj+GYpN3BvhjL
   WR9g3Y9Q25iRKDDQWCsf1Qu8lKx9FRdfLxBqOK7YF0UYelNqexzwJ4BMY
   +0Xkc48DkqYpQLPumN0Sk0fWrTLyTwrt38+8TUh/860/YzxCSsAc1a7fb
   Nrp6c4SA+1Nfq4J4gz0CG1xLSEHES5kPSxKzDGf9fnFxT4u4GlHWnRMlH
   Q==;
X-CSE-ConnectionGUID: RRm5k0Z7SjC7vdEwvCH94w==
X-CSE-MsgGUID: JeE0NMxPTRioLySTGCc1yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36096747"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36096747"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 09:09:07 -0800
X-CSE-ConnectionGUID: juUB3+MpQ4GSwPmjyTuTsQ==
X-CSE-MsgGUID: Bg7GU6NWRKiM5k/8AE5gjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102912354"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jan 2025 09:09:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU7e2-000B5X-1B;
	Sat, 04 Jan 2025 17:09:02 +0000
Date: Sun, 5 Jan 2025 01:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or
 struct member 'switch_on_unlock' not described in 'msc'
Message-ID: <202501050137.ZcXa1BjX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 8622dfefb6ac333c58d354331d1bf78a2927ce51 intel_th: msu: Make stopping the trace optional
date:   4 years, 9 months ago
config: parisc-randconfig-r016-20230411 (https://download.01.org/0day-ci/archive/20250105/202501050137.ZcXa1BjX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050137.ZcXa1BjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050137.ZcXa1BjX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/intel_th/msu.c:77: warning: Function parameter or struct member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:122: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'msu_base' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'mbuf_priv' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'work' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'switch_on_unlock' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'orig_addr' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'orig_sz' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'iter_list' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'stop_on_full' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'do_irq' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'multi_is_broken' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:1287: warning: Function parameter or struct member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1287: warning: Function parameter or struct member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1287: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'


vim +168 drivers/hwtracing/intel_th/msu.c

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
8622dfefb6ac33 Alexander Shishkin 2020-03-19  141  	struct msc_window	*switch_on_unlock;
ba82664c134ef7 Alexander Shishkin 2015-09-22  142  	unsigned long		nr_pages;
ba82664c134ef7 Alexander Shishkin 2015-09-22  143  	unsigned long		single_sz;
ba82664c134ef7 Alexander Shishkin 2015-09-22  144  	unsigned int		single_wrap : 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  145  	void			*base;
ba82664c134ef7 Alexander Shishkin 2015-09-22  146  	dma_addr_t		base_addr;
092f47c383adbf Alexander Shishkin 2019-07-05  147  	u32			orig_addr;
092f47c383adbf Alexander Shishkin 2019-07-05  148  	u32			orig_sz;
ba82664c134ef7 Alexander Shishkin 2015-09-22  149  
ba82664c134ef7 Alexander Shishkin 2015-09-22  150  	/* <0: no buffer, 0: no users, >0: active users */
ba82664c134ef7 Alexander Shishkin 2015-09-22  151  	atomic_t		user_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  152  
ba82664c134ef7 Alexander Shishkin 2015-09-22  153  	atomic_t		mmap_count;
ba82664c134ef7 Alexander Shishkin 2015-09-22  154  	struct mutex		buf_mutex;
ba82664c134ef7 Alexander Shishkin 2015-09-22  155  
ba82664c134ef7 Alexander Shishkin 2015-09-22  156  	struct list_head	iter_list;
ba82664c134ef7 Alexander Shishkin 2015-09-22  157  
8622dfefb6ac33 Alexander Shishkin 2020-03-19  158  	bool			stop_on_full;
8622dfefb6ac33 Alexander Shishkin 2020-03-19  159  
ba82664c134ef7 Alexander Shishkin 2015-09-22  160  	/* config */
ba82664c134ef7 Alexander Shishkin 2015-09-22  161  	unsigned int		enabled : 1,
aac8da65174a35 Alexander Shishkin 2019-05-03  162  				wrap	: 1,
397c7729665a3b Alexander Shishkin 2020-03-17  163  				do_irq	: 1,
397c7729665a3b Alexander Shishkin 2020-03-17  164  				multi_is_broken : 1;
ba82664c134ef7 Alexander Shishkin 2015-09-22  165  	unsigned int		mode;
ba82664c134ef7 Alexander Shishkin 2015-09-22  166  	unsigned int		burst_len;
ba82664c134ef7 Alexander Shishkin 2015-09-22  167  	unsigned int		index;
ba82664c134ef7 Alexander Shishkin 2015-09-22 @168  };
ba82664c134ef7 Alexander Shishkin 2015-09-22  169  

:::::: The code at line 168 was first introduced by commit
:::::: ba82664c134ef7ab97808f09a3c5e894b0a4900d intel_th: Add Memory Storage Unit driver

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
