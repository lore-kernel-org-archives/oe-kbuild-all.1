Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBE4138E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707019547; cv=none; b=VkwiWM8cTqHmmB0gzYPJO+U1gcwOd0eO5lojzMr8VCams+scgfFqYRgPTgwFRKt2ZhRC7dyQCY+uBv6Q12CHbmVj+G5MUzW/oV1M5RT6ulChDgizYMh9mtx6q/764l4nvclJ4p4QumYJWprkICeoHN34bWZN2r8g7p9SJ/Sck1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707019547; c=relaxed/simple;
	bh=b9XEpdFPe/PNZC2HYAEQHdLzNXB1WRKccHhHm8G9vkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USZ6rGCAR9Sim5Kc0JNuBSvqIIVCeKSjo3qKgSIp6Z7UbVkFE17YOMZrAOFhciEmOn1RsNSf9NJe/stoXipr4nA3Gkuq0Ij7vt9IwwRRj8DWAJTS45zNobFgqIMDpKDHwFSZowD2x3RWZHoTqDW/zXQ7T9/RAJmxx/+G5QW7SGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQBK8PZn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQBK8PZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707019545; x=1738555545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b9XEpdFPe/PNZC2HYAEQHdLzNXB1WRKccHhHm8G9vkE=;
  b=HQBK8PZna6xox6v0dUVOxGyGFoz2P6TXEEhjvPBk2lOJJbeMrGrKHeaw
   4Ys4xq4a8sf0Yayl55N61xxFGjYJNHKD7xA4wXGfmd8kMSKVdbeRL6992
   /5VUlmfM4eEiG7YFj46N4qiC7cPq5SLjTGLco4DBN0+kpXJYXj95hHYZJ
   HysB6hPe6Rm9toxoNiNq5p+Nxo00AOijnqC/CiSihycfHaHo/z6JFXJ2m
   eatIc+Sr+WwJtbBdVYDO3edVtTg6r/O8Knut3jLue0HN5SgvJlown+K59
   JMKFqYUHVWOqFZeCjWDjUYhVhhVWlvt/tSPIrHVASmvc59HfenDMKHULv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11727316"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11727316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 20:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="480284"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2024 20:05:42 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWTlD-0005zq-0O;
	Sun, 04 Feb 2024 04:05:39 +0000
Date: Sun, 4 Feb 2024 12:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/5] firmware: imx: support BBM module
Message-ID: <202402041140.l2qPp6Gn-lkp@intel.com>
References: <20240202-imx95-bbm-misc-v1-4-3cb743020933@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202-imx95-bbm-misc-v1-4-3cb743020933@nxp.com>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 51b70ff55ed88edd19b080a524063446bcc34b62]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/dt-bindings-firmware-add-i-MX-SCMI-Extension-protocol/20240202-143439
base:   51b70ff55ed88edd19b080a524063446bcc34b62
patch link:    https://lore.kernel.org/r/20240202-imx95-bbm-misc-v1-4-3cb743020933%40nxp.com
patch subject: [PATCH 4/5] firmware: imx: support BBM module
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240204/202402041140.l2qPp6Gn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041140.l2qPp6Gn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041140.l2qPp6Gn-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/firmware/imx/sm-bbm.o: in function `scmi_imx_bbm_probe':
>> sm-bbm.c:(.text+0xbdc): undefined reference to `devm_rtc_allocate_device'
>> s390-linux-ld: sm-bbm.c:(.text+0xc90): undefined reference to `__devm_rtc_register_device'
   s390-linux-ld: drivers/firmware/imx/sm-bbm.o: in function `scmi_imx_bbm_notifier':
>> sm-bbm.c:(.text+0xeb6): undefined reference to `rtc_update_irq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
