Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309617BA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 00:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771805573; cv=none; b=CAKP/lRuvKcfq1Kjjv1YYZOJlQE2YocQlqgYZdgjjP3JaQd4z1uZU+dBXfpf1gh+7DwsxrpqT0bjFYYoem1WzgzzB9bb2FaAQ2Z423Gc++TI7ELOEvlQOtcgBqSg8XpxEG5eEJLg9HQ5sB0PpYSZiHGWzjvT3OW1pW3zG+NkKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771805573; c=relaxed/simple;
	bh=jpjjGhcVSqB1baj2q9uTBLJmAfnNREJO8guT1yGAcXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ITSZUAdqfCf1vV2GZNmilG2M6tTFMR3I9okOd+vr8zGAnfn+N3Ylo1t8xwigq4rwsTCd2NXsaRrZoyJ+um3jl3gtLOOHUXr5LOW6Bj/cOo7VKm9I5yw1Hx22YEczlX4LivvXuyFVQMz77NYrpzxv0jSxFfhr9pSSFqzBafHF98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPn9r+cT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPn9r+cT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771805571; x=1803341571;
  h=date:from:to:cc:subject:message-id;
  bh=jpjjGhcVSqB1baj2q9uTBLJmAfnNREJO8guT1yGAcXY=;
  b=VPn9r+cTXUigcBACNRQitbEGRB3+rzd1RrYLNvswUrozJf5ayiWCoQYb
   4HgSCFZyEppzgTUX/eNYiTYwVplJutuVG1Mw5CsphhLZrU2lY7e68lMtL
   gEk6Jci365gYAuaRUQIsNPg1jOYJoTaj5NtcI9mlxgCIyKk64llxkzmV0
   /VkEcQn3s7AFttBe7jIHoKWt0WGGNJOKb9c6y0Fby87Bhv7dGoV4zrpAK
   vswmTDSwagJWyxrW2j20mXTi2AF8UrYvzYHVpUoCqDpw2nwOxlm0kvzZo
   C+t5BlNtOqC8j2iZYi6qm7yOszW1mPLRD+5/Rybhh3fTp4FmlHKogZlfB
   w==;
X-CSE-ConnectionGUID: zd6dFmsvRPmSn6zcgG8vqA==
X-CSE-MsgGUID: Ujt6QnRoTxC1numj1wWCyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="75409169"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="75409169"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 16:12:51 -0800
X-CSE-ConnectionGUID: Czo/neW1QjiVC6h0AnLygw==
X-CSE-MsgGUID: 8maD3vXlT4iLwlK4uZdCdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="213390938"
Received: from lkp-server01.sh.intel.com (HELO c63097897875) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Feb 2026 16:12:49 -0800
Received: from kbuild by c63097897875 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuJZ9-000000000CP-1QO8;
	Mon, 23 Feb 2026 00:12:47 +0000
Date: Mon, 23 Feb 2026 08:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] vfio_main.c:undefined
 reference to `kvm_get_kvm_safe'
Message-ID: <202602230835.TRoc8Y73-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c190014704c7a433b2d1df9efbffca3f36b294c0
commit: e43f03eb172d7e8ecac55bc3f9547c18f436ea82 [0/1] ANDROID: drivers/vfio: Call KVM directly
config: i386-buildonly-randconfig-006-20260223 (https://download.01.org/0day-ci/archive/20260223/202602230835.TRoc8Y73-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230835.TRoc8Y73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602230835.TRoc8Y73-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/vfio/vfio_main.o: in function `vfio_device_get_kvm_safe':
>> vfio_main.c:(.text+0x18d9): undefined reference to `kvm_get_kvm_safe'
>> ld: vfio_main.c:(.text+0x18e3): undefined reference to `kvm_put_kvm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
