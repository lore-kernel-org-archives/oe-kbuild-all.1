Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5957316E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716882178; cv=none; b=nXJTydwGnO839KiH3e/g1fEdo1qahw49rvVe+6ovKpJKzSdNDcXQkUdVVVR7/EnmDL2qY0ta7/WLtattJnuyZ+W1JuSAqURxZCi6GAqq+Yuh5WQftnXebwcm0+OfHQmB5juaUq6ASqFGHRult9OnbX1oOSXP76ByNVLhzrCDk00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716882178; c=relaxed/simple;
	bh=X07Q6Vhao5uo2xPX4fukvQ5tsHzV91gQp1gLgX+UA+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ns7hv8iO4AX139E25CEPcginirJrf1aGgBIlbIfwIHw4rzEQRL1YPWvD/AsmsblrX9nB5jH6a+ecgDEgVcOSC0YByExpoPbAXYCHltaLd7Eq8mDhldfMkHiNfmtO/v08MnceInJaTHy8ZQ73StYDE32hDpiORpaKq7agHiK3rQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfXxCs6o; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfXxCs6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716882176; x=1748418176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X07Q6Vhao5uo2xPX4fukvQ5tsHzV91gQp1gLgX+UA+g=;
  b=IfXxCs6o7I5zMhoSowNAiUPGpDBtcH48CdIPDf34MC1f9eSGD8Q01UEJ
   1dXC13DlrYs2o4omkdzBwD8EZ7bAXPp5TeWOy+zwyBsBBpRtvTzYYqlwZ
   HESBLBboD7WX4+kit3MlXiRIRGcQzfH+pjNWUqJO1OuQ7tUzkdzcpPEYn
   EJn04o1HKGJS0tNlsRm4GQ6DQWoFAh3Ahpg14WYF3PWomdywfcJibKg/r
   oLwFcwWJMgQQF1WzCcbbXBLm4eqtJJHMyzbS+WBnTH+YysM0uuD4DqYcB
   wCAQ741oZ+vRKxciv76GU+RQ3BH5i8zvhhxMb2R9nhVvAcy7I+j6Snvfq
   g==;
X-CSE-ConnectionGUID: KDtkO80kQwWj+6dXnmOl9Q==
X-CSE-MsgGUID: eKX1k1T0TdSuvJhodjqT5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="12983205"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="12983205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 00:42:55 -0700
X-CSE-ConnectionGUID: /+tr2fu0R2O4Hx84dL7/0Q==
X-CSE-MsgGUID: vbvbWMxvR6OtN2nvD4hEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="65812957"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2024 00:42:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBrTw-000Bqd-0I;
	Tue, 28 May 2024 07:42:52 +0000
Date: Tue, 28 May 2024 15:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:mariusz-npem 2/3] drivers/pci/npem.c:206:23: sparse: sparse:
 symbol 'npem_ops' was not declared. Should it be static?
Message-ID: <202405281505.XFik7B8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux mariusz-npem
head:   2fb114bf74eff73c83383cbd1d481584053cb8cd
commit: b333459f7f6c0f7dc493350e5bbf2bd1c21f518f [2/3] PCI/NPEM: Add Native PCIe Enclosure Management support
config: x86_64-randconfig-123-20240528 (https://download.01.org/0day-ci/archive/20240528/202405281505.XFik7B8S-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281505.XFik7B8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405281505.XFik7B8S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/npem.c:206:23: sparse: sparse: symbol 'npem_ops' was not declared. Should it be static?

vim +/npem_ops +206 drivers/pci/npem.c

   205	
 > 206	const struct npem_ops npem_ops = {
   207		.inds = npem_indications,
   208		.get_active_indications = npem_get_active_indications,
   209		.set_active_indications = npem_set_active_indications,
   210	};
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
