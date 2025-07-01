Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4015E96
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365934; cv=none; b=DFocdd9CllQ05JXRw9SOEq4Ob8dWDLLUicN1hbAukqtU/QQFIhZQhVgLevRMshmhfoP+8uvPbTyVowcz832EgrDMxjgkjnob9v3Jq4nmsT8LvEI837n46m85Ai9/1hpHsroOUwtbAQs4ws1Ln0MBs/Q4w3XicSlKpX7H3xmT1hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365934; c=relaxed/simple;
	bh=KFQ3Y+pkEqJc8qXrsKgLrHhHwNO8VS0ND7y48Hk8wLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwlShUtXTOmj437gyWOZj13VtWEnhEbDHmb1lLKv8P5jbLEIutCwaHGWz7HKsbYHETPPXg5kl753U5LANeDc8Wz/3V6wpgFySkS/LqTtlV9XB8Arww56ihT+B6ygVpnKTc8buWmz49WtTPF6o85jwEyAJg5IKbZCyiIKlOWFBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCZJhTYF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCZJhTYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751365933; x=1782901933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFQ3Y+pkEqJc8qXrsKgLrHhHwNO8VS0ND7y48Hk8wLo=;
  b=CCZJhTYFXDix6CBvR/pYTVcLlGBSYwQJGCVV+ZxHfik1+XfKmF+7PXDL
   SqUrVtvs3Zko5EQcJUxPnVGZ7WCA4vDswfRYwYfQzDOH4AqV+c+He0UIv
   MKK5MnjbjAO0QzHw4HmFiTc6pUmZE+WFUrLnKdu/wqQirJzxRfRTp+qPg
   IbtEHfLHQuKUKrx8UWKyjaeVySgJKRxlWLoWHUHBjZenilLdYybuYayrh
   R9JsWUnIQ3UE26UDKexSEPmOWiCuTvYnoQ5cYBUWdBe86O7vhnCoqr0hV
   TvuYAar56vNUIfmHAo+DHXehvoWNw7a30An55C88xnj7CxKi+Igf0HBeK
   Q==;
X-CSE-ConnectionGUID: qdfOlwOsT82af89sIuxPHw==
X-CSE-MsgGUID: BUAcU72TQha3s+I/wW4HDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57303723"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57303723"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:32:13 -0700
X-CSE-ConnectionGUID: hQrXYdEiQse/5dHINGM+gw==
X-CSE-MsgGUID: CHzkwkz4R++zhFShdwmeiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153510188"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2025 03:32:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWYHZ-000a1S-0X;
	Tue, 01 Jul 2025 10:32:09 +0000
Date: Tue, 1 Jul 2025 18:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2989/2989] kernel/futex/core.o: warning:
 objtool: handle_futex_death()+0x16c: unreachable instruction
Message-ID: <202507011830.hdTLU1NP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0655af1b703c5ae3de3a1ba80e5e31690ccfae93
commit: f552f518f86f4489577e296625e624271e2f76b2 [2989/2989] futex: Move to kernel/futex/
config: x86_64-buildonly-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250701/202507011830.hdTLU1NP-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011830.hdTLU1NP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011830.hdTLU1NP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.o: warning: objtool: handle_futex_death()+0x16c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
