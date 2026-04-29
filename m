Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59A383C95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 06:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445299; cv=none; b=WdbabUninY4ycLL9yFqJtH4T913hJfo0JpLxovoiO3xAKOMYe5hUDKl2sWRto/E0+dvvCa7E2Q/u4pl7QwAO82onUKZ0oCTC17HywqJJsrnB9BgWkYCTUex9Soqyak8afUddFm6Q2aAE5Zyxvr8vdSW2M3Z3Pq1VZeiLsOZoggg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445299; c=relaxed/simple;
	bh=JdCXjq/ToHwZG2Gft/YWrzlY5MGvkkJtl7NasR0hTZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/xyiASQF0yWrmdpjy3bs1/Y1idwDNknLze6dAlC9OOaK6XZpzw5Ae6WxNG7X+nJg0W3Cox90S8ksn0PSsmtIwXb1i0KYduX16TSO5Pw2s2tXGJ6HhdStR0roSUetO9/9ZBdq7D6dgeLtw23GD0mUVPOL5NFElZO4p64VZf90GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fj7Azryt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fj7Azryt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777445294; x=1808981294;
  h=date:from:to:cc:subject:message-id;
  bh=JdCXjq/ToHwZG2Gft/YWrzlY5MGvkkJtl7NasR0hTZA=;
  b=fj7Azryt4pCaPrwUjOvs4WasihQYMCa9mKnCwHsRjRQa6MnU6qxn3k9I
   E+VjNSaL5thhS67ylXful+yIUDp/HgxznUkennx1Q43tU/7QfMwATtSxw
   XgIs3Ok47HZL5yPoh1W+bJ09ect115D++HoeNts/yTkv/UsGn+x9jXUZw
   toWncr+HT1wOAGM//K6804CtUapee15o0D1bNYgXXBkKTH7jRPmB7UPA3
   3uHRNC+mJMVb47JFlGC7kc2AFBV0SipnhouUzOmUzx6WtqzBN0Tg8PMu1
   YjPXM+6F0DyaqFtZsM0UX2fq5hHJuWiWtnOKvDsC+PwyUCABA3t50OGGn
   Q==;
X-CSE-ConnectionGUID: PamzQmqsQ1Ca1D/kB1GfiA==
X-CSE-MsgGUID: 9debYOQNQ/SJHLiWAD7GPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95785649"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="95785649"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 23:48:12 -0700
X-CSE-ConnectionGUID: 4EbvUyxyRM6CXXBajyF0lA==
X-CSE-MsgGUID: TsXw8mGBRZmO4xtlOdC79Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="239172089"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Apr 2026 23:48:10 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHyiO-000000004Rt-0qKI;
	Wed, 29 Apr 2026 06:48:08 +0000
Date: Wed, 29 Apr 2026 08:47:49 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 4/4]
 Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring,
 error parsing file
Message-ID: <202604290811.VEkPLxnu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   6b7dfe729846aaf2cbfadca50d3cc4c7fc70733e
commit: f51d1788938f74dab42d10114f59a836b44d1823 [4/4] ANDROID: dt-bindings: CMA support for Virtual Machines on Gunyah
config: arm64-randconfig-2052-20260428 (https://download.01.org/0day-ci/archive/20260429/202604290811.VEkPLxnu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290811.VEkPLxnu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290811.VEkPLxnu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: fsl,liodn: multiple incompatible types: uint32
   Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn: multiple incompatible types: uint32-array

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
