Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5541A9B58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784382936; cv=none; b=WCmrKN3huzRCf8E40azOYS8O34sWJdpCyvMNm9IeLKFUj3330iztS0KyD7cJ16lhxek4AB48fFV3Ff5S3S5mPTVccjWS6BCerBNFXllYo3jc+P/4RKbgp//qLQucJxLtZP9iBOF1EjIBC+rmEDOsgeYcrXYYB61c9n+etQ8FOk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784382936; c=relaxed/simple;
	bh=Tes6FifLi8iidQUUYcIhA1pawmbsQvj7Q5/BOHBLOf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kGBHb5Jegt/nSG6h2FbDeRG7QPqLMcOsEkYqluCtlOy6IkDmICB75GRyTRBx8+yU3eoA/LXj3gH/gNiCN+RNDuH5DIK2zVWGiFdeIp2HKiF9b82SAxgfjAxkiy9cT7lBJL+Fv50O0AIrnXgcF9XiwEmkkAvi1Qg2LSYQbP0/Cu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICZJmDTJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICZJmDTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784382935; x=1815918935;
  h=date:from:to:cc:subject:message-id;
  bh=Tes6FifLi8iidQUUYcIhA1pawmbsQvj7Q5/BOHBLOf0=;
  b=ICZJmDTJCr9ID7XnW67/e/zzD1sN7R4UzXjOElPfGblVVcGKfVAYVz33
   iCTW9766Jki2iip24P0r1jBYqExk1P8x6jx4fX9RSbdsbl2B1FtOnFnEI
   olrk7TE6cLMzDfVwkg8jVrIMAHgYvGdxM6j9vYffUf1fq+c8KOe+rYf3+
   ddVK0GpBJGd4w29s0p9pMVGcUvpc/PioH/4dFCfPeB77qEbLszMb92JTn
   RmeASx3GHmFjMu7Y7d3sXAhtCQJjdYbqYba3suiDyKTS2GXdGYpzdHAPH
   hpgVfDhbjG3e9jqvO/gxuS0e3X3ToOHkMOFmm9hBGu/mLRkkx/j64UHcn
   Q==;
X-CSE-ConnectionGUID: fd1gI7JbT4Wz6PIHbgE2jw==
X-CSE-MsgGUID: uEHAt6kpQcSJpSexkrNroA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102579311"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="102579311"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 06:55:34 -0700
X-CSE-ConnectionGUID: s0VcJYEdTlGJzGg5Af7pUw==
X-CSE-MsgGUID: 7tKrJK+dQuyN99DTN1dngw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="261303847"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Jul 2026 06:55:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl5Vp-00000000UoE-3TOU;
	Sat, 18 Jul 2026 13:55:29 +0000
Date: Sat, 18 Jul 2026 21:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Stone <daniels@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [linux-next:master 306/7584] Warning:
 drivers/gpu/drm/tests/drm_bridge_test.c:126 struct member 'in_fmt' not
 described in 'fmt_tuple'
Message-ID: <202607182137.NZSc12Su-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nicolas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
commit: 082fbc179c012d2ab441575f1d9386088c0c88be [306/7584] drm/tests: bridge: Add KUnit tests for bridge chain format selection
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260718/202607182137.NZSc12Su-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607182137.NZSc12Su-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607182137.NZSc12Su-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/tests/drm_bridge_test.c:126 struct member 'in_fmt' not described in 'fmt_tuple'
>> Warning: drivers/gpu/drm/tests/drm_bridge_test.c:126 struct member 'out_fmt' not described in 'fmt_tuple'
>> Warning: drivers/gpu/drm/tests/drm_bridge_test.c:126 struct member 'in_fmt' not described in 'fmt_tuple'
>> Warning: drivers/gpu/drm/tests/drm_bridge_test.c:126 struct member 'out_fmt' not described in 'fmt_tuple'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
