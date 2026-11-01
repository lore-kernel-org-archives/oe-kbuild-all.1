Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793506371;
	b=ZyiXxmlH5XRbzq/IyW+TCxwe3XIl9F/iIB6YKPTtMW/aAYzB7oQcTvJaoStjcee+n+6g
	 Z+yXfj4C5w15rQHsVEGs/5EIyG1gRUNVH+SdO4tKMMXY7BTknL1G7m0GhIiuH4FdEYnxA
	 d9XZPS1uMpWrXDGFdKIeS69pOtEuSHDFMq0AgNBj2FXGX3ZkbpJHU41Pt4KshF2sRca+q
	 djQbvuDKTKZVTAThTzkPduqfls7jxpLIjHTcwIlhYWaylka/YZTztqozOFJZuo69K4mBG
	 o6PNaVr/BItGaqIdcsakUVyArKzj+6MHWFS+g5YpAaMM2GxXsJYBg2IsQwM7udiFo1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793506371;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WPCFElbWGRzS/xYvpajeBobxUqjNbIyzvqcjHhBOllM=;
	b=1Jv5OxpN1kuyerzeP8wBVlU+zGa9u4QlC3OINV6YFASRyuZStrpu2l3JLae/DjYZJ6Bm
	 7TgLzfO0Ro+C0Qe+a57j/RrWb31f9HHrlXnLA15bBBo+sRLjTxi3AvXBptf7SEw3bUD+P
	 dOOkyXATXpf+rJSzIKsK/u8DZ2c0lmsNI81L2czEAi8EPAjp2bvMlxUv64VvBEGuyQHpr
	 /8k6DIH0ZryPmTdZzwe6FppfrRwm+YGj31lA5Kw+iNsbgxbdd3FdpJeblDfJmGlab1p9S
	 5X52hpy9vo9E4awQzrNPfsr5jd7ZuInpuvHAl9FtgKBj5I9IAf2sD2I5jSRmDADzYlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGeFtRFW;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2D606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 04:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C2D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGeFtRFW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793506369; x=1825042369;
  h=date:from:to:cc:subject:message-id;
  bh=FrA2yPievLDyCxbadLoZpLzcRmg2qWvepdFAGXIf5mY=;
  b=BGeFtRFWS7RhIaJex0CDhAB3vLTJPvtnq2ZyNSs2FT1PwEA/xeaUqvcG
   UcdwNPEjX+PEZmuLm4ApUfdTxcHTnjmlQddSjKZgrUluqbiU+eCYko0IR
   5khN5Qjj3gqde15CLmMlT/DpH1+C3kUmvbrxguFsgoMkT1ENr8hIu0LRn
   HyweHhlDtKWrLArtmbmphqnWjer9RG2aT5Laq8xIFKFSNXMCaw3x8VUDp
   jxwV0IIBnmmSTzRPRBEX7BtrpH3NRnJmrl1DOxYwyC26D5D6E9nwYwt5B
   O2ceFTwVVBlvasVOFFj6Jd/YKGR07QpHkXQ4tos93zsGWecAr/qkTt4u6
   w==;
X-CSE-ConnectionGUID: 0EaH37gtTbWM4Uc5QSwzsg==
X-CSE-MsgGUID: uOrmvr1qR2ucbFvS+ktedw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2118219"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2118219"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 21:12:48 -0700
X-CSE-ConnectionGUID: Y2zesIjcRbyLwHf6uJQtAA==
X-CSE-MsgGUID: s/EwRO7LR7a+Lo6aL8UF4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="7602322"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 21:12:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNMw0-000000006KT-1Z05;
	Sun, 01 Nov 2026 04:12:44 +0000
Date: Sun, 01 Nov 2026 05:11:51 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE2
Message-ID: <202611010537.NhToOOxE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   72211702f642336d084c9cb7a986b6c351449c6f
commit: e0244015478adde7baee3a127e43091668d91289 [842/842] anolis: net: update linkdata ethernet driver features.
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE2-0-0 (https://download.01.org/0day-ci/archive/20261101/202611010537.NhToOOxE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611010537.NhToOOxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010537.NhToOOxE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE2
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE2 [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && X86 [=y] && PCI [=y]
     Selected by [m]:
     - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE2_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && X86 [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
