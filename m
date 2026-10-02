Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD13E49D2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955317; cv=none; b=OGpHw12LYCFsqW3ZCkg8pxCN3WweKkvwAkXfPEiv4ndaplWE8dS+PWDIJZkAsmM7xzhpo4yxNdM4T3xyNHihRxBgAnX+9jBSAgvyG3DBmlU4Vra72lOpKdMreqSm7Wlr6e2JquTqPeVv3kPBO84c6ZRthXhT6Wg14tlBiGNwBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955317; c=relaxed/simple;
	bh=JrSrZe7SoXYtkQ1wa0E4wwks1tV1E7Y+h93XsPYVuBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G0J/8BzKqR4ZXak23vTs8XZtndmz2WauJ88SsoP4RixqTY/JNydigIvbE5BhC3mCLefAEvNEbcmQpi8DaUfedAt+3jzFyNSVHjalilmgrPsS4HtA9i5mX/pmej5BpkWxWAlVfPWkmHXlsd1OtpzcX5VeCzAR7WekDTKHnN7zXfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iohA44ra; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iohA44ra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955316; x=1822491316;
  h=date:from:to:cc:subject:message-id;
  bh=JrSrZe7SoXYtkQ1wa0E4wwks1tV1E7Y+h93XsPYVuBM=;
  b=iohA44ra6ShnMznUneoRkv5XYl8Hv9aTfPNK01yzogeRSdHpehF42l/V
   aVjU8Totyjc2xpIpiUWKn2jzN9kF3SKgqGxlgUmv+6tRm8Xu+8akSgwEK
   2gjbX+tMdfe3IqdPOngy4lSzGgztT3a2VCyOv6VeE42LlAlRMOYDOVfAK
   WLcdxYMuaIEWKibMUQoYTdK9HFUGbeqYaHMGKmkRqUd1Qq82y8FplmC+0
   ZLRXOB1CJK8pTOXNJ1eyMHwzp2uzVcqXCWB3AO9Utg0mem94cVDvuO6BN
   hHn+U9WYqsAvA8sFRBY2nWoJA2HqnmxC8XjsYFC6siKNIdWYFI6wBGV5R
   g==;
X-CSE-ConnectionGUID: bf12Zb8iQ+6UA9+egADvrw==
X-CSE-MsgGUID: cK/eII9nTTSjv9oVicohpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102397341"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102397341"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:35:15 -0700
X-CSE-ConnectionGUID: 8qTXZnX6RDGz6B9Eaam1aA==
X-CSE-MsgGUID: ZNCe5gioTwOCa9B+dbzbXg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Oct 2026 08:35:14 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCfHz-00000000TC1-3G0m;
	Fri, 02 Oct 2026 15:35:11 +0000
Date: Fri, 02 Oct 2026 23:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:arm64_drtm 5/16] aarch64-linux-ld: cannot find
 __efi_image_info: No such file or directory
Message-ID: <202610022347.ABxX6ZdP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux arm64_drtm
head:   3cb16363c0f4c782f6aa10fb3eebd4d7fc5fa8a7
commit: 9333233a16e15067f5b6cbead3b15b28c6ca90ba [5/16] arm64/efi: Use CONFIG_EFI_STUB_IMAGE_INFO for code_size
config: arm64-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610022347.ABxX6ZdP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610022347.ABxX6ZdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610022347.ABxX6ZdP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: cannot find __efi_image_info: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
