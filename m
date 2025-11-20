Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52CD302164
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763670137; cv=none; b=cYGkzoEZ12ba/DzAT5e66Pts3Z4PXi/U8t2q6YeBKs5ZrqQjMkxZZ4f4P0Mtaz59cwUIqmtqJ+HJYIcb/n6HMD5N2CQin4U7V9HtOjg8Ab73vSFzcK5hXhdMmfNhl3dVB3C4Rx7ETBfM9UyOR5wceGR8Y9aekw2ed0rdG1VDQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763670137; c=relaxed/simple;
	bh=M4jGDK+9OJIB6bdanHccELs/epGs/OSKHkf5qo/ez6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDx/7LNEeUJD6h0eyhKMJc0QLWBdw9y05iK1zvjredFdQo3NQHeIAtoA6RcHO0QE91v5qCq+qJpeG5cGYpNtFo5SVPM1mtYPWOEG03Tcg8JpooLQqYzsmt6JAfaU8bmiieFouwO0upcTX72Pzh/Q5DTHHFQ8f7gG28cQE5zHJsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQgpxAAx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQgpxAAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763670136; x=1795206136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4jGDK+9OJIB6bdanHccELs/epGs/OSKHkf5qo/ez6M=;
  b=XQgpxAAx26h/GBiJYLR+dTsoSvtdPXuA/HfPrbzSi9L1GKvPgrtNLx8R
   eX7iqobz3EcqjFgro9AUypyIO+7s3Zp7RUoikbCIoOyY8H7YLjAG0PQ13
   Lto0ufteEJENlA7NAOQxzDDxWbM3TVys18eueh9pG8EdiD3AqO4bjjsm4
   vAfd0w54h7mjfFu2FcSJ9sSmf9oHgJntgO/lEyyzsxWciYhnLZLFig27d
   yXBspHrK71Ecy094rD3xVB6tX/ZcWPDiroy+MWO5PVi+/bzsxkIVXojXN
   /h7cX6FRrBMv+XsvZqa88vPPkyZcBz2guAwF1H3MVsG3pzAtGHYQyOjV4
   g==;
X-CSE-ConnectionGUID: +hUl63Z2RGS+WSHu9ze57Q==
X-CSE-MsgGUID: TwJjFJbkSl6VQSUi97uK0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77224507"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="77224507"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 12:22:16 -0800
X-CSE-ConnectionGUID: G0gZAyTER0avlxwmfyekxQ==
X-CSE-MsgGUID: pq1YdfmNRfu2egaejCGGLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222123459"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 12:22:14 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMBAR-0004Wz-1Y;
	Thu, 20 Nov 2025 20:22:11 +0000
Date: Fri, 21 Nov 2025 04:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: wcd-common.c:undefined reference to `sdw_write'
Message-ID: <202511210405.zd9wig5Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: 59aebbbb0b47ee97c15cb6992c0fd665289544de ASoC: codecs: wcd-common: move status_update callback to common
date:   9 weeks ago
config: arm-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210405.zd9wig5Z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210405.zd9wig5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210405.zd9wig5Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/soc/codecs/wcd-common.o: in function `wcd_bus_config':
>> wcd-common.c:(.text+0x108): undefined reference to `sdw_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
