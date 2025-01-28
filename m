Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C321E98ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738099779; cv=none; b=RCJA5ichySqjhIVAswd6tcEDTFTcP7DZ1ybMIeJu7m/wf3353B7V2kBCHZ2hjUX9W43gh9T4isDI/jd+dvP+dquqpcGZ7U/Jm+zjb4gBgsfhqLpYgBTKW02lucvteEhGRwt9OLZJmSpwFx9D+xdC8dczawsDTL3Kf71f/houtWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738099779; c=relaxed/simple;
	bh=UTf8mwkhnYTNR1+AFTF4EQuqXZQTsZxJLeJgt8YSuig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FBlxQ4JIUuvFqyAONGppAtu+S6nIA/gR6yaob2czMUa1yNgrgRvvp+PYyYdbzfHxFLo7c8MfLv46bxj89bfwn5V/bVU0BDDCVkBet9xQsLquMNO9OPjidyOyvDnJULLbQah6KtR+F+yQIG1ARYqRVoPd36kz8fY8UuP+mhlGeQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOKRSdSG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOKRSdSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738099777; x=1769635777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTf8mwkhnYTNR1+AFTF4EQuqXZQTsZxJLeJgt8YSuig=;
  b=HOKRSdSG5UzgvUn47aYcNM17qlsSMF9bP3rFuFH8OHZnNPian2WdiBm1
   mMnESKcbMlP/LNPj25463cRoS06EgbnzFKHmWAb2A2EhrLjaqdnoLragb
   aleO4xroMK3MB4XW7KDLnA+Qu/2FXAfSQqDviDzwfy6ifkPzSBvNnXeNC
   bU5RSOBtcIHvchmY8tIhp4SIa9RzdCgZQE9Q/JtRi9BcHTgDKMX/Gz/F4
   79gPga0AL+b7GpSLSahK8N6huRQeb088LHjOHo30H68sgGbVtZEmr+y9c
   haH+8p2z/7TpyBRM06cPgCr8WpbILzKTMUhLQ2ndtynfys4v4mrOhuGAq
   Q==;
X-CSE-ConnectionGUID: IJXl02WBQK+MKOvFvUe9yg==
X-CSE-MsgGUID: 0FkSaHjPQsO4bPyYXfaSVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38706823"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38706823"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 13:29:35 -0800
X-CSE-ConnectionGUID: DJPRZTujTYC1rsCXvIDDAw==
X-CSE-MsgGUID: Nxp3EGAyTEy1lPjtSdcIOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109772724"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 13:29:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tct9H-000iFp-26;
	Tue, 28 Jan 2025 21:29:31 +0000
Date: Wed, 29 Jan 2025 05:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_13 2/18]
 kernel/events/uprobes.c:475:24: warning: variable 'uprobe' set but not used
