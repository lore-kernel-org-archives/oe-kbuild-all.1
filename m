Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639534;
	b=yJp1wIwWjJwhiSnUpEp6OM4DEnv/U4otbaTXzj4y1NqrgBNO00CrI+F/Hbtk2+IrIyXz
	 nDJq4CXJN8bAqVyAzV6qnTsrWx6UncUjDIgD4k52zVOLsZscWDuDpBK1ULQgeo8hTQM8u
	 kW/KJUwBS9KZdSxF3ZEK2eh1GIX2J09b3iGRXqfQ7WXNRJMInt/euDYQL/dUd8LtX3Gxj
	 VS9mxmWTCzPH8wevrWYMr+vgGgkRpIs+wuaMz5uht9xr7rVca2wL8AjXHiBoRFg3xNVyG
	 DN/pCDHbdTt9mdpKJ27pqR1JxgiIHV2KJV0pVlvrh9Oa+jBIoq0Gs7LM+zUCDYoDTZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639534;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gGtfxxma1zI4821arV9TSd86IzWQZ0fhdWmGaIEaE34=;
	b=lzrwflWERaC4uESBJIlSznCX6ajLQhpZYZX/JHtbaRHy7eTJgdtqIynKUL8wjb39XW3p
	 N+oqRFoCutrpTIAiig6cVJ86gQ3aDAB00yWq3WDXrN8LProWo/lCt1Sf2XEU4FGCF/TEn
	 u7NIimlruf+s8SqHIIHAT2GG/NWO8hWsZ7rQFVaAE8LzRlk2uzCVj8wyaXH6UjBKlLiJJ
	 dFczdei3B7+kadz4PJYSIUSRKVAKJv+xEMa92IaRhwVs2vqTBWppJTd9ZcpLujwVmL1JO
	 dp8rP37hEwLU1gH8XY74GbCon2cxI3MFb04A9dd4sIWBHVVTQJOZAf2ZIp77ipV6JRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XPl8jBf0;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471A606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 20:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4471A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XPl8jBf0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795639533; x=1827175533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DDYfQHdtuskPOHyvF0sDLhY+eNSMxNJm9s9Wv0Gvkb0=;
  b=XPl8jBf0XdM2blCuk5aXFTGJ+0hGZxqBGFTCPcW8t+vo5mkcyGYNTl4B
   AlFxfBJMULrw6u8lMzvz6r6uYkvGbV9+0f4aQTJ4QWz4wtZtrks53iLt9
   5PV2MCKHKayz3KU/U1W4UzzJj3cQrW7SVJYQHmWI2lhVrwSG+Zd43TrVA
   mFTZjmTdZp4AnezDvQ7RU5ysStaDXNXWFjBvSxQI3IitdDDEl4TnDm2kd
   TDK3tvKNnP1W9llJ4LuUgwimVwyCZB/SCUiAcCQwOzloajU1aNA1aiUEm
   Cbf+G9artbpnWzmoGSgx1YbGlF9u+a4URB10sxEZ5Uig2b+tzUGDsFKit
   Q==;
X-CSE-ConnectionGUID: Ir1u/aPwTFmqLTytNq4m+g==
X-CSE-MsgGUID: yxXd3R3rS3ClDUt4XAzgYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4436536"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4436536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:45:32 -0800
X-CSE-ConnectionGUID: 7+lboQ4kQ928y4DBpv+sgw==
X-CSE-MsgGUID: 4ieOVeXpQs6jd5cS2pjbrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12253478"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2026 12:45:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWJrr-00000001Sag-1y2S;
	Wed, 25 Nov 2026 20:45:27 +0000
Date: Thu, 26 Nov 2026 04:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] spmi: Drop struct spmi_device_id
Message-ID: <20261126044125.DtFzBYQ9-lkp@intel.com>
References: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125112158.938835-2-u.kleine-koenig@baylibre.com>

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3dd8c790a7b7027abdd568e36db5e82ffaea7c77]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/spmi-Drop-struct-spmi_device_id/20261125-122152
base:   3dd8c790a7b7027abdd568e36db5e82ffaea7c77
patch link:    https://lore.kernel.org/r/20261125112158.938835-2-u.kleine-koenig%40baylibre.com
patch subject: [PATCH v1] spmi: Drop struct spmi_device_id
config: nios2-randconfig-1000-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126044125.DtFzBYQ9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126044125.DtFzBYQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126044125.DtFzBYQ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spmi/spmi.c: In function 'spmi_device_match':
>> drivers/spmi/spmi.c:68:32: error: 'SPMI_NAME_SIZE' undeclared (first use in this function); did you mean 'SPI_NAME_SIZE'?
      68 |                                SPMI_NAME_SIZE) == 0;
         |                                ^~~~~~~~~~~~~~
         |                                SPI_NAME_SIZE
   drivers/spmi/spmi.c:68:32: note: each undeclared identifier is reported only once for each function it appears in


vim +68 drivers/spmi/spmi.c

5a86bf343976b9c Kenneth Heitke     2014-02-12  60  
d69d804845985c2 Greg Kroah-Hartman 2024-07-01  61  static int spmi_device_match(struct device *dev, const struct device_driver *drv)
5a86bf343976b9c Kenneth Heitke     2014-02-12  62  {
5a86bf343976b9c Kenneth Heitke     2014-02-12  63  	if (of_driver_match_device(dev, drv))
5a86bf343976b9c Kenneth Heitke     2014-02-12  64  		return 1;
5a86bf343976b9c Kenneth Heitke     2014-02-12  65  
5a86bf343976b9c Kenneth Heitke     2014-02-12  66  	if (drv->name)
5a86bf343976b9c Kenneth Heitke     2014-02-12  67  		return strncmp(dev_name(dev), drv->name,
5a86bf343976b9c Kenneth Heitke     2014-02-12 @68  			       SPMI_NAME_SIZE) == 0;
5a86bf343976b9c Kenneth Heitke     2014-02-12  69  
5a86bf343976b9c Kenneth Heitke     2014-02-12  70  	return 0;
5a86bf343976b9c Kenneth Heitke     2014-02-12  71  }
5a86bf343976b9c Kenneth Heitke     2014-02-12  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
