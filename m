Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E8A249E5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732505019; cv=none; b=G1UQJ90OEseSbYZEPAVPozifLQcptswoWjNndRJLWlhU5nAJyMaT1OiM7Nq8pmqmgNxT/CAqv97N3BU46ezGCaxoLKYb2OwGqINtVzP5Hu17bUcnIVNx+u5XlG65MCLAM9+tJAwUi36mSrWPV0JmLrf5ER0ZIZyRMpmkAmA37N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732505019; c=relaxed/simple;
	bh=SHSVT2auJHEEgaSg5GTp4SfBwYoG0gAzRTEZGEr7S7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fEP2SwHy8bN9A9i4vf3/Kj2jcMFqzrGHCv4VVbWkGcO0u4MbAUhqFFf+n1qzJYHIwe7GE7qOwsmagGT5ZifYMjHsEG2eF4Zeg4obm+38t1limhS675nUGIT8DktdJvzmzef5z4aIi0O4Qpb7e8r46tyK2fi15Re5AmSgStbPEBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+M07AHf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+M07AHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732505018; x=1764041018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHSVT2auJHEEgaSg5GTp4SfBwYoG0gAzRTEZGEr7S7w=;
  b=P+M07AHf7+C0sDHboD1sE+OgnOfni6uM7liUDNk5ehc13sHYi/mK32Zp
   iLV249tcwg7t1AefzTn4UnmKLRSOXDU3MUrl+Q+jjOwzb/jXSQTNvGf7O
   SZjVVaGzESrAF/1Twjz2WUzWDWszFEHqGEqAPaN5V0j/puXzLzD9omDP+
   UeDq20ss9pmRCxLiXsB8s+YMsybtfxKVt7SDMMGO0rhESyfX1sd+3Oate
   RHXU65gxIHlXyIRDwhUhF1p2qlpDLMweXOh9aSoZIo+tO2OUVuq+HGFHp
   Kvc0VaBPbwf3HLo5pzYz+qlVH9ISBT+Z87E1eZgRCrZgXPL1jOP69s76h
   w==;
X-CSE-ConnectionGUID: SxvHznBdQ2OfLu9nw0wPYw==
X-CSE-MsgGUID: 3kvxzO3tSRWrUQPOCHem5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43655335"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43655335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 19:23:38 -0800
X-CSE-ConnectionGUID: buZXXYNPRju/Zmq1nIJbog==
X-CSE-MsgGUID: YAyKdZHDTAyJdU1poLUg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="90930791"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2024 19:23:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFPhG-0005go-1c;
	Mon, 25 Nov 2024 03:23:34 +0000
Date: Mon, 25 Nov 2024 11:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466] loongson3-acpi-cpufreq.c:undefined
 reference to `acpi_processor_unregister_performance'
Message-ID: <202411251114.dtutDKWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuyun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e2e6e833f0e931accd24012488ed312ed9f63150
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1466/1466] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-randconfig-r053-20241114 (https://download.01.org/0day-ci/archive/20241125/202411251114.dtutDKWn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251114.dtutDKWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251114.dtutDKWn-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `loongson3_cpufreq_cpu_exit':
>> loongson3-acpi-cpufreq.c:(.text+0x5b4): undefined reference to `acpi_processor_unregister_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L231':
>> loongson3-acpi-cpufreq.c:(.text+0x1ba8): undefined reference to `acpi_processor_register_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L276':
   loongson3-acpi-cpufreq.c:(.text+0x225c): undefined reference to `acpi_processor_unregister_performance'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
