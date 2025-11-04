Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1532D3A6A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762237641; cv=none; b=QVEftUY8CITvF6nME2Qutfhq03fsiP4KR85mNmYPfj+8XJpuiGMGW1orl1+n4c0NwxBTEV1jldZRw0rBPWexVxNwm4kHKcXJ9L40CH7Rc2gnDAIZc8MH9gYq0e+eh/5LeOjca0EO0L5QuizlftwoFw+LVPM3qoqxKlOTOaF0mm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762237641; c=relaxed/simple;
	bh=JwqAMSDA8f9S/OAXyQc+WXEVfbEc77fOsiigq4pif2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aG8uQ+fBUyQaglLwahAi41y5L+7926qaTd1cePA0LN5EWiH/HIvJvAm+ynmEvo6fGV7ZBWIeVQrkr4OQdrWf67omNhXNAHYxVU4TzTaeGze4GfsG1G4YEYDJ32U/iKYJtLGuNUdGMVUALZdLD3viqBQj6CNaIrLDOlpBdFgiS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rc/H+eNV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rc/H+eNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762237639; x=1793773639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwqAMSDA8f9S/OAXyQc+WXEVfbEc77fOsiigq4pif2Y=;
  b=Rc/H+eNVEwsXqFKZLDy+5zmnmPBhh03PVPYSrYvGlPfRtyQxLRyxV6sl
   qKN9mlxYMPSwQoJUKGpeFo2dJT6TGKb7UHAQEm4KuEVTSFmA8MOEBHg6p
   Kln+33bqsf66NYudDViGF2TjjYAW4PL04fzFrdPWBMOWUi2yMa+3y/JkM
   JZjsDpzamYJW+WvkyuELJwNMyqtTsV62kXGy4Q3VY5DGdmymjdN9Yb8JD
   dTBRvsRCqnK80WXS495Ge7woCEkndM0hUht2bMLHGij1/UdsQOWpt9/h3
   XiEih5inp55MgNGID1I01nkzQcAdq+iczUY44K3o00PkkUcIugWGzgwQT
   A==;
X-CSE-ConnectionGUID: uwQa+jevSvekk6ABTEPqHg==
X-CSE-MsgGUID: 4Tt4ToYhQr2W0SqWDRMwNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68162068"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68162068"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:27:19 -0800
X-CSE-ConnectionGUID: bQDAjQjNRQqSvduFRVhqBQ==
X-CSE-MsgGUID: 7H8MYjDkT3Kouj9X0JkdQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="187520939"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Nov 2025 22:27:18 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGAUF-000Qze-1n;
	Tue, 04 Nov 2025 06:26:15 +0000
Date: Tue, 4 Nov 2025 14:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kanjimonster:b53/wip 10/12] ERROR: modpost: "b53_vlan_msti_set"
 [drivers/net/dsa/bcm-sf2.ko] undefined!
Message-ID: <202511041428.TDEmKYrc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/KanjiMonster/linux b53/wip
head:   4bd0d15e25ab64f157bf00b4c39bd1ef94da1ff5
commit: 70fb214830ff40f92fbfbacf66223b3cd3e803b9 [10/12] net: dsa: b53: add MSTI support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251104/202511041428.TDEmKYrc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041428.TDEmKYrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041428.TDEmKYrc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "b53_vlan_msti_set" [drivers/net/dsa/bcm-sf2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