Message-ID: <202501290558.cTXERqVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_13
head:   a264266ebd33899155a0cf37feac0ef4e300cec0
commit: d5ed71e33003ba39762296035f70af6fd1def07f [2/18] uprobes: Move ref_ctr_offset update out of uprobe_write_opcode
config: riscv-randconfig-002-20250129 (https://download.01.org/0day-ci/archive/20250129/202501290558.cTXERqVg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290558.cTXERqVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290558.cTXERqVg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/events/uprobes.c: In function 'uprobe_write_opcode':
>> kernel/events/uprobes.c:475:24: warning: variable 'uprobe' set but not used [-Wunused-but-set-variable]
     475 |         struct uprobe *uprobe;
         |                        ^~~~~~


vim +/uprobe +475 kernel/events/uprobes.c

1cc33161a83d20 kernel/events/uprobes.c Ravi Bangoria              2018-08-20  453  
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  454  /*
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  455   * NOTE:
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  456   * Expect the breakpoint instruction to be the smallest size instruction for
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  457   * the architecture. If an arch has variable length instruction and the
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  458   * breakpoint instruction is not of the smallest length instruction
0908ad6e56b5a6 kernel/events/uprobes.c Ananth N Mavinakayanahalli 2013-03-22  459   * supported by that architecture then we need to modify is_trap_at_addr and
f72d41fa902fb1 kernel/events/uprobes.c Oleg Nesterov              2013-11-05  460   * uprobe_write_opcode accordingly. This would never be a problem for archs
f72d41fa902fb1 kernel/events/uprobes.c Oleg Nesterov              2013-11-05  461   * that have fixed length instructions.
29dedee0e693aa kernel/events/uprobes.c Oleg Nesterov              2014-05-05  462   *
f72d41fa902fb1 kernel/events/uprobes.c Oleg Nesterov              2013-11-05  463   * uprobe_write_opcode - write the opcode at a given virtual address.
9ce4d216fe8b58 kernel/events/uprobes.c Qiujun Huang               2021-05-24  464   * @auprobe: arch specific probepoint information.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  465   * @mm: the probed process address space.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  466   * @vaddr: the virtual address to store the opcode.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  467   * @opcode: opcode to be written at @vaddr.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  468   *
84455e6923c79a kernel/events/uprobes.c Oleg Nesterov              2024-08-01  469   * Called with mm->mmap_lock held for read or write.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  470   * Return 0 (success) or a negative errno.
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  471   */
6d43743e9079ac kernel/events/uprobes.c Ravi Bangoria              2018-08-09  472  int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm,
6d43743e9079ac kernel/events/uprobes.c Ravi Bangoria              2018-08-09  473  			unsigned long vaddr, uprobe_opcode_t opcode)
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  474  {
1cc33161a83d20 kernel/events/uprobes.c Ravi Bangoria              2018-08-20 @475  	struct uprobe *uprobe;
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  476  	struct page *old_page, *new_page;
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  477  	struct vm_area_struct *vma;
d5ed71e33003ba kernel/events/uprobes.c Jiri Olsa                  2025-01-04  478  	int ret, is_register;
f385cb85a42fc4 kernel/events/uprobes.c Song Liu                   2019-09-23  479  	bool orig_page_huge = false;
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  480  	unsigned int gup_flags = FOLL_FORCE;
1cc33161a83d20 kernel/events/uprobes.c Ravi Bangoria              2018-08-20  481  
1cc33161a83d20 kernel/events/uprobes.c Ravi Bangoria              2018-08-20  482  	is_register = is_swbp_insn(&opcode);
1cc33161a83d20 kernel/events/uprobes.c Ravi Bangoria              2018-08-20  483  	uprobe = container_of(auprobe, struct uprobe, arch);
f403072c6108e1 kernel/events/uprobes.c Oleg Nesterov              2012-07-29  484  
5323ce71e4b4e1 kernel/events/uprobes.c Oleg Nesterov              2012-06-15  485  retry:
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  486  	if (is_register)
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  487  		gup_flags |= FOLL_SPLIT_PMD;
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  488  	/* Read the page with vaddr into memory */
ca5e863233e8f6 kernel/events/uprobes.c Lorenzo Stoakes            2023-05-17  489  	old_page = get_user_page_vma_remote(mm, vaddr, gup_flags, &vma);
6a1960b8a87733 kernel/events/uprobes.c Lorenzo Stoakes            2023-10-03  490  	if (IS_ERR(old_page))
6a1960b8a87733 kernel/events/uprobes.c Lorenzo Stoakes            2023-10-03  491  		return PTR_ERR(old_page);
7b2d81d48a2d8e kernel/uprobes.c        Ingo Molnar                2012-02-17  492  
ed6f6a50dc5f18 kernel/events/uprobes.c Oleg Nesterov              2012-09-23  493  	ret = verify_opcode(old_page, vaddr, &opcode);
ed6f6a50dc5f18 kernel/events/uprobes.c Oleg Nesterov              2012-09-23  494  	if (ret <= 0)
ed6f6a50dc5f18 kernel/events/uprobes.c Oleg Nesterov              2012-09-23  495  		goto put_old;
ed6f6a50dc5f18 kernel/events/uprobes.c Oleg Nesterov              2012-09-23  496  
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  497  	if (WARN(!is_register && PageCompound(old_page),
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  498  		 "uprobe unregister should never work on compound page\n")) {
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  499  		ret = -EINVAL;
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  500  		goto put_old;
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  501  	}
aa5de305c90c99 kernel/events/uprobes.c Song Liu                   2019-10-18  502  
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  503  	ret = 0;
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  504  	if (!is_register && !PageAnon(old_page))
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  505  		goto put_old;
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  506  
29dedee0e693aa kernel/events/uprobes.c Oleg Nesterov              2014-05-05  507  	ret = anon_vma_prepare(vma);
29dedee0e693aa kernel/events/uprobes.c Oleg Nesterov              2014-05-05  508  	if (ret)
29dedee0e693aa kernel/events/uprobes.c Oleg Nesterov              2014-05-05  509  		goto put_old;
29dedee0e693aa kernel/events/uprobes.c Oleg Nesterov              2014-05-05  510  
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  511  	ret = -ENOMEM;
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  512  	new_page = alloc_page_vma(GFP_HIGHUSER_MOVABLE, vma, vaddr);
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  513  	if (!new_page)
9f92448ceeea53 kernel/events/uprobes.c Oleg Nesterov              2012-07-29  514  		goto put_old;
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  515  
29dedee0e693aa kernel/events/uprobes.c Oleg Nesterov              2014-05-05  516  	__SetPageUptodate(new_page);
3f47107c5c2972 kernel/events/uprobes.c Oleg Nesterov              2013-03-24  517  	copy_highpage(new_page, old_page);
3f47107c5c2972 kernel/events/uprobes.c Oleg Nesterov              2013-03-24  518  	copy_to_page(new_page, vaddr, &opcode, UPROBE_SWBP_INSN_SIZE);
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  519  
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  520  	if (!is_register) {
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  521  		struct page *orig_page;
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  522  		pgoff_t index;
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  523  
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  524  		VM_BUG_ON_PAGE(!PageAnon(old_page), old_page);
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  525  
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  526  		index = vaddr_to_offset(vma, vaddr & PAGE_MASK) >> PAGE_SHIFT;
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  527  		orig_page = find_get_page(vma->vm_file->f_inode->i_mapping,
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  528  					  index);
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  529  
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  530  		if (orig_page) {
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  531  			if (PageUptodate(orig_page) &&
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  532  			    pages_identical(new_page, orig_page)) {
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  533  				/* let go new_page */
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  534  				put_page(new_page);
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  535  				new_page = NULL;
f385cb85a42fc4 kernel/events/uprobes.c Song Liu                   2019-09-23  536  
f385cb85a42fc4 kernel/events/uprobes.c Song Liu                   2019-09-23  537  				if (PageCompound(orig_page))
f385cb85a42fc4 kernel/events/uprobes.c Song Liu                   2019-09-23  538  					orig_page_huge = true;
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  539  			}
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  540  			put_page(orig_page);
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  541  		}
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  542  	}
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  543  
4dca82d14174fe kernel/events/uprobes.c David Hildenbrand          2024-01-15  544  	ret = __replace_page(vma, vaddr & PAGE_MASK, old_page, new_page);
fb4fb04ff4dd37 kernel/events/uprobes.c Song Liu                   2019-09-23  545  	if (new_page)
09cbfeaf1a5a67 kernel/events/uprobes.c Kirill A. Shutemov         2016-04-01  546  		put_page(new_page);
9f92448ceeea53 kernel/events/uprobes.c Oleg Nesterov              2012-07-29  547  put_old:
7b2d81d48a2d8e kernel/uprobes.c        Ingo Molnar                2012-02-17  548  	put_page(old_page);
7b2d81d48a2d8e kernel/uprobes.c        Ingo Molnar                2012-02-17  549  
5323ce71e4b4e1 kernel/events/uprobes.c Oleg Nesterov              2012-06-15  550  	if (unlikely(ret == -EAGAIN))
5323ce71e4b4e1 kernel/events/uprobes.c Oleg Nesterov              2012-06-15  551  		goto retry;
1cc33161a83d20 kernel/events/uprobes.c Ravi Bangoria              2018-08-20  552  
f385cb85a42fc4 kernel/events/uprobes.c Song Liu                   2019-09-23  553  	/* try collapse pmd for compound page */
f385cb85a42fc4 kernel/events/uprobes.c Song Liu                   2019-09-23  554  	if (!ret && orig_page_huge)
34488399fa08fa kernel/events/uprobes.c Zach O'Keefe               2022-09-22  555  		collapse_pte_mapped_thp(mm, vaddr, false);
f385cb85a42fc4 kernel/events/uprobes.c Song Liu                   2019-09-23  556  
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  557  	return ret;
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  558  }
2b144498350860 kernel/uprobes.c        Srikar Dronamraju          2012-02-09  559  

:::::: The code at line 475 was first introduced by commit
:::::: 1cc33161a83d20b5462b1e93f95d3ce6388079ee uprobes: Support SDT markers having reference count (semaphore)

:::::: TO: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
