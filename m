Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30612F5A6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711558357; cv=none; b=nVvDZTozLBwjubikH1dJQVzQ0dT3+i+TTqx++npyTh+Z5azviaquwUvoURyuFZsLxHMo85qXccXY1ZQ8ijShn4p4V31G2U5DR6mWAXpk0rlxWgYyWLXibA/ZWgbTmsAzujYE326LToZrusSAKLKKh77nMcKfloutS6LA351zBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711558357; c=relaxed/simple;
	bh=YL5g4HtmYUHvsv2icjeClBC/kZjz8b4K2ajAEr0S5iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dI4MToUprec56vsmRw4VW2V0ZaVkTyOdOtDPNLypG+UIWYt1iegdmrhhBaTeIiSg6vcsMMSlzLWK+vTfYqG3BdnXPPDKvR+PEwOJ24xPF/ciZ74NMW7e5r7LPFrjdskDB9etnwZpBFZc+qVjB5inmlysrK7aXVhdNkFqo87x9Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr1i5Hbg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr1i5Hbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711558355; x=1743094355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YL5g4HtmYUHvsv2icjeClBC/kZjz8b4K2ajAEr0S5iQ=;
  b=Hr1i5HbgFkCTX7yv1KetirElwPREnW4k8GIkU9BVxoUV1Zj/G6wXtp5z
   3fuMq92xWgNClrki0nQCoIV/i0TXQ+8bUfn2Gr6aoBF8W3ywXtPsS7i7Z
   8TbWWWk7IVDsNvPYClV8Nto2nybbWmF/kFZoBUhWfw1rA3+TlMZR9/76O
   aZyCAZ12uDX1Oe1Szz7IRgtIs6gVpjJCS7AvPWR2iVyNBhcquN2I89bOo
   EmhAcw/VSBj/P6ABz40m9WNjaUuuZQQluCY9mUOCYIRmehfT9D3yWkoTQ
   qGnxH/+NH/pufEiY63p7bjY9KLpVOn1yVfdj4+NUsj8Mu7GlkKx/ssSk+
   Q==;
X-CSE-ConnectionGUID: 6mPrbdzoQaql7mQQaJlLbg==
X-CSE-MsgGUID: t5kDgrNdTDK9CQp15zO1Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="32119863"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="32119863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53830487"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Mar 2024 09:52:33 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpWVq-0001HM-2E;
	Wed, 27 Mar 2024 16:52:30 +0000
Date: Thu, 28 Mar 2024 00:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [akpm-mm:mm-unstable 86/199] mm/nommu.c:258: warning: expecting
 prototype for vmalloc_node_noprof(). Prototype was for vmalloc_node()
 instead
Message-ID: <202403280003.Y6Lp2ZvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   4e567abb6482f6228d23491a25b0d343350e51fe
commit: 9aa556ae32f93a3d72747460903fdd229be19d54 [86/199] mm: vmalloc: enable memory allocation profiling
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20240328/202403280003.Y6Lp2ZvS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280003.Y6Lp2ZvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280003.Y6Lp2ZvS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/nommu.c:258: warning: expecting prototype for vmalloc_node_noprof(). Prototype was for vmalloc_node() instead
>> mm/nommu.c:276: warning: expecting prototype for vzalloc_node_noprof(). Prototype was for vzalloc_node() instead
>> mm/nommu.c:289: warning: expecting prototype for vmalloc_32_noprof(). Prototype was for vmalloc_32() instead
>> mm/nommu.c:305: warning: expecting prototype for vmalloc_32_user_noprof(). Prototype was for vmalloc_32_user() instead


vim +258 mm/nommu.c

