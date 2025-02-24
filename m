Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E3D469D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740433130; cv=none; b=blZxSfgtC0WOx7rUUyn+oDvPniE+gXRVpTOtLopfEzxnbAlawwcR4W13DliNnoQRRlVH081+0KvhXftCIzxuxQwCVcz6CYnU194WgQUVRzRuIBha8HWT0q1zUADtYG3HcOKXmn+qmdfgAc4LUJA+f263nohF1WNIz5nnRP845io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740433130; c=relaxed/simple;
	bh=UEHsR685Hp+tfGeP3M3+q/EyKQZGmlGSkL8F/zIiZDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozbHFqx6rbHm2rY+FnvVu6e77PfScyPbDjOHdgtqu68HBauIS/+LWCNEz3ohrtDqVHTXJF+hWNx9JJ/+eIIxDxp6KDb1V7nZHs3KUlsC9+nOMFMX9S111U4AUL/FV++DwVeaf/uwwvrO1o1iVMYN3I+tkoM2OdPGQcNax7NmM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5V3JXQZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5V3JXQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740433128; x=1771969128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEHsR685Hp+tfGeP3M3+q/EyKQZGmlGSkL8F/zIiZDQ=;
  b=B5V3JXQZMZBphnCfaFzuOi4AzMGwDWEP7k83/QiJFcYCnljbnVdtkrF4
   2iY8BprslAP+9Zyse330SyShfFaweEUdiVALaxr51/HPnDFTlZNNyBcLb
   nAa88WB7azBbHgPn2BVriX4K6WA3RRDRH5g697lDo0IEAnOwqc/x5qw9n
   gbawf2j1KC8AGFwXM8kYTvWXCf4B2Gmdn4bPbe0ryOAE+yZYpi8t1/gJc
   1hxhhb9k9Pj+cah/egdMCs5eD2CNg9oZXnJsD8STjFwZJCNhZScWUWVpG
   QclA+l6p6n0WPEM6MjKGl6u6/OCpEc0A6oPGedpPUpSU2l6XLbAG7dd/J
   g==;
X-CSE-ConnectionGUID: F8uCzL4YRmm7LiUzIUXISw==
X-CSE-MsgGUID: HKtJyGVTSKuoa4KMnVtYDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40399702"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="40399702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 13:38:45 -0800
X-CSE-ConnectionGUID: s2lHYtSaQlaDHuHr99s4XQ==
X-CSE-MsgGUID: nYhxSHVkQuip8V+RcKklSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="115979619"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2025 13:38:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmg9y-0009MN-2Y;
	Mon, 24 Feb 2025 21:38:42 +0000
Date: Tue, 25 Feb 2025 05:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 5/6] drm/xe/pm: D3Cold target state
Message-ID: <202502250510.3h9zZG7v-lkp@intel.com>
References: <20250224164849.3746751-6-anshuman.gupta@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224164849.3746751-6-anshuman.gupta@intel.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250224]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Gupta/PCI-ACPI-Implement-PCI-FW-_DSM-method/20250225-005537
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250224164849.3746751-6-anshuman.gupta%40intel.com
patch subject: [RFC 5/6] drm/xe/pm: D3Cold target state
config: arm-randconfig-001-20250225 (https://download.01.org/0day-ci/archive/20250225/202502250510.3h9zZG7v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250510.3h9zZG7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250510.3h9zZG7v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_device_types.h:10,
                    from drivers/gpu/drm/xe/xe_device.h:11,
                    from drivers/gpu/drm/xe/display/xe_display.h:9,
                    from drivers/gpu/drm/xe/xe_pm.c:15:
   include/linux/pci-acpi.h:143:5: warning: no previous prototype for 'pci_acpi_request_d3cold_aux_power' [-Wmissing-prototypes]
     143 | int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 requested_power)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci-acpi.h:148:5: warning: no previous prototype for 'pci_acpi_add_perst_assertion_delay' [-Wmissing-prototypes]
     148 | int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_us)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_pm.c: In function 'xe_pm_d3cold_allowed_toggle':
>> drivers/gpu/drm/xe/xe_pm.c:888:45: error: implicit declaration of function 'xe_display_connected'; did you mean 'xe_display_create'? [-Wimplicit-function-declaration]
     888 |         else if (xe->d3cold.vrsr_capable && xe_display_connected(xe))
         |                                             ^~~~~~~~~~~~~~~~~~~~
         |                                             xe_display_create


vim +888 drivers/gpu/drm/xe/xe_pm.c

   856	
   857	/**
   858	 * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
   859	 * @xe: xe device instance
   860	 *
   861	 * To be called during runtime_pm idle callback.
   862	 * Check for all the D3Cold conditions ahead of runtime suspend.
   863	 */
   864	void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
   865	{
   866		struct ttm_resource_manager *man;
   867		u32 total_vram_used_mb = 0;
   868		u64 vram_used;
   869		int i;
   870	
   871		if (!xe->d3cold.capable) {
   872			xe->d3cold.allowed = XE_D3HOT;
   873			return;
   874		}
   875	
   876		for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
   877			man = ttm_manager_type(&xe->ttm, i);
   878			if (man) {
   879				vram_used = ttm_resource_manager_usage(man);
   880				total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
   881			}
   882		}
   883	
   884		mutex_lock(&xe->d3cold.lock);
   885	
   886		if (total_vram_used_mb < xe->d3cold.vram_threshold)
   887			xe->d3cold.allowed = XE_D3COLD_OFF;
 > 888		else if (xe->d3cold.vrsr_capable && xe_display_connected(xe))
   889			xe->d3cold.allowed = XE_D3COLD_VRSR;
   890		else
   891			xe->d3cold.allowed = XE_D3HOT;
   892	
   893		mutex_unlock(&xe->d3cold.lock);
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
