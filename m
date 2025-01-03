Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D91B87FA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930979; cv=none; b=T+GmLO4pDnXMERk0xpz+KX/RghGQw/O0l+gHW40AyrJ/ru/c56a5jA6Apy9E94QOFnPT+18mTkfz2ZCU277XgMbENfExJMbJJ7PrBSt17nMZJjH+PXm86a6bY38PEaHDiIkYwtd2X3CGrQutDgXnTXOA2Zb9BzVrYF2jI6vvjgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930979; c=relaxed/simple;
	bh=dTVcPW0Du7VAEokw5TgMuHbnmwIpQgmqrKJ5KEXk6ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BsypEw8gfvxGMqhYK6XiSXTDUx1YH+xp+DFT//SFCWTuyBcmzLt9F+Qjd4rP4Dp/C3y+x4VEX2SnicczsOgQiCh4EbJDd6QfOyCEZugDTqbIbwG/ccFJn2cnJ8/XygWalGmRekAYxynPwkLxForJsYxlnS71nAkSNDi+26a5hCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGuSYX+0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGuSYX+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735930978; x=1767466978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTVcPW0Du7VAEokw5TgMuHbnmwIpQgmqrKJ5KEXk6ig=;
  b=gGuSYX+0DIyK8bE1BeKh9R9BoyqR+hOvbZZaan1Ido7b1jKrQEIL9M0i
   6hY7IaT4gtM82o5dn+G5tXcp25gwFGspRbw/lJ1qsSVMPwTg4xPdZnUTv
   SO0MNFtZBQ59tq6nh1obYVv0Z3purSbQ2AfeDMqXRZQ9I1c1aJNJATvbA
   bK60fZw2/szjdwzJ1GHXuoyvtormBXLE0nFINpKzwa8d/dpKXO7tQzNiz
   ObpOFsWUhBqG1j3ZCBdX1eUOmRGrvYVc++kQ8BLfBZBfL8YAN1Uwvzp2A
   7jP+jZia8qVCX/xS/qr+rqMUk0N6Yp1nO5/Izmg1hNDT/rorMOQSqyaNK
   Q==;
X-CSE-ConnectionGUID: fzlfrnvJR1CXvn4RoOY4Ug==
X-CSE-MsgGUID: iiwTK0GqQ02TYgVeeoiItw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47594425"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47594425"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 11:02:58 -0800
X-CSE-ConnectionGUID: xlDAuQe/TOSnjjS+b7/tng==
X-CSE-MsgGUID: 121KF7ykSgK/3iBrshGQig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105906501"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jan 2025 11:02:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTmwg-000ACV-03;
	Fri, 03 Jan 2025 19:02:54 +0000
Date: Sat, 4 Jan 2025 03:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: drivers/hwtracing/intel_th/msu.c:162: warning: Function parameter or
 struct member 'mbuf_priv' not described in 'msc'
Message-ID: <202501040214.DyemqWbj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 615c164da0eb42cbfb1688cb429cc4d5039db5d8 intel_th: msu: Introduce buffer interface
date:   5 years ago
config: parisc-randconfig-r016-20230411 (https://download.01.org/0day-ci/archive/20250104/202501040214.DyemqWbj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040214.DyemqWbj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040214.DyemqWbj-lkp@intel.com/

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
