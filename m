Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD941F5D8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Sep 2026 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209372; cv=none; b=OUPYoXu7NGx/AYHRexcJdM+/tX9aQQ4IaxR2xMZts3w3gdyzDPTbVcMNklKF3bpmNfzVXLTJ5OssVqpU9tK5SZvwHZ/HoHvdxNpvOZtaQE5h/K6X5zGKBI60m3imkpwXP8wsGTqUyhROdpmjzB7sv3Xe9ZUSS+eabIuwIP89I2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209372; c=relaxed/simple;
	bh=0hntzCOIpeOMwyGy4kPaq53ny+gAJQ3YbbYwooJWxBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jfKXF+26f0nGXf+xWqvO2pcOxi+Eig80TZ71FHCWrHeTdCUAVyx0VdH9ZhAZIq7bXKQ3e39ZYSWU319wuZO2p0dWqb4tnljA0wQCLLMYL5JBMPF66vzde3iQc9W9N5gkKBqHk2VSmHTG9/u0gZ+4r5poERGOVSH2nBYHNLC4994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/AZRyU8; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/AZRyU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789209370; x=1820745370;
  h=date:from:to:cc:subject:message-id;
  bh=0hntzCOIpeOMwyGy4kPaq53ny+gAJQ3YbbYwooJWxBw=;
  b=U/AZRyU8TdYk9Cs0lRO2lLc/mY3DLioNbIffczCqwX2nu7dyVpvoBnLU
   aYdU8vvL5yrn3nbArIpoamZsnd+NkTisaXNjhNC6pQivu3Dn18tLzU9X5
   5EwoJ/h4sPARLp8bH+FEkdOzlEbk34XY851IBsJZk/Z4nTZWX/fz0l/M3
   MYTl5T2RcpC0xR1qUF0+0DeBUEvl+eZAWdQTW/NfMhVDyY5NPZWa2Ims0
   UPM++Pe28iweZgStNWmGCLMGsLSuWpAcH8rNggUzM2naePfaAu9J6KnRL
   c/Xg2YJusFQTS0zX1+6kmGTLRTEhboGthvvXiJvuWn8oloQ3/8VRDIdbQ
   g==;
X-CSE-ConnectionGUID: ODk7Z0NJT3WRi6Gnf7JJ5A==
X-CSE-MsgGUID: jOZN0lbPTViadWxP7EWjnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="164064"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="164064"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 03:36:09 -0700
X-CSE-ConnectionGUID: 2AQOkbx9Q1qzFaYOy6GesQ==
X-CSE-MsgGUID: zViOAu77T22ISRMSn+Tu0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="400119"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa011.fm.intel.com with ESMTP; 12 Sep 2026 03:36:08 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5L5J-000000002rz-0zhl;
	Sat, 12 Sep 2026 10:35:53 +0000
Date: Sat, 12 Sep 2026 18:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] vfio_main.c:undefined
 reference to `kvm_get_kvm_safe'
Message-ID: <202609121855.PZLm7RBT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8eff909dd82da10a599468a514cc1ad07e90c3cc
commit: e43f03eb172d7e8ecac55bc3f9547c18f436ea82 [0/3] ANDROID: drivers/vfio: Call KVM directly
config: i386-buildonly-randconfig-005-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121855.PZLm7RBT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121855.PZLm7RBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121855.PZLm7RBT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/vfio/vfio_main.o: in function `vfio_device_get_kvm_safe':
>> vfio_main.c:(.text+0x15c5): undefined reference to `kvm_get_kvm_safe'
>> ld: vfio_main.c:(.text+0x15cf): undefined reference to `kvm_put_kvm'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
