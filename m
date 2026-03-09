Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D636894A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095274; cv=none; b=VUMr9FwheVqGc0iR9w4U4UeRJ97Zv2eSS2i3V979J/CF/XPBKGFvTkCSCRAFSOeZ3PffokuoC2r+6dPhsVMC0ssE+kSAKMmF/4mFDyYfefMoEP+Ukq2aZf8Ak3HbxQFbCfXazC5D6dHKnAYNoqViTEr/zd6eY0DgxHRFxKBJCHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095274; c=relaxed/simple;
	bh=SeFI68hOQ+Hno9j67R7i+Kg/IXRLeVuczTVHTEBBTt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxRk4qB/TY3lPtLd9AQGOGBhTBrfrPIZ3IR5woIW9F4NqxGwNzlTHYHEmusTyivMl1W3RfHgxJ19VzXhgZYL4txGhYnm8YXhgXQNUANwcOSRtYRsflOOJ7WUyd/cBNZu8ZzxYT8gFm1MNSXrISO2vK/t8ulQSu4mRDM7YU1ktnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALQJ/E9S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALQJ/E9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773095273; x=1804631273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SeFI68hOQ+Hno9j67R7i+Kg/IXRLeVuczTVHTEBBTt4=;
  b=ALQJ/E9SZZ6loQ5SaOxmITlDkUnbTHPvnesrLC+925sq0MhBQuD//FUn
   kpQUPgO+NXl3suSgpke4N7/DUkZKwY5/9GMp7Xl9l2kH6M//kA6HwnQip
   alztG5mzxhM8CKwgNsi0kbDFLdU9LOKMBEoePQOWGj9UGsNPPk6rJXeNj
   XTGvBCSwl/4p8AULRg08z/3fWiF/vvsd73oI8nWdGZogKQQGwxkOh2uyi
   SFI8mwK4oPvdMpUn/6aYV8eu/rA+73lLEjdrX7qgae3dHGq1fWDPRzVJZ
   mkasT2ONBbyLYyCpgPbhQq/m0VR9CmwUmosv7Mm9D8ikIfyyAKJW7C4z1
   Q==;
X-CSE-ConnectionGUID: eKUasRK/R8yjz7PygCv/8Q==
X-CSE-MsgGUID: kI3mbpGTTWKTueelv9+QKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73331916"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73331916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 15:27:52 -0700
X-CSE-ConnectionGUID: JHK93R8NTPKNrBjXYqD6mw==
X-CSE-MsgGUID: 1FGyWe8rRiSQWFFglb3Q1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224594777"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2026 15:27:48 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzj4j-000000000uO-11Ix;
	Mon, 09 Mar 2026 22:27:45 +0000
Date: Tue, 10 Mar 2026 06:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Pet.Weng@ite.com.tw,
	Kenneth.Hung@ite.com.tw, Hermes Wu <Hermes.Wu@ite.com.tw>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI
 bridge driver
Message-ID: <202603100655.k9Q6otfR-lkp@intel.com>
References: <20260309-upstream-6162-v2-2-debdb6c88030@ite.com.tw>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-upstream-6162-v2-2-debdb6c88030@ite.com.tw>

Hi Hermes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2622649ad6cdbb3e77bfafc8c0fe686090b77f70]

url:    https://github.com/intel-lab-lkp/linux/commits/Hermes-Wu-via-B4-Relay/dt-bindings-display-bridge-Add-ITE-IT6162-MIPI-DSI-to-HDMI-bridge/20260309-174457
base:   2622649ad6cdbb3e77bfafc8c0fe686090b77f70
patch link:    https://lore.kernel.org/r/20260309-upstream-6162-v2-2-debdb6c88030%40ite.com.tw
patch subject: [PATCH v2 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge driver
config: xtensa-randconfig-r053-20260310 (https://download.01.org/0day-ci/archive/20260310/202603100655.k9Q6otfR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100655.k9Q6otfR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/ite-it6162.c:861:36-41: WARNING: conversion to bool not needed here

vim +861 drivers/gpu/drm/bridge/ite-it6162.c

   846	
   847	static bool it6162_wait_mcu_ready(struct it6162 *it6162)
   848	{
   849		struct device *dev = &it6162->it6162_i2c->dev;
   850		unsigned int status;
   851		int val;
   852	
   853		status = readx_poll_timeout(it6162_wait_ready_event,
   854					    it6162,
   855					    val,
   856					    val == EVENT_READY,
   857					    100 * 1000,
   858					    1500 * 1000);
   859	
   860		dev_dbg(dev, "%s status %d val %x", __func__, status, val);
 > 861		return val == EVENT_READY ? true : false;
   862	}
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
