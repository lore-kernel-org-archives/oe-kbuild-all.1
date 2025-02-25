Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAFE1FDD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740468523; cv=none; b=WLla1J6bAtpTrb5YdhQbmzM65dtMk0yI3hC3jXz1HssprTSYnLfKiups6Mh/sCLzQN/Tei2dG4wv+ofnbqJ9a+7XONpHGPZL2mAhSD9f9t9w/hpsVcmUlM7PWnVyMobDff5/20U3RkI4MEUIuFPHhvihk8SbQiyJDKY1WAnUaEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740468523; c=relaxed/simple;
	bh=rgWokTZOdbsjtOXQMM0Q4idqEfwo/dXeTxcwldzJKrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIeKex4C31pqa2BBglY6/NNJ+ly/j5sRsAIlJF9/5A9+4WQ0pC5QsjjMo9LP1hLRwtw7l94qjXb3Lr9kdOWtO9B00ZFq/HrcJOHM1ybTGmWGBKNRH7xOs1c2QvWxqOzgSoWWMPeUmRxYa2sZ7pp63Ra07JkRKrvsqJfWh0Sks4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDOrmiN1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDOrmiN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740468522; x=1772004522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgWokTZOdbsjtOXQMM0Q4idqEfwo/dXeTxcwldzJKrc=;
  b=IDOrmiN1vh9UImxChlgjJnnqD+9UcsJ+y6Jg6EI3B2QQLBDbLDv9Xx3r
   7cjMA6l8fPnnr6dlh32HiocSLW1St+ahNzL1ypKOULJ0u8sGiT/RLNL4M
   Ahs01WtOSd5HBN8GQHKjjmGynarIth4YqrDGUfTAc5xbEvqh4FkZfcVCC
   ci/XgoSkygO2KuxGDGuvINc6/yxQqbYhNChGkOR2+N8h8w/6YlNgeiV9/
   5gAzmgyzYC/Nsk5a4lIvgyznC45LEHUAXq4BNovuuEUfcdrVMLeAGIqYG
   /OE6B9UGXU0uhFqbvyEGTVzlXrI+1ipOlrXE1XfBDAr/Sltksfdj7fD7+
   g==;
X-CSE-ConnectionGUID: XAWT3ZReQhCsfit88c6ZlQ==
X-CSE-MsgGUID: vbSd/ondTgWPCEC5a4NroQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52258320"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="52258320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:28:42 -0800
X-CSE-ConnectionGUID: BFFT8DP0Qd28LxMDIcFKhA==
X-CSE-MsgGUID: vU6TOpTzRt+hbFBcgH0DVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116793742"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2025 23:28:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmpMd-0009t9-27;
	Tue, 25 Feb 2025 07:28:28 +0000
Date: Tue, 25 Feb 2025 15:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Wagner, Steffen" <steffen.wagner@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
	Mohit Sinha <mohit.sinha@intel.com>,
	"B, Jayachandran" <jayachandran.b@intel.com>,
	"Shaik, Kareem M" <kareem.m.shaik@intel.com>,
	"Koul, Vinod" <vinod.koul@intel.com>
Subject: [intel-lts:pr/59 1/1] sound/soc/codecs/tdf8532.c:355:5: warning:
 "CONFIG_ACPI" is not defined, evaluates to 0
Message-ID: <202502251551.jPcvNvaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 581931b4a2f278b8f5f8079248436f4cbf0dc3df [1/1] ASoC: tdf8532: NXP TDF8532 audio class-D amplifier driver
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250225/202502251551.jPcvNvaP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251551.jPcvNvaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251551.jPcvNvaP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tdf8532.c:355:5: warning: "CONFIG_ACPI" is not defined, evaluates to 0 [-Wundef]
    #if CONFIG_ACPI
        ^~~~~~~~~~~


vim +/CONFIG_ACPI +355 sound/soc/codecs/tdf8532.c

   354	
 > 355	#if CONFIG_ACPI
   356	static const struct acpi_device_id tdf8532_acpi_match[] = {
   357		{"INT34C3", 0},
   358		{},
   359	};
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
