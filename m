Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B751A0730
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755931175; cv=none; b=mX65F9hnK2JjARRnX4MLKxnEBnHRuphUfZU1mFado90UDjFRUxkOU6PGhfPOmpgj+JYvBNl7oSb+6xfNE5u5/Ipnb4fYNsGEYkp8P3O/MbbHxjNAUQpTsIlLchKgN4ufTrX81J5UqLB4oetu56Nk5boqYHGkMlYPY+IooLFyIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755931175; c=relaxed/simple;
	bh=iPq3W8p0MGCvAAtvNpS0pQ/V2802RoyytStOLiJEBT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aoeiha+8hpUrnvBcsEyajnJmSJ9DZvL5SVnXRQ/qURtpyeudvn9XckqNOQdyb85iHyZ3VLoX/LxQKh/gocNgBsPZRPSLL/nxekj7qHCXiuCFRtd12BaX9RAAnKZXGkp/9ChtroaXpp9wjTCrXQfjwGrVu1EHwUys0g2ie3t4lYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeaV1P/4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeaV1P/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755931174; x=1787467174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iPq3W8p0MGCvAAtvNpS0pQ/V2802RoyytStOLiJEBT8=;
  b=jeaV1P/46fu4Q38yeo3dZ5bk+UZJSYyTj0y+AZMIVfzZonQwht8JS0bR
   9NhDYiRl6C7kOenWy/kr/8cEmgJHp9qmhQGzINU9f9mfEbleQC7yZAngp
   Am7Yzyd6L7U97pSiTagggG1ZYteVoehqzkxPHxAHhAMVjhmZfVGfYdO3f
   rYDxWwIqjjnxnv7iBjVcXojk5+WzZYJCSlSOUy8h95kvN/wq+bcQOH6iz
   /PPtx/yUpgNAK0jM0Ilh63Qts3cRQ8Su6K47q9FeUT5nWx0W96soQgaI2
   QCpNp288WCodwfWjhoSY33mqQwwTx+3TQeZun97NhqR8e7zz44rVe+7z5
   w==;
X-CSE-ConnectionGUID: JNN32+TdQ+2lFE6PTWsZkg==
X-CSE-MsgGUID: DrJ1SHzuQd2f0dexmHYLvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69597854"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69597854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 23:39:34 -0700
X-CSE-ConnectionGUID: hK37uaofQnu62wSf93TVgg==
X-CSE-MsgGUID: Cjm2CoGcQWqYRekIT0Dplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173282321"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2025 23:39:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uphuT-000M8X-2m;
	Sat, 23 Aug 2025 06:39:29 +0000
Date: Sat, 23 Aug 2025 14:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.17-rc2 71/89] kismet: WARNING: unmet direct
 dependencies detected for ACPI_MPAM when selected by ARM64_MPAM_DRIVER
Message-ID: <202508231456.e4YNDMbG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.17-rc2
head:   c0646bf01fb5098c7d6cbc44af567a8bb2ca82d6
commit: cc5c3a178290a55e8ebb9ea8c8df08bbd54951c3 [71/89] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: i386-kismet-CONFIG_ACPI_MPAM-CONFIG_ARM64_MPAM_DRIVER-0-0 (https://download.01.org/0day-ci/archive/20250823/202508231456.e4YNDMbG-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250823/202508231456.e4YNDMbG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231456.e4YNDMbG-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_MPAM when selected by ARM64_MPAM_DRIVER
   WARNING: unmet direct dependencies detected for ACPI_MPAM
     Depends on [n]: ACPI [=y] && ARM64
     Selected by [y]:
     - ARM64_MPAM_DRIVER [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
