Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3C2F2B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692637341; x=1724173341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3fEEKgpKo0AUdYUVK81c2aqK47RfRy2nKiyolEZ+7O0=;
  b=dh+MrGE5DQUdTzcJ3CMY6mXvwG9izonsJGVK+r+dWTA0KXNAKoAyLbaU
   1NWDxl/+ku3vCho4SRQ3mr1OK8SmX5DcjZzIwJUaDJ5x52ez21aN0FwBJ
   y9viAPCzAjcwPxTmWfxYmWEDvk8NHKe228q3fSuZCO9rH10r7S0+UWR40
   GGn4K7lEWjQtdqkbbeZqCzI36QqISYpSmOBJQlC+FSpyzIcpJbj0vHON+
   7cg5ed+zvMN9Yj0VVK71zSSrso8/d2ENygxcPDcdeW022pE0Kqd8wVLSq
   fC7j4sA5QPG7eMYgNaanFwJ+fUEOy5o9bzlqvOg/N6WhwiNMffWcqyXeQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404653715"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="404653715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 10:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="771038474"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="771038474"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 10:01:31 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY8HR-0000iG-1E;
	Mon, 21 Aug 2023 17:01:29 +0000
Date: Tue, 22 Aug 2023 01:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [linux-next:master 10295/10848] arch/x86/kernel/crash.c:232:12:
 warning: 'prepare_elf_headers' defined but not used
Message-ID: <202308220012.gipltORx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: f59d77dc3eea31329e70dbc9ba6fea9faa24829f [10295/10848] x86/crash: add x86 crash hotplug support
config: x86_64-randconfig-r024-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220012.gipltORx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220012.gipltORx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220012.gipltORx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/crash.c:232:12: warning: 'prepare_elf_headers' defined but not used [-Wunused-function]
     232 | static int prepare_elf_headers(struct kimage *image, void **addr,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/prepare_elf_headers +232 arch/x86/kernel/crash.c

dd5f726076cc763 Vivek Goyal     2014-08-08  230  
dd5f726076cc763 Vivek Goyal     2014-08-08  231  /* Prepare elf headers. Return addr and size */
dd5f726076cc763 Vivek Goyal     2014-08-08 @232  static int prepare_elf_headers(struct kimage *image, void **addr,
f59d77dc3eea313 Eric DeVolder   2023-08-14  233  					unsigned long *sz, unsigned long *nr_mem_ranges)
dd5f726076cc763 Vivek Goyal     2014-08-08  234  {
8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  235  	struct crash_mem *cmem;
7c321eb2b843bf2 Lianbo Jiang    2019-11-08  236  	int ret;
dd5f726076cc763 Vivek Goyal     2014-08-08  237  
8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  238  	cmem = fill_up_crash_elf_data();
8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  239  	if (!cmem)
dd5f726076cc763 Vivek Goyal     2014-08-08  240  		return -ENOMEM;
dd5f726076cc763 Vivek Goyal     2014-08-08  241  
9eff303725da653 Borislav Petkov 2019-11-14  242  	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
cbe6601617302b0 AKASHI Takahiro 2018-04-13  243  	if (ret)
cbe6601617302b0 AKASHI Takahiro 2018-04-13  244  		goto out;
cbe6601617302b0 AKASHI Takahiro 2018-04-13  245  
cbe6601617302b0 AKASHI Takahiro 2018-04-13  246  	/* Exclude unwanted mem ranges */
8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  247  	ret = elf_header_exclude_ranges(cmem);
cbe6601617302b0 AKASHI Takahiro 2018-04-13  248  	if (ret)
cbe6601617302b0 AKASHI Takahiro 2018-04-13  249  		goto out;
cbe6601617302b0 AKASHI Takahiro 2018-04-13  250  
f59d77dc3eea313 Eric DeVolder   2023-08-14  251  	/* Return the computed number of memory ranges, for hotplug usage */
f59d77dc3eea313 Eric DeVolder   2023-08-14  252  	*nr_mem_ranges = cmem->nr_ranges;
f59d77dc3eea313 Eric DeVolder   2023-08-14  253  
dd5f726076cc763 Vivek Goyal     2014-08-08  254  	/* By default prepare 64bit headers */
9eff303725da653 Borislav Petkov 2019-11-14  255  	ret =  crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), addr, sz);
cbe6601617302b0 AKASHI Takahiro 2018-04-13  256  
cbe6601617302b0 AKASHI Takahiro 2018-04-13  257  out:
8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  258  	vfree(cmem);
dd5f726076cc763 Vivek Goyal     2014-08-08  259  	return ret;
dd5f726076cc763 Vivek Goyal     2014-08-08  260  }
f59d77dc3eea313 Eric DeVolder   2023-08-14  261  #endif
dd5f726076cc763 Vivek Goyal     2014-08-08  262  

:::::: The code at line 232 was first introduced by commit
:::::: dd5f726076cc7639d9713b334c8c133f77c6757a kexec: support for kexec on panic using new system call

:::::: TO: Vivek Goyal <vgoyal@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
