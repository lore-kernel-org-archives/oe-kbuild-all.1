Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4221F931
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733761186; cv=none; b=nQgY8TL5hQl2ZxQ69ATH2/I23x3EvnBWG7AW/BfJc5Vgef/G0jXdy9MV6hp49VgykVDn0TeBkxRUA6JQth9syZt0AzGDi+P0A2raSDFOQnHQ0lcCso+RVaCUUSTRKUhGR+yM4TuCRV1y+JknIs5JsbPjoxUG2Zft7/pZcAhDyqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733761186; c=relaxed/simple;
	bh=WTocw3YRuATtbueQeqXiIBamdubxZcFWj9uZQ7AERdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUqWFY8ZM8CqxGyloPbMG6zREgVgOhd2j682P9Wnpix/oD9iEI4pvG7Sb64zfTLmNsqESYiR9YyfMDwtCPQj9Vxx+v96cP39wKzMgGZNmT4HvT5ZrqlpHlIctDBaAoObMbmtUk5hQbj5axOa+J3aTcBM4e9eya55KLpxbQr2nI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4XXbQTN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4XXbQTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733761183; x=1765297183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WTocw3YRuATtbueQeqXiIBamdubxZcFWj9uZQ7AERdQ=;
  b=O4XXbQTNGCVzAHtrE8Wl5a1c8dXj1sfzQG1iwWFtrEFFS7xQQOLiiNRT
   hIrfklpRq7KtRosHxLepRsmzJuNDWNv+rHx2dc1p7Sgwnc3djbV/e1ia1
   3r8QpHtWE8n5zd+KEtBO6MN4Avq3dQFKrg/lS88KFlOOVTkJrGp68VjfW
   ENG2sEAfubAyEjJywFcWInwPSoBUIXrNVAFTeouCM7r/GDtqdidbXfu64
   bWVv4Y2cQ3+MACP7JnoJpMatLcE8vPBILhaBd9DFvrEbRQfiqYVPbsMXO
   IE5BhSx06DCpjv0YW/recQVXiPPzMHPnqhnOJ0Z3OncDCmBP1hVQGrwo/
   Q==;
X-CSE-ConnectionGUID: 2jwShkAaSpKVKFORfkhOfQ==
X-CSE-MsgGUID: PwByjTJJQlm07EQb4o/ItA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="38001298"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="38001298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 08:18:57 -0800
X-CSE-ConnectionGUID: zIn1z+CDT0u3Qf833L4ffg==
X-CSE-MsgGUID: LA7QWLAlQzuJ6meXlTx2dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95316787"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2024 08:18:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKgTF-0004aO-2S;
	Mon, 09 Dec 2024 16:18:53 +0000
Date: Tue, 10 Dec 2024 00:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1610/1610] kismet: WARNING: unmet direct
 dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
Message-ID: <202412100011.1MOBC26l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 362f33cba6a04a09bcfc47ade55ace95e8a51c5b [1610/1610] ACPI: Add _OSC bits to advertise OS support for toggling CPU present/enabled
config: x86_64-kismet-CONFIG_ACPI_HOTPLUG_IGNORE_OSC-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20241210/202412100011.1MOBC26l-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241210/202412100011.1MOBC26l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100011.1MOBC26l-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
     Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_PRESENT_CPU [=n]
     Selected by [y]:
     - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
