Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B643B145B22
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711906057; cv=none; b=qF23A2RJQ1mwAJQha/dlpunmrb+ad1jsYLOLXKj1rQJMCNwlPEZauMnahMXrg8e50G132q7Sn7h8QHheq13kZZS45jyBthj0S8+EcD7ptue+O9gjSPlCdYYo6wQkUaAqpuPUmCJaiXjduvxGSLVDAGb7SnqWB5+EBHbWKXA8UYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711906057; c=relaxed/simple;
	bh=C285iP4Cplh42LKKsJRAF1aHabam+qC5NG6DnP+8s1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkCul/9O0cGzfoNV2yl97ZvrParyW3+nT13ggDzjIVPkTc50gKwjQOkvQQ05xpExUST1n8woKjZRUugJXI77VhJl6TE2rKDTx9UgZ6TTIu+roJk60i2SLvgDHxTYAeYp9fXZAwwelYzN6TFBKAbzD+JtoIV97pEcCVPNOoXSlCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEHWxCgG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEHWxCgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711906056; x=1743442056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C285iP4Cplh42LKKsJRAF1aHabam+qC5NG6DnP+8s1s=;
  b=hEHWxCgG01AAvuH1pq9/yBVfDtmlBWtSFfe5i7fcU0zqM12NYn2nakuR
   RYvaNjvtfG2yI0e9P73dJ0HY6aKB6yjBiM1wKKlpQX8AQbRaVF/O6GCk6
   F4LK1PfRx8sP6L7KUOZ4Gh5+RGlbwWW0vBApUm8Ot7brvjjnEUXrT9Ehe
   J1ar2NuVBtff1hyAl8OcY+o4cPoFOeScF2t0+rx7U8+hElI1wd+QrpON9
   qHefw80hAN7JDnAle8Fin9976P9+EZ7+xlKo/hNOBQ99uITn7owlzw9hB
   sMjGvvVqvtx5FptGAmAoBSdVzWBcj8yKBSMx5Ag626rzbQAN+WhiiYS5g
   w==;
X-CSE-ConnectionGUID: NuGelGOsR1W7hKxzmM52KQ==
X-CSE-MsgGUID: n06X24UYQd2InjyObGojIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="17659765"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17659765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 10:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="17477117"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2024 10:27:34 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqyxv-0001Ie-1B;
	Sun, 31 Mar 2024 17:27:31 +0000
Date: Mon, 1 Apr 2024 01:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3673/30000] kismet: WARNING: unmet direct
 dependencies detected for PCI_IOV when selected by CRYPTO_DEV_HISI_MIGRATION
Message-ID: <202404010117.12KkS4bP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   737efe73dd2ca6ee503ba26e6fc3ee41bd8cf633
commit: a0464f0b70f9b8d2242f89509f423dafe99ab9cd [3673/30000] vfio/hisilicon: add acc live migration driver
config: arm64-kismet-CONFIG_PCI_IOV-CONFIG_CRYPTO_DEV_HISI_MIGRATION-0-0 (https://download.01.org/0day-ci/archive/20240401/202404010117.12KkS4bP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404010117.12KkS4bP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010117.12KkS4bP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCI_IOV when selected by CRYPTO_DEV_HISI_MIGRATION
   
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]
   
   WARNING: unmet direct dependencies detected for PCI_IOV
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_MIGRATION [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
