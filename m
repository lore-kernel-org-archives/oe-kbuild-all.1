Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A32701DA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762467545; cv=none; b=c8DUKXN6OGuSGB5YYsVdDm0f7G1LMSXwlWCfUbV/33qHgv2YD9QHEe8cVr6lHr9jWbG3MKDLe/iRN0OTPCqgdL8u9VShGzJgipAIpeYvHYB5uJQICSTHMfqai/bRmIbJLeUSmrHCuyOgAJGoQZ2DxR4W4+/kZaclMO9YY03gMZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762467545; c=relaxed/simple;
	bh=ku2NGfimp72vXCQLrT9QSjrzqIzlPkhz0qCVVu/Kt4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e62dD5dN38DMGn7RDMGCiccUZZlSob7zsP2zrB7ybwhMI+kyCwhWvh2M1oYWCwiXQsC39FfuCD0xG7KB03VwVlJHZovu5Wg4qERcAG4AXoYJWTCmhnXpLDTKBUp83IcyMr4RznlQw2ANUhnCaVBIV7Z2ovhDQhjsZFpZzLUTYTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mj43yD1B; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mj43yD1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762467543; x=1794003543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ku2NGfimp72vXCQLrT9QSjrzqIzlPkhz0qCVVu/Kt4k=;
  b=Mj43yD1BPX9tVaUD1YvdHa3jihuu8543AJnzLOkITXgI2gWQPhptcchf
   h7AYXBH18fJId/I3EfsFGIuR1ckG6U2THJuo7fuxWxxkHpy4abjC+nvRq
   hhcjyDWc2edYjj6sSUe0Wnd++he2aHZrO7NKWOreKqBAc5vMeF/Zk3xyv
   rEgCAOYQBQaki48zYFXYIwq3mDe06+4A/+z5RMMCbwQx4trUBKbH4iXFt
   AOVGyOP+p3AUx/q1jfQPniauQZF4j9Ftzd2rE1J5yylQvlPTHrlB9W9F5
   jTRAv8EmeJuEOmHebSskPg/iIIyOMaxhl4WaQBI5q1+s7WtaxvYbDX529
   A==;
X-CSE-ConnectionGUID: QLo502VPTDezSg5Pis9sXA==
X-CSE-MsgGUID: m0Z+yuEMTj6a8piPa5JAkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75306862"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="75306862"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 14:19:03 -0800
X-CSE-ConnectionGUID: lBzv9szdR2OCNKtzHh4Iog==
X-CSE-MsgGUID: ZiLLDryOQ86qbAA/p2vl1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="211327684"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2025 14:18:59 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH8JX-000UOa-03;
	Thu, 06 Nov 2025 22:18:49 +0000
Date: Fri, 7 Nov 2025 06:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Davis <afd@ti.com>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	"Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling
 for TPS65214
Message-ID: <202511070607.Il9q9meO-lkp@intel.com>
References: <20251106-fix_tps65219-v2-1-a7d608c4272f@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-fix_tps65219-v2-1-a7d608c4272f@bootlin.com>

Hi Kory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1c353dc8d962de652bc7ad2ba2e63f553331391c]

url:    https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent-TI-com/mfd-tps65219-Implement-LOCK-register-handling-for-TPS65214/20251106-185551
base:   1c353dc8d962de652bc7ad2ba2e63f553331391c
patch link:    https://lore.kernel.org/r/20251106-fix_tps65219-v2-1-a7d608c4272f%40bootlin.com
patch subject: [PATCH v2 1/2] mfd: tps65219: Implement LOCK register handling for TPS65214
config: i386-buildonly-randconfig-003-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070607.Il9q9meO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070607.Il9q9meO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/tps65219.c: In function 'tps65214_reg_write':
>> drivers/mfd/tps65219.c:479:26: warning: variable 'tps' set but not used [-Wunused-but-set-variable]
     479 |         struct tps65219 *tps;
         |                          ^~~


vim +/tps +479 drivers/mfd/tps65219.c

   475	
   476	static int tps65214_reg_write(void *context, unsigned int reg, unsigned int val)
   477	{
   478		struct i2c_client *i2c = context;
 > 479		struct tps65219 *tps;
   480		int ret;
   481	
   482		if (val > 0xff || reg > 0xff)
   483			return -EINVAL;
   484	
   485		tps = i2c_get_clientdata(i2c);
   486		ret = i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK,
   487						TPS65214_LOCK_ACCESS_CMD);
   488		if (ret)
   489			return ret;
   490	
   491		ret = i2c_smbus_write_byte_data(i2c, reg, val);
   492		if (ret)
   493			return ret;
   494	
   495		return i2c_smbus_write_byte_data(i2c, TPS65214_REG_LOCK, 0);
   496	}
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
