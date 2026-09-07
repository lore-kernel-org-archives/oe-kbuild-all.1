Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61BE3C4172
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 22:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788820983; cv=none; b=u4vrzZ5ccQ0F/63yKcdgYKwhK19GYTpfNdYnVcVAxNNGFipxeWJj//HNLX/Cit+K7q2XTSMNJwGB92WJgZS3fDag9AhWp3Kv+wpA0PX4xbNtCgg8HZxCYID/ZvPAEXLDqO0lPQqzVJv3i+1JOPN1u+UKfqtTqMGw8YpZKw/0AHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788820983; c=relaxed/simple;
	bh=cGGam9Y8jySc13FJuJ5GLgSIm133nHXMyGoqb5zDa2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HQNzoFkR/0Z/EkeA60KxNPhTNFXLjU5nrnDhrktADlrc2N8VheVWpjSPMogxsLqzskDXY+m1u2NBs8XJ4rkYqI7RQV1kuavxzJS+A4gMoxc1IZx8bJFEVrFCo//92VB16NsZWqb+PQddaURAAzx4F6nkRppsn0qriCt9wNp5IM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7kb6IU0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7kb6IU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788820981; x=1820356981;
  h=date:from:to:cc:subject:message-id;
  bh=cGGam9Y8jySc13FJuJ5GLgSIm133nHXMyGoqb5zDa2U=;
  b=h7kb6IU0V2430tYPVRyL3DmY5yCHGLBrH4TN3AtIOWk3RFJvyrOUBMn4
   JDmB2zbsDpimQxk5/5oRR9Tep1tVYgVyJPR/sdlK/WJVPrZ0VERcn98DV
   zDj2HwaivwV62KshsaBjnX5ZRLN6aWZ37TQSa44JOov9P1Amk+61OoAXQ
   k2s656Pdj1yFGHcLc80f0jgKP1BQ2Dc4f8cs9nl2F/1EvIHUjfL61oQNb
   F9ErOcX293SA1dfGMXGTT2zUCmNjX2Rad/66z2Zjtdqud9xMW9XYU8lKK
   f4MlD1wQw0DPCZj/+ALwhoPHccjfyCOK6/97SuDjwjCmuIocEaNS+xBE8
   A==;
X-CSE-ConnectionGUID: zSdeUxA5Qri+mug2dbjWeA==
X-CSE-MsgGUID: UxLl7qWGQn2Yp9QC7Fgw6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100740317"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100740317"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 15:43:00 -0700
X-CSE-ConnectionGUID: xS8PNcGzRBiN7UDUocsP7g==
X-CSE-MsgGUID: PBkp8n4lQ0mMMFI3hnH07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="294285133"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2026 15:42:58 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3i3E-000000000PW-0u6R;
	Mon, 07 Sep 2026 22:42:56 +0000
Date: Tue, 08 Sep 2026 00:41:57 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/i2c/busses/i2c-omap.c:608:24: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202609080003.dbREhhYS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/i2c-omap-Drop-bit-shift-for-I2C-register-addresses/20260904-081245
head:   80bb64593f6862ec848394a6fc7e7946dcb93fe1
commit: 80bb64593f6862ec848394a6fc7e7946dcb93fe1 i2c: omap: Add OMAP_I2C_BUF_{TX,RX}TRSH definitions
date:   24 hours ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609080003.dbREhhYS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080003.dbREhhYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080003.dbREhhYS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-omap.c: In function 'omap_i2c_resize_fifo':
>> drivers/i2c/busses/i2c-omap.c:608:24: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     608 |                 buf |= FIELD_PREP(OMAP_I2C_BUF_RXTRSH, (omap->threshold - 1));
         |                        ^~~~~~~~~~


vim +/FIELD_PREP +608 drivers/i2c/busses/i2c-omap.c

   586	
   587	static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
   588	{
   589		u16		buf;
   590	
   591		if (omap->flags & OMAP_I2C_FLAG_NO_FIFO)
   592			return;
   593	
   594		/*
   595		 * Set up notification threshold based on message size. We're doing
   596		 * this to try and avoid draining feature as much as possible. Whenever
   597		 * we have big messages to transfer (bigger than our total fifo size)
   598		 * then we might use draining feature to transfer the remaining bytes.
   599		 */
   600	
   601		omap->threshold = clamp(size, (u8) 1, omap->fifo_size);
   602	
   603		buf = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
   604	
   605		if (is_rx) {
   606			/* Clear RX Threshold */
   607			buf &= ~OMAP_I2C_BUF_RXTRSH;
 > 608			buf |= FIELD_PREP(OMAP_I2C_BUF_RXTRSH, (omap->threshold - 1));
   609			buf |= OMAP_I2C_BUF_RXFIF_CLR;
   610		} else {
   611			/* Clear TX Threshold */
   612			buf &= ~OMAP_I2C_BUF_TXTRSH;
   613			buf |= FIELD_PREP(OMAP_I2C_BUF_TXTRSH, (omap->threshold - 1));
   614			buf |= OMAP_I2C_BUF_TXFIF_CLR;
   615		}
   616	
   617		omap_i2c_write_reg(omap, OMAP_I2C_BUF_REG, buf);
   618	
   619		if (omap->rev < OMAP_I2C_REV_ON_3630)
   620			omap->b_hw = true; /* Enable hardware fixes */
   621	
   622		/* calculate wakeup latency constraint for MPU */
   623		if (omap->set_mpu_wkup_lat != NULL)
   624			omap->latency = (1000000 * omap->threshold) /
   625				(1000 * omap->speed / 8);
   626	}
   627	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
