Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04978170826
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751423; cv=none; b=N912lj/ikhvFKFc/5OiHbaDJZp6laEOpf7HCiSdILyqRuad9t/pLyLlJR+xqudjQcEBnRxh/T8DYZ/50jevElaJ0uZGjo/t1rfQp/CwECOqvo8SfmSZQ+y/N1MgCg8vTo5JNl/xEMNmEMmC2BSaeLWfuNLCJlHubEnRGCow/OEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751423; c=relaxed/simple;
	bh=vKOJZf/S7dqO673amrjHfdy/NkdL0LUfynAjbpfwbtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+QvT6jsYbX31j0xrqp8sYS532qsLWYv4A+W4NBbJIgVXNbn/VYJD7A950sTHm2gKOJ5fjLesnVdCBzJGhRmSfnlQZoq3UFaYX/twH3nqnpmJ8Q7YCFRS+PZzyzRLRpz0MFNZx+Y0MuhlL+rTLfKlTL0yPdyLq/HczTxd4bquiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj8y3Asw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj8y3Asw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761751422; x=1793287422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vKOJZf/S7dqO673amrjHfdy/NkdL0LUfynAjbpfwbtk=;
  b=Qj8y3Asw0z1eNW6065MulxRE0b/bvZn9TFd+5JPFB5oK8PnAg+WN9zzK
   auc+rpSKBCuclJ8A4MnpKUjIaWZgzDkdKfCsta+dv+P1tAZPARnmjPZVD
   VKkijunDXrKa6790hqMrm+WOmqY8FAqtBNDpp4zC2RRCFkxSdeOOYBjkR
   rLz99QfWlh4LkIXCQSzUNwEUlGoRgIJKvVhqDLuQVS3LCe2oGe3yLzw9q
   J4Iv1uK0DqWPtjOPRTLRWuFbAYI2ZAbupMSUImiHyhiTN6bnDHYOjTdtR
   MY6lqhRE4ormkHImZfRkktZ3gZnx9prwjYWV4JoMbwhRAnN/Ji3fGXyrV
   w==;
X-CSE-ConnectionGUID: Yl0RG26PTeqm6vmXEfmhzw==
X-CSE-MsgGUID: bUQi0nXqQaiWvs+YkdcpoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89344899"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="89344899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:23:41 -0700
X-CSE-ConnectionGUID: ISDTi55YQaGJ2tWvaebh/A==
X-CSE-MsgGUID: YcykwXw7TGG5dVEmM4990Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="190827803"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Oct 2025 08:23:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE81C-000Kie-1n;
	Wed, 29 Oct 2025 15:23:36 +0000
Date: Wed, 29 Oct 2025 23:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [tip:perf/core 18/20] arch/x86/include/asm/unwind_user.h:16:17:
 error: 'struct pt_regs' has no member named 'flags'
Message-ID: <202510292357.orDRPo4p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
head:   c69993ecdd4dfde2b7da08b022052a33b203da07
commit: 49cf34c0815f93fb2ea3ab5cfbac1124bd9b45d0 [18/20] unwind_user/x86: Enable frame pointer unwinding on x86
config: um-randconfig-r071-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292357.orDRPo4p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292357.orDRPo4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292357.orDRPo4p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/unwind_user.h:6,
                    from include/linux/unwind_deferred.h:6,
                    from kernel/fork.c:108:
   arch/x86/include/asm/unwind_user.h: In function 'unwind_user_word_size':
>> arch/x86/include/asm/unwind_user.h:16:17: error: 'struct pt_regs' has no member named 'flags'
      16 |         if (regs->flags & X86_VM_MASK)
         |                 ^~
>> arch/x86/include/asm/unwind_user.h:16:27: error: 'X86_VM_MASK' undeclared (first use in this function)
      16 |         if (regs->flags & X86_VM_MASK)
         |                           ^~~~~~~~~~~
   arch/x86/include/asm/unwind_user.h:16:27: note: each undeclared identifier is reported only once for each function it appears in


vim +16 arch/x86/include/asm/unwind_user.h

     6	
     7	#define ARCH_INIT_USER_FP_FRAME(ws)			\
     8		.cfa_off	=  2*(ws),			\
     9		.ra_off		= -1*(ws),			\
    10		.fp_off		= -2*(ws),			\
    11		.use_fp		= true,
    12	
    13	static inline int unwind_user_word_size(struct pt_regs *regs)
    14	{
    15		/* We can't unwind VM86 stacks */
  > 16		if (regs->flags & X86_VM_MASK)
    17			return 0;
    18	#ifdef CONFIG_X86_64
    19		if (!user_64bit_mode(regs))
    20			return sizeof(int);
    21	#endif
    22		return sizeof(long);
    23	}
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
