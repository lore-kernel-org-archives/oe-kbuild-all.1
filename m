Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604C36E467
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191775; cv=none; b=Ox9x6yl8LlpPMWj8i5sVvhJ//IWgpJAc4IyFzVh1gI6wAbBmicC7fGXHZPw1J2Bzy+M1mUqyMTw69Y1gZp7Nwy/qiqL1hlwTm7mpNCc8RzYCCPDUX51ApzKeouEFdhsGdkGgcLy9ROtbdUq7wWWroprqtlWo68Q6PfXl66ddwc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191775; c=relaxed/simple;
	bh=hj6gLWle7rhdf6w0pAWD+AtitSlHFf6Wrh/QtD92mPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KVlQiExZQolFbJzd5bcdPk9GubGLsLGr5KCFEGaxt44QF9MTXnfc9yJV+3IClL600ZwxA3FzN5FkOfw/V4T7XYafx4skOzZNWl42kFlYjYLltcbPKK4JH0lA4WxJmGwDNxRjGWRpfSb+oNCoPWaYhZ2lS/U/ldWmx+XZQh+b84w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXl99F59; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXl99F59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772191771; x=1803727771;
  h=date:from:to:cc:subject:message-id;
  bh=hj6gLWle7rhdf6w0pAWD+AtitSlHFf6Wrh/QtD92mPc=;
  b=lXl99F59Sa1teXXWLrEfNKee22x8kLDX/C6n8GexjGmSJoqTh+/Z5w8I
   Qk/IT0jENDIKgqhH6bwlpr0pRDuABZVSRKN8eAFFlyAMyh7SdsR2DNqY9
   +kOWcOoWLod0s/rRwV+dhgaKaqIA7+W/ddj47sQaMhoS3qJjXNSOfEYq0
   uKnopTOTZ9fgcWS4LpiS2y6F7pog4Djx15v+g1UFMW3qfyonONERn5PQ9
   CO7OtoaC/49dk31SXC+AIWVwSJPmG8erlsFMvVMZ7proQH0AULLDSLavj
   P0D3NQUtL7yd4Hi0S02MOxdtvIB9WTcjhQP4RvAT8dS8Ex1N/YQlnG0A9
   A==;
X-CSE-ConnectionGUID: MBeOWJcoSqmBYrUtgwGvkw==
X-CSE-MsgGUID: 28zj926rQj2DCq5hwQwQnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72975939"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="72975939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:29:31 -0800
X-CSE-ConnectionGUID: Mz5zWFBBRvOUlaj1iks34A==
X-CSE-MsgGUID: Gvagr6HKThOTlzS9UR0Mvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="221497065"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2026 03:29:30 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvw2B-000000000Xh-2R78;
	Fri, 27 Feb 2026 11:29:27 +0000
Date: Fri, 27 Feb 2026 12:29:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb:
 clock-controller@82800 (marvell,pxa1908-apmu): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202602271241.yUjV56vU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   71f2074b8c1e4e009b1e126ca1a2a9ce14201030
commit: 5bcf9e1d0a5da750ff180e7385b0bd4041686516 [3/3] dt-bindings: clock: marvell,pxa1908: Add syscon compatible to apmu
config: arm64-randconfig-2053-20260226 (https://download.01.org/0day-ci/archive/20260227/202602271241.yUjV56vU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271241.yUjV56vU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271241.yUjV56vU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: clock-controller@82800 (marvell,pxa1908-apmu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pxa1908-apmu'] is too short
   	'marvell,pxa1908-apmu' is not one of ['marvell,pxa1908-apbc', 'marvell,pxa1908-apbcp', 'marvell,pxa1908-mpmu']
   	from schema $id: http://devicetree.org/schemas/clock/marvell,pxa1908.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
