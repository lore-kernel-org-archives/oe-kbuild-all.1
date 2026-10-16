Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D863C1092
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141606; cv=none; b=INHWARiXsX+SuqYvoPDT5jAU8iwuuSWZmn+NHBGO/pnOCNR0uyDfMisBngCBzrogOeHGDlFZLlLVkDV8kaepGgXHTzM7o9PgG5/AxHuMLVmW99QPAqlkJNBqz1eM30HAAKZoPtVdeCPwcrV5bt3Az8xxEqriowAeke9IMf+wN4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141606; c=relaxed/simple;
	bh=m0ZuLurKO93RKq2zN5sbWU/zl6b1oVK83/2Xuer3jn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b7SLZ9S7F7kC+vEwrKMhVAzqwxDUuCt5O+flrwg5Ke0WSf6Plmbvq5rzTtidDI7Tg841AQ5PgUhuJg73jR2KHM+Nd6tpGrLpEFrqYAOluwjX5Y7xx2is8KpFoC2p0jieyYKHHpqZCcSXoCOuWhrBpOD3JGNRXsYIVwd0W0wO0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ga6punlt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ga6punlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792141604; x=1823677604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0ZuLurKO93RKq2zN5sbWU/zl6b1oVK83/2Xuer3jn0=;
  b=ga6punltjc1d/fuzgBxRczwecC9ban6SEiA+N1TwXrriFIdKA0IekvOi
   4mzDxuN+WhteVIOQ8z+7mrsALrcwmDdaw9kBXJ0eLrG8582RY/c+Z6XKA
   1yxmkOnYKX5/XN3lBqYAoa3FhS2NiLaRXVu6/O04EcQk38Sd0Eh+s1aPY
   vHlxM2rHJeLSWFX7QdPclzlujX/OIqExPtNhq/KRyppfBk1oJUV3Ddd/K
   55Pm5T7/LzSWYwmqSZgrgweSaTA33A359qh29txYTTL8FWaU4TQsOazub
   J4JrBnXZoi4rHNNzTV9jQ4jKLTyFwH2+vm50ElHgd7ZftKdEeZpp50rYd
   A==;
X-CSE-ConnectionGUID: 4WceulTzQ+C1ceDCYUx3Ww==
X-CSE-MsgGUID: ng7AcWsVT1WGPr2NBIoh+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="802751"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="802751"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 02:06:44 -0700
X-CSE-ConnectionGUID: lLyZEQtaRceklvn9vEkCxw==
X-CSE-MsgGUID: DORxr0vzQIKaBSmbyooTFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2319574"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2026 02:06:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHdtg-00000000C9b-1Z5m;
	Fri, 16 Oct 2026 09:06:40 +0000
Date: Fri, 16 Oct 2026 11:05:56 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-alarm-clocks 3/5]
 alarmtimer.c:(.text+0x46c): dangerous relocation: unsupported relocation
Message-ID: <202610161140.ukMBd3Bv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-alarm-clocks
head:   c8bb37f3267c7cbf3aed873255994d37a43122c9
commit: 16c670855b6263e33441b6502dd778778a33ae69 [3/5] vdso: Add alarmclock support infrastructure
config: arm-randconfig-2000-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161140.ukMBd3Bv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161140.ukMBd3Bv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161140.ukMBd3Bv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/time/alarmtimer.o: in function `alarmtimer_rtc_add_device':
   alarmtimer.c:(.text+0x46c): undefined reference to `vdso_time_enable_alarmclock'
   arm-linux-gnueabi-ld: (vdso_time_enable_alarmclock): Unknown destination type (ARM/Thumb) in kernel/time/alarmtimer.o
>> alarmtimer.c:(.text+0x46c): dangerous relocation: unsupported relocation

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
