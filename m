Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702361FA16B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740225354; cv=none; b=kxejiqDC5xqKjCO9Rpejh6mjXudC1V3qHMLOO6sJREnFAKL3kuQpvNyemM6hdzRtugRpN3ZVeCNyAQVAqFBTgJp0jA2cBRH3iihBpahIXdVmZPeKh+YuI6DvCR9b6uo1bLMP/w5KObIycvD+DlSPj//d0a2GJkbDFdaiomiMOc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740225354; c=relaxed/simple;
	bh=3CXAidJ1YaNW3DTQVSEgzTKHs+xd2XGOXpIAA7/lBqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUJ7pJsQshMo7ox0w+kolylrTh8U+n2At71sg+EyHbwb2aHfVwE4BCJm4sKCA1BDX5PRAhMAgHles3mh4gxDCO+/l4ima0ULSSixpYpL4nHiB4NbQSlpxndfFVqJKGb1oQV1Q/RVNxbVG8IE0Ldsv8l/QoKMpoApoe9mHjgZVaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atMMUI3S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atMMUI3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740225353; x=1771761353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CXAidJ1YaNW3DTQVSEgzTKHs+xd2XGOXpIAA7/lBqk=;
  b=atMMUI3S23IF8ZZMpZ1haovVd79ltMyeVrkdi5NtKgZzIcOujwFt38B0
   CGhbCdjOGh6i0YtBhhLuVCeSbSMaxFD/IYCdURG36Ei0BmCu81W8jqNge
   CeyKAezCLr1ZMcEUNYT/IBI2nhdvaVziTxaiLSM5lBVBthRYZ9WTOvYXz
   F6UuSCgqUgB6iPZn/D8nVZutXvKRjSPcmmCElvo9+AE0MidFM4uN/9lVS
   yWSKMt8rD+CslSxN+w4klX5Dvam/+Rd9gymit6eW9thnv+WK8daAJnsjj
   KpjX+n9OFWo6B6zY00BNZXOsX/in+PC2MPGw0PmD0NLwpy1evHvyFqBcx
   A==;
X-CSE-ConnectionGUID: Jkc0Um0tTgmeKQ8yvHqrMQ==
X-CSE-MsgGUID: kUiqL2bmR1Wl37ZyMy8Epg==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="41160083"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="41160083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 03:55:52 -0800
X-CSE-ConnectionGUID: bElaQEzlRFq55CVXv2DAJw==
X-CSE-MsgGUID: I9KIDJTwRQiDrwT3iZdSYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="138834958"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2025 03:55:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlo6m-0006XH-2q;
	Sat, 22 Feb 2025 11:55:48 +0000
Date: Sat, 22 Feb 2025 19:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for P2SB when selected by
 GKI_HIDDEN_I2C_CONFIGS
Message-ID: <202502221913.1fqnGXwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   f1a7d64e039461ef511f25b61668310cc675cf24
commit: 7662d999c05b7ca019aa86cea9acfdf698a2f611 [1/1] ANDROID: GKI: x86: Add hidden i2c configs
config: x86_64-kismet-CONFIG_P2SB-CONFIG_GKI_HIDDEN_I2C_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250222/202502221913.1fqnGXwJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502221913.1fqnGXwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221913.1fqnGXwJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for P2SB when selected by GKI_HIDDEN_I2C_CONFIGS
   WARNING: unmet direct dependencies detected for P2SB
     Depends on [n]: PCI [=n] && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_I2C_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
