Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196F12E336F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643941; cv=none; b=lq8lbM4EH5fbdq01jfn/ZelNd+iRZpuxRnbpbz+CDdzJGeH2HA/1DG47NSnIUmyLNRph2o4dTKfwkqatB80Q/6+rg2KN0Q4LFgK2nx3rWPeV1V0zO4NuIGL8COheYIKnFb8VWkP069zOJffCg+fqdirWDmi1bpJ2WdJuHR4Uxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643941; c=relaxed/simple;
	bh=/7qvvIYS1IG85JU3SRdrJIFgo5WS9Aw2vpRRbpudLV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k3cov6/1qJhLLI/DhJBZbFFfH5iZkiikH+DhrwXeH4JU4jSSq9BMN9oyoR8Wy8s1/oRuZo7WNbyDwDg6VNORjZmz5DlQm7tRoGgCHxwGxMegH7WptUarReXtF7ZRTVPRcoBBMqhMBF7kZpHW2o+wmKTdD0x0B5/81lVFqmzdibE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2oqqbXo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2oqqbXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758643939; x=1790179939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/7qvvIYS1IG85JU3SRdrJIFgo5WS9Aw2vpRRbpudLV4=;
  b=k2oqqbXoPu726bROJbgbWAIy2zgS/geyPiFp7/KYjT/D/37mfJS/o89u
   ED6PNVglx2opfbgm5EohHYEoxX+120afIdcnSTwp+q+i4OEP3xXnkl/Zh
   g2qhatgwogH6ilbscJl7hIoRzMu6aYqONsEpzJZpOtaes2M31faZjm9jw
   EBJoH0ds55oGIeMN+3d7+wsQPSuC+N5p/U4Bv+FR52eGpV7zsEC8hlPlq
   4ldjG1rDZI2vNc/0DpjTEwNBeuMZ1PWJTE2nMtvPXdIQklm7RLASP7iLI
   Q6K9DT3jdB4b+oHxFD9UNQ8VtIqLX9eCESLEWwwTJMebmFjEGKZcx3GXM
   w==;
X-CSE-ConnectionGUID: EX1Sm62fSUWbcTjxsTyUlQ==
X-CSE-MsgGUID: KOhNQAmjQ1uZcwRxStUCzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60628464"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="60628464"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 09:12:18 -0700
X-CSE-ConnectionGUID: d1EjFuO4TuWIFXywFk2Arw==
X-CSE-MsgGUID: dY80SpliTnKBepUVVir3HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="176746777"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2025 09:12:17 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v15cE-0003IF-0Q;
	Tue, 23 Sep 2025 16:12:00 +0000
Date: Wed, 24 Sep 2025 00:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202509240057.swOD8VyN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   d1c28b38386c9dcb6852045d5109c1f7584ff342
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [1/1] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20250924/202509240057.swOD8VyN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240057.swOD8VyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240057.swOD8VyN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
