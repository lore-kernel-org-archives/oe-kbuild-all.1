Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175D274650
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458382; cv=none; b=KQOtJFcY83sWcqWJQJeZzLQr87nIiLH6y2Q0pQ9HnjU1wKiWgmvF3hyoyOziMDyVres2cRZO8wCPCb7AJkOdZggt0S8XmnuxL0Sw2Ed17HmOhg6bV3JcEzr5rzkXFA2zigVE9e2x/knUXln5IkdNVH67/ZBUqBMCDaCDxdstrVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458382; c=relaxed/simple;
	bh=EmWTvdC8tHlvZgSYjUPdm2+loYbWrXS/0R0OhsIrDaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b7GkLW582xUlp4WIXjQGSdQ3P4ciRCrIW3LCgqJXsv3ppXINivopmFM2bTzqay0O1ZQhF+E2zpYhyvxfE2EX4j/UVkqfCfUP7RXxj6H1eZCNHb4usK8q+w88yRPHf/EJUW8x7IJfFgFkzDvkv/f5YeYtVMIbz3DJaPKbKQ7AewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gww1MVJj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gww1MVJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751458381; x=1782994381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmWTvdC8tHlvZgSYjUPdm2+loYbWrXS/0R0OhsIrDaA=;
  b=Gww1MVJjl0OgAvUfR6i68OLGos4B8UNn9lJIeCkOfYiAF+y9oowlJygy
   T9gFrvgdPCTwWtGRoen5BtTZMQd1au532bjXYCKUJO5vH/NE+UGkUE/BH
   C1p8YcJnryANztHGq+o2iTduMRlmLeVzi/brmrzl1dVQBUjhQwtohoZt1
   ezRtEPiuG7IQELxn4JPYdENpwk692Q8N2pKlvr1+Fk0xwXKrFDV8JbHYQ
   z6ohitZvT29aoQGbw+JpiizImUkIisyHu6pw6tEsPRV4XtOeVvMGoYars
   qDBl2SsocVVuKszKu9PNCV+Cz9m89e9gg/uvUdXvx61R+3GRpzmBat81E
   g==;
X-CSE-ConnectionGUID: 9KdHSJfpSdKvKF6PayNVbA==
X-CSE-MsgGUID: w5jfHR2NREu0VPRNDm3u0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53678351"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53678351"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:13:00 -0700
X-CSE-ConnectionGUID: +KmfgAluQ76UPxBWG8T5kw==
X-CSE-MsgGUID: S+IbiwzfTCKmni0u0C1IgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158100783"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jul 2025 05:12:53 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWwKY-0000Hd-1o;
	Wed, 02 Jul 2025 12:12:50 +0000
Date: Wed, 2 Jul 2025 14:12:22 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2445/2445]
 drivers/gpu/drm/display/drm_display_helper.o: warning: objtool:
 drm_dp_set_subconnector_property+0xed: unreachable instruction
Message-ID: <202507021408.Op6CzldG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bf2df406d75690971b837e37418494e09d8eec02
commit: 107e8e2d48f2014216a818314d4e1af591b39aed [2445/2445] cpu: Re-enable CPU mitigations by default for !X86 architectures
config: x86_64-buildonly-randconfig-2001-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021408.Op6CzldG-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021408.Op6CzldG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021408.Op6CzldG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/display/drm_display_helper.o: warning: objtool: drm_dp_subconnector_type+0xa5: unreachable instruction
>> drivers/gpu/drm/display/drm_display_helper.o: warning: objtool: drm_dp_set_subconnector_property+0xed: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
