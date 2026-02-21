Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3117C203
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771665844; cv=none; b=rAJxaTpyQra/cpRmFMiKpNSfWEMt0GJxkvrq1dMi4StyXqBbrwWo5Qp8WqkXJjrgFTdJbwzDIYcw95jx9ki801WbyzpMWG+zwYB4HgeV82c3xm8Ci42Plnt2gPQfDl47Zgo/+1VuSZQj3YJYO8hYEK809j/fyMj6ge2wLvZ2dFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771665844; c=relaxed/simple;
	bh=q8Id1jNm2j4lD0NBamwsuDGVSwVtDQpMJDUAEk+EOa4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tLgHCM6QLre8uWbwlcC2qa5C3Pww1eKWU6U0Ps/ru45GJwuyCBO1KJoi15DC+bFCpCW8CytVEMWqflOWpFmXrUjwBGS6mPQfbmYJGvn9JA0cm//Y2u0XfoSaKI3hEx+VDZTJumnQ/2dzaVsf8+vFdcwHzydmy5L0DfQMj7xsL4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RihEhwNB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RihEhwNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771665843; x=1803201843;
  h=date:from:to:cc:subject:message-id;
  bh=q8Id1jNm2j4lD0NBamwsuDGVSwVtDQpMJDUAEk+EOa4=;
  b=RihEhwNBIWXpp5bGD6NDOq/VaXRiDoKZNq56ACSXBIUSOxS/RVaZH4KP
   lKGBj86e3Qtali4KE2jfPHRBMxGncRMWPyiMspEEtj+K4ncnoVJgLvTYY
   ifWR5VMz3Wu0YE/ygchaRNJpE5xJNn3j9Uxmn8Il9XCLu3gDDPU40VDrB
   IAe0mGXGIOfzeoav1j5Fr5l0+qSr/unk/86mVOFAamw24WXtFWI6Vcxw9
   kSOw812huyOneiUw6pGvq4I2JGC0Mq10B8a6g8Tnx/kfOvwrLOWuVvCJ8
   jE8+vShqtmeyUP4HX+M8DyI7NbWYD6umCpcF4MjHT3VpPxs6A08aDOaVd
   A==;
X-CSE-ConnectionGUID: 4MKnLN9EQxelFzKDvmDiBg==
X-CSE-MsgGUID: e7ufxUuHRaiOFS5WUqKbgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84103997"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84103997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 01:24:02 -0800
X-CSE-ConnectionGUID: fKXSZTkVT9G+E7mfh5VVJA==
X-CSE-MsgGUID: 7FMjp3MjRgS82Yw/Afmq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214921736"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Feb 2026 01:24:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtjDS-000000014pM-37CN;
	Sat, 21 Feb 2026 09:23:58 +0000
Date: Sat, 21 Feb 2026 17:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 5/5] ld.lld: error: undefined
 symbol: vfio_file_iommu_group
Message-ID: <202602211715.Z7xPJ50H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   eb956db04093e9a707a899925eab316f5863d001
commit: 04f52993ce9341df59f9cc10ccf4d681bcad0a51 [5/5] ANDROID: drivers/vfio: Call KVM directly
config: x86_64-randconfig-073-20260221 (https://download.01.org/0day-ci/archive/20260221/202602211715.Z7xPJ50H-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211715.Z7xPJ50H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211715.Z7xPJ50H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vfio_file_iommu_group
   >>> referenced by vfio.c:130 (arch/x86/kvm/../../../virt/kvm/vfio.c:130)
   >>>               virt/kvm/vfio.o:(kvm_vfio_release) in archive vmlinux.a
   >>> referenced by vfio.c:130 (arch/x86/kvm/../../../virt/kvm/vfio.c:130)
   >>>               virt/kvm/vfio.o:(kvm_vfio_set_attr) in archive vmlinux.a
   >>> referenced by vfio.c:130 (arch/x86/kvm/../../../virt/kvm/vfio.c:130)
   >>>               virt/kvm/vfio.o:(kvm_vfio_set_attr) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
