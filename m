Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210442ED872
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 22:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110063; cv=none; b=MDaKNkFe8VUbvCdjF/WqifrCvMctk1Sdg0XZoQVPXTo+GqyP2G/0ZT9T9BUuOxFqsfxkqCYUffHxJ0/nJzxpC0gb4EnonBGgJgfMj46lHPqYuvh+a0kXDYpNMQItyqUSqFBSxsLWVC4pyjRDh8GHvnJc0c706FZjFAlr82XXwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110063; c=relaxed/simple;
	bh=8XyGNvnfBs6uY8D93hfhV99uV1gjUtEk+m1p8ACmxLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chmA0316kjqBFX+R7SUSmWAuBVIkV8dkVLhEGRH2lApsj3DlWfwyrpqMQw08kOTNmbzX0nKu4TIBsTHZ4GKLcsmZuklc1rHrgHW1SAqVb2rSxG66TrKwDxqKCjEkyVCjuMUB7tCCinDLN9LZ7b/zrqJEvuQ8ahMXatfaksBoTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1lqhVXo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1lqhVXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764110062; x=1795646062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8XyGNvnfBs6uY8D93hfhV99uV1gjUtEk+m1p8ACmxLM=;
  b=e1lqhVXor6MvupL0DNeP1Gdan2l5Ahjw/9+SKetnjxjb4BrcHvcT6ZyP
   fbqDShqq+2HPI/8mOvrCZ5IoWmFMK2MBeOCxGqJfSVQfAHxfAWftL6zXC
   CfENc5F7m4ewfv5F28HfFcYaBPO2i09nK9+rf7E+nynxrQPKociZEOMeW
   c7YaxFQwLQzHqBSP2LnWacacHfqIshyrWW5DihBjPMxNo1yYYizKXJgNL
   mGNG2iZntUhWebmnGIqjn1jYo+3fmZSYZawHIUQbkHCyCqdrZJJJu/XDv
   m4thLGsrs3fhlS35qfKnqN+QGjuklo1NgUUkSDShUy+Y1NVFZVc0j83bI
   Q==;
X-CSE-ConnectionGUID: ms8ONlNQRgC1h9nGTV5+MA==
X-CSE-MsgGUID: fD/lC4DUT7mRSvoTttef5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83749755"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="83749755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 14:34:21 -0800
X-CSE-ConnectionGUID: 61SFWq9bQ4GKL3WN2OP8Og==
X-CSE-MsgGUID: UBBZe7Y4Qi2cfTYl84+sSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="191917244"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2025 14:34:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO1c1-000000002KD-0rZV;
	Tue, 25 Nov 2025 22:34:17 +0000
Date: Wed, 26 Nov 2025 06:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, naresh.kumar.g@intel.com,
	Michal.Wajdeczko@intel.com
Subject: Re: [V6 PATCH] Due to SLA agreement between PF and VFs, multi CCS
 mode can't be enabled when VFs are already enabled. Similarly, enabling VFs
 must be blocked when multi CCS mode enabled.
Message-ID: <202511260605.6coXQdhv-lkp@intel.com>
References: <20251125101345.2324973-2-naresh.kumar.g@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125101345.2324973-2-naresh.kumar.g@intel.com>

Hi Nareshkumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20251125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nareshkumar-Gollakoti/Due-to-SLA-agreement-between-PF-and-VFs-multi-CCS-mode-can-t-be-enabled-when-VFs-are-already-enabled-Similarly-enabling-/20251125-182712
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251125101345.2324973-2-naresh.kumar.g%40intel.com
patch subject: [V6 PATCH] Due to SLA agreement between PF and VFs, multi CCS mode can't be enabled when VFs are already enabled. Similarly, enabling VFs must be blocked when multi CCS mode enabled.
config: xtensa-randconfig-002-20251126 (https://download.01.org/0day-ci/archive/20251126/202511260605.6coXQdhv-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260605.6coXQdhv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260605.6coXQdhv-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `num_cslices_show':
>> drivers/gpu/drm/xe/xe_gt_ccs_mode.c:98: undefined reference to `xe_sriov_pf_disarm_guard'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `ccs_mode_show':
   drivers/gpu/drm/xe/xe_gt_ccs_mode.c:109: undefined reference to `xe_sriov_pf_disarm_guard'
>> xtensa-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.c:110: undefined reference to `xe_sriov_pf_arm_guard'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `xe_gt_finish_ccs_mode_enabling':
>> drivers/gpu/drm/xe/xe_gt_ccs_mode.c:134: undefined reference to `xe_sriov_pf_arm_guard'


vim +98 drivers/gpu/drm/xe/xe_gt_ccs_mode.c

f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   91  
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   92  static ssize_t
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   93  num_cslices_show(struct device *kdev,
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   94  		 struct device_attribute *attr, char *buf)
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   95  {
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   96  	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   97  
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  @98  	return sysfs_emit(buf, "%u\n", hweight32(CCS_MASK(gt)));
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15   99  }
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  100  
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  101  static DEVICE_ATTR_RO(num_cslices);
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  102  
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  103  static ssize_t
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  104  ccs_mode_show(struct device *kdev,
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  105  	      struct device_attribute *attr, char *buf)
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  106  {
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  107  	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  108  
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  109  	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15 @110  }
f3bc5bb4d53d20 Niranjana Vishwanathapura 2023-11-15  111  
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  112  static int xe_gt_prepare_ccs_mode_enabling(struct xe_device *xe,
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  113  					   struct xe_gt *gt)
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  114  {
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  115  	/*
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  116  	 * The arm guard is only activated during CCS mode enabling,
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  117  	 * and this shuould happen when CCS mode is in default mode.
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  118  	 * lockdown arm guard ensures there is no VFS enabling
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  119  	 * as CCS mode enabling in progress/enabled.
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  120  	 */
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  121  	if (!(gt->ccs_mode > 1))
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  122  		return xe_sriov_pf_arm_guard(xe, &xe->sriov.pf.guard_vfs_enabling,
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  123  					     true, NULL);
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  124  	return 0;
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  125  }
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  126  
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  127  static void xe_gt_finish_ccs_mode_enabling(struct xe_device *xe,
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  128  					   struct xe_gt *gt)
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  129  {
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  130  	/* disarm the guard, if CCS mode is reverted to default */
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  131  	if (!(gt->ccs_mode > 1))
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  132  		xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling,
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  133  					 true, NULL);
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25 @134  }
c1e57b48189978 Nareshkumar Gollakoti     2025-11-25  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
