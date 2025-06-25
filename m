Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537C8F58
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 00:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750810765; cv=none; b=MkZu7wBSkVbwiDxxHn9GyeumvF9w0mK9Cw7gsAlrt9oGafE+LCxgXlKzllCeULNJ3qjBmlinPF0VCsytK4NeztDcTDntwxu5odSZxTo8Fd2h7zo3OFcVuzdq2qwIxTIQjH8LxcMWYer5fAEDXv4UAqdTokNewECF14yRclG3AsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750810765; c=relaxed/simple;
	bh=iibwnusr6H5pAslJr0vCSjgL4ijw2I819JNTl5HOxj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QX3TWAD1YMI4ZOOP2xtW4uefqOXY3E9MvohNitR39wMRBThJo0wT4tD+5TITalurELeYF0PkQK1oiHO3/maKUSS2/b8gtHZ1lvmOYR6FY40kTDrRITbfPhS5JGq3oC+iaqItmhi6p7HhSJg3THryxJaZuAVnTp9NmAGitHqk+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B407Bbyd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B407Bbyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750810764; x=1782346764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iibwnusr6H5pAslJr0vCSjgL4ijw2I819JNTl5HOxj8=;
  b=B407BbydDjqqTWXahN/arf2aZxyQgdSn64wBpvuRWF3U9+2om5eQbmYf
   2bxbpuKf6BE0HXNzxTXX96CqzjcRGVHRUZ6x2CRVZCrDW/HS17RWvhxng
   3k/rcdlY8U50YXq5TFTAp/uy70mDTn+x/NmrEEX/o4kNnY356+StN4zin
   J84hq9JA82KyxaQ8YC9tsqxUn+UtqkkK8KvT5NZelI/VRTLv/vpyGxscQ
   y3/Swwv2vbRd9Ug1vm6rbnUkvFnAVL9Xsy3K8y6IIUiPVloUZBMexbziy
   bsQfdDZ8/asJbm9PUwKLq0J/czTGYw/4eVEYkGENUeZfiGPnT4aiWRz4Y
   w==;
X-CSE-ConnectionGUID: 2AabO3YDR9C15DrUsZYRnw==
X-CSE-MsgGUID: HLF/XskBTcqCtL6RiTo+Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70637298"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="70637298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 17:19:23 -0700
X-CSE-ConnectionGUID: oK/wAIZdQAaa0ufIoCGjkw==
X-CSE-MsgGUID: Os5krqNURsuKbTBcli7aLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151569836"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jun 2025 17:19:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUDrE-000Scc-0G;
	Wed, 25 Jun 2025 00:19:20 +0000
Date: Wed, 25 Jun 2025 08:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 7/21]
 arch/x86/include/asm/msr-xen.h:31:10: error: invalid input size for
 constraint 'a'
Message-ID: <202506250846.T9ZTrTBe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   f5a7aa46f2de853090449e1a5bb733628907c08b
commit: 980e76f99822167671211032d7ceed3b01f82c63 [7/21] x86/msr: Utilize the alternatives mechanism to write MSR
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250625/202506250846.T9ZTrTBe-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250846.T9ZTrTBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250846.T9ZTrTBe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:13:
>> arch/x86/include/asm/msr-xen.h:31:10: error: invalid input size for constraint 'a'
      31 |                 : "a" (val), "c" (msr), [type] "i" (type)
         |                        ^
   1 error generated.


vim +/a +31 arch/x86/include/asm/msr-xen.h

    15	
    16	/* No plan to support immediate form MSR instructions in Xen */
    17	static __always_inline bool __xenpv_wrmsrq(u32 msr, u64 val, int type)
    18	{
    19		BUG_ON(!cpu_feature_enabled(X86_FEATURE_XENPV));
    20	
    21		asm_inline volatile goto(
    22			"call asm_xen_write_msr\n\t"
    23			"jnz 2f\n\t"
    24			ALTERNATIVE("1: ds wrmsr",
    25				    ASM_WRMSRNS,
    26				    X86_FEATURE_WRMSRNS)
    27			"2:\n"
    28			_ASM_EXTABLE_TYPE(1b, %l[badmsr], %c[type])	/* For WRMSR(NS) */
    29	
    30			: ASM_CALL_CONSTRAINT
  > 31			: "a" (val), "c" (msr), [type] "i" (type)
    32			: "memory", "rdx"
    33			: badmsr);
    34	
    35		return false;
    36	
    37	badmsr:
    38		return true;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
