Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A472E36F3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751725626; cv=none; b=uJY0dRhVh6L7z8dorDaaeTilrpteHN1G5QUcO9Yg/S5BlA5Ami+12hqhgxOZMV5PKd8nrXKvIZwhRzj8WqV+We2exlzVb772Re+WeIeDfxG1qjNUD5Aou1tp0qS/bmMF4WQ4au4prnDcqklv4h9d64SsiR0f5XSUAoi3erJePzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751725626; c=relaxed/simple;
	bh=ELIxSDvHLQJUyoLmMOnsCoCZawdQt8QGo0hanZBqI1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JASlWj1EQBkfgAeV807d8FMwkMqhiF2RMRoSmET2MsaZ6BfVoYllQtQ5m8N9DtmGiTI82oCgjqer6epqXO6WkBeStpaJkyJOB/mbDL2GzIgAx225R93+/M5aCu/MX6g1lcF8yi/jLxmsNACdtsNSDZvC8io4qjnwFR6KXQG+4+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCL4G4ol; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCL4G4ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751725623; x=1783261623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ELIxSDvHLQJUyoLmMOnsCoCZawdQt8QGo0hanZBqI1Q=;
  b=nCL4G4ol6cZTQf3VF7P3VQH/kvrrY6BMalgnzitHd4HR202vB+pMf197
   YIc8rBRANTHoNpsmOKsgjEurixLn5cf17YcORJaNAjO5gWwXnhKQgJ9Sl
   pATGVsridrXhzneW0SeG4PyVRQtu11/Kt4TxyGQZsV6iz+AiNQ1cvcVP9
   eT1cHvmxG/O+FGMo10bLujogXqWX0sUejsf3+dwPryAAor1f9M6tXZSzM
   JrC1QFK5voj8QQBT8xWZxxtXjPHWpEXnQ3iWwioQp/ZQe2EC/fCoJPJiX
   5eJG2XXDfIxYC0UxwkAsUK0cp5Ep8T1pGCKDGViQ91Pq+wi+GTs2WYa7j
   Q==;
X-CSE-ConnectionGUID: wKtHnXjTQ767+rWKxJf2Zg==
X-CSE-MsgGUID: cuIRlbwZTdyYlILeOI/YTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="65363973"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="65363973"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 07:27:03 -0700
X-CSE-ConnectionGUID: BaWRdH6vQK+Wxjzm584smg==
X-CSE-MsgGUID: UFa0u0uoRZ2ZF4qUTIB7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="155409142"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2025 07:27:02 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY3r1-0004XX-2v;
	Sat, 05 Jul 2025 14:26:59 +0000
Date: Sat, 5 Jul 2025 22:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464] kismet: WARNING: unmet direct
 dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
Message-ID: <202507052222.OKOdFMzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a9f7917e90ec872036160e2cb3a1d3c1856cb406
commit: 362f33cba6a04a09bcfc47ade55ace95e8a51c5b [2464/2464] ACPI: Add _OSC bits to advertise OS support for toggling CPU present/enabled
config: x86_64-kismet-CONFIG_ACPI_HOTPLUG_IGNORE_OSC-CONFIG_X86-0-0 (https://download.01.org/0day-ci/archive/20250705/202507052222.OKOdFMzt-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250705/202507052222.OKOdFMzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507052222.OKOdFMzt-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC when selected by X86
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
     Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_PRESENT_CPU [=n]
     Selected by [y]:
     - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
