Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5217C23B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725103986; cv=none; b=pYm9f3Swvk3DeNt7xWGnvHJv9brUaB/7QqKamHcSlTdQDoq0hXHthGoLdZDQtuKBj0j/e6oAzCktrYRIruU8ah4H/ZY+h3cyzr7OkdAWqc9MTnC8GjSWuUqia7sQFM3P5YMr98cN+x/289ryLESOt25OD6NKM9qeJ7XJQ1TnN5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725103986; c=relaxed/simple;
	bh=jj9Vp976niRDnareIAZjr8PaQoO1NluWTTen20cykOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udUkk58N/80DRvEiSbMyDpdZnpzgOKokOH+HBT6RB7YsdhDWhRD4atLswkCSOs/awrieUBn1uEFaNtMh++nKVTrFJ7PUiNF2KmsS5QeoM4u7SD+zddPJmeWnV/GJ5oyJTNpgHyhOUhqMsjVw4xIsmG/u/GABPdNdp6ZUmGUhm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rv2WyKuc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rv2WyKuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725103985; x=1756639985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jj9Vp976niRDnareIAZjr8PaQoO1NluWTTen20cykOg=;
  b=Rv2WyKucrWF0ggHkEiEF+z06Pbj60boocxvM1yAIIaz0q/PQLPU4pdwl
   GX5VGri6eHCUcGbcPHvcBHUPNjxAvG/4K+pYGzOLAJ6y1UZ0AFNMxen9/
   QRkn0/FcAtv+f92298AhgAyH9aSIH3zavdiY4b2WYkLEAGnCRjJ9sT6E9
   Jg3t/k/Cyd9uGouhSXPSBKWZQ8wrMTYt6M6ATTwpVdy7EMoGbgYV9sMsW
   c1tKbp3TZwghRSY7RFy5CjSkuZjbERnJK5CEngdaeypubM11xW6odq3vR
   QmWh2KbYU5jbXI4T4dbfeiXmYaJA0kLOFM+oqLwVTJFyLuWA7nPcvaGBl
   A==;
X-CSE-ConnectionGUID: gBMZTQmbQKywF6A3EojcsA==
X-CSE-MsgGUID: CnI5m0dPT+ugHsJacsdcRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13309736"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="13309736"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 04:33:03 -0700
X-CSE-ConnectionGUID: TgT16vksQVKDRClb9UEsPA==
X-CSE-MsgGUID: sXsRxjuBTrO/IOqNzb3UrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64158485"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2024 04:33:02 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skMLj-0002gg-2G;
	Sat, 31 Aug 2024 11:32:59 +0000
Date: Sat, 31 Aug 2024 19:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morse:mpam/abmc/v6 76/162] htmldocs: Warning: fs/resctrl/Kconfig
 references a file that doesn't exist: file:Documentation/fs/resctrl.rst
Message-ID: <202408311914.xjS4eyEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/abmc/v6
head:   1c2b259a9b6b7795f994cc351031c4ac166b1496
commit: 2132c4b5412b53caf5b353ae75e463adbc36a2e5 [76/162] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408311914.xjS4eyEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311914.xjS4eyEd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/fs/resctrl*
   Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/arch/x86/resctrl.rst
>> Warning: fs/resctrl/Kconfig references a file that doesn't exist: file:Documentation/fs/resctrl.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
