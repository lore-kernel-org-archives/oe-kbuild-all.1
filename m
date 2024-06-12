Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D2E16C875
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184225; cv=none; b=gR6KIjKoc+sl7YExNEyZ/vubRcii5CBi8qo/Eb+mK/7JKzwc5usA/icgOpnrecV4YjVJWmpvYaNBD6fVGtFdOQhfO0+/hnnEeH1UvwlnJLqNHVzAR3frU3QQcHPGllxN2ptdtYlsvaC7WboMKVXVA7QuhAga6aLAiElGwbKzKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184225; c=relaxed/simple;
	bh=g5HCYXMALQ+VResWT67U5tGDDYWeQGYwDKzP4MnMl04=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHW+YRVcluSpB6nrfQi+b+U8rhXEXLXRgB3hE9i9gJEqifg2CeB62CFwkqhAeBTX1y1/jeTnjJzZ/X7TgdjizKLTqr+xfuMuL4ktwIQRUh7QxIEmM7BnDNnZ87Ja6lyZirnhS5bIjtV3swLH9mpr942oF5dEsJgxaU6hm8OCFPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl/7Y8mI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl/7Y8mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718184224; x=1749720224;
  h=date:from:cc:subject:message-id:mime-version;
  bh=g5HCYXMALQ+VResWT67U5tGDDYWeQGYwDKzP4MnMl04=;
  b=Wl/7Y8mIa6CtzxhcyFJ2pppH0waJNVjxrZl9g1tT+0Tms7hH07I+tf6P
   zNtG0LStNYo8jgD8va9cpTVIRxMbCP5QobWFO56UurKX36HU8tmNuzEIS
   Q5L+cEKh+zU9559q+GLYj7LpqxXkTheBdm+PoobVJFtMMLFQzC7IUWIax
   nyPOhr8Z91D5G+rWCB1iDQSlZq+rIwvKy5mFls/hpqF9syc2YRyzFTOGq
   6fU1wdKdv9DDp/qvGV2uoxqTXPxULR6fhlDW+sSY0I8ZMhGkvXqcWN8k7
   JCKXdrGqQMpiGgB9AYmtiFdEIy3hq9a3k2AqCRig2tMP2nF9i4vWdYkrx
   g==;
X-CSE-ConnectionGUID: PqY1box3T16rSKyDy6slfg==
X-CSE-MsgGUID: dEatApHUQMmLN2Fa9w6KkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14810414"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="14810414"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 02:23:43 -0700
X-CSE-ConnectionGUID: twSUtPAYQiG/bxKB84xmrA==
X-CSE-MsgGUID: ul6YLhddQaC6jF+vwViRag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="70530896"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2024 02:23:42 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHKCi-0001PI-0w
	for oe-kbuild-all@lists.linux.dev;
	Wed, 12 Jun 2024 09:23:40 +0000
Date: Wed, 12 Jun 2024 17:22:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 2137/6555]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o: warning: objtool:
 amdgpu_ctx_ioctl()+0x10d5: can't find switch jump table
Message-ID: <202406121717.bR2ThGoi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 47ba45da78220ca133536968121bb39fefcd1a52 [2137/6555] UPSTREAM: drm/amdgpu: rework ctx entity creation
config: x86_64-randconfig-012-20240612 (https://download.01.org/0day-ci/archive/20240612/202406121717.bR2ThGoi-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121717.bR2ThGoi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121717.bR2ThGoi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.o: warning: objtool: amdgpu_ctx_ioctl()+0x10d5: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
