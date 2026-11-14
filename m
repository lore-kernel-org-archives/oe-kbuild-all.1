Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794639158;
	b=Xchhy4DOMiBkKP00cc8CgqKVC+0QW07jPubfO/aKnXsOSj8rdrCzSIjDPWsMGSBAVXVu
	 AIUfaxeauGWaZzmgSkWsMBWK1vgSwnrfMph/UQAGpDvHo0kMTcVVIKh9yLutJPZu7qObQ
	 xC5mjuT+MUQSV5i4hCfrMS3Yq2bqxiLjTa+oRtIjCD0JvpSVEm9GDZN/u1RAP0A2RajvK
	 qpWGhpiqmxqN/jIOWR375IwIOoNyR+fF5ZgHC901LkQIGguiwG0kZjTywjCn2Y6OyMYjP
	 yCnxI8d6SLaIFziCv7ShfaCylPLdor957nag2XUy2cKHq+SjEYK22dkFQk1bmBR+KIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639158;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uoYw+YrzkspAqdpS6hbdyt8mBdjFBf2BCq7xKcOuu2Y=;
	b=S02vocstEBVIbLBf36omScBwhMT6Ti/kJMT6xcegwDJ7OsIDN4XGdKNxOVvphZYcw8Og
	 SHXW8DisQK7B6gYGIKyDz5n2cEOAoNT6Q8JgJ2LjPKz/E0e+P7UBkm9G7KyL+ER6ALBTl
	 KXddhZMdw10yjtsWsBIIF3Qg6i8QbA/5T1e8cMEFlO5ZbcyP3bkRgOQTxI0xqKXAQO0i3
	 NfAVxq/fX3gQBckiWwuXdjOU/Rmn0l+vwYDivj5A8xSlCLikJVHEbRSmfFmFVZFNTmTOj
	 7ji2cGGb4Uf+yRrRfyq6PYLMobQT5xjI3D7jH4WXxxpDrl9nUK/TjfuF7EEwaXCXPWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SxVUVUX6;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E4606A323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 06:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SxVUVUX6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794639156; x=1826175156;
  h=date:from:to:cc:subject:message-id;
  bh=2OWsOJz/EnSj/dpDk/BNV0+nYLUfBUsGSGMZnwREnQc=;
  b=SxVUVUX6m46CflMe2YUTJFXfnJQvw5DMdhVMsQmEyaujKNPhp/D5NJfB
   4EizFnkKnvnQA0HUwmldXb+1Pwp8unB85fsEGtBv+i/EzOo53/u8DkjuD
   2+h+DPp9ErL7mULUlcw1ob4S7I/CsxuLsiFZttG9FucrkVFX83pTbfQbG
   EdZ8auZFdH9LN4RFiZYq0+wxFJ2360Ed7FRLTBEx+hrcvYMECtqyUCIa6
   zBcvUiBbVohwD6fcV02GFRVMdcihhPVKG44EAMsvj3sTQmSgTovuu2q2j
   b+y1yoIQPj6gKNRwZCiREKyM7BPn2HKm9En5TzesLnn7EbrZjY8yPx7fW
   w==;
X-CSE-ConnectionGUID: 7s9L+vSlS66zwbqdbjkTDw==
X-CSE-MsgGUID: vw3miTjeQ3SMO5W2BHltQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3445906"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3445906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 22:52:36 -0800
X-CSE-ConnectionGUID: 1d8vZgEaSlWOEMUYAF2PpQ==
X-CSE-MsgGUID: sNClrKchSambArsbhj7Lkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9251158"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2026 22:52:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS7cm-000000001WF-2cJG;
	Sat, 14 Nov 2026 06:52:32 +0000
Date: Sat, 14 Nov 2026 07:51:53 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 48/68] ERROR: modpost:
 lib/ctlv/ctlv-kunit.ko: symbol '__umoddi3' undefined!
Message-ID: <202611140706.ZRD7Gt8x-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 3e5d2a45aaa3688da1de5a2430c2993c39451793 [48/68] ctlv: Add KUnit tests
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261114/202611140706.ZRD7Gt8x-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140706.ZRD7Gt8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140706.ZRD7Gt8x-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/ctlv/ctlv-kunit.ko: symbol '__umoddi3' undefined!
ERROR: modpost: drivers/net/mdio/mdio-cavium.ko: symbol '__delay' undefined!
ERROR: modpost: drivers/media/i2c/tc358746.ko: symbol 'devm_of_clk_add_hw_provider' undefined!
ERROR: modpost: drivers/media/i2c/tc358746.ko: symbol 'devm_clk_hw_register' undefined!
ERROR: modpost: drivers/media/i2c/tc358746.ko: symbol 'of_clk_hw_simple_get' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
