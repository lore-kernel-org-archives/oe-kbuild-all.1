Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214570;
	b=W/ufLoZIHYgw2nrP+AOyqcSPmF1h07j29y2Ei7UOtdDOAvKGQjzAQ8GyALZPJotVO9oV
	 wGJNXT3UD3bhyXW4Aa9XuoBvgj+q5kdFogOcQPDSWoqYSRF1ggJ5rq+1Pr3oGDhd38Ksd
	 vTKFpRwKl41U9NyazJ3Ul96GhWaTT5ZZynz0tfSqpRc+phizFoZF2BoYk3uDtgHagmNWN
	 aHeZyd0TxlvosJd2YINssyBc1hIJ/65+sDwL1wTKP91/jFkIJupk7WPUPSptVCC3Fq7KF
	 Puxa/S8YyvRv4q3ngCELN+wjhYG8MDw/W2dniYmNM/4xD70TcsEW21sOIfTvBH0tY6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214570;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=zvlt7oA5wnaYgWScQbXXAT61wM2HCxJcnVYeznnXteU=;
	b=HECWeYY8H7AgAjqVBDj5NS3PRovTYlAQUO+3xGKQ0R12rv/eTPUDu0dVES+wVjlMACkz
	 VmQ2nF4L4YjNAE8i/JrVdKI59AcYvI/PqQ7nLpK6bgTcnoEjXQyyDiCJ4OaaSBzEm5hnV
	 IYtzu4sssvYap35JHx9Azwc0AUWZhzIxlzyBGD92xYNSOgCXBFv18laCGHSwfFzdwfX0X
	 LUcj1Cmrnt+ysMynngALtsQnTFA+F6+CKmusoSMeX5qGgLIh17IFo3xXclZiZSlsTxwob
	 H47qOKZtxobJINztLtV59LScFjh7zrJr1pCStKJpmLI4Sc7IIM0fPg3bthuTwOtezGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="edr/rDNf";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B32606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 08:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=edr/rDNf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794214569; x=1825750569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BhyD1QzGRT1tH5OWrC/ZlfpAJKOG3aWG9ixtpC98Qy0=;
  b=edr/rDNf+8BUDjMYMhBkwXhHzqEBHMQy5/jhr5JEpGDrLBQx1cPApnPM
   UsIjNXmYV0pWhI3MhLuFAh3sT+p1Wv0ZVBWkS/pxX/4ZER1RxCaav1lHi
   NU1J29CsjHG5ycq3J0LZmMLsFhWoGhW3g2ucQqkb9Z38ICNvkYVZC6674
   COzBJDQxdOS1fizSEaO6KAssdN3Afjn01knStcfjtC3VpT4i979DeiLxy
   fryseL+FPFUWRG4C3sgs3xJcX7U78wRmiEIjZoKV2SGN/x2VkjpFr1Cjv
   QgD1HFX32aRe/OX8nxxWYGVa9ZU9Szo4QqQC1ipc53Xf6piBB/F3AvUaK
   g==;
X-CSE-ConnectionGUID: ukO83i1oQlSLZYrAtPsL0A==
X-CSE-MsgGUID: 7jWwZCTTR+acBM4vebJzLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2948064"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2948064"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 00:56:08 -0800
X-CSE-ConnectionGUID: OCVBDTscTwS/0E3O99ZUjw==
X-CSE-MsgGUID: 32Y77RTDRAmqQDeBLS7Ogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8166744"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2026 00:56:05 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQLAY-000000000HT-2kuw;
	Mon, 09 Nov 2026 08:56:02 +0000
Date: Mon, 09 Nov 2026 09:55:37 +0100
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50] lib/dynamic_debug.c:301:1:
 sparse: sparse: cast truncates bits from constant value (3000000000000000
 becomes 0)
Message-ID: <202611090947.TmRoSuzC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: hexagon-randconfig-r2311-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090947.TmRoSuzC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090947.TmRoSuzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090947.TmRoSuzC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:301:1: sparse: sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
   lib/dynamic_debug.c:302:1: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   lib/dynamic_debug.c:303:1: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)
   lib/dynamic_debug.c:311:65: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)
   lib/dynamic_debug.c:313:66: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   lib/dynamic_debug.c:315:66: sparse: sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
   lib/dynamic_debug.c:1825:63: sparse: sparse: cast truncates bits from constant value (3000000000000000 becomes 0)
   lib/dynamic_debug.c:1827:63: sparse: sparse: cast truncates bits from constant value (2000000000000000 becomes 0)
   lib/dynamic_debug.c:1829:60: sparse: sparse: cast truncates bits from constant value (1000000000000000 becomes 0)

vim +301 lib/dynamic_debug.c

   300	
 > 301	DEFINE_DYNDBG_SITE_ACCESSOR(function, DD_TAG_FUNC)
   302	DEFINE_DYNDBG_SITE_ACCESSOR(filename, DD_TAG_FILE)
   303	DEFINE_DYNDBG_SITE_ACCESSOR(modname, DD_TAG_MOD)
   304	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
