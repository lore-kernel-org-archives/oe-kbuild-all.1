Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792534283;
	b=1QIc7xnfZW7f+zqhav/WN+bPnoMHrefiB6c/sWhoJpTy7e4wFbf7DcaJYsQ3DBjMEaRt
	 0fudnyeWYx35uRNlMOJ0xiVed7sYMT03VwUdrQ3AL5VUNMnKmM5B4OF8cktDQQ1Tjv9Jy
	 bOjfy1isjmskYAD+TXX0XPDyrFQu6WB+PwzrLy1xr+o2CRazfbtZbKOo46GeBryAzGM0x
	 Ji7uNv7QegT9UvVdcTbr1fYb8hV+kyWtw3CPe7H2jc30Z9GrGIbXH/emvb0vgqupHSw7X
	 /nLpMezQCVx+1VVGhipf0GE7AXIOUOg2r8PzdSbtlnDqLG6gSrLOSS7d1vUS6aY7Nsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534283;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Nprbm0Q/nGcmD6b3sFQnaly+vyKm9oGW+LaPdxYuIOo=;
	b=Zry3MKJ0QXKYjwNF8GonSRw+JBcQeHbxNNjPBaS9Dj3GYCEgxGj0wm+Mz507ndGD+Qnj
	 1TuJnK3Suh6hYrbCpteCwGN0RpJ7ZVK5T8Vcti7++55el5NM4y/poYvquwNQKbprcw24r
	 pjWN1YEIeRt3F48pfSFHJ5YOiLfNYKMPK+86QUPuzudasuJ7NQcfFfzOHOu8gGDWFc2LO
	 vBMoa7RrjBshXypmh+R2mWWLGjc4XoVd072/s0/GSd+6k2G7Yw2KJC+/fjr2qMD2SDW9z
	 IG2OITGDMIi/TOx1uZ3K1UXlRZ0QQ5hM2SuKIRWsufyAgnc3AZaH2vWzsULjw5aofQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=(null) smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGFsGktj;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF569606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 22:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF569606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGFsGktj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792534270; x=1824070270;
  h=date:from:to:cc:subject:message-id;
  bh=QsryH3OuDJcji14K0kYiTf5J8BZN5wRJReqQ4nOB0Sk=;
  b=kGFsGktjqe0410zE9LfGmpHTIoe4wTympRukEnP8pXeC49kXWwCpXIZd
   kSZImccqv0S2fZ/77dFEHdXEZcONq4Q3VMdDLXit5v4cb/BIN95y6cLLY
   o3ycYxvnH/Dzp5TZldXYedm8zdCn/VSDfuEic+1oZjBlNoXJ03/MWUlkG
   tv/j0bo/PrPWQjzE2ejmFhTkw+O/v8B5tWwoVWxt/7MW7ZFZ/MiZ/XSyU
   4u0dAKHIo/RS++N5oQiP0Q3XJKyRix1E4ASUutGzzOgiMWsY5dGOSmQe8
   BoVFDK6Ulx8bpsYjoZd6YaJOclZ2WpwrWPCCiD1EPBnfapFZybobdbM7v
   w==;
X-CSE-ConnectionGUID: QR/k3P69Q/uA7JzFO3F0Vg==
X-CSE-MsgGUID: flcUp3gVSNiO8LiJGM7Y0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1263489"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1263489"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:11:09 -0700
X-CSE-ConnectionGUID: uBfc5fQIRpKRRlhjEzlqvw==
X-CSE-MsgGUID: v3YGynBOQrymPPpqjyXMMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3267425"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2026 15:11:07 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJI2z-000000006SP-2HvD;
	Tue, 20 Oct 2026 22:11:05 +0000
Date: Wed, 21 Oct 2026 00:10:20 +0200
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-7.3.y 56/59] .gitmodules: warning: ignored
 by one of the .gitignore files
Message-ID: <202610210003.Z7o4muYM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/tobetter/linux odroid-7.3.y
head:   c30cb664bead7336f81c7a7c7c82709ee1f803cf
commit: 37053daffd18f8906f9269bd7e80714e24806188 [56/59] ODROID-COMMON: net/wireless: add Realtek Wifi drivers
config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261021/202610210003.Z7o4muYM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210003.Z7o4muYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210003.Z7o4muYM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .gitmodules: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
