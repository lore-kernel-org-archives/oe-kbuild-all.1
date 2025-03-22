Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83041258A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742620652; cv=none; b=sg2o2wHJI0/MtRuYHaAV2vnLYJ750dh0wnVJUeubvZi/hpjAVMWgoEk3gyvlVq4VtZ+85UAtvfwFeU3gf/zvviShTK0Xnonx6tAM2zoig2qiDEUOBcqFzah4bwDgQX+5dpXuaWd4ZtodiiMt0mqDtHu25M6NFRU8RyOwmRY5EG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742620652; c=relaxed/simple;
	bh=9fuUIQb24oYeohD6yiHjRoyZ4xAkHEynsmfdLjaXbng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tAdSf3mLX2K14yel+gGbkC3RvIteXKMzxsTXfp3To8J+1Nqkzo026SLLWuOBsta/CXKu/R5ZXXK2f8e9ZwbL3DBP4Ru/LQDWH4bjtptLIU0sZCZ4Rb2DVzpVNF+HSg0vv97/rGrVrzPR8mlkWvMx7mCZHqcbTG+jB45jq4mLt8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGWuRnhc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGWuRnhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742620650; x=1774156650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9fuUIQb24oYeohD6yiHjRoyZ4xAkHEynsmfdLjaXbng=;
  b=MGWuRnhcvDeWCbtUdh6hEZxwJ9Z6i/fSWi+LZbXcUXegdnX9SureGdUY
   gj8GPGeLX8C8As2iFrja+duu/+5iVtUXtIB+y0myR9/TgV9WmPepH9r+N
   M1OdyG/zj1tLIybtiqxkF6/24jBnBc2ysZGiFnsrR28Whp3I0b1+LT+yJ
   XJPPLk3gjDYIjRlBJzQ/yEaxlQDhxwZmwOJ1p8NlYw2tZmWt4BlCcSQbG
   5o+x32dmmB8rBd9kwyyFt7hjAu+P38GMni+b/J/ZMdbh+TFeDvvpGMuJa
   gzebUxTrDi/BWDx37MQ6xjuXBu+oRkqtWEu1sSmf9js/seRI935Eh7e6U
   g==;
X-CSE-ConnectionGUID: c34dmwDXRdW6ronGKOaz1A==
X-CSE-MsgGUID: CwntA0cETcmZGIRniLMskQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="69243462"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="69243462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 22:17:30 -0700
X-CSE-ConnectionGUID: 2v369mqCS9qj/GNdCHl1MA==
X-CSE-MsgGUID: r7losqOXRrChHgytMjQ0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="124357194"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2025 22:17:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvrEd-0001wx-0Y;
	Sat, 22 Mar 2025 05:17:27 +0000
Date: Sat, 22 Mar 2025 13:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 24/24]
 Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring,
 error parsing file
Message-ID: <202503221341.Ba7Ck066-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   50eb8d5d443b43f38d6e72f005f1b8601ac88a05
commit: f51d1788938f74dab42d10114f59a836b44d1823 [24/24] ANDROID: dt-bindings: CMA support for Virtual Machines on Gunyah
config: arm-randconfig-052-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221341.Ba7Ck066-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221341.Ba7Ck066-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221341.Ba7Ck066-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: fsl,liodn: multiple incompatible types: uint32
   Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml: fsl,liodn: multiple incompatible types: uint32-array

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
