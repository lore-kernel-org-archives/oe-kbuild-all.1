Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF3745F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710438283; cv=none; b=dW2U0WSChB1dJ2WtQt4U1ycM/TwVvQh5hHwLyOp7D+IwOsBSj0gEmvxxG7TXpOpQyyDjnOl5/RoDw4VPLz7XV6t5cyEZdKtUcZxqR7Zs8SVDzqY64c1iwFpiqThdsr9FCo/pwQ3Q+JDS2XxjCJnb7jY3lDGnXxX4aEPvFuOMxzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710438283; c=relaxed/simple;
	bh=8fG0024ATNo2KXNW1AayLOu5sZFGfZrmDoOM1g5rVgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQexBaFOwrJIBPurzAt4nnW1g+8VNo0Ck/Lbt4vEKD4n/DUzN/Gr8nAwR6YXseh+OJht3P+9za8dTSaiiVjKicS1XM/1h8jmJTnJwPP8gSO3gum+5y70vZCHNotxvOeptydS2C6VIGkspmBBJKkh59wVJbhvqTYYI0dVY/V+vyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGolGEUD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGolGEUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710438280; x=1741974280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fG0024ATNo2KXNW1AayLOu5sZFGfZrmDoOM1g5rVgQ=;
  b=ZGolGEUDwa27T7pDYROU1hRVhkHy3pmLziHoej3uXdFw/Av5oj3YrAkD
   oTsQHNWPG6lTqW0P1Stp96DHhYR1dN1CVljw8AhizfslcSFH8DNVaDXod
   yC0TJ1hLMQyL7PrAZlXnVu7Dt1i+pKS/nSjVgqPxHQgvLEGu/1JY5EkBj
   IaSGEqIQMWAkg8xt/FlKQD419YRHpLbMAG3HtL+bqiRiig1kQHBHSwYyC
   wR5b1OuA5eA4mIh+mY2cPgv0YZkdxT6n3JXKaqym9WLyC5/xI8Vj48ssE
   CCgW+LeI5pvtqlLioI2ep2hevCVGV/LSZ21axsc5Mx1sq7CT0moGO0ouk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5133493"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5133493"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 10:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="12446705"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Mar 2024 10:44:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkp88-000Dgh-1F;
	Thu, 14 Mar 2024 17:44:36 +0000
Date: Fri, 15 Mar 2024 01:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiantao Xiao <xiaojiantao1@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21695/30000] drivers/ptp/ptp_hisi.c:731:36:
 warning: unused variable 'hisi_ptp_acpi_match'
Message-ID: <202403150118.n2U1zcxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9e82708a746dc5d4ec8995a3e6edace2cf23c6fd
commit: c64545e1e5fa4e09603149e918f306562a22a60a [21695/30000] net: hns3: add support for Hisilicon ptp sync device
config: x86_64-buildonly-randconfig-003-20240314 (https://download.01.org/0day-ci/archive/20240315/202403150118.n2U1zcxF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150118.n2U1zcxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150118.n2U1zcxF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_hisi.c:731:36: warning: unused variable 'hisi_ptp_acpi_match' [-Wunused-const-variable]
     731 | static const struct acpi_device_id hisi_ptp_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


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
