Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF5620EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693901137; x=1725437137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xhslne1923YccOkJiUZWOaa2tAU2h2SHQSzs+FuH6qo=;
  b=WkgTGvUNZxIn3OPJLvCM0SsVu5Z830a+60lnfNJpOAxYkQ8Uf+Mbui9i
   volhMwVFqfhqzTrcYXnq8kDLOf76b2+Df+Ftru3EaRGQ6onSev+bG7bpd
   RCuvW6Rg5I6hngwCG3DXHAf7cPrGCVLy8d8iRdUf5AxBZXxj+yrsjZipc
   ZGvOLCC2SeDJySBRedpf3Yj8XXMHMXA76rY9RF8hh5UqCk4hufTbEZuSm
   PNXJ0bQXw/4lyJrdx3p5z1r8e6u3unBuZVzqDGTB7ZbOkOZYp0CUO75Qt
   E1W0wy3oGQsqEL9tgml8uKica94XErh9aikZ0QW0Qv31SFOM3sf6Q+tIQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356229150"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356229150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="806517071"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="806517071"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2023 01:04:53 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdR3L-0001Pj-1c;
	Tue, 05 Sep 2023 08:04:51 +0000
Date: Tue, 5 Sep 2023 16:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: seq: Fix snd_seq_expand_var_event() call to
 user-space
Message-ID: <202309051521.lrL7hyJ2-lkp@intel.com>
References: <20230905052631.18240-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905052631.18240-1-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-seq-Fix-snd_seq_expand_var_event-call-to-user-space/20230905-132920
base:   linus/master
patch link:    https://lore.kernel.org/r/20230905052631.18240-1-tiwai%40suse.de
patch subject: [PATCH] ALSA: seq: Fix snd_seq_expand_var_event() call to user-space
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230905/202309051521.lrL7hyJ2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051521.lrL7hyJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051521.lrL7hyJ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from sound/core/seq/seq_memory.c:12:
   sound/core/seq/seq_memory.c: In function 'snd_seq_expand_var_event':
>> arch/parisc/include/asm/uaccess.h:208:20: warning: ignoring return value of 'lclear_user' declared with attribute 'warn_unused_result' [-Wunused-result]
     208 | #define clear_user lclear_user
   sound/core/seq/seq_memory.c:194:25: note: in expansion of macro 'clear_user'
     194 |                         clear_user((__force void __user *)buf + len, newlen - len);
         |                         ^~~~~~~~~~


vim +208 arch/parisc/include/asm/uaccess.h

^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  195  
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  196  
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  197  /*
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  198   * Complex access routines -- external declarations
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  199   */
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  200  
b1195c0e3ee1a1 arch/parisc/include/asm/uaccess.h James Bottomley 2012-05-26  201  extern long strncpy_from_user(char *, const char __user *, long);
671028728083e8 arch/parisc/include/asm/uaccess.h Helge Deller    2021-09-09  202  extern __must_check unsigned lclear_user(void __user *, unsigned long);
1260dea6d2eb75 arch/parisc/include/asm/uaccess.h Helge Deller    2021-09-04  203  extern __must_check long strnlen_user(const char __user *src, long n);
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  204  /*
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  205   * Complex access routines -- macros
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  206   */
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  207  
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16 @208  #define clear_user lclear_user
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  209  #define __clear_user lclear_user
^1da177e4c3f41 include/asm-parisc/uaccess.h      Linus Torvalds  2005-04-16  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
