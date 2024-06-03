Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47B58062B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407819; cv=none; b=mhNqEcb5vav2BaiFHPl6x/j/4t2cmcf3w9gWeUUJ7gbqy5uGVTT3W1cH6J7/NFpCgy0+wkgu8F2xNWDaGbZpkeNSC//qeLay9RUvAaoWh+N+WZfPmuDsdvmkqdlDn9HyfRc/Da1BZ+MeFPNaaBGJh/aQRk9nIt++V1YUZoTwd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407819; c=relaxed/simple;
	bh=QJgyk4Hqv6L3qgb6EA9natEWIOuUpjgY6eqT1OOKyQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i04uE+GuBMOYNb1gKyl7hriVMvWGA4cAS0DJsUEFrDLsU3AR/gsjrcvwxalVmO05pEI0Q7ioQxpXQsFA9t2rKCAJU2AbDrXBlDQesux7RdDHJTmccT+xxqYYg6Q0RDBgyFHySIFYUx6RAiFPJzJaqiZt/RLmttU5G2XAzCf96cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG+qKAHX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG+qKAHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717407817; x=1748943817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJgyk4Hqv6L3qgb6EA9natEWIOuUpjgY6eqT1OOKyQ8=;
  b=NG+qKAHX+NfRqd5sQl+hN0WqkimsSK97ZbekYs5yYahQ0FRzuamelAIA
   one5p4gD27aikM3kCxCpePPFcfIOVMln5eXS/5KtvrIkxQ8wt/hTdqRen
   JfAnH5SG59399RBxan2w7nOdtKnZp4mDrh18gOwy/fAaOCiLRV2xZnThu
   kZ0/dpQCwrN5Ozyo+NNz/MvH1TBc711MhpDnolZh2pydeWfSrxSszqLuO
   YVO9yon4+abrwueJRhXcqlpPpHa2+pButNA0g9b+UV91pf6CCiKFKHVbw
   CTqYW2zkCXFBpD4fCVJxvSZeBvaqZ8g4FQQYlupnCljW2aS1afnYfXbWd
   w==;
X-CSE-ConnectionGUID: HDiIehygQxS/GY2Ynbl6mg==
X-CSE-MsgGUID: DpwlfdwzQsG5HcuEkMveEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="31423442"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="31423442"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 02:43:37 -0700
X-CSE-ConnectionGUID: auV+l2NSRUWEEZcRWk7WFQ==
X-CSE-MsgGUID: z6sJWO59SrOIzlDTHPVH1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41758939"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Jun 2024 02:43:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE4Dm-000LIX-26;
	Mon, 03 Jun 2024 09:43:23 +0000
Date: Mon, 3 Jun 2024 17:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-ak4619-for-upstream-2024-06-03 7/7] Error:
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts:30.2-14 syntax
 error
Message-ID: <202406031709.kVkSgWtQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-ak4619-for-upstream-2024-06-03
head:   083c2d07c3858c8430a8faabbc29e56905da9dd3
commit: 083c2d07c3858c8430a8faabbc29e56905da9dd3 [7/7] arm64: dts: renesas: gray-hawk-single: Add Sound support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240603/202406031709.kVkSgWtQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031709.kVkSgWtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031709.kVkSgWtQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts:30.2-14 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
