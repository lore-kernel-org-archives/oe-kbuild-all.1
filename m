Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA5212BF24
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 06:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727851021; cv=none; b=o5mHKGU1JfC8fuwkhJGJupaKy9YkdBJL+3OHcmuYM0NJaKvK9OxWgyL7Y8ID783lA0YbxFdEMdUeQekTJwJOIAvOxTk8svk+AEk/GkIiQ47RSjXy9KczvdkggHz5f8v39+YuhYOyumhdXVXctJwEOegQR2+TV7sUV3Tvex3/nKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727851021; c=relaxed/simple;
	bh=PCH811RJ++Msg4LWUdwjVKWuhE8W8nrq4fshizr2nPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bd5P5l7vtyfh0lNRWIYFvqJ4ltF6pCIjOMkE98NZioq2lewp6lXtR09pGt3PNamfU7Ogin/2FhZjU1f8Nj+nVgye3lrelpuNCqunUbqJLbIjySwnCEjoK/J2t7iJZM2dYFhsyksYDc/D34/dYXbdg+8ngjug9Gzi/8G58VB3Qzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dzc3Auxy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dzc3Auxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727851019; x=1759387019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCH811RJ++Msg4LWUdwjVKWuhE8W8nrq4fshizr2nPo=;
  b=Dzc3AuxynbSl0/gdEPJagKdXq8rBdUmeqrPidTvh880psOfKNla4GgTD
   DHOL4itWokJhDABqou+SYFSSGGEkRkN1UvGbKQmhXhyQb95hQjK5AOlNA
   /VeAY5bdjAYKK2iIAKBAPGXpPGxbQd0GcafXoYwOP9avh8WHiJ9z7+jCh
   YhDNyrAUxc7qP8XLkAq3LWMrGOxI2xJLRP9Z/s20hd9a6b4zSM1pe4CNE
   HRunFKxCuRrHRbKU0zi4s4J2LLAuRpyrU0k5Mbif3S+kxBvoRwdTAW7d0
   P7kwVeYkZZkmTwGI8gDPCnRACoQmfQOUoO4Ll1R86b4hkhXFPFP66ywjb
   w==;
X-CSE-ConnectionGUID: 0eMUgmFNQOyNnlE8bpR8Fw==
X-CSE-MsgGUID: oW5yeH/GQw6n1VLll/xrXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14631780"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="14631780"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 23:36:58 -0700
X-CSE-ConnectionGUID: 14Q376ozRUSFEsfo4VDc7g==
X-CSE-MsgGUID: 2eK/+ER/R12QGBrt6MAQ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73896578"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2024 23:36:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svsyk-000RdH-2F;
	Wed, 02 Oct 2024 06:36:54 +0000
Date: Wed, 2 Oct 2024 14:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Francois Bortolotti <jeff@borto.fr>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/120-spmi 1/4]
 drivers/spmi/spmi-apple-controller.c:214:3-8: No need to set .owner here.
 The core will do it.
Message-ID: <202410021415.196dOlPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/120-spmi
head:   0e7bd6f1c359d469704dae286e446cb6ec3c4876
commit: 542dad1563a5c96bc2295ede9886014ff20abe63 [1/4] spmi: add a first basic spmi driver for Apple SoC
config: alpha-randconfig-r053-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021415.196dOlPA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021415.196dOlPA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spmi/spmi-apple-controller.c:214:3-8: No need to set .owner here. The core will do it.

vim +214 drivers/spmi/spmi-apple-controller.c

   208	
   209	static struct platform_driver spmi_controller_driver = {
   210		.probe		= spmi_controller_probe,
   211		.remove		= spmi_del_controller,
   212		.driver		= {
   213			.name	= "apple-spmi",
 > 214			.owner	= THIS_MODULE,
   215			.of_match_table = spmi_controller_match_table,
   216		},
   217	};
   218	module_platform_driver(spmi_controller_driver);
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
