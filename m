Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDEA2209F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 20:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726431917; cv=none; b=VQT1IOJ9/zhf+IdXyZFLB84HMHBOh01JCAEs7Hw1G31S32UxTZob7LjJQ6GBijFjJO3PITjDlcLBvUrqx98nRNWV9tTlRd6d7hUzeGtC4zflcoH5iYitRpMfKLUJbPNm0Oy/CVHEiZdDB5KRFhLGe5bsdRaLzfq/1Gh88Cysmck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726431917; c=relaxed/simple;
	bh=XguYv4ThW5ZYjXCrppONz9r4kMUc/nyNaVCAQo6NBxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xp7iDzxhn0oo1zQgxN7sHn/FcocNEyJxHQmXFgvQDisZ1BQkR2tvUQsad6hdX1/f+7S9KQyKes0vL8wi4elsxyC7Vzb4Swd8FvG7S7JncuT7emClmpFGhPUWYBX9LsBgiybM5bCdl/EMsQ0iDrQxWHaWNjf3sRu2G3l6vE6a+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YccvY48W; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YccvY48W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726431915; x=1757967915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XguYv4ThW5ZYjXCrppONz9r4kMUc/nyNaVCAQo6NBxk=;
  b=YccvY48WXNsaizH4NDlYV5bGGl11b4PVdr5eypgpJS+twlQI8jJqWitL
   Dg56hlUjBR/UP7+GtEIcQM9fOcunWbo2xEfbxQJYWcJ9yZqbZ9PAvDBl9
   BvvWujOKlfubCpSENlNH9eKDhap8HHljn889mAEyLevDxeASH23XTgkP8
   9PjiildJCbFwCL3I2JnDgfhb+yXB5EAfsRNo2E+UZeC+xJ5FP+lyraOK2
   pOFEkQ8kYreWs9Rm5PyJRk4qndiVjg3IaIjbige4N7evOi+vBL7F5ZhsF
   iCh1LziDh5Ej6nW3vyJDuaGvavZ/Xoi1uXvcVucXLwpgKIuRUG/8YyA/F
   A==;
X-CSE-ConnectionGUID: e0q/RX4uQaOC7AlC+zA8BA==
X-CSE-MsgGUID: AhEyhrSbQW+Ddn1c+VFE1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36648129"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="36648129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 13:25:14 -0700
X-CSE-ConnectionGUID: BmPNptE6T9yq1HtbnlOIFw==
X-CSE-MsgGUID: BSONGI0YSKe7a3CsRzcNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68929918"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 13:25:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spvnz-00091K-1x;
	Sun, 15 Sep 2024 20:25:11 +0000
Date: Mon, 16 Sep 2024 04:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/13950] loongson3-acpi-cpufreq.c:undefined
 reference to `acpi_processor_register_performance'
Message-ID: <202409160448.mekEXGBM-lkp@intel.com>
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
head:   84404f248a61323e09909849803ea4efce81742f
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/13950] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240916/202409160448.mekEXGBM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160448.mekEXGBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160448.mekEXGBM-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `loongson3_cpufreq_cpu_exit':
   loongson3-acpi-cpufreq.c:(.text+0x6f8): undefined reference to `acpi_processor_unregister_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L333':
>> loongson3-acpi-cpufreq.c:(.text+0x2a20): undefined reference to `acpi_processor_register_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L372':
   loongson3-acpi-cpufreq.c:(.text+0x3390): undefined reference to `acpi_processor_unregister_performance'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
