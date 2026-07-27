Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500C348C7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183609; cv=none; b=Dmkp1G1leW9xO/NvXgk2+LGYJgUTLyYn0e7yDeZiKhyIHWsBLQJ+GqieyNcwkSOUnuIHXX90Ro4w1NYo/PjgkaFrBtL76UE5Xe9WbBiDAPN1M7SF53L4afrFTNJNiDpptdQ1brY8l0gxA3wWvnExLuBuFvzEW9fXlAU3r5q9DXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183609; c=relaxed/simple;
	bh=zKC756NoDgn7/eap8KQVIWymS6upIBDYmysoy1mqIus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VQ5U7ht6dseXcR3I84IuEY9/QeOJZSI+1tgyXXN8JTpt30xwzWdOo+z9Kcak5UABmVFpboZhp8vbhbMTPFTOGEc1Ntr5eFtPVDfTGLBNOSWLXAyP4e3htDoUmq6/5BxZRxs/oBOI8hmhpBBdVJmTzIwN8GEsR+ECmuQrJSIShjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQngNY/A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQngNY/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785183605; x=1816719605;
  h=date:from:to:cc:subject:message-id;
  bh=zKC756NoDgn7/eap8KQVIWymS6upIBDYmysoy1mqIus=;
  b=OQngNY/AVFWtbjSpX7r8lXb5rjQHjSXONc8hNvZ7EBPLH1/QV3RoWOiL
   KKEB2OL5gd4CwrfbZBuZLeIZDCDIHt2cUY6DyO0O3QWUUerPZE+PVsgIt
   yYs6n97x+6g236QSDysHcY3nR2XxWzdbPdnlI1zw77C5ceXJm6cPrG6Ny
   AVwfZmx7iJqEwsJ6BE/+81sV5Uyl2D/PdlnMzLVHpoZeTP2R4aZTiMmRJ
   C5IkrvCJLwzCzg+Lbdlsx9zO0GVjYyvkWOYCa82Gb0muObWN4JsS1xQl/
   aLRWX0PIjQWOCtbUmEZpvyiHNE4RAbZ75phRoCDVL9lgiXNyylidr9dkr
   w==;
X-CSE-ConnectionGUID: 1QCzsFR+RlC0bzjgLdmeSw==
X-CSE-MsgGUID: 4auCHsH1Tu2BZvRbaqQOGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85949345"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85949345"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 13:20:02 -0700
X-CSE-ConnectionGUID: xW4yRQE+R6ep9nPTasXhQw==
X-CSE-MsgGUID: WBuJGaiNThmIpwLyjerVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263286455"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Jul 2026 13:20:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woRnj-00000000dUW-23bl;
	Mon, 27 Jul 2026 20:19:53 +0000
Date: Tue, 28 Jul 2026 04:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 0/5] undefined
 reference to `kvm_get_kvm_safe'
Message-ID: <202607280413.A799RbX8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   6ea6f1d2674f3ee03b932d9813dea9a0590e8a77
commit: 04f52993ce9341df59f9cc10ccf4d681bcad0a51 [0/5] ANDROID: drivers/vfio: Call KVM directly
config: x86_64-buildonly-randconfig-001-20260727 (https://download.01.org/0day-ci/archive/20260728/202607280413.A799RbX8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280413.A799RbX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280413.A799RbX8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `vfio_device_get_kvm_safe':
>> (.text+0x135beda): undefined reference to `kvm_get_kvm_safe'
>> ld: (.text+0x135bee6): undefined reference to `kvm_put_kvm'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
