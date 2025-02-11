Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC31D54C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255182; cv=none; b=q43GBSYoUQ0vPpL19PmtMv4PDRiJndwtgJsdRpukmWoYaqW80MzpowUW7vdxMv8wO5xk4WIJmSK5itZa5eG77VgMVNamv90UNA2SLDab9iIl3qMOicwCaVLiIcHvEmM3FhQlpKZ1pP+JPBo2ll3EQu+njb4/CjtqUZUE4v0yWEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255182; c=relaxed/simple;
	bh=liztFc8kFhXeH8479TR2rSLdVHvZpXrlykNrMC2fjeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJOgr+2waW9lp4XUXhf8hYHSSYI1p6RsMujwj9aRCk/jNDSdJQBNcOEF0JZ+HlvE/Bzv9GV+8jHYntGfdgPhv5k4p02k+MprQdGiJ4e6LnRueSRcHkSpH8Na/WhHG2nIy9MNjWk8CVJ3wN5dUc5tJl90/u+TTFZpRKkv9Bah6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jn6z5h2p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jn6z5h2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739255180; x=1770791180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=liztFc8kFhXeH8479TR2rSLdVHvZpXrlykNrMC2fjeQ=;
  b=jn6z5h2pLBYmVu0A0hpWtfkKGr9xolea/nQ489Pp83uBqGKH78GxXuBB
   m6WMgLFq0KZpAEZta8zzEgdpJJLDnQ5tLGUM30h+rLzm5scTwh2hZcRxw
   7Etco8qSFPtBqRNpzo+EMKInrV/cK6aJ5SmrPPYfam62mrSfaPVHbnTH5
   qJ6BSUtBCmmumjyz52lVlAWQEWuQ0pyrGyAR/b5gCnTmiE3+d15ETlne9
   SC7XGef6TZbFCQO7TH3s51VCVT0EgtH7ore+03wgz+muRXec8J1h5DNb2
   KQKhyPRzd5CVjLLkXEmVGUWNiHyRrAEsVHYbQUlCosJQvMomaOfg1YM+e
   Q==;
X-CSE-ConnectionGUID: FT/yRRJkROS1otRjwJMNLw==
X-CSE-MsgGUID: PXyYbUJXQCG49hUSAULHpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39723718"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="39723718"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 22:26:19 -0800
X-CSE-ConnectionGUID: piBPiRl8QxCl2oX/zd5l8A==
X-CSE-MsgGUID: eKkxPT75S1aDybZrh+8zxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135671512"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2025 22:26:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thjip-0013pj-35;
	Tue, 11 Feb 2025 06:26:15 +0000
Date: Tue, 11 Feb 2025 14:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2735/2735] ld:
 drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'
Message-ID: <202502111437.CmqnjjLj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7152a244f5f9fb024d93d293168ce0b62309680a
commit: d74f3b70d73220d919db010ec1c81aa1d89082b6 [2735/2735] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-104-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111437.CmqnjjLj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111437.CmqnjjLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111437.CmqnjjLj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/video/fbdev/ls2k500sfb.o: in function `ls2k500sfb_events_fn':
   drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'
>> ld: drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'
>> ld: drivers/video/fbdev/ls2k500sfb.c:244: undefined reference to `fg_console'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
