Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7989D229B36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769256434; cv=none; b=Qqk/tt1BnvM/qyvatPqQy0mKuoeKJ08E4cSqLNbxYJjJgvmnm3ty7rGr/9LYFB6QqkUOKJyo8f42i3TbrYBbkp7mE3+5uBmNt+6o0MYK1PqdyzcuZCdwiaG3NmaS+0Uu/DkW4SUdNhTdrFaIsHO9UEGFcGP9E3V1l0SIaq9KVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769256434; c=relaxed/simple;
	bh=hEMWM1BnnC4BQFmSyu8jaIkXzKOfr7Cc8RJE39zuZ3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G2ewKUM2tx3HOsRXM/oOEq8W3q2ZOvWFtVjDzVLlMJFSTvpkmIUZQnlD0iJl6XFwJ68WgPP1Ct7ZhP1xhIlKq5xMwSIstvMD6nTaq8JTEkf6uRXZZxSlzw/4/vg1NuMIHuQ//iw0cDzTvbaYGgijiUbavdQle291P56qA7YXAgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld+PLRRS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld+PLRRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769256432; x=1800792432;
  h=date:from:to:cc:subject:message-id;
  bh=hEMWM1BnnC4BQFmSyu8jaIkXzKOfr7Cc8RJE39zuZ3U=;
  b=ld+PLRRSP9834asfknq+DGxxLqSB3HXvgdFc+7HkiU2scQrRoFUn57Tt
   BKd0j9mDZEC9HF+Vs0pf5mkndEMYFpsxRnwrJwJ4nVseChkTjlecIg8Uc
   HY42Uv/60fuWX+qp1a7yM6cByToUGPCPnGjv3N3D9rRmI1Zx749IXybxS
   T6tvIH7U5ES7oq7JX1YyNZxVlzwU7geSsgRKnkb/F0hol81sYtARm/wfG
   2HOpUxkDe7TFMycdRIit1pKqvsxSkCN1cqbifXN39QsqZwkjxKalLkUAi
   c7vq3fkySfLNGm4hMZmlMRZVSX9NEd+igzGWJsHDcSmsrxdjN/9m1i7+H
   Q==;
X-CSE-ConnectionGUID: vLFomoH7SGCmDX6WjRrlHQ==
X-CSE-MsgGUID: 79uQ2UW/QAaghMq1sOShOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70402742"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70402742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 04:07:12 -0800
X-CSE-ConnectionGUID: csW8qnLdTfagUkdZUj3cJQ==
X-CSE-MsgGUID: jN41aiBuSSifTEi1TF0iOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="211715808"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jan 2026 04:07:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjcQ0-00000000VA8-1KBM;
	Sat, 24 Jan 2026 12:07:08 +0000
Date: Sat, 24 Jan 2026 20:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/finalize_cpu_caps 12/12]
 arch/x86/kvm/vmx/vmx.c:2979:5: warning: format specifies type 'unsigned long'
 but the argument has type 'unsigned int'
Message-ID: <202601241925.Qzl00UWs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/finalize_cpu_caps
head:   69c68b30b26eaa72b38bd9150f5cecf45fe2ab8b
commit: 69c68b30b26eaa72b38bd9150f5cecf45fe2ab8b [12/12] KVM: VMX: Print out "bad" offsets+value on VMCS config mismatch
config: i386-randconfig-054-20260124 (https://download.01.org/0day-ci/archive/20260124/202601241925.Qzl00UWs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241925.Qzl00UWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241925.Qzl00UWs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:2979:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    2978 |                         pr_cont("  Offset %lu REF = 0x%08x, CPU%u = 0x%08x, mismatch = 0x%08x\n",
         |                                           ~~~
         |                                           %u
    2979 |                                 i * sizeof(u32), gold[i], cpu, mine[i], gold[i] ^ mine[i]);
         |                                 ^~~~~~~~~~~~~~~
   include/linux/printk.h:597:26: note: expanded from macro 'pr_cont'
     597 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +2979 arch/x86/kvm/vmx/vmx.c

  2949	
  2950	int vmx_check_processor_compat(void)
  2951	{
  2952		int cpu = raw_smp_processor_id();
  2953		struct vmcs_config vmcs_conf;
  2954		struct vmx_capability vmx_cap;
  2955	
  2956		if (!__kvm_is_vmx_supported())
  2957			return -EIO;
  2958	
  2959		if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0) {
  2960			pr_err("Failed to setup VMCS config on CPU %d\n", cpu);
  2961			return -EIO;
  2962		}
  2963		if (nested)
  2964			nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
  2965	
  2966		if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config))) {
  2967			u32 *gold = (void *)&vmcs_config;
  2968			u32 *mine = (void *)&vmcs_conf;
  2969			int i;
  2970	
  2971			BUILD_BUG_ON(sizeof(struct vmcs_config) % sizeof(u32));
  2972	
  2973			pr_err("VMCS config on CPU %d doesn't match reference config:\n", cpu);
  2974			for (i = 0; i < sizeof(struct vmcs_config) / sizeof(u32); i++) {
  2975				if (gold[i] == mine[i])
  2976					continue;
  2977	
  2978				pr_cont("  Offset %lu REF = 0x%08x, CPU%u = 0x%08x, mismatch = 0x%08x\n",
> 2979					i * sizeof(u32), gold[i], cpu, mine[i], gold[i] ^ mine[i]);
  2980			}
  2981			return -EIO;
  2982		}
  2983		return 0;
  2984	}
  2985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
