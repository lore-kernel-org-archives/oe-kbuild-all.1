Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171F30170F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784406776; cv=none; b=Jjl19nsyraemK7noGozYeQcxKLCiEA6rw5AvjlmIs52yFWwjuGsTs2j4BZEusSJp6SWqrf4Su83nUl/rCeVNbKI03LKFLZOYlqhuuI7ges+RZN4xmdRllYVBsEsUDtnqvZUF93Oqu9/4CiRoQ8IAMlWxtnUIJ0xkzFjk9nDDiw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784406776; c=relaxed/simple;
	bh=dd6TV0M1jmbkEvM/xF+FFsXhwYGo7bIpVHB5TA2o3Y4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lRW6+xtArNiYU848VTCS6J9uYRtJk4Dg2/EHreP3KO4a35NR4En2nTqwbXMceozxGt5ZK50ZK1sEYRaOwL3yFMPxeTipJdQmoeXShlohFPSs3nZ26xB5Sq19igEWNH61UyrCSdrOVjkr8f5f7/2QofgeqEIDUsyOwmvCamcJamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/MPm+Ke; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/MPm+Ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784406774; x=1815942774;
  h=date:from:to:cc:subject:message-id;
  bh=dd6TV0M1jmbkEvM/xF+FFsXhwYGo7bIpVHB5TA2o3Y4=;
  b=H/MPm+KeYMHLWltX4UajK9snC05g4OxTH5NeZbhxEYybiTXL3z9aJsNl
   bEc3BYvNfgcvNj935yLl16oYMfR9KuM2P0vF+L8PWXUL291+dOkQv2IUt
   SLfgwxbt5O51pwV/tLJF6RTnxSBOpjvKT8ZBrRsd6SoGu0LDiFvV2rCmI
   yokacYnuMwtKJGNVdcGSaO1tdDZIfnNf2zSdxdcIX50vMOT/uIP8L//aj
   1UjUefQsDml07Nrr67CAHgU+h0cM3PuXOJksbMJcklXexwEmAtYTsSykw
   jOMtsa+rL4d8CR3l7JwgtDws5tO+CfD5jLjh5qkqOOyMYeOuFaqaF2qEb
   w==;
X-CSE-ConnectionGUID: dmpcmB9jScGTCP6qnIyGWw==
X-CSE-MsgGUID: UFuNAvqNSVymxoQlMv4h6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84166041"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84166041"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 13:32:53 -0700
X-CSE-ConnectionGUID: mTOp32JRSqyjI+PJCnE+0Q==
X-CSE-MsgGUID: PJvrx0zlQNynSlPi8eoC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="261360945"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Jul 2026 13:32:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlBiL-00000000V61-1D9x;
	Sat, 18 Jul 2026 20:32:49 +0000
Date: Sun, 19 Jul 2026 04:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 192/192]
 arch/arm64/kvm/hyp_trace.c:595:36: warning: unused variable 'hyp_trace_ops'
Message-ID: <202607190424.4it7LZtK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   15bdff0dd01eed4ffc4ae138c5a611d8b102a4b6
commit: a6af57723d00e6d80d21f6171f3cb4574aba159d [192/192] ANDROID: KVM: arm64: Remove the non-consuming hyp trace interface
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260719/202607190424.4it7LZtK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190424.4it7LZtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190424.4it7LZtK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   arch/arm64/kvm/hyp_trace.c:245:6: warning: no previous prototype for function 'hyp_poke_tracing' [-Wmissing-prototypes]
     245 | void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
         |      ^
   arch/arm64/kvm/hyp_trace.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void hyp_poke_tracing(int cpu, const struct cpumask *cpus)
         | ^
         | static 
>> arch/arm64/kvm/hyp_trace.c:595:36: warning: unused variable 'hyp_trace_ops' [-Wunused-const-variable]
     595 | static const struct seq_operations hyp_trace_ops = {
         |                                    ^~~~~~~~~~~~~
   3 warnings generated.


vim +/hyp_trace_ops +595 arch/arm64/kvm/hyp_trace.c

34305ad4b1bbf0 Vincent Donnefort 2022-08-25  594  
34305ad4b1bbf0 Vincent Donnefort 2022-08-25 @595  static const struct seq_operations hyp_trace_ops = {
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  596  	.start	= ht_start,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  597  	.next	= ht_next,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  598  	.stop	= ht_stop,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  599  	.show	= ht_show,
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  600  };
34305ad4b1bbf0 Vincent Donnefort 2022-08-25  601  

:::::: The code at line 595 was first introduced by commit
:::::: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
