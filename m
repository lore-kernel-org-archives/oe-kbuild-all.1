Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B461635A6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713458206; cv=none; b=EeP92h6FO0gJeREkkMEca8MhVyeLKuoFCfUJU85o5EnUhbYtn2MYI6aQGViMcR3wyPATd6LjXXvi+xiie6RBzceMbDLUhbsup7wmRpDH2/n81algra6hYdjdbq2V9fKDl+CgS7AAzs0L5WAig3aO0xxK7qyB2ZYxm7dnqRQ7eDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713458206; c=relaxed/simple;
	bh=v6ERhm7klDpfgpOBKjXgd3Jrry8NBBU+VoaTIOphKqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHU0FI6SNhianU/D5BX2OwqLe5QUjKThkD7w5GLQkBPKMuWh4LuV0gH63sXakc6GN3VDvdmro0ORunYcGgurZTNtP4AZKLObQYU5AT64UwsBb95tzD/rJhZJLjJeAJoW8kAsXGa9EHIdJh9qMC5c5s+Rwdcd7hqUvvZlSMKRCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QziBJoOZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QziBJoOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713458205; x=1744994205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6ERhm7klDpfgpOBKjXgd3Jrry8NBBU+VoaTIOphKqY=;
  b=QziBJoOZajiDE7MZYrRXnzmBQ6o34bsmleW4hJnsgxmL6jeosgWc7jwf
   TmceiPpUj/qCxfJ83kSk9CBi8EVPcdHLV3YAqwfwylJO27t5rfM1wvPFK
   iixIAia+aMpvNyMVVCIBhLL5EFtEsPIB6eQlyI9o5Wl88LWkPWZMnVbX5
   uS9LVvYOxvI51NEHCgR58N1QcmYd00kF6pSVpCpQoWGyI1g07f5qoPmcR
   vbrvvFxvNKYyDjHofQ3q9TRYBFFIdQRuwuSnhKODlprxyEQLTg7AX4pdK
   ZWbRSNevCw0JaCsEtwJm/UNRnqH8ROT9v/r3iF/OkJNi/wkngS9Vb+lyY
   Q==;
X-CSE-ConnectionGUID: tAp/DpwOT2mmn0CeV15Wvg==
X-CSE-MsgGUID: yWjxOrfFSimdo8ggi9Q30A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12808871"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="12808871"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 09:36:45 -0700
X-CSE-ConnectionGUID: VP4ZTQqcTuCg2XFH/F0sGw==
X-CSE-MsgGUID: 4sD67ojQQJWfiL5pYCqRqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="23490468"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Apr 2024 09:36:43 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxUka-0008y2-2U;
	Thu, 18 Apr 2024 16:36:40 +0000
Date: Fri, 19 Apr 2024 00:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:for-next/ffa/updates 5/6]
 include/linux/arm_ffa.h:233:13: warning: 'ffa_partition_check_property'
 defined but not used
Message-ID: <202404190004.fmNxgxtB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/ffa/updates
head:   6b5c206a33a5c546478598142d4ff7246de0d18d
commit: 859286f3b381a6f09b8e634a8438ecf34805dbca [5/6] firmware: arm_ffa: Stash the partition properties for query purposes
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240419/202404190004.fmNxgxtB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190004.fmNxgxtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190004.fmNxgxtB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_pkvm.h:9,
                    from arch/arm64/kvm/hyp/include/nvhe/pkvm.h:10,
                    from arch/arm64/kvm/hyp/hyp-constants.c:5:
>> include/linux/arm_ffa.h:233:13: warning: 'ffa_partition_check_property' defined but not used [-Wunused-function]
     233 | static bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: warning: initialized field overwritten [-Woverride-init]
     187 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:187:43: note: (near initialization for 'hyp_exit_handlers[3]')
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: warning: initialized field overwritten [-Woverride-init]
     188 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:43: note: (near initialization for 'hyp_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: warning: initialized field overwritten [-Woverride-init]
     189 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:189:43: note: (near initialization for 'hyp_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: warning: initialized field overwritten [-Woverride-init]
     190 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:190:43: note: (near initialization for 'hyp_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:191:43: warning: initialized field overwritten [-Woverride-init]
     191 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:191:43: note: (near initialization for 'hyp_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:192:43: warning: initialized field overwritten [-Woverride-init]
     192 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:192:43: note: (near initialization for 'hyp_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:193:43: warning: initialized field overwritten [-Woverride-init]
     193 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:193:43: note: (near initialization for 'hyp_exit_handlers[52]')
   arch/arm64/kvm/hyp/nvhe/switch.c:194:43: warning: initialized field overwritten [-Woverride-init]
     194 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:194:43: note: (near initialization for 'hyp_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: warning: initialized field overwritten [-Woverride-init]
     195 |         [ESR_ELx_EC_MOPS]               = kvm_hyp_handle_mops,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:195:43: note: (near initialization for 'hyp_exit_handlers[39]')
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: warning: initialized field overwritten [-Woverride-init]
     200 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:200:43: note: (near initialization for 'pvm_exit_handlers[24]')
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: warning: initialized field overwritten [-Woverride-init]
     201 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:201:43: note: (near initialization for 'pvm_exit_handlers[25]')
   arch/arm64/kvm/hyp/nvhe/switch.c:202:43: warning: initialized field overwritten [-Woverride-init]
     202 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:202:43: note: (near initialization for 'pvm_exit_handlers[7]')
   arch/arm64/kvm/hyp/nvhe/switch.c:203:43: warning: initialized field overwritten [-Woverride-init]
     203 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:203:43: note: (near initialization for 'pvm_exit_handlers[32]')
   arch/arm64/kvm/hyp/nvhe/switch.c:204:43: warning: initialized field overwritten [-Woverride-init]
     204 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:204:43: note: (near initialization for 'pvm_exit_handlers[36]')
   arch/arm64/kvm/hyp/nvhe/switch.c:205:43: warning: initialized field overwritten [-Woverride-init]
     205 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:205:43: note: (near initialization for 'pvm_exit_handlers[52]')
   arch/arm64/kvm/hyp/nvhe/switch.c:206:43: warning: initialized field overwritten [-Woverride-init]
     206 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:206:43: note: (near initialization for 'pvm_exit_handlers[9]')
   arch/arm64/kvm/hyp/nvhe/switch.c:207:43: warning: initialized field overwritten [-Woverride-init]
     207 |         [ESR_ELx_EC_MOPS]               = kvm_hyp_handle_mops,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:207:43: note: (near initialization for 'pvm_exit_handlers[39]')
   In file included from arch/arm64/include/asm/kvm_pkvm.h:9,
                    from arch/arm64/kvm/hyp/include/nvhe/pkvm.h:10,
                    from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14,
                    from arch/arm64/kvm/hyp/nvhe/switch.c:30:
>> include/linux/arm_ffa.h:233:13: warning: 'ffa_partition_check_property' defined but not used [-Wunused-function]
     233 | static bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ffa_partition_check_property +233 include/linux/arm_ffa.h

   232	
 > 233	static bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
   234	{
   235		return dev->properties & property;
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
