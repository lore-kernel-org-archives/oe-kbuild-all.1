Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63423623
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 00:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713572719; cv=none; b=BvewSUcNOkKK+0lRCkUZGxObZd947RuXsN9sSDtPeH2s0qeskb6u46eQWsGY9jzzSi8waVphzLXh2iPz8H4cQ7+jyMqgDobTT02A/u3ZJX+++wLncaZOhe/dxgry3WTG3DIb2yvCFY5k0jsgGyx+ns20ndkqCigpPFElEzyBCjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713572719; c=relaxed/simple;
	bh=wfvc8kpoXj3ILSnxB0tfyOcOhwA2n2AIndvPRiM04pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Baeo6eVzcnn9FnTEej1JEv0jM+wQBVYrukEYA1fEhGxt1UTyi56xD6QlIyAxeJAP8FH53gG94NiUeUHTPZtxFhTIS0rT30Iza1NVfFcvh8ZIBfFeeZkbpIGX/rmzXv36opEo5/hL3QJa1HliCoOcrWK7PJIcG0Jzn5s3F8PB5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1pObrPX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1pObrPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713572717; x=1745108717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wfvc8kpoXj3ILSnxB0tfyOcOhwA2n2AIndvPRiM04pk=;
  b=R1pObrPXfAJ3MQQtrHA7N5NLNyC7QIe5I8d2KJYxOV8oypn8PTLZ+8DN
   hVPUb1QDcoPiEPIMDPSF2a3kdQJoMv9yLOru9ItZvJhVUZd4iYqPl9+om
   ZduVHpH+adWosBpK4A8m4YRyb3SFCDz6a0ZU0Fy3FAhaC9GzQReFeOtJg
   Qr1RzVrXCm5wqNT29FCCgoyVvNrv6plKMfeUYGYKck6b/dqzS2JqXJBJe
   8W8rN92TFvlmI5LMjz1W4eQ4xTpxiz7eSxYtzNRpq2xL0eBubFpbGxR2f
   Bpc/eDfk//fkS2x52p/S58hLi4DZ5E5w5RYDXJadixW8ejxWvD9Naj+HK
   Q==;
X-CSE-ConnectionGUID: L0ijUCaKTImDvYkjcxXkTA==
X-CSE-MsgGUID: Abdg8IZYSuWfm+HjwFZVig==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9417119"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9417119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 17:25:17 -0700
X-CSE-ConnectionGUID: kge3a7ANSNWA8SblMdqjAQ==
X-CSE-MsgGUID: 13o207bvSRqali5gl8VP2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="23551509"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2024 17:25:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxyXY-000AaW-2J;
	Sat, 20 Apr 2024 00:25:12 +0000
Date: Sat, 20 Apr 2024 08:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [linux-next:master 7019/7122] panel-lg-sw43408.c:undefined reference
 to `drm_dsc_pps_payload_pack'
Message-ID: <202404200800.kYsRYyli-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
commit: 069a6c0e94f99437652dbb7229a56233c7d39968 [7019/7122] drm: panel: Add LG sw43408 panel driver
config: sparc64-randconfig-r061-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200800.kYsRYyli-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200800.kYsRYyli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/gpu/drm/panel/panel-lg-sw43408.o: in function `sw43408_program':
>> panel-lg-sw43408.c:(.text+0x394): undefined reference to `drm_dsc_pps_payload_pack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