e1ca7788dec677 Dave Young      2010-10-26  245  
e1ca7788dec677 Dave Young      2010-10-26  246  /**
9aa556ae32f93a Kent Overstreet 2024-03-21  247   * vmalloc_node_noprof - allocate memory on a specific node
e1ca7788dec677 Dave Young      2010-10-26  248   * @size:	allocation size
e1ca7788dec677 Dave Young      2010-10-26  249   * @node:	numa node
e1ca7788dec677 Dave Young      2010-10-26  250   *
e1ca7788dec677 Dave Young      2010-10-26  251   * Allocate enough pages to cover @size from the page level
e1ca7788dec677 Dave Young      2010-10-26  252   * allocator and map them into contiguous kernel virtual space.
e1ca7788dec677 Dave Young      2010-10-26  253   *
e1ca7788dec677 Dave Young      2010-10-26  254   * For tight control over page level allocator and protection flags
e1ca7788dec677 Dave Young      2010-10-26  255   * use __vmalloc() instead.
e1ca7788dec677 Dave Young      2010-10-26  256   */
9aa556ae32f93a Kent Overstreet 2024-03-21  257  void *vmalloc_node_noprof(unsigned long size, int node)
f61388822a6040 Andrew Morton   2006-02-28 @258  {
9aa556ae32f93a Kent Overstreet 2024-03-21  259  	return vmalloc_noprof(size);
f61388822a6040 Andrew Morton   2006-02-28  260  }
9aa556ae32f93a Kent Overstreet 2024-03-21  261  EXPORT_SYMBOL(vmalloc_node_noprof);
e1ca7788dec677 Dave Young      2010-10-26  262  
e1ca7788dec677 Dave Young      2010-10-26  263  /**
9aa556ae32f93a Kent Overstreet 2024-03-21  264   * vzalloc_node_noprof - allocate memory on a specific node with zero fill
e1ca7788dec677 Dave Young      2010-10-26  265   * @size:	allocation size
e1ca7788dec677 Dave Young      2010-10-26  266   * @node:	numa node
e1ca7788dec677 Dave Young      2010-10-26  267   *
e1ca7788dec677 Dave Young      2010-10-26  268   * Allocate enough pages to cover @size from the page level
e1ca7788dec677 Dave Young      2010-10-26  269   * allocator and map them into contiguous kernel virtual space.
e1ca7788dec677 Dave Young      2010-10-26  270   * The memory allocated is set to zero.
e1ca7788dec677 Dave Young      2010-10-26  271   *
e1ca7788dec677 Dave Young      2010-10-26  272   * For tight control over page level allocator and protection flags
e1ca7788dec677 Dave Young      2010-10-26  273   * use __vmalloc() instead.
e1ca7788dec677 Dave Young      2010-10-26  274   */
9aa556ae32f93a Kent Overstreet 2024-03-21  275  void *vzalloc_node_noprof(unsigned long size, int node)
e1ca7788dec677 Dave Young      2010-10-26 @276  {
9aa556ae32f93a Kent Overstreet 2024-03-21  277  	return vzalloc_noprof(size);
e1ca7788dec677 Dave Young      2010-10-26  278  }
9aa556ae32f93a Kent Overstreet 2024-03-21  279  EXPORT_SYMBOL(vzalloc_node_noprof);
^1da177e4c3f41 Linus Torvalds  2005-04-16  280  
b50731732f926d Paul Mundt      2007-07-21  281  /**
9aa556ae32f93a Kent Overstreet 2024-03-21  282   * vmalloc_32_noprof  -  allocate virtually contiguous memory (32bit addressable)
^1da177e4c3f41 Linus Torvalds  2005-04-16  283   *	@size:		allocation size
^1da177e4c3f41 Linus Torvalds  2005-04-16  284   *
^1da177e4c3f41 Linus Torvalds  2005-04-16  285   *	Allocate enough 32bit PA addressable pages to cover @size from the
e1c05067c323fb Masahiro Yamada 2015-07-07  286   *	page level allocator and map them into contiguous kernel virtual space.
^1da177e4c3f41 Linus Torvalds  2005-04-16  287   */
9aa556ae32f93a Kent Overstreet 2024-03-21  288  void *vmalloc_32_noprof(unsigned long size)
^1da177e4c3f41 Linus Torvalds  2005-04-16 @289  {
9aa556ae32f93a Kent Overstreet 2024-03-21  290  	return __vmalloc_noprof(size, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  291  }
9aa556ae32f93a Kent Overstreet 2024-03-21  292  EXPORT_SYMBOL(vmalloc_32_noprof);
b50731732f926d Paul Mundt      2007-07-21  293  
b50731732f926d Paul Mundt      2007-07-21  294  /**
9aa556ae32f93a Kent Overstreet 2024-03-21  295   * vmalloc_32_user_noprof - allocate zeroed virtually contiguous 32bit memory
b50731732f926d Paul Mundt      2007-07-21  296   *	@size:		allocation size
b50731732f926d Paul Mundt      2007-07-21  297   *
b50731732f926d Paul Mundt      2007-07-21  298   * The resulting memory area is 32bit addressable and zeroed so it can be
b50731732f926d Paul Mundt      2007-07-21  299   * mapped to userspace without leaking data.
f905bc447c303f Paul Mundt      2008-02-04  300   *
f905bc447c303f Paul Mundt      2008-02-04  301   * VM_USERMAP is set on the corresponding VMA so that subsequent calls to
f905bc447c303f Paul Mundt      2008-02-04  302   * remap_vmalloc_range() are permissible.
b50731732f926d Paul Mundt      2007-07-21  303   */
9aa556ae32f93a Kent Overstreet 2024-03-21  304  void *vmalloc_32_user_noprof(unsigned long size)
b50731732f926d Paul Mundt      2007-07-21 @305  {
f905bc447c303f Paul Mundt      2008-02-04  306  	/*
f905bc447c303f Paul Mundt      2008-02-04  307  	 * We'll have to sort out the ZONE_DMA bits for 64-bit,
f905bc447c303f Paul Mundt      2008-02-04  308  	 * but for now this can simply use vmalloc_user() directly.
f905bc447c303f Paul Mundt      2008-02-04  309  	 */
9aa556ae32f93a Kent Overstreet 2024-03-21  310  	return vmalloc_user_noprof(size);
b50731732f926d Paul Mundt      2007-07-21  311  }
9aa556ae32f93a Kent Overstreet 2024-03-21  312  EXPORT_SYMBOL(vmalloc_32_user_noprof);
^1da177e4c3f41 Linus Torvalds  2005-04-16  313  

:::::: The code at line 258 was first introduced by commit
:::::: f61388822a6040ff462c5f7260daa0f1017f2db0 [PATCH] nommu: implement vmalloc_node()

:::::: TO: Andrew Morton <akpm@osdl.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
