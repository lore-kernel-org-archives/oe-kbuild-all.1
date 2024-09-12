Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFDB1BF7F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726168220; cv=none; b=rE/fLOicbU4OQZ26YhnrOdXD6cLLWcHR6Jz9PDvFv2yT15sA7OVucOxb5Ft1OFskAPuHrxsu4x/FgvInnOvdJv7b2eb+CaVwrLk8IJ6IsKC0yPYD/YmudylN5A4JYAsErr3SWDYNz0GrRPen/2LZhXPDNlWGURngtQ9T3BZK7Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726168220; c=relaxed/simple;
	bh=sqIVF5eKe95B5FwV0irMfQ/kt4QJSmtYzaBArAzRuRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cusirjzgmAaJ+glGW6uaLy3Fd9i74vrym791FXyA/Be4RX8nOCdVGa8wJH/0kgn3fMTBZkhxn+mgMiFkGQK6/axAp6hUz33o/Mgffnj7vGZfz4/31CsvTZ2ueFowKQPVBtQeNCAKKe6UY/OWmgXcNQqwU1ZGhrJyEbkFeTLduXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pmygqoyb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pmygqoyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726168219; x=1757704219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sqIVF5eKe95B5FwV0irMfQ/kt4QJSmtYzaBArAzRuRY=;
  b=PmygqoybUUbJynR8CtAUuCr8gycMHGBxvYwEM44rXuvjNU7SqFBaW0A+
   NgA5qLKGyWKtdjv6YOo+7OKVDNA021uyguR0k0AsX/7MNPKLt9G0PZMXF
   Lmq8T5hj8R7d+qYn0QerBYBNlkpmPlBs15a1CESuaGF7zyR4Si3dYcyhn
   RwkhRoE7w2Ekd6+lcK5m+uUqXK4aqU0vJwo2Ko4XZZTWTuePCL8aYJ12S
   G584gxB5RvRpnq3PXdSeEIL1tT+IjIffMROwiQy8qeg/a31DWMA7rQB3M
   FeY5FhMJDQgRaD1Qe3RCkemwJoOUZcD0kTYeNuAJMpXtOBS4QZrgIFKkr
   w==;
X-CSE-ConnectionGUID: 6YUeSWqIRgqAAkekYGydWQ==
X-CSE-MsgGUID: N06mgd6AQESUfJx7sSyDZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="47565361"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="47565361"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 12:10:18 -0700
X-CSE-ConnectionGUID: XjCK2jYRSh+pYQSE3Xx7wQ==
X-CSE-MsgGUID: pVHvneXLRZ6XIrKghAJU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="72807259"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Sep 2024 12:10:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sopCo-0005c2-2v;
	Thu, 12 Sep 2024 19:10:14 +0000
Date: Fri, 13 Sep 2024 03:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7633/13930] drivers/ptp/ptp_hisi.c:731:36:
 warning: 'hisi_ptp_acpi_match' defined but not used
Message-ID: <202409130201.5q7OutLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   13706c950ff941dc015e16f76812077f9861e378
commit: e6aa0ecf50a8a0da6b742aacd9cbd47463275a30 [7633/13930] net: hns3: add support for Hisilicon ptp sync device
config: arm64-randconfig-003-20240913 (https://download.01.org/0day-ci/archive/20240913/202409130201.5q7OutLm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130201.5q7OutLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130201.5q7OutLm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_hisi.c:731:36: warning: 'hisi_ptp_acpi_match' defined but not used [-Wunused-const-variable=]
     731 | static const struct acpi_device_id hisi_ptp_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~


vim +/hisi_ptp_acpi_match +731 drivers/ptp/ptp_hisi.c

   730	
 > 731	static const struct acpi_device_id hisi_ptp_acpi_match[] = {
   732		{ "HISI0411", 0 },
   733		{ }
   734	};
   735	MODULE_DEVICE_TABLE(acpi, hisi_ptp_acpi_match);
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
