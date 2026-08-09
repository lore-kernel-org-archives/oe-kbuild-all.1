Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA71514F8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786285886; cv=none; b=WxV5oYB8KoPHKww8id6dpXrDy73QcSpV1AGKWocpXVeqU2dL/WScktdTK7TUArY7U1YMm8kqx0i1eWbwJ377KKAqTmfv1t6GNXPsEkyHS9MCjw/QB9esm7fY0fLJuUImOjOyx3IFTpO77NFxUx1H31tVg7D1trjyXRmYMZTM1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786285886; c=relaxed/simple;
	bh=jjVRJgKHCMvXvuT0ubssPzhNKgIoj68FVZlig4wYtZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWDFz3I02hLukTAyVLeZXDjDoSHrik6k0/+QGt+xo9PdevXttP11928c1Z83XrjGi7OfnnZugwANrizbvqPzBX1kxbmT55+cFjpe0HfauncLfM4Fkvs+L9e0u0ZaQaf6vOmD5oqCWdsDVmu20YlZJHXJDsgDi7w+R8i4kWXH4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKXBSxq/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKXBSxq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786285883; x=1817821883;
  h=date:from:to:cc:subject:message-id;
  bh=jjVRJgKHCMvXvuT0ubssPzhNKgIoj68FVZlig4wYtZU=;
  b=FKXBSxq/+R4LRs6GGt3UJwwxXcAghdAIwoEgPE4ukhG1dHiFjkIWQWpR
   Y3Till/06TNJ+f5caysiXV0lGH2DSiZ/l27ByMuRihKrPe5al3qmWgkWU
   u0paucYbCVfQlCickBIrt3a+JVD65g52DIUFXXyUFhkWrl+IqWPlCmZsW
   OjxtWUL6eI8lAiJoE3v3jn2qKEJR0QN1ft8A7nbdnsoLxg8h4hsVkcIe6
   JTY0fDl0Tqk3m0BB6CnIxmNbsWGBZ3CanBUS2vopNjQXqgqbh11rHZ8EW
   VQ0N3N2rJJG8KnH/7N2uNx9Vo3d4iPGp5pUxTt+pfFWDd/RvfK7rKESkm
   A==;
X-CSE-ConnectionGUID: oyw9uCIkT96yoFpsOZlICA==
X-CSE-MsgGUID: ULBLLWmOS3GCt7FtlaKy9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="89343673"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="89343673"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 07:31:23 -0700
X-CSE-ConnectionGUID: ZJCO0IxnR1evvhlqtioxhg==
X-CSE-MsgGUID: Ztw7yljqSfC893NI0BNYVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="301044734"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2026 07:31:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt4YZ-00000000Lvb-1vyg;
	Sun, 09 Aug 2026 14:31:19 +0000
Date: Sun, 09 Aug 2026 22:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [thermal:thermal/linux-next 20/26] make[6]: *** No rule to
 make target 'drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.o', needed by
 'drivers/thermal/qcom/built-in.a'.
Message-ID: <202608092253.XLsZTIen-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jishnu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   55c16e15ff9f91bc994a20124b83faf27f0e3690
commit: 948ee3a74f35644c16b6c100f19ff0799cebe0b5 [20/26] thermal/drivers/qcom: add support for PMIC5 Gen3 ADC thermal monitoring
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260809/202608092253.XLsZTIen-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608092253.XLsZTIen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608092253.XLsZTIen-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.o', needed by 'drivers/thermal/qcom/built-in.a'.
   make[6]: *** [scripts/Makefile.build:289: drivers/thermal/qcom/qcom-spmi-mbg-tm.o] Error 1
   make[6]: Target 'drivers/thermal/qcom/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
