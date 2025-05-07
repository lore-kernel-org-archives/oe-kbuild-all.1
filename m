Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189CB1F3BA9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596692; cv=none; b=medaO7LsyH6y9MNpwjtHV5Z8mrLuHuWYzGEmKpZ2LNFh0fcYGPZdqwAMDR30tHjyRh9UaYCr58BxEfG5zqmTyI2t6dmG2vPJpdBdGw12Q9ORJJ1/9VW2p5YpCU7kKZzwAcQQv7A7q0dAcqt+2Fn1JipgBJMhtumM7xdsyz3A+GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596692; c=relaxed/simple;
	bh=XI60xGYIQTZg5X8FBGpr+owwAIoAiJbAyvGsjcuyivU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzHzoiCaaVueT23p7H9dFgy0DMiiYWX8ExglJPjZZ7/+2scU40kGU70/AQEI2y48PBysmxOUlL7iLzWkC5ceKKvKl4OFgF5tsXgUlBWE4WDMm7q7TV0Bd0a72EhyNdc7GwqI1iaE4X5Dvz1h9gCS2ApQfjix15QMNVnYa9r6QlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiFjk0CT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiFjk0CT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596690; x=1778132690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XI60xGYIQTZg5X8FBGpr+owwAIoAiJbAyvGsjcuyivU=;
  b=MiFjk0CTkF3O0ha2DG0XrYHlpSRJ7CDB2FhbwtMpejxhWxGeTPpifq+P
   fICmsLe/wZlspCilmIG2uLadpuGVRCU0aX8uFWbsRU57DnHNtpES/XTD/
   Vr3ZzTT6sFitH/+aKXxsrvdpuZvXW/BVmYIU3lmZuMYiRYopULajXzeMn
   dGCmXhxE49fabVnio2MqA0rTvHfq/eHN4a2MUyhETg6Elarfvk/TZtiIl
   UDWYGNvNqhOVeWeWV32ULTCrr4dhVzjCoEkLgs/QszniOz0M4EEwB+Ly8
   lkYMIUgkm0ar9pMLzlLE1mf1Sl5SQsDuTVlaXFeLmRCCDcyAd6RqBjDvr
   Q==;
X-CSE-ConnectionGUID: yGUOC22GQ4OAfVWJ+x01JA==
X-CSE-MsgGUID: VHrpGTIUR4eQyHIlc46qjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35932867"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="35932867"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:44:47 -0700
X-CSE-ConnectionGUID: pRayHpX/S4+oM+Re01y1Tg==
X-CSE-MsgGUID: Rab9B6fGRL+UVaRBfIuWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140959201"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2025 22:44:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXaG-00076a-1x;
	Wed, 07 May 2025 05:44:44 +0000
Date: Wed, 7 May 2025 13:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 23/38]
 arch/x86/include/asm/msr.h:325:10: error: invalid input size for constraint
 'a'
Message-ID: <202505071319.sJJm9xmb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   07f1fbd81034c26b74c8a6851a3570f540063255
commit: fa58a01cf5fa65ab09320f30f94a835928f019e0 [23/38] x86/msr: Utilize the alternatives mechanism to write MSR
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505071319.sJJm9xmb-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071319.sJJm9xmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071319.sJJm9xmb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
>> arch/x86/include/asm/msr.h:325:10: error: invalid input size for constraint 'a'
     325 |                 : "a" (val), "c" (msr), [type] "i" (type)
         |                        ^
   1 error generated.


vim +/a +325 arch/x86/include/asm/msr.h

   310	
   311	#ifdef CONFIG_XEN_PV
   312	/* No plan to support immediate form MSR instructions in Xen */
   313	static __always_inline bool __xenpv_wrmsrq(u32 msr, u64 val, int type)
   314	{
   315		asm_inline volatile goto(
   316			"call asm_xen_write_msr\n\t"
   317			"jnz 2f\n\t"
   318			ALTERNATIVE("1: ds wrmsr",
   319				    ASM_WRMSRNS,
   320				    X86_FEATURE_WRMSRNS)
   321			"2:\n"
   322			_ASM_EXTABLE_TYPE(1b, %l[badmsr], %c[type])	/* For WRMSR(NS) */
   323	
   324			: ASM_CALL_CONSTRAINT
 > 325			: "a" (val), "c" (msr), [type] "i" (type)
   326			: "memory", "rdx"
   327			: badmsr);
   328	
   329		return false;
   330	
   331	badmsr:
   332		return true;
   333	}
   334	#endif
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
