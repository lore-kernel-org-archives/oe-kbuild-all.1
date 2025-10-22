Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BCCA5A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113809; cv=none; b=TooPWMJIZV9sLoFFMvN2M2cJIA4FBOidIQ0ub3L+kq5PYOkr0T/MG6qkG+5pl9ZA29tNyYtmKZw2sFn/qdlkKMyu3XGH4v0P3PBjCWSEoL594Yf4zVZiBsdBXpXXhiiU3OrgO14NpWhTAr5OkirK4Owk1Lpui+Oe1WFVf/AIm0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113809; c=relaxed/simple;
	bh=dGh10ZJQ63JnDE7v8zmb22f1lp7p6+iUbDKmPSwfEWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSMwYlrDR9PdOunAJHirc1RmE7tT45zino0/NwcGLkTOHyf8ihL9Zx0jzGisYMxenLQyPBhDMDtAn+Z7moa6YCgrMhBsTDtYnWGs3gleH+rMM5LRQtOLPhSnHzHBibKhScAwmmTM5HT1FqoOmyOM0MUmMiylhFRPQx0tIHITDyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECOnurol; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECOnurol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761113807; x=1792649807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGh10ZJQ63JnDE7v8zmb22f1lp7p6+iUbDKmPSwfEWE=;
  b=ECOnurol1tYqcgfgSVDG27Qjt+B8YBDakFDZOljD0fMda58Uku7cbYYd
   BDmknhv0PoPm7Gqy4iBDcnY6jxWgVb/WV/5BRAAeRYKi2thWFijVPCJkP
   4de3yAYre+zZqS7Wdnw8ddFVdlnuki8wn+S+4zChMkoCjxGHfv4LRJdOV
   cwHv83fRw32SaAnAufUZj2/ck0ykyoKr/iBKTgZ/zF22dr+TZIbNlTj76
   sCCwmt6nFQha0+UXqnxLSnwbwuD6rQGgzuGQDigLDt0W24EW5ShqyECMy
   jaUYoqbYOaGi4+OWHk9OzC4+JMrzW6Yt79OkSqzCzJ7F0Qab24Y3YjyNV
   A==;
X-CSE-ConnectionGUID: YFcNCXqYQamuBcImWVwpbw==
X-CSE-MsgGUID: fun0OUznQyCz2ZnY7yP+lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63348048"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63348048"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 23:16:47 -0700
X-CSE-ConnectionGUID: P1kCdZ2VQ+W1TUCxcg+Y0w==
X-CSE-MsgGUID: 1BrTorw6R+2Tnv2HkEk+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184188637"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2025 23:16:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBS9M-000C3P-17;
	Wed, 22 Oct 2025 06:16:44 +0000
Date: Wed, 22 Oct 2025 14:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [tglx-devel:rseq/slice-v2 16/75]
 include/linux/resume_user_mode.h:62:35: error: passing argument 1 of
 'rseq_handle_notify_resume' from incompatible pointer type
Message-ID: <202510221457.zuEqOoF1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice-v2
head:   eb5ca0a40f94f3ab3c37ec0253eb85692057d3e0
commit: ec9e3f02b82eb65dc2374128c003a4e425ce15fb [16/75] rseq: Remove the ksig argument from rseq_handle_notify_resume()
config: i386-randconfig-141-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221457.zuEqOoF1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221457.zuEqOoF1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510221457.zuEqOoF1-lkp@intel.com/

Note: the tglx-devel/rseq/slice-v2 HEAD eb5ca0a40f94f3ab3c37ec0253eb85692057d3e0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/task_work.c:5:
   include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
>> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_handle_notify_resume' from incompatible pointer type [-Wincompatible-pointer-types]
      62 |         rseq_handle_notify_resume(regs);
         |                                   ^~~~
         |                                   |
         |                                   struct pt_regs *
   In file included from include/linux/resume_user_mode.h:9:
   include/linux/rseq.h:107:62: note: expected 'struct ksignal *' but argument is of type 'struct pt_regs *'
     107 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                                              ~~~~~~~~~~~~~~~~^~~~
>> include/linux/resume_user_mode.h:62:9: error: too few arguments to function 'rseq_handle_notify_resume'
      62 |         rseq_handle_notify_resume(regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rseq.h:107:20: note: declared here
     107 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rseq_handle_notify_resume +62 include/linux/resume_user_mode.h

    58	
    59		mem_cgroup_handle_over_high(GFP_KERNEL);
    60		blkcg_maybe_throttle_current();
    61	
  > 62		rseq_handle_notify_resume(regs);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
