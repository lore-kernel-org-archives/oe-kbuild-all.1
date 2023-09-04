Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7EF7E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693822231; x=1725358231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTo+eLP6ZJ9C6aoVvs/k6IkRoryDYtw13AcZgMDZjbU=;
  b=LjhDTcGVs9mEO8yCCtXtLxf7C6an8m+zvvsqa9vqbQcMcKJyFlutaMVH
   fC4P16LlnmUQM5sNJBZvqFLWBtX2ax+Es4SR9FLQ7jhUZXo2fSdqNFdXG
   x9OKcBCYpHoOX9mT4wwuIiLaB269KNslSnXKEAr0mAWjUJrc+WCHQB5D2
   MblyDB/+qPA1vOf6+PrfkGfW6ZFmJpQ4hLOqELQr/J62UFiKBPx5Z2Ggb
   mp+17j2yWQpqz5ioJekUoabEVlCsPWG+zUKwBOryqVcYG9c9fjW6UkjUv
   2BUmcb+9GbTo4yx9eLM8aj6w3DEoq/vCVDOnOpQlttWUbGp+hYjty/mx5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="407564178"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="407564178"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 03:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690542245"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="690542245"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Sep 2023 03:10:27 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd6XJ-0000OB-0h;
	Mon, 04 Sep 2023 10:10:25 +0000
Date: Mon, 4 Sep 2023 18:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/sysreg-xarray 7/8]
 arch/arm64/kvm/sys_regs.c:3106: warning: Function parameter or member 'sr'
 not described in 'emulate_sys_reg'
Message-ID: <202309041858.cL5JQBVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/sysreg-xarray
head:   2fbea250756eb06bd1a2b515aea53f77525fbb70
commit: e0a7c86733c3e4b707330180818040b7fe1387b4 [7/8] WIP
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230904/202309041858.cL5JQBVT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041858.cL5JQBVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041858.cL5JQBVT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c:1246: warning: Function parameter or member 'vcpu' not described in 'arm64_check_features'
   arch/arm64/kvm/sys_regs.c:1246: warning: Function parameter or member 'rd' not described in 'arm64_check_features'
   arch/arm64/kvm/sys_regs.c:1246: warning: Function parameter or member 'val' not described in 'arm64_check_features'
   arch/arm64/kvm/sys_regs.c:2868: warning: Function parameter or member 'global' not described in 'kvm_handle_cp_64'
   arch/arm64/kvm/sys_regs.c:2868: warning: Function parameter or member 'nr_global' not described in 'kvm_handle_cp_64'
   arch/arm64/kvm/sys_regs.c:2868: warning: Excess function parameter 'run' description in 'kvm_handle_cp_64'
   arch/arm64/kvm/sys_regs.c:3038: warning: Function parameter or member 'params' not described in 'kvm_handle_cp_32'
   arch/arm64/kvm/sys_regs.c:3038: warning: Function parameter or member 'global' not described in 'kvm_handle_cp_32'
   arch/arm64/kvm/sys_regs.c:3038: warning: Function parameter or member 'nr_global' not described in 'kvm_handle_cp_32'
   arch/arm64/kvm/sys_regs.c:3038: warning: Excess function parameter 'run' description in 'kvm_handle_cp_32'
>> arch/arm64/kvm/sys_regs.c:3106: warning: Function parameter or member 'sr' not described in 'emulate_sys_reg'


vim +3106 arch/arm64/kvm/sys_regs.c

54ad68b7776043 Mark Rutland 2019-12-05  3095  
28eda7b5e82489 Oliver Upton 2022-05-03  3096  /**
28eda7b5e82489 Oliver Upton 2022-05-03  3097   * emulate_sys_reg - Emulate a guest access to an AArch64 system register
28eda7b5e82489 Oliver Upton 2022-05-03  3098   * @vcpu: The VCPU pointer
28eda7b5e82489 Oliver Upton 2022-05-03  3099   * @params: Decoded system register parameters
28eda7b5e82489 Oliver Upton 2022-05-03  3100   *
28eda7b5e82489 Oliver Upton 2022-05-03  3101   * Return: true if the system register access was successful, false otherwise.
28eda7b5e82489 Oliver Upton 2022-05-03  3102   */
28eda7b5e82489 Oliver Upton 2022-05-03  3103  static bool emulate_sys_reg(struct kvm_vcpu *vcpu,
e0a7c86733c3e4 Marc Zyngier 2023-08-22  3104  			    const struct sys_reg_desc *sr,
3fec037d0fb292 Pavel Fedin  2015-12-04  3105  			    struct sys_reg_params *params)
7c8c5e6a9101ea Marc Zyngier 2012-12-10 @3106  {
dcaffa7bf91157 James Morse  2020-06-22  3107  	const struct sys_reg_desc *r;
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3108  
e0a7c86733c3e4 Marc Zyngier 2023-08-22  3109  	if (unlikely(!sr))
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3110  		r = find_reg(params, sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
e0a7c86733c3e4 Marc Zyngier 2023-08-22  3111  	else
e0a7c86733c3e4 Marc Zyngier 2023-08-22  3112  		r = sr;
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3113  
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3114  	if (likely(r)) {
e70b952263445e Marc Zyngier 2017-03-27  3115  		perform_access(vcpu, params, r);
28eda7b5e82489 Oliver Upton 2022-05-03  3116  		return true;
28eda7b5e82489 Oliver Upton 2022-05-03  3117  	}
28eda7b5e82489 Oliver Upton 2022-05-03  3118  
28eda7b5e82489 Oliver Upton 2022-05-03  3119  	if (is_imp_def_sys_reg(params)) {
54ad68b7776043 Mark Rutland 2019-12-05  3120  		kvm_inject_undefined(vcpu);
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3121  	} else {
bf4b96bb542ee3 Mark Rutland 2019-12-05  3122  		print_sys_reg_msg(params,
bf4b96bb542ee3 Mark Rutland 2019-12-05  3123  				  "Unsupported guest sys_reg access at: %lx [%08lx]\n",
d1878af3a5a6ac Mark Rutland 2018-12-06  3124  				  *vcpu_pc(vcpu), *vcpu_cpsr(vcpu));
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3125  		kvm_inject_undefined(vcpu);
e70b952263445e Marc Zyngier 2017-03-27  3126  	}
28eda7b5e82489 Oliver Upton 2022-05-03  3127  	return false;
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3128  }
7c8c5e6a9101ea Marc Zyngier 2012-12-10  3129  

:::::: The code at line 3106 was first introduced by commit
:::::: 7c8c5e6a9101ea57a1c2c9faff0917e79251a21e arm64: KVM: system register handling

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
