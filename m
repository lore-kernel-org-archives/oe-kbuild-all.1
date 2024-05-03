Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F617C66
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 03:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714705996; cv=none; b=f/EkZTwAed2D3RrD2g4sjniHB6SzgV6kkqsDusYZsLpB+jgnAFKMbWaVWcGw0BXPdJgVXPTsVePRgnBkYYMQSYLe5TT7E5sPsal14MST3Kzs5DQmMRxErXXFW15R6Am5cbIhl7JaGLl0Njv040DjpFW/JEnfFGPXj3ksaBL9XHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714705996; c=relaxed/simple;
	bh=oRomg/pJwK4hCLw3O4fPQQL4SEcPNZSXLKhwHTyycbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIcQes9oBjNd9qqQmBYJerwSannId5GfxJ4cSs8E1yMVVR5YTb0gGD8tJQraWo5BoWX8XfTTUj0PLwnDAbEpiw16KKzWx97+AbdWk0Q9tOAYOZNGLQK4aJSy2Dw0BOPAs5HulqJoCtuoPwVRMc4qDaZLzJCHOSuux5VE1DAzQLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8ye8vsF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8ye8vsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714705994; x=1746241994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRomg/pJwK4hCLw3O4fPQQL4SEcPNZSXLKhwHTyycbk=;
  b=U8ye8vsFtEZczwUiD5XSLQrwFFK3tiJgT/S4kW6w6p1v5BYR7JIbAMb7
   +G+8ijWL8VSjoUB+5PNvD/zMK7Ed4Vo4bh1BcCVbErN+4w5dPzbj1FyjZ
   MR+4lX50dCUSmGSZEKTpP53ipblE7EaceIrhllIoIqaDmjjriRKG269BL
   TGc+VVep4msJzrbK7DQjo6Q+d3w3I+2Ec+Xq79f+5CWeNFH6yS0Vx3/vT
   cBO8EU62Wlsvzbfg+rExxhuJf9HGRqPw6jr7yyHLs7hdLuiXpOrZCFFGP
   h4DY9uXGFwEc4cpNblS/7JWdEkRzSTUKKA3CMmgD1qz2qRaffLvyuueaT
   A==;
X-CSE-ConnectionGUID: KyM9KN9LRliCcirz9SGCRA==
X-CSE-MsgGUID: swkhmxYZTHiFUFKtpZ/qNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21920338"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21920338"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 20:13:13 -0700
X-CSE-ConnectionGUID: 6JUNAb7ARGyH8eAksn71tg==
X-CSE-MsgGUID: fikV/KRMSnKqVAWEgavhOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27434166"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 May 2024 20:13:12 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2jMD-000BGN-2g;
	Fri, 03 May 2024 03:13:09 +0000
Date: Fri, 3 May 2024 11:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10364/10463] panel-lg-sw43408.c:(.text+0x3fe):
 relocation truncated to fit: R_390_PLT32DBL against undefined symbol
 `drm_dsc_pps_payload_pack'
Message-ID: <202405031157.L9nq7t6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
commit: 225051a2a11ca1fbbc3fba67b635a091f40badeb [10364/10463] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: s390-randconfig-001-20240503 (https://download.01.org/0day-ci/archive/20240503/202405031157.L9nq7t6s-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405031157.L9nq7t6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405031157.L9nq7t6s-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/gpu/drm/panel/panel-lg-sw43408.o: in function `sw43408_program':
   panel-lg-sw43408.c:(.text+0x3fe): undefined reference to `drm_dsc_pps_payload_pack'
>> panel-lg-sw43408.c:(.text+0x3fe): relocation truncated to fit: R_390_PLT32DBL against undefined symbol `drm_dsc_pps_payload_pack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
