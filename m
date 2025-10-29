Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A05F24BD1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 00:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761699551; cv=none; b=oQZ+b4WBpMEI99II3ChHjYT7rdqY87y9GtfWI88w5DNvPkMPcWJ6xCrKfFa8UrLMCHTTQyo06PsGMAdJBNBKU/DA1Vt0qhMqqkqWwC+Z6yyVPeS0F9KMcKQiFkz1iadjdkKXUqdwCXZi4eLl10VNf/GYPspKca5quDGcY0NLIt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761699551; c=relaxed/simple;
	bh=L1fwkKyfGCopimO2KT6ZjVWg4mk91IJv4XRwdhvRqpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSDMxhavz0cK++UjLZO9KWnKpPHmIjkn/0kB77QKFoNEBnaS1OOFPO0CXC+KpnEpvL6CNE1B1BXB9pql2MgnoJET5a9NTqpi0av00QdoP5eAu6fiskekVkOTCrwwfNip/jXkpC2j3h3pLJe4bgkhqFJmzrfmWNDq8lkMXFuiF2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sgr5pU3w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sgr5pU3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761699550; x=1793235550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L1fwkKyfGCopimO2KT6ZjVWg4mk91IJv4XRwdhvRqpk=;
  b=Sgr5pU3w7AAWK8bd/BKnNii5zCc+nM9z3GW0thN9WNoCndXLeTKQ2nj2
   lzmfVsFo6sBgYPC/1YkIR+tCoAXyDSSgz5xX9TwY+MUFOfW3KUAv3UCDC
   CqS2CkEFyXdMyN4w2nPosjcXPQzk24mMx6V/MTT72HhF7ZGDGLCEmC+F5
   pTjJoIcFQ0odsHGW7MnSODseW3YsgoMjIRIh2Lky2/18Y7iE1M29PKd5D
   92VDzoNVB3KtsZKMn3XpGvHjtHzCCRWHhtus4d7Bvj3MfjIy+l6eEbJmj
   LZSbffEjQards8w9ccgdKIRlS7ednBfC1xxkJuyMXrab3dnp/K97mXl6Q
   A==;
X-CSE-ConnectionGUID: DFcDzjDzT5qM+o5vL/ZJCw==
X-CSE-MsgGUID: VlmMwFAuRqOxZ9Nd567Jsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63719919"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63719919"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 17:59:09 -0700
X-CSE-ConnectionGUID: dXL4dUxQTLy/VrcE6UDrBA==
X-CSE-MsgGUID: Y4zkv6KLQZ+6jtEdLHrAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185391143"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2025 17:59:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDuWT-000JyH-23;
	Wed, 29 Oct 2025 00:58:54 +0000
Date: Wed, 29 Oct 2025 08:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 04/13] media: i2c: ov5647: Fix v4l2-compliance failure
 subscribing to events
Message-ID: <202510290816.8EQhDjD8-lkp@intel.com>
References: <20251028-b4-rpi-ov5647-v1-4-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-4-098413454f5e@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/media-i2c-ov5647-Parse-and-register-properties/20251028-153619
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251028-b4-rpi-ov5647-v1-4-098413454f5e%40ideasonboard.com
patch subject: [PATCH 04/13] media: i2c: ov5647: Fix v4l2-compliance failure subscribing to events
config: sparc64-randconfig-r134-20251029 (https://download.01.org/0day-ci/archive/20251029/202510290816.8EQhDjD8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290816.8EQhDjD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290816.8EQhDjD8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ov5647.c:870:10: sparse: sparse: Initializer entry defined twice
   drivers/media/i2c/ov5647.c:876:10: sparse:   also defined here

vim +870 drivers/media/i2c/ov5647.c

3c2472a3c54895 Ramiro Oliveira 2017-03-22  867  
c9a05cece64c60 Jacopo Mondi    2020-11-19  868  /* Subdev core operations registration */
3c2472a3c54895 Ramiro Oliveira 2017-03-22  869  static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
dc3373081396f5 Jacopo Mondi    2020-11-19 @870  	.subscribe_event	= v4l2_ctrl_subdev_subscribe_event,
dc3373081396f5 Jacopo Mondi    2020-11-19  871  	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  872  #ifdef CONFIG_VIDEO_ADV_DEBUG
3c2472a3c54895 Ramiro Oliveira 2017-03-22  873  	.g_register		= ov5647_sensor_get_register,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  874  	.s_register		= ov5647_sensor_set_register,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  875  #endif
d812c6225cf5be David Plowman   2025-10-28  876  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
d812c6225cf5be David Plowman   2025-10-28  877  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
3c2472a3c54895 Ramiro Oliveira 2017-03-22  878  };
3c2472a3c54895 Ramiro Oliveira 2017-03-22  879  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
