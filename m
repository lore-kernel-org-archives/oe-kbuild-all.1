Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66820208D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 23:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615071; cv=none; b=iPVXaUi22mJJONDDRQGCODjL2gR4VCA/Aa4lvMfqWsj4jY6Rqv4mDCrOE+Mlt6j+N0ei1CNKCVcTBV4zv47/Dqx1yM7p2vjzExrItBEexMCtQFxejEfe7iVyjgfEomdNxU6C/45XXowhW7wor8PReiMdR75+27dxu3yiZhdFQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615071; c=relaxed/simple;
	bh=v+Cz0BiUCo9XQSifPPIbAW7wzmZJeaVNTLtPwb1HaiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1Tb1lqLNwYAvQvMaEoK8CV9ODjSmmZe1oq98V/g3IyD8FVJjDYiaNcJerDimMTEKmgpQRmGKNOrINJrCnQaR28yV3wJzCPEOqWtwEcmahHtcr00smArKGwOv8yfDgYfF2ykBIz1poqdmOLD9duzV37G2FUvcU07DTTtGLXygLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hohLoaXA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hohLoaXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726615069; x=1758151069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+Cz0BiUCo9XQSifPPIbAW7wzmZJeaVNTLtPwb1HaiA=;
  b=hohLoaXA01gT2eGtJOb0dSolQFS18oCwVoXT0laIStR70ThxrcqWhCB+
   Lj8IayVbHGeApNkNRiPzgEz5ZB/TZQ7vKmUW7Sc6UyeXbeNRujb8yx66J
   mVmEurqurJ83IncaqfCjVydAhRUl/RIQlGzpjHc+vATaYeuvSU3Zex0K7
   knoMjvdygg709R+QKppDW7gApy+Av3K3unn5dJpC/jB9AvWoP8uUlyCRL
   yRKXOMpe9ibvzSY+XFGSrwLlYltM/UgOhYaZpMuB0RKuZHE3n0cUGYGnw
   PUeQ5w2Fj3JjIpgZTGENYEQYqiNzg1txtPvu/LKXjtwUB+ZYY4e9hJySG
   w==;
X-CSE-ConnectionGUID: N7O4PmSUSxSr/ZiWhCuDcg==
X-CSE-MsgGUID: G3suBVUgTLWWPPRt1pjt9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13564610"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="13564610"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 16:17:48 -0700
X-CSE-ConnectionGUID: b8/0KlrAT5Opa1gH6K10hg==
X-CSE-MsgGUID: gwnBTkf/RU6KXSHEtHkEKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69834917"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Sep 2024 16:17:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqhS4-000Bh4-38;
	Tue, 17 Sep 2024 23:17:44 +0000
Date: Wed, 18 Sep 2024 07:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3093/14977] htmldocs: Warning:
 /sys/bus/coresight/devices/mali-source-ela/regs/SIGMASKn_0-7 is defined 2
 times:  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:184
  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:199
Message-ID: <202409180701.OQCKbDS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiyu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   3516b574d9cb19c39dc921a07a37c8a2fcaf0009
commit: 17c7a8b9f566aa74780249dbd6ad28020edcb5c7 [3093/14977] MGS-7377 [#mali] VX504X08X-SW-99002-r45p0-01eac0
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180701.OQCKbDS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180701.OQCKbDS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: drivers/gpu/arm/midgard/debug/mali_kbase_debug_ktrace.c references a file that doesn't exist: Documentation/filesystems/seq_file.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: tools/power/cpupower/man/cpupower-powercap-info.1 references a file that doesn't exist: Documentation/power/powercap/powercap.txt
>> Warning: /sys/bus/coresight/devices/mali-source-ela/regs/SIGMASKn_0-7 is defined 2 times:  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:184  ./Documentation/ABI/testing/sysfs-device-mali-coresight-source:199
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
