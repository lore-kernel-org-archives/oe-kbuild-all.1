Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FF3815FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662758; cv=none; b=bC7sehE5PqHyhHQThBNcnLkax90ZNPOED8Xj68CTNW0kcewVdZx3Dxz2EW7urVUuXCum2K9EopWXbh02WcqDSkjrnEIXfDBQAoz8ucMARkGvQcJ+9DcN4o75RQdzNvmc3WgoUwEH7/kyj9OEjQOaZ1AAGskqsFkDP3zK/5zhM3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662758; c=relaxed/simple;
	bh=vbisaGP3w3bufCJVew2R6CBVgTu8iJAhss8zQabnIps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Uw+UHR7zmxJ40KnZmuvOTiwzPqAjvfDN4SX4ww2TuO3t+a+iANmwj5z5ITZuPoWzKEbIDBDM9S0rGS3pmVcsG0rzpL1ZP7Tdv7r3gbZIpXlgOYNgWjgXUgWrPLAs+TCmGy7I/ZAAC8v+D7yizW/Np8kYd5tnK4iV7/8SkHx/CHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERZY9Bk5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERZY9Bk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787662755; x=1819198755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vbisaGP3w3bufCJVew2R6CBVgTu8iJAhss8zQabnIps=;
  b=ERZY9Bk5p33MW6iA2zfPnSuLxu8ssZTuMudYqxeBktr/jeH8lJum2f/w
   C4STJ1JJS8wZ84DTPC4OievIUozOnsmAh54usn6rhc0UAIq+aTrX6nTfd
   /hBanYspwRMkSyPhNVwG3JkQK/NQ7k4yGn1GoIm/zS821KylAPts5HD3B
   ME2DZcMDrhORwyGVdkeQ5bSC6BjZbUAMxfi1UrqXEb8p3/WRBJ+QgBWJt
   zyU/fMoQ5B7L4RmZIFuBdss6CGrTbTu0zRghWh4dcd8CfttHgS2tgRdio
   a6UsTu58QMFloWSr9j/FFMjbjYUUtN0Wb9t6UzDL9qW0nKhI0IU3vN1tj
   A==;
X-CSE-ConnectionGUID: 0ByP1pOlTK2ulaNxmrXQBg==
X-CSE-MsgGUID: sH95//zAQSS4PnMXtrvQPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87254331"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87254331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 05:59:14 -0700
X-CSE-ConnectionGUID: KUgbvSL2T/eLG1DoM0gvOw==
X-CSE-MsgGUID: gnjwIrvnRX2A4tSp3PW+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="266721981"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Aug 2026 05:59:12 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyqk9-000000005sl-4Aks;
	Tue, 25 Aug 2026 12:59:09 +0000
Date: Tue, 25 Aug 2026 20:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 10/14] kernel/bpf/verifier.c:1749:1:
 sparse: sparse: symbol 'verifier_ENABLE_KEY' was not declared. Should it be
 static?
Message-ID: <202608252025.WSWKi8L7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0
commit: c9c8f578d0276bbe284eaa9359bcdf56b151bbc8 [10/14] bpf/verifier: Route verifier stack states to scratchrec pool
config: hexagon-randconfig-r133-20260825 (https://download.01.org/0day-ci/archive/20260825/202608252025.WSWKi8L7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608252025.WSWKi8L7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608252025.WSWKi8L7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/verifier.c:1749:1: sparse: sparse: symbol 'verifier_ENABLE_KEY' was not declared. Should it be static?

vim +/verifier_ENABLE_KEY +1749 kernel/bpf/verifier.c

  1748	
> 1749	DEFINE_SCRATCHPAD_PARAM(verifier,
  1750				"Toggle BPF verifier stack state scratchpad pool");
  1751	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
