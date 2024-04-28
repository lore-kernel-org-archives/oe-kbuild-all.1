Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C9510E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 02:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714270025; cv=none; b=plX014GSKmG0MOnCfxK9BVnNNzSQ0DcJFPd42NGtOMkWMDAySHu1Q7yGXYE+C3RzWe9BKY7hqtKJf8z4WxqbeOro9Vov2fw/pYAD3MsgNlq09pzbPrEoS9Pp3V44eC2za3P6vPD3MgIhfZ+tkb8gY7HtsA8HwnafmyWHMO2PyIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714270025; c=relaxed/simple;
	bh=wtgQV+wLWEh3NvnOGWAHg161ZNzmfoDX02AfgGZG1FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISSOZuXu9LMN4VVFXWIEuQcAkPNyB32LoTLzbtTTXg34nisl1IDLoPwKcf24JVO3iFB6uwr6esAhiU96oJz2xCvqdwZOIt7NayXl6q0GuWX2t1GVsYfp9s3kOa3R44caToESNPtUL9YZ6XpigSvhwRRKI5S7RNsKw20CE7zkzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwrhniMK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwrhniMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714270024; x=1745806024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtgQV+wLWEh3NvnOGWAHg161ZNzmfoDX02AfgGZG1FU=;
  b=iwrhniMKE6J6VjBGMm+Otq5+iYX1et7JtPjOaFuwWJ3B5WLTPXYYiziG
   7rMyMPHfKGHm0VDFr58P0M0T/fPC8RyBEECDU1IsaqmGNoUUjzV/MX8L8
   6qZxb3zwyIs82sWNgFHe94UP9ZXyIiHw0PegiS+A/qPHU505wiqDQnnFt
   9fBgm5oUOipkFiG6ujjf/LVj/cyF6d2adIbedBHeMhLb24DmXGcY53OWh
   UsqymFZi4NwfJ+ES4Et2LmcuRw6k3cZTKMjHN1gv80vhmFtH55Ua5eKVZ
   KDq5yGaiMBGFcOH4zFuVYIi5yhu62SrsmX5CKi+0rkS7GfYtfts25gA2o
   Q==;
X-CSE-ConnectionGUID: mImyS0DnRp22OqqOtKamyw==
X-CSE-MsgGUID: uyvMntrNRmaG6FyqpSAh/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9892021"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="9892021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 19:07:03 -0700
X-CSE-ConnectionGUID: 2OJQnskVQBaxX3LhdW/DcQ==
X-CSE-MsgGUID: wert0OD/TYm+SEVJ+KLDAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30593790"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2024 19:07:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0twR-0005jY-1y;
	Sun, 28 Apr 2024 02:06:59 +0000
Date: Sun, 28 Apr 2024 10:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 164/11728] si476x.c:undefined
 reference to `si476x_core_is_powered_up'
Message-ID: <202404280953.gglHdGxi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 238dd29b01d30596739b1d261273fbae78933351 [164/11728] MLK-10899: ASoC: si476x: add startup/shutdown to powerup/down FM
config: loongarch-randconfig-001-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280953.gglHdGxi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280953.gglHdGxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280953.gglHdGxi-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: sound/soc/codecs/si476x.o: in function `si476x_codec_shutdown':
>> si476x.c:(.text+0x490): undefined reference to `si476x_core_is_powered_up'
   loongarch64-linux-ld: sound/soc/codecs/si476x.o: in function `.L53':
>> si476x.c:(.text+0x4b4): undefined reference to `si476x_core_set_power_state'
   loongarch64-linux-ld: sound/soc/codecs/si476x.o: in function `si476x_codec_startup':
   si476x.c:(.text+0x504): undefined reference to `si476x_core_is_powered_up'
   loongarch64-linux-ld: sound/soc/codecs/si476x.o: in function `.L57':
   si476x.c:(.text+0x534): undefined reference to `si476x_core_set_power_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
