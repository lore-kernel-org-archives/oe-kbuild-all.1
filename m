Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650206;
	b=DcD+6q17NA2EmdtbC/fjSZmVwJULgxltTFSAvFaQUmKu2diouYUbFzGM4d4uwyG4yT7u
	 Vxh68yPR8z/77jg4orouL33VkbWaZCaB6e+wEKogz50QA/q+hVry27FGJMKqchPsaAA/O
	 ckpmmjItf/wUCPVHaU8UhLshFK5wmMGY9SWwkgI8/aB/CACN0fxpVh2oOuMY7+VUm/E4q
	 +nct3VpOl4Wv7WBfFRp4j0fo5nv0PjmZCnDBscUaQoKsA8kzCsyrVH45uJYJzG2w36GYw
	 w0COR/ZzklaI2kFnOr1Hp4Q+dLhqtdU7173Edver9CjJo3nyQ7OArzYugmtRh0tn8pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650206;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZxzI4EmU3hFipBzTTLD7GTHi/mK4Y+htODR5RJX8Ung=;
	b=KTkC5In0sB4GcDX6GocqpIJ+9Dd7BZpeSv6cjYhr+9gdSieNFlgBoOW0Eq64zWJprOKV
	 euYsCcM7t2/vWoNRIazEgU5JHHtJW6lmLngMwy9CqX2J62SlhWKqUXs5YAJOfoXSNYV+7
	 epHckDzof7Mi07G8z5U0umsbs1J3S/lQKaqW4gJ8qoUw7L1o6jhvs9Lj4zZCbYRBH/jOj
	 0E3+804BkQXOg6zANQ07PhUHBfO4JBK18P7pNcDs2fVpirFL6clXkbD+AjxuQcg548Yb/
	 kF6oqVRR7jDV0euzsP4aQfZw1WPZxQI8j6E73Ou/lPUAVwsaD+J/DyZ4mRnCh82YLTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n6BOIYQF;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330CB606A327
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 09:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330CB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n6BOIYQF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794650206; x=1826186206;
  h=date:from:to:cc:subject:message-id;
  bh=6aiJz69MTrUGf+23xuYq3IT51fdEUVG1SvUsHSKXV94=;
  b=n6BOIYQFUcVKc/p7JLFzRSq4RNh5lrV7VHavExWWBdl3/E7HLPVPAP4w
   0t/fuelHl9C/0+f3tE8QsHuM/MkMJy3dvEe68od0Iy5C66znfDICyJmKN
   i2dUItn/iksMu5m7RloxXyWD4Vg1KTr3VNAEqKeXJtdRiU1TIrMIRrHf7
   mk66WOHXl/cqe6UZTA5OEZtvx6ZCe/yS0WXoxpFA73l9tl03cDMZC2JVR
   LXimewDMecDLe8BYOS/xaAT3UtFSi4WlVfouYK7LpWHOcuHqAVgMVozpP
   oU4DDHvAQJbAvqfYAI0Zkq1Tjfav/p8QaBagrgthQ6N8a8x5v6AuSX5Y+
   w==;
X-CSE-ConnectionGUID: ABaks8IYRtOf2ZILZUZG4w==
X-CSE-MsgGUID: 7e6DVqT0RNSZUcFzduhGww==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3359715"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3359715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 01:56:45 -0800
X-CSE-ConnectionGUID: 5QyMhXyZRK+xnDnw8BATng==
X-CSE-MsgGUID: NQrUkXTPR9O4wlJA7gV8gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9664015"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2026 01:56:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSAUx-000000001XT-17V3;
	Sat, 14 Nov 2026 09:56:39 +0000
Date: Sat, 14 Nov 2026 10:56:16 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dom Cobley <popcornmix@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 Alexander Winkowski <dereference23@outlook.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [broadcom-stblinux:drivers/next 8/22]
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c:484:55: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202611141002.jCrJ06DU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/Broadcom/stblinux drivers/next
head:   0cab822bca7a59667774725b83e948b71462290f
commit: 0d6409fd70afa8e0e43dfd8b15a419d84a2a802d [8/22] platform/raspberrypi: Add VideoCore shared memory support
config: um-randconfig-r2308-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141002.jCrJ06DU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141002.jCrJ06DU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141002.jCrJ06DU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c:484:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c:511:59: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:473:32: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:472:41: sparse: signed value source

vim +484 drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c

   479	
   480	int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t *msg,
   481				u32 *cur_trans_id)
   482	{
   483		return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_FREE,
 > 484					   msg, sizeof(*msg), 0, 0, cur_trans_id, 0);
   485	}
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
