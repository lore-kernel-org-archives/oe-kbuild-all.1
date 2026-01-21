Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BBF30F7F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 20:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029114; cv=none; b=XIibxI+sQg6xMzW1Q6fg2TmNp3iB2G8P3snxB8O2UVZ0Alc89aVsqBusNTxsU7gRvVZ2ZwFCHodoqCnVc4FJwoDvNasgfubQeSQcR+jPtULOV87IxR/OCGaXf36+TpRmq5kI2lpdSIu9Yc3boWP8fxn32hToymT8MuIfrJ+Cl/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029114; c=relaxed/simple;
	bh=8LxhSpE7+gclKEPRCqxEhyLPtSwVpMp8U4xtsLgBphI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X/5C0KUWq8GrvQI1+0eddP7dsi2KHwvUjZm46+Fe5grpRhwJJJE3e96gyxFIaUd83pNilp3nrmdS1LUCVV9mnTFUMwy6pHHQmDzXSroT1AL0dvCAEMA4LbBCG3T1GccYJqGCabuO0OsC9fbMqIx3jFtuJpgJTeBdcGatmtieR4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jg+F6FX1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jg+F6FX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769029112; x=1800565112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LxhSpE7+gclKEPRCqxEhyLPtSwVpMp8U4xtsLgBphI=;
  b=jg+F6FX1Lna0F5K1gY0goeMMbrU031P7p/YlI+35pWSxPKdksIrVAxDC
   2WOIQyJ1hcxnp+VHBr34OCsfZGHGJE5X+BbPyDlTT087oxbKoQp3p8PTh
   X0TY/cnIkT5yOiiRQMmTCtb1XFgzCR7bBvDvYjSrKG+U/xV3W5Yt/srtg
   913F1CGc25xstEI2oG+esuw6KyiHeXr4y5c41AN1fZ1IEwFqar7UlJA4q
   z5pqHt8Osdy8OZx72azXJ43um0hwdKZf3fUx9MWJFs7htAq+s3MUTj4qw
   qVUbP0U+7PUUPfaSiRRGyiKJPbSu0sPk1tqfE8V8SxRS6cZNpSPN2/VhU
   Q==;
X-CSE-ConnectionGUID: NxAP8goVQCmyJgV3BE17hw==
X-CSE-MsgGUID: aYkeXD7TRe6fMEnWgk/LoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74129316"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="74129316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 12:58:31 -0800
X-CSE-ConnectionGUID: oHZXXnlCSBKlrOxZm9XLSw==
X-CSE-MsgGUID: g2W6iIvQQKiTyzfy5VfaNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206603619"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Jan 2026 12:58:29 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vifHX-000000000NN-2C68;
	Wed, 21 Jan 2026 20:58:27 +0000
Date: Wed, 21 Jan 2026 21:58:26 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 1/28] kismet:
 WARNING: unmet direct dependencies detected for POSIX_AUX_CLOCKS when
 selected by DEBUG_TIMERS
Message-ID: <202601212156.bLcG84jz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   90614b63ef6a2f10b6e486e486ca8d5bfd2b7a81
commit: 3d3535e426c8e15bef8f2b193de5a970bbc84a20 [1/28] debugging
config: alpha-kismet-CONFIG_POSIX_AUX_CLOCKS-CONFIG_DEBUG_TIMERS-0-0 (https://download.01.org/0day-ci/archive/20260121/202601212156.bLcG84jz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601212156.bLcG84jz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212156.bLcG84jz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for POSIX_AUX_CLOCKS when selected by DEBUG_TIMERS
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
     Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=n]
     Selected by [y]:
     - DEBUG_TIMERS [=y]
   
   WARNING: unmet direct dependencies detected for POSIX_AUX_CLOCKS
     Depends on [n]: POSIX_TIMERS [=n]
     Selected by [y]:
     - DEBUG_TIMERS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
