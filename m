Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF11DFD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715874264; cv=none; b=flRLc4Zy1yBbzYkslSBWIbXGlq4pM8VP28qXPb/zqBi6/PZDsES9wrCnnmRqxIvnOBCcrMzol9mLX2QKR8C4333Ew8wy3Kvwhvqf5qV1b1h2MOiGJ/8fjuV0W/0ypBU0UpoRm6e9Vnet/0NHErohgYOrb1NuI5obeKQfnQNdOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715874264; c=relaxed/simple;
	bh=7uEWX4xsHV4nJcV41BFoPh4Qp/fbZA6ZjCgLBPdpUak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lG6m74Dr4284GabGz4Z/0ENB/iLA8mscuKVPA85UVaqmjNf8RRjHRRshFAasryCtFZLmRWjecbcOkDooy5r+BEzySdllUzn3N3Fa62YWb8iK/daJXEazIDs1pyKbEeri/+8qJxIsUu/yv/D+l8q5pQZXFEfCBQ6RftK17cQoQcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8Y95gVy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8Y95gVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715874264; x=1747410264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7uEWX4xsHV4nJcV41BFoPh4Qp/fbZA6ZjCgLBPdpUak=;
  b=J8Y95gVy+OqxqBAyEd7jk+0aGGdIC4/UWtU3vtnm2Esw12I7ZvWcMmMb
   yLT6cToJwqdy4SUKtYSskrnRMfy2yTNw3Akj8Qm/4488qd4bSM0p+5cLD
   Q8NwqC+XPa+3u0T97LC9Q7Hx2YcUFRMeMZdf0Vv9QuoRec+AlWFK33A0n
   dBztRnbzZsbJRrVGQos2G/+7emjosEIU/Rj40Cxxg1OMALlUiVIjAg40d
   ZYjm7L6E8K1ueE9ew0denRnWSw7smQxNP/phgJ0Dp9ZUKWFsvKqQNfG0K
   mDQJvTLTql7a7q4yppCrso1p8Asw1eSAzFHzxlaw3J9OEoXjIC2sOdmaK
   A==;
X-CSE-ConnectionGUID: Eg1QOYScRDywLxH6TR+AdQ==
X-CSE-MsgGUID: 6Oa3xggQTGCk61/9m7AAwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15780907"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="15780907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 08:44:09 -0700
X-CSE-ConnectionGUID: iN6U28A6Sz+i2cA5lyQUpA==
X-CSE-MsgGUID: FOzq9vCVQsO8vN4tVqC/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31493407"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2024 08:44:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7dH2-000EPF-2r;
	Thu, 16 May 2024 15:44:04 +0000
Date: Thu, 16 May 2024 23:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/rt712-quirks 10/12] ld.lld: error: undefined
 symbol: sdca_device_quirk_match
Message-ID: <202405162305.EbnOm7Ei-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/rt712-quirks
head:   667a5afcfd541df0169d7f1e3ef905e22a565472
commit: 9fde48a258313fe16d3bf299945e441c88b462b9 [10/12] ASoC: Intel: soc-acpi: add is_device_rt712_vb() helper
config: x86_64-randconfig-003-20240516 (https://download.01.org/0day-ci/archive/20240516/202405162305.EbnOm7Ei-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405162305.EbnOm7Ei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405162305.EbnOm7Ei-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sdca_device_quirk_match
   >>> referenced by soc-acpi-intel-mtl-match.c:775 (sound/soc/intel/common/soc-acpi-intel-mtl-match.c:775)
   >>>               vmlinux.o:(is_device_rt712_vb)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
