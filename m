Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F625A647
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 03:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738726845; cv=none; b=ar+MO7P/n9510lNuJ902k7BaQumBRbBmzPC2TxTvyXKs6SJzBY+WyIm+a8AGFG1pjYoLizPVxhORIXXBVw+A43qMs6furHmkYgZSSawtPtvBX83tkkJGJg1uEbkdPG3bTQYQd33uSo4e2prFCz3e1N7rFvU5+pwqgDCxnmYpLcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738726845; c=relaxed/simple;
	bh=taKGALfmy71N9LNNLGAHZAudTWv/z2nXZEXf/+wSnno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mu119ZVO2GyUU1ETgFS1IstfLWOfoCDutHMRwzwlRrJYAZrTjgZ9T0TMnwaMbZRSSwrcU1QzWmmSx+rDA1idtnlDrUQVb5pUVj4UnIw+Ob0GMSr4veQzKizv7mnapeElMqk0XJNrcX4SGoELom6Us7/vsxqV1tYhTVEYjPVkXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUWzuPJL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUWzuPJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738726844; x=1770262844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=taKGALfmy71N9LNNLGAHZAudTWv/z2nXZEXf/+wSnno=;
  b=nUWzuPJL6UtwsJrkBROubT8MNynGhZdGwaaoN4wvRhMyExRg9GlitvBo
   N471M1jEp8UbWc/crh6dVDoB0vGaRtA1+JXoOPWCLzmUy2XvFS28kqajy
   5ZnwLE0u5mxZU3RiwPIWqNEhSZOvmEg1DO0n3C9X6hUvm1JksGhrKzRQp
   2GIOJpzGjhLuWJcs/YXctdFQJAJZfAhWJNkevIMuNmLnudq5HxSBl4ra1
   HdldmxddiRi1QvxpsuqR6K303luQwmUxJFscHKEFmntAdnGkCyEevc83/
   BdZZ+212TXH8q88Grp+HBk0JMsNGT5PpgHfrpndZvmmI5E2CX8iCvQTKi
   g==;
X-CSE-ConnectionGUID: rlFQz6XCQOm3uJ8g0oqokA==
X-CSE-MsgGUID: m2jkSv8hRRayUK/ZBgEvlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39420001"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39420001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 19:40:40 -0800
X-CSE-ConnectionGUID: ywzLCqVQSrGgAwuMMScEGw==
X-CSE-MsgGUID: 8mNjQHOyTLyheQ7mNLJ8Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="110635571"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2025 19:40:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfWHD-000tNT-2w;
	Wed, 05 Feb 2025 03:40:35 +0000
Date: Wed, 5 Feb 2025 11:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:virtual_bus_2 2/2] drivers/regulator/dummy.c:59:27:
 sparse: sparse: symbol 'dummy_regulator_driver' was not declared. Should it
 be static?
Message-ID: <202502051136.oWGOGsbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git virtual_bus_2
head:   bdb2f3a52db4cbbb7bf900190e7a964ea116d44c
commit: bdb2f3a52db4cbbb7bf900190e7a964ea116d44c [2/2] regulator: dummy: convert to use the virtual bus
config: nios2-randconfig-r113-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051136.oWGOGsbe-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502051136.oWGOGsbe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051136.oWGOGsbe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/dummy.c:59:27: sparse: sparse: symbol 'dummy_regulator_driver' was not declared. Should it be static?

vim +/dummy_regulator_driver +59 drivers/regulator/dummy.c

    58	
  > 59	struct virtual_driver_ops dummy_regulator_driver = {
    60		.probe		= dummy_regulator_probe,
    61	};
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
