Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE69B67A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 05:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740547436; cv=none; b=Fjhm5xJAc671G9mmbOSGRb9/1M6ERIHm30Gya3vfCJBW0D3Xd7GEQ7Z53RzigSPgUiM/YX6zsovutEvWnTGOVOvy8DU8SG7/Z1PpVkjBSURC944z0PS4YV8XAj+f11SsD9Q97ID2xczPjVfqHd5gRL2IA8dmKqIldGcQ347MpK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740547436; c=relaxed/simple;
	bh=hsNq+ky1CZ2eWWp1fULZlDRNRpv5S7U+YFzAGt4kO/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S49HySMBpNWF/FzJw0BsTGpnz/vswmGcE0FMW2wZhuC3RGylfQusxRxo3eyLfp2Y0y7QCT4UEoCCTKueOqcZ1COf/IPoTE+53pQruZyFZv+BCx8O9zewrGaAv29o5OdJUHP0UplZI59jOKqMJQBXpPXXkPcz1QUEP445BjyYXSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBL15OOc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBL15OOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740547434; x=1772083434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hsNq+ky1CZ2eWWp1fULZlDRNRpv5S7U+YFzAGt4kO/I=;
  b=bBL15OOc+3+/U1atTlVCzYr4fGE9maCt0aqGyXBHJk5xoiYX1faHfev6
   US2xBfygTiz7V7Xa3KBSmKTajKAKsTddaA8OXetDF5YvLEI9twVRJpHC/
   aiQJ9UFyBB4b6NJ0ESTfJwuE/kc8UREJXTi+nRDKxeg53LG1y0EXAaCWC
   kiAf/YV8Q8iDS6YOco8gu3DJB3H82sdHB71swZXyAVrIfzSR9VTk2yOYF
   rnIrEHNU4B1RGGJhqCxd7fn5UuAyPVgNvmSy3pr2/Hdxx9q4S+GYLA3bi
   qTzf1KFcxlmwyUniqQXMFfLhQaQZcMMpotpdBMY+uVSUHVtm1ZH+t2k56
   Q==;
X-CSE-ConnectionGUID: m99HIqgURjmufnb6yRoVMw==
X-CSE-MsgGUID: BVJKUjktSAKnunclrd4MFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45294045"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45294045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 21:23:53 -0800
X-CSE-ConnectionGUID: hkr0ZdHSRYeq+gNbVpE3JQ==
X-CSE-MsgGUID: KBKu5FpXS6WH0XHyO3nfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121847677"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Feb 2025 21:23:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn9sM-000BCR-0z;
	Wed, 26 Feb 2025 05:22:51 +0000
Date: Wed, 26 Feb 2025 13:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/6] drm/xe/vrsr: Apis to init and enable VRSR feature
Message-ID: <202502261332.3GzxfFDL-lkp@intel.com>
References: <20250224164849.3746751-4-anshuman.gupta@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224164849.3746751-4-anshuman.gupta@intel.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250225]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Gupta/PCI-ACPI-Implement-PCI-FW-_DSM-method/20250225-005537
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250224164849.3746751-4-anshuman.gupta%40intel.com
patch subject: [RFC 3/6] drm/xe/vrsr: Apis to init and enable VRSR feature
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20250226/202502261332.3GzxfFDL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261332.3GzxfFDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261332.3GzxfFDL-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/xe/xe_bo.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_bo.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_bo_evict.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_bo_evict.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_device.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_device.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_device_sysfs.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_device_sysfs.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_dma_buf.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_dma_buf.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_drm_client.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_drm_client.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_exec.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_exec.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_exec_queue.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_exec_queue.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_execlist.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_execlist.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_force_wake.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_force_wake.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_ggtt.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_ggtt.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc_debugfs.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc_debugfs.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc_proxy.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc_proxy.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc_submit.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gsc_submit.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_clock.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_clock.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_freq.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_freq.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_idle.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_idle.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_mcr.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_mcr.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_sysfs.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_sysfs.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_throttle.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_throttle.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_topology.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_gt_topology.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_ads.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_ads.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_buf.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_buf.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_capture.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_capture.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_ct.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_ct.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_db_mgr.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_db_mgr.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_hwconfig.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_hwconfig.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_id_mgr.o: in function `pci_acpi_request_d3cold_aux_power':
   (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/xe_guc_id_mgr.o: in function `pci_acpi_add_perst_assertion_delay':
   (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
--
   hppa-linux-ld: drivers/gpu/drm/xe/tests/xe_rtp_test.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/tests/xe_pci_test.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/tests/xe_rtp_test.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/tests/xe_pci_test.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/tests/xe_wa_test.o: in function `pci_acpi_request_d3cold_aux_power':
>> (.text.pci_acpi_request_d3cold_aux_power+0x10): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/tests/xe_pci_test.o:(.text.pci_acpi_request_d3cold_aux_power+0x10): first defined here
   hppa-linux-ld: drivers/gpu/drm/xe/tests/xe_wa_test.o: in function `pci_acpi_add_perst_assertion_delay':
>> (.text.pci_acpi_add_perst_assertion_delay+0x10): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/tests/xe_pci_test.o:(.text.pci_acpi_add_perst_assertion_delay+0x10): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
