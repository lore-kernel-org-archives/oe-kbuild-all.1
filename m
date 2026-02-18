Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95571163
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771373149; cv=none; b=NgC2Ps/6OAamUH9T8D1R75tFRBut8KS26+nq5sdRk+Auyi8ZdXc/qNxbXfFRqg22PuXpXbB5q3MiJbgWcPlEZ+JQDjrmTigMiqCZoZZO9QAQKCOV/KulpWGKVdseSiAv0iQj9xNhUrzFRa0oM+Wa62mhZWhncXt/cconqgOgGfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771373149; c=relaxed/simple;
	bh=LUn09K1TCa0FS8B9m9fsX+MWNo8QWtLuZ04VrRWizVo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k4EW+hXSMMzr6KX2lyf7HJMqUDUxx0JxJI3m9LipADnrAytMsyeFf223VGCG5qk6ZX0UVFG+ccuK4l48HwTZB4Ogrv+7jALVr2hnhaQvUTmXhdScqP0wXOT4QCK2EzG18CK/wstLWXlAmmaMbhV3QQ73hXEOMFAm6T4DFQKABrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CK2YVhjt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CK2YVhjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771373149; x=1802909149;
  h=date:from:to:cc:subject:message-id;
  bh=LUn09K1TCa0FS8B9m9fsX+MWNo8QWtLuZ04VrRWizVo=;
  b=CK2YVhjt5tgOrh2ztEfyKdHXc4ZLazMwmYrs7EA/YOZa/BJldhMljtdO
   eV6YyEMiOnql7FNUw6Ibgx05kwNBgeQjadOCT2nlCfWrl+DmND6QTaGhH
   BqCfk/LJkq4T0CkNxRIxZno1ljMhLBJ5B4QchldcywHNEF3pztBIO20zu
   Se8z4HAX+QzQvg40gjmzehDss6eDuFSjn2WSDF99VJaUVlM7De2/mbLAK
   dUUvlClpqybcLI4HaR03pCTN/AydDUwym+17afCtByGefs+ChUiFXhzRH
   u9x52/OVc1HoYBpwlLVDa0WL2JYWzIEMs6okBr1cT8Chmr7c2i+5uO7Ew
   w==;
X-CSE-ConnectionGUID: gAjP5ZttRzGAlrteRhgwqQ==
X-CSE-MsgGUID: ci5ZHl7RTs6vWHK4NFVujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72353329"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72353329"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 16:05:26 -0800
X-CSE-ConnectionGUID: 9x6E0lvbQtqwZJ27LNbwzQ==
X-CSE-MsgGUID: aigDHg5pT8CXuctaVRBPAA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2026 16:05:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsV4B-000000011qy-46Th;
	Wed, 18 Feb 2026 00:05:19 +0000
Date: Wed, 18 Feb 2026 08:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: pci-epf-test.c:undefined reference to
 `config_group_init_type_name'
Message-ID: <202602180706.VtXkmtqL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e81dd54f62c753dd423d1a9b62481a1c599fb975
commit: ffcc4850a16133d8db0f11ee6dde319201800451 PCI: endpoint: pci-epf-test: Allow overriding default BAR sizes
date:   3 weeks ago
config: sparc-randconfig-001-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180706.VtXkmtqL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180706.VtXkmtqL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180706.VtXkmtqL-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/pci/endpoint/functions/pci-epf-test.o: in function `pci_epf_test_add_cfs':
>> pci-epf-test.c:(.text+0xec): undefined reference to `config_group_init_type_name'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
