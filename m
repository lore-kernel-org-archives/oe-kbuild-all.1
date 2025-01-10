Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADDDF60
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 01:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472219; cv=none; b=M5wcEGQLJk1zwuxtl0JM7nX9dpfD3FDEa/7eesdUPWfHe1o1+Ly1a6gwf+2/TuFfee573esWFRMPKdEfacpEbo0AVlrJUMR7OXJN21+dAnsDZyk6TbPUOWNlZt63C0XaAuEBtR0+4gHu7GjQSpIvR7KRJZdcQt56fUng6Ma7de0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472219; c=relaxed/simple;
	bh=Dd7v7yeNDf6qiYr1iA85pxswVzpI/VIXtSKR9LfrdvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugadAbzL5rMwN002qOfyW9Rzmsn6gw8YQ0cj7xrejBFgg75dSj4Pc5EgJ24ip+QfZS09BfBwrp8W9bE19QjwtF996LXXPbBFpfS+pCQEXISDX7CfUFogtWc0xsxrGvfjZwQYEsAa6PJUTfGvIsKHxiqGkLJeY2QqmbUKhXgClCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9eOYQ7M; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9eOYQ7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736472217; x=1768008217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dd7v7yeNDf6qiYr1iA85pxswVzpI/VIXtSKR9LfrdvI=;
  b=E9eOYQ7Mh8zXDrprZylLJthuBRwDPdTb6Q0+dM4VBD5SA5rYk4t3l3Ng
   r44G/9japadiuDLK5KdLCUPusK6VGpRD16RiRwenUP5c3Nl+yNYREIAS1
   9gZ5/AD8BqMkaBxn10pEHNf4L24Ph/vF69+/vKWSxAiL1/nCUORtb5zKN
   uSd5PBbGN4QR0KuouFgeefrVyVgN47thMJQWNYMfsXU3E6zbUTivaoVRJ
   DmCIPoKqCSyOh8h9YsO4dsWPnuBc0u3xge2aIlvquh4ULjsJOU44+M6d9
   xksmCbObrmATCfYN2GKnRFHJqF1JPgwLxQkk9YKEt0xEMqB27N5IzARhV
   Q==;
X-CSE-ConnectionGUID: 9oWKMaqeRU+mQRTwhgTFmg==
X-CSE-MsgGUID: un4zXSlaQg20eHMK1nTkaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47333748"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="47333748"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 17:23:37 -0800
X-CSE-ConnectionGUID: /gcqp+IeRTyS9c4aEOts4A==
X-CSE-MsgGUID: bpmnW8bKTtu1ppghEL4wog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="108496420"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jan 2025 17:23:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW3kL-000INi-35;
	Fri, 10 Jan 2025 01:23:33 +0000
Date: Fri, 10 Jan 2025 09:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver O'Halloran <oohall@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_driver.c:786: warning: expecting prototype
 for eeh_check_slot_presence(). Prototype was for eeh_slot_presence_check()
 instead
Message-ID: <202501100917.m9I062gm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c77cd47cee041bc1664b8e5fcd23036e5aab8e2a
commit: b104af5a7687060792ca398bb86b033057afce75 powerpc/eeh: Check slot presence state in eeh_handle_normal_event()
date:   5 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250110/202501100917.m9I062gm-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100917.m9I062gm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100917.m9I062gm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/eeh_driver.c:158: warning: Function parameter or struct member 'edev' not described in 'eeh_disable_irq'
   arch/powerpc/kernel/eeh_driver.c:158: warning: Excess function parameter 'dev' description in 'eeh_disable_irq'
   arch/powerpc/kernel/eeh_driver.c:181: warning: Function parameter or struct member 'edev' not described in 'eeh_enable_irq'
   arch/powerpc/kernel/eeh_driver.c:181: warning: Excess function parameter 'dev' description in 'eeh_enable_irq'
   arch/powerpc/kernel/eeh_driver.c:343: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_error'
   arch/powerpc/kernel/eeh_driver.c:369: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_mmio_enabled'
   arch/powerpc/kernel/eeh_driver.c:389: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_reset'
   arch/powerpc/kernel/eeh_driver.c:435: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_resume'
   arch/powerpc/kernel/eeh_driver.c:461: warning: Function parameter or struct member 'pdev' not described in 'eeh_report_failure'
>> arch/powerpc/kernel/eeh_driver.c:786: warning: expecting prototype for eeh_check_slot_presence(). Prototype was for eeh_slot_presence_check() instead


vim +786 arch/powerpc/kernel/eeh_driver.c

   772	
   773	/**
   774	 * eeh_check_slot_presence - Check if a device is still present in a slot
   775	 * @pdev: pci_dev to check
   776	 *
   777	 * This function may return a false positive if we can't determine the slot's
   778	 * presence state. This might happen for for PCIe slots if the PE containing
   779	 * the upstream bridge is also frozen, or the bridge is part of the same PE
   780	 * as the device.
   781	 *
   782	 * This shouldn't happen often, but you might see it if you hotplug a PCIe
   783	 * switch.
   784	 */
   785	static bool eeh_slot_presence_check(struct pci_dev *pdev)
 > 786	{
   787		const struct hotplug_slot_ops *ops;
   788		struct pci_slot *slot;
   789		u8 state;
   790		int rc;
   791	
   792		if (!pdev)
   793			return false;
   794	
   795		if (pdev->error_state == pci_channel_io_perm_failure)
   796			return false;
   797	
   798		slot = pdev->slot;
   799		if (!slot || !slot->hotplug)
   800			return true;
   801	
   802		ops = slot->hotplug->ops;
   803		if (!ops || !ops->get_adapter_status)
   804			return true;
   805	
   806		rc = ops->get_adapter_status(slot->hotplug, &state);
   807		if (rc)
   808			return true;
   809	
   810		return !!state;
   811	}
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
