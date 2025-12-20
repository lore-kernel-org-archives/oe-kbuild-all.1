Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37172701CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766244825; cv=none; b=C0mTBNxRkGvN9yJglHcYpLwA3C3MOOZwaB4fCBWLE/MwcEc6oDOBx/aIJGrRXwGqss/iPIPKwI+FixV0T8SfA1rX4dSIgSU0vhNlbwSbR3ldGTiTlQF/z+lf5seCkTu4dXfqYVgbJ3fO1UZMSa7699YG+8r8bQVkQlSDcvjUTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766244825; c=relaxed/simple;
	bh=JwI3elfFFylItYX6hQ9LJ8wFJv0svUa6ORvyyv1AWCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GkLFI/ZGvNXKq8WK/RfI8E5MZQr7zX/eUGBUiR4Smbtbf9Fxc3qOSyfCiSCD3domuaGSe6NxGRnR5oqwaX9kzYo+cqpWdgGKLRTPTxSrAm3PbHfKRrFF/bnxA+k6SqmblYZHBieOIDcGM9arZ8+KJlchHsAvYLj+DC/eZdr/+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP3AhS0r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP3AhS0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766244824; x=1797780824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwI3elfFFylItYX6hQ9LJ8wFJv0svUa6ORvyyv1AWCs=;
  b=UP3AhS0rNpJJo+9iUGNgjfjjktyG7F4t9KOYdtFztaNQZmdah54hNV3d
   XWIK1utsbyE3mOy64p26XwFdetEXMzwl4NqJm+YQZlZh2GRgizNek7yi1
   +UE4nz7ZG8fQjcjjWdIg5g4BpC67+ihq/3W7V3/A6UeIOebEbMqZ6sf3F
   jbuzWVB2Km8qFi01iWqiIoRaW7Bfhv1tTZRYexJXbufFU9/CqTOihnlMc
   ItqSj9lgxn5qR5WeddFCv9VwHwyyi4V5enJ+YzG4NT1fn49LeZsEPzb/h
   UZmSH/+IIjYc1WEuMKIBFv08nlPsrO8cFy3aGg/NgJ+cdNqzW/lT61yD/
   w==;
X-CSE-ConnectionGUID: dZuVhoMuQH2xOdHZqnvP4A==
X-CSE-MsgGUID: AdzYiJxxTuq8uDWLTFEIhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68154117"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68154117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:33:43 -0800
X-CSE-ConnectionGUID: uEdl++ssQyeyRPFG+yfMyw==
X-CSE-MsgGUID: KtiWa7z5RU+lksrtTfGnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204054876"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 07:33:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyxg-000000004fw-1YWN;
	Sat, 20 Dec 2025 15:33:40 +0000
Date: Sat, 20 Dec 2025 16:32:40 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
Message-ID: <202512201612.K3fc9gHn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 362f33cba6a04a09bcfc47ade55ace95e8a51c5b [1/1] ACPI: Add _OSC bits to advertise OS support for toggling CPU present/enabled
config: x86_64-kismet-CONFIG_ACPI_HOTPLUG_IGNORE_OSC-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201612.K3fc9gHn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201612.K3fc9gHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201612.K3fc9gHn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
     Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_PRESENT_CPU [=n]
     Selected by [y]:
     - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
