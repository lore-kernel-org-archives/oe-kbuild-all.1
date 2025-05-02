Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EED9BA50
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218542; cv=none; b=Qw+pQDnGDp+bNbwdyOIi1W5mxCBrqvGUVHGI9r19EtifAVbhnnLbGQ88xhCuvJLnMcKodkKNYN1By6dTdm9obRm/AcnaNwY3BFXcIB2J3xG1nZBZK9+udlPaCciYH9fOH0UcD/0AxVILnZTjFUm52wzfdzJbYrpEnFg39KRUrOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218542; c=relaxed/simple;
	bh=mNtb/Xw/aoWYCPEPBDpYHFwjv+7NPMeAlQU8BsGIlzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFlQ4b9SEedHzOhQaJ0IPUmIPf4pwLzPjjbdwty76aPky4e3uee2iGnQL/raFSwoQXFDTFrUY5ZYDElGPvxIW298Q6bGoRgNz2/CUh2gJjQu/A1CjQ0swQehs1DI1+f1kDMvLIwiwxVfShoSFpfQWcutWIJTKeDzY3pP8oHjjIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrLiPz8a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrLiPz8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746218540; x=1777754540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mNtb/Xw/aoWYCPEPBDpYHFwjv+7NPMeAlQU8BsGIlzY=;
  b=TrLiPz8aR/PikoGUxljdZp50OUWYpZ+L3ham89jUS72WLDWZnMiizJrs
   I1af1Y+wL03f4HD0FM/PB2/xDPS6ohfweCZ8mO8SAFVgr/t33Jc6pFrie
   ACfznCvW5Wo1FwifBri/glzQQJ4k6xgxVnuj4H2aUCxsWWOVf89PvzhTc
   S7ChwqdBNhfpKVb2d+hg21GoVRLr3pZlFm3jYFYpgtrzln2S1Huw9tmWS
   YS5l4eMIIvoQ+cOcuOTsBD9Bs8AF0VPGT/fjmgOzkat44C7rYbimCk42t
   sm0xX2MUj7w8TiBia31UtL5kCITP+jvMs2gFxyzaqrRCSdGRou3xxyCUE
   Q==;
X-CSE-ConnectionGUID: c8bX9WFUR7yDJIjgdex8sg==
X-CSE-MsgGUID: axZxRvUfQImEZZXyS8nwZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="51718107"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="51718107"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 13:42:19 -0700
X-CSE-ConnectionGUID: ctPsS/GgR3WnmxnwMRMXTw==
X-CSE-MsgGUID: w9S2BAunQRyInBp3o0ClfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="138746218"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2025 13:42:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAxD6-000517-14;
	Fri, 02 May 2025 20:42:16 +0000
Date: Sat, 3 May 2025 04:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [linux-next:master 7636/8235] max8971_charger.c:undefined reference
 to `extcon_find_edev_by_node'
Message-ID: <202505030449.BkQ5Iyjl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37ff6e9a2ce321b7932d3987701757fb4d87b0e6
commit: 60cd40eee4f4f57e88bd5dd03f299eb9e17c73e5 [7636/8235] power: supply: Add support for Maxim MAX8971 charger
config: i386-buildonly-randconfig-001-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030449.BkQ5Iyjl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030449.BkQ5Iyjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030449.BkQ5Iyjl-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/power/supply/max8971_charger.o: in function `max8971_probe':
>> max8971_charger.c:(.text+0x31b): undefined reference to `extcon_find_edev_by_node'
>> ld: max8971_charger.c:(.text+0x39a): undefined reference to `devm_extcon_register_notifier_all'
   ld: drivers/power/supply/max8971_charger.o: in function `max8971_extcon_evt_worker':
>> max8971_charger.c:(.text+0xb16): undefined reference to `extcon_get_state'
>> ld: max8971_charger.c:(.text+0xbb8): undefined reference to `extcon_get_state'
   ld: max8971_charger.c:(.text+0xbf0): undefined reference to `extcon_get_state'
   ld: max8971_charger.c:(.text+0xc48): undefined reference to `extcon_get_state'
   ld: max8971_charger.c:(.text+0xc75): undefined reference to `extcon_get_state'
   ld: drivers/power/supply/max8971_charger.o:max8971_charger.c:(.text+0xcb7): more undefined references to `extcon_get_state' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
