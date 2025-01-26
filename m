Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC51362
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737889405; cv=none; b=IK4P9aidHZmVhjkk/wb0iZUOK5ETFMVr3CHLPHppVVc3Nas0NjzmYA96mtcdT4+ZCmWzhpgHR5MKbZO9wgsVxSI23QIla3IDnRSh/UtF75XHSjfLpF9z2tKc/jwzhZyPCoNmkRrttRtrq0c+3YuLLRrswZok8+YziX6wGj4lewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737889405; c=relaxed/simple;
	bh=jT8vMNOBdWkQrc0foUGd1oBbqU8JVzdvTqRKROLsKWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgJGxiiDK3qkksecsa/wm6oj6e1AYJOi4mWBg6scqJS61yFnpl6eghwnWXdYoHhIzGNz+ETy76YxoY3cJoscuuGYBjLeC2cV405zQNtKHN7dJ4KLpFhDnSTSvOu6r0Bw3GzDgO1Ua7unoDu1i/27nVXaOHq9XukqZpf6RcZimKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6+yQ66G; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6+yQ66G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737889404; x=1769425404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jT8vMNOBdWkQrc0foUGd1oBbqU8JVzdvTqRKROLsKWg=;
  b=N6+yQ66G1MFDVSAg5ldXtZYPj1Tz46yzxF70NFmAnu8SJE9XwnbBJMJ8
   QAgvjTRWDn4hbmfTE6XG/v36bkyIyy6TuNfBKWvcJhu95flDQPTyXVuXN
   LKPXzKk7lSzPvxGSKucPEVJgjcVMEimGwsiY265Got6dVfYATKfFh6FiU
   38Mvc0mtaqr08MtRa/XXlQTZq5nf2aqfI94AbF8ePwQLHLvmQBERo/L6S
   tbimMKN9WAvbSYlGAZ679gtvSUB63X7ZhBskB6/mvGDTjeiEvoJgMVTfl
   ysrZBR8kM1IVYka2KDUmZSPUGv8uBcMPqg1qHF51ujNXwNAMZyqNkD7sP
   A==;
X-CSE-ConnectionGUID: 5KDTz/e8RFmAbhF5aWHBYA==
X-CSE-MsgGUID: xAwUrdPRTiWO9LcZFcd/xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="60835357"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="60835357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 03:03:24 -0800
X-CSE-ConnectionGUID: KlAJ3lhlQQWdNLWkuWKQpw==
X-CSE-MsgGUID: t5SrT4yJSAqvFd7AbrIGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139041067"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2025 03:03:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc0QB-000fIh-2q;
	Sun, 26 Jan 2025 11:03:19 +0000
Date: Sun, 26 Jan 2025 19:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver O'Halloran <oohall@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_driver.c:786: warning: expecting prototype
 for eeh_check_slot_presence(). Prototype was for eeh_slot_presence_check()
 instead
Message-ID: <202501261817.WelJ5nqt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oliver,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aa22f4da2a46b484a257d167c67a2adc1b7aaf68
commit: b104af5a7687060792ca398bb86b033057afce75 powerpc/eeh: Check slot presence state in eeh_handle_normal_event()
date:   5 years ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250126/202501261817.WelJ5nqt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261817.WelJ5nqt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501261817.WelJ5nqt-lkp@intel.com/

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
