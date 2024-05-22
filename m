Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02660823AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380290; cv=none; b=sdFM2umLPblb3f82JJQfgg+SreojY9rdtarKS7T2imSHKgHdSCFNrjfk/2PKBonUQEEP10cxT69iuIkYnMxGZ4ahn7Risa/pMWu/QsQ0s8OKEbGxoR2bLEZyD20P5nnV3s0KDX9T1TjwtV/ENS+PgklKyCuqZqShBNPFH7QuR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380290; c=relaxed/simple;
	bh=1cJ07QLRe8ioHOjNRlcVP4NUbr9EHzKWJ2D6ZYLT31Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ftz/yj+8HrihFSV8Cn64APovmx88LtMsNo7mLBZub/nt0qZvAw76HuAzUWRB3ofWjheQRfEVbcqpuKT1Ccx2GuIJ8jNvC6gTX2Owvk9KpEvtzTKoqFArLIFPwqFgNF/QYUNXBcpkVLi04UaGUPqy+OEoVXGUEDGLYua5ZlhGI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgM0A02k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgM0A02k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716380289; x=1747916289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cJ07QLRe8ioHOjNRlcVP4NUbr9EHzKWJ2D6ZYLT31Y=;
  b=LgM0A02kwZrGZVJQR8HAE0ueLZcvxEb2b5P06y7oKU28X1SuX4D+izS7
   CT7iRzxockifiNXXAnMG6tT9wifER7Dkv+WoWl85/GEKLjaCKR3FpqcHZ
   voNSBRHMpQ6+ktLGbkU6RnEmMF3X06sc+gr1yYkl7Stg544GVSA0XR3Rh
   zECq5yHwY0c/pn6y0iq4e3COXjvJ5jPcWEjya9+YREJcY3HGo++xWod0M
   yDS3cL7V9DdxeOJSiDyTMp9oyJlCTseODjPluuzDEpX6v+z5kmSebWEhj
   XUlfNEXmANDE47keL5c0nFUCxJjJTcxqmYH7HGBQhohlnhUbTHkDMhrJc
   g==;
X-CSE-ConnectionGUID: Kf2wj6gTS9qNrYhIldIS7g==
X-CSE-MsgGUID: hvUGTa0GQH2/DW54VMazJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="11645613"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="11645613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:18:08 -0700
X-CSE-ConnectionGUID: /0e+GhynR4+/HtDXGXubQw==
X-CSE-MsgGUID: dzUyVacSRametexAKyVuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="37853162"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2024 05:18:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9kuz-0001Wr-16;
	Wed, 22 May 2024 12:18:05 +0000
Date: Wed, 22 May 2024 20:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-function-devices 25/26]
 intel-sdw-acpi.c:(.text+0x2e0): multiple definition of
 `sdca_dev_register_functions';
 sound/hda/intel-dsp-config.o:intel-dsp-config.c:(.text+0x120): first defined
 here
Message-ID: <202405222029.t9ZyuuZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-function-devices
head:   f46b8e859911a824897639b737e4df43e17e1f42
commit: 2ac8e1bbf1ec8eeb41f02e27879939321999656b [25/26] ASoC: SDCA: add function devices
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240522/202405222029.t9ZyuuZX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405222029.t9ZyuuZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405222029.t9ZyuuZX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/hda/intel-sdw-acpi.o: in function `sdca_dev_register_functions':
>> intel-sdw-acpi.c:(.text+0x2e0): multiple definition of `sdca_dev_register_functions'; sound/hda/intel-dsp-config.o:intel-dsp-config.c:(.text+0x120): first defined here
   ld: sound/hda/intel-sdw-acpi.o: in function `sdca_dev_unregister_functions':
>> intel-sdw-acpi.c:(.text+0x300): multiple definition of `sdca_dev_unregister_functions'; sound/hda/intel-dsp-config.o:intel-dsp-config.c:(.text+0x140): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
