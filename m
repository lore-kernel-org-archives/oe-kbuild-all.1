Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C863191B2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 06:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175643; cv=none; b=MharTTPCnnvwM0pWRSrSjIpOcCpIZ56NlNxHhy2lJoJ5n3FgSJhBKUR5jvMIXuMSy/WqciMRGlnQJ7kxEwUl66drrX7xoJ/LRqUBUMHHwz2nHWyf7iCOKQJcxqrkjTwWYn3szreDi+bLrFze7kNul50PKUFKCOrG5bN+mvJLSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175643; c=relaxed/simple;
	bh=Du46Ge7JlG+mDpklweo5bapKvtXMmNT3uesvSlvY5/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=du9DlOZdO2oIchjc+jaJRrQW6yTZoGirlghIdELU+sMmulhDD6IVcdU+k63jJR6IyisZPKvWCyFt1WV1zNSGTqnyRL+3fFRdBnyZqkSe3YFGdBNolgKVhgFcMG1AmMl5wbNY9Jy4aSHwJOMWE+/OLR3+HyR4IBnaHGZ0N6gMkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j52sJqy/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j52sJqy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765175642; x=1796711642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Du46Ge7JlG+mDpklweo5bapKvtXMmNT3uesvSlvY5/I=;
  b=j52sJqy/Wd27U1PbIGnY+ODF0U2+1xdpkrfh3NcVd0E4uKK4WB49/yZv
   R3yTtlFXXSwv/IHx1g6MQR5yc85aNmJPIEU0BY46t/PGA06WOi5lTJ71S
   9ffZGY1vkFqUvdr2nWckJ0ToC5fUKZjDrCOxZopbhZBH34Pye2GsDX8EE
   6wfgEtvqmGvMnijaoY3qHLBUR+wUHSRIW9WmOK2cvb/S7WXM9dLESNCpE
   VhgLhd/GoSXYjN4NR6RVRq6YuyUcYMggiOIes88y4WEmBiNuBb+AiNsi7
   gSNajiSr9R2hNUDuefTo2GCqU+xDOXrn1V8vcrLd5x/CDx8LWfjEOl0i8
   Q==;
X-CSE-ConnectionGUID: fgWNYzXrRGWedoFrDil3HQ==
X-CSE-MsgGUID: oQgtHDb0T0uR9eGUK33eaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="54655688"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="54655688"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 22:34:01 -0800
X-CSE-ConnectionGUID: QZYxZmiSSvGHWjkFE2773A==
X-CSE-MsgGUID: Mc1KJHRyRICzpw0JDhubKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200985516"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Dec 2025 22:34:00 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSUon-00000000K2U-42AO;
	Mon, 08 Dec 2025 06:33:57 +0000
Date: Mon, 8 Dec 2025 14:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3485/3485]
 drivers/media/v4l2-core/v4l2-subdev.c:2253:17: error: implicit declaration
 of function 'v4l2_subdev_get_locked_active_state'
Message-ID: <202512081445.4S7Y9xWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   79aa4f2e99baed837a6933aa6b1a852197d30b91
commit: c1be6d998806425f28600e867a8e9a2dd9bac741 [3485/3485] media: subdev: Add v4l2_subdev_is_streaming()
config: x86_64-randconfig-003-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081445.4S7Y9xWG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081445.4S7Y9xWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081445.4S7Y9xWG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_is_streaming':
>> drivers/media/v4l2-core/v4l2-subdev.c:2253:17: error: implicit declaration of function 'v4l2_subdev_get_locked_active_state' [-Wimplicit-function-declaration]
    2253 |         state = v4l2_subdev_get_locked_active_state(sd);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:2253:15: error: assignment to 'struct v4l2_subdev_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2253 |         state = v4l2_subdev_get_locked_active_state(sd);
         |               ^


vim +/v4l2_subdev_get_locked_active_state +2253 drivers/media/v4l2-core/v4l2-subdev.c

  2242	
  2243	bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd)
  2244	{
  2245		struct v4l2_subdev_state *state;
  2246	
  2247		if (!v4l2_subdev_has_op(sd, pad, enable_streams))
  2248			return sd->s_stream_enabled;
  2249	
  2250		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
  2251			return !!sd->enabled_pads;
  2252	
> 2253		state = v4l2_subdev_get_locked_active_state(sd);
  2254	
  2255		for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
  2256			const struct v4l2_subdev_stream_config *cfg;
  2257	
  2258			cfg = &state->stream_configs.configs[i];
  2259	
  2260			if (cfg->enabled)
  2261				return true;
  2262		}
  2263	
  2264		return false;
  2265	}
  2266	EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
  2267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
