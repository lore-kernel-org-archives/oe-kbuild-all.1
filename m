Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223311B86FF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 04:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727757536; cv=none; b=NFQGBd4nIFDinYK+pRAWrnbhn/35+wJOH5+WGQWZPBymCZwoa+FQIAkTU2N64R0pJrXMzogLAFybyXMxoTMlujOJpijolWNQUoZf20MrEBl3GFJVwEbdgxc+G5t2RwUYh1JKeBF9cPE2YGrlhu5xZ43n6g7iPLGsp83GgowaeDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727757536; c=relaxed/simple;
	bh=6O+OIN1oh5nc8RVG9Djr41kGfFIXH7+jXn7Hilb0sXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzIMBV23Zrm+/1OmJdQx7SNsrtBNuA5nY7/3C9I03pQduY5zBl/TdotOd4PWh4esLvGbQGiH0jgRjLo5CBJePpSScCgMjz3yaD3FSII3VKNsPBW+8faWpLrPc8xVLVGY6dUWJMFeUWtio9oCinkTbaOd1rH+Db+a3IU8H3RQ0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+thIzgb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+thIzgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727757535; x=1759293535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6O+OIN1oh5nc8RVG9Djr41kGfFIXH7+jXn7Hilb0sXg=;
  b=e+thIzgbdZlKG+NwBlk4ydGsiS1Vq9xaprdwbx+gHIRhYjJXqxHRt7lz
   Tflg6iS/ptONhUwpJ2vJKbJxJjppJNqVuA/9E8CuV3h6jaPKsPOk27j1/
   ucxonAlf55bM6kXswVqQayQ/ku38veBHph9FRPe8h7uRlKExSRc4LpQiv
   3jbt2oq7CA3k1AVyC2m/NvztS903UIfjfITvFYuG8n6DqlKCyXHI/A3Pn
   brEzIX0c6UmCC7TORCz6i2AmYPZPMksu7mR0XtOkP8U+ZYFuJmNLeer/C
   2ENHujbJpwzZSB5joGIdV2KHLQsFZNmHqISDYneymJLFh86O+7XWvqS9r
   A==;
X-CSE-ConnectionGUID: 7BLTLUQCTQS5PDNDyAXuYA==
X-CSE-MsgGUID: s9YgKEleQS25ohocB8WbYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27045971"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27045971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 21:38:54 -0700
X-CSE-ConnectionGUID: f6HEEzblSQyUKwGRSNQybQ==
X-CSE-MsgGUID: uUm4RYoqSWeSXhcRCjaFfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73831082"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Sep 2024 21:38:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svUew-000QEr-2P;
	Tue, 01 Oct 2024 04:38:50 +0000
Date: Tue, 1 Oct 2024 12:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 107/137] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_CRC64_ISO3309 when selected by
 CRYPTO_DEV_TI_MCRC64
Message-ID: <202410011217.9J6iAtPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   7866eaeb3c1ddb52b976c3e4140cdfbba28a74f3
commit: 2af1725d4bd6b8b24a1a2b47e1de27949d1cee9b [107/137] crypto: ti - add driver for MCRC64 engine
config: openrisc-kismet-CONFIG_CRYPTO_CRC64_ISO3309-CONFIG_CRYPTO_DEV_TI_MCRC64-0-0 (https://download.01.org/0day-ci/archive/20241001/202410011217.9J6iAtPi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241001/202410011217.9J6iAtPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011217.9J6iAtPi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_CRC64_ISO3309 when selected by CRYPTO_DEV_TI_MCRC64
   WARNING: unmet direct dependencies detected for CRYPTO_CRC64_ISO3309
     Depends on [n]: CRYPTO [=y] && CRC64 [=n]
     Selected by [y]:
     - CRYPTO_DEV_TI_MCRC64 [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ARCH_K3 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
