Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD556DDBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735677161; cv=none; b=PEu0jYEVPwHGOc+OR+BhcGi40qkQcsFMqcAo1Kt8LxJH4SeTCSS7IKLnWUTnhxxDmYJ26Nlcev2FXYyFC9Elbzsu/7S5LaR5JdSkm9XJzblKz8jist4BYBGGphCTttqWQVs898utjmD8NvqV5Rs6rQ7XRb/gGqdz9zHHHlaSARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735677161; c=relaxed/simple;
	bh=000OG3sjJRaeX0lTLp5ECeVFWmx4I0vlyw44umys7YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QONWITIzkvqWc6/gMUTNlGl52ZB+5vgCXCLsGJY59Ez8X3CXWzpGG3n8xJNZjYNmGJess2kT4zvS4ELLzoFUdmVJbLB0Qhh0vhoyZysK5qY7pwSC+Hn6yfzw56y5/Htx3FReSow3JNvfF3mjcFWyBitTyd//LomvihIlz1R+g2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EayV2LGs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EayV2LGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735677159; x=1767213159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=000OG3sjJRaeX0lTLp5ECeVFWmx4I0vlyw44umys7YE=;
  b=EayV2LGseuDLy/PhUOzk2o/yviVG6+SeEX1TmBvp3qCwnzeRtn6Cu+xZ
   YRPIQDxZo1Ba0quraG8W9ecplidU+Pb1taP2/BDHH0EnCNaq9OPgU48h9
   cpEBPQV7RYf8yuiuNNaR+NVr3PjWvsGIZwMhPrZfhtygZ81DtW01IW0Bj
   D/Jm6mv4aP4SvpXoDVnjnVRl12A3JEepjFOflqLsq4ZCLKlBIHTmQtJAa
   t8VgjY1MQMYhN3TibPTwAsTN5ObndtzYfcDa7g1TIo3zkN6NXAsBVDttH
   qt9kPRi+9fPRB8iXOp1VfulPGVXBi7TwxKfdFLIZ4NXpmmhqRHcuw7TGT
   w==;
X-CSE-ConnectionGUID: 5SJq0ymmQTixsW4j1bYsBQ==
X-CSE-MsgGUID: 2j/YseE+QDmJuMOCTjIFMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="53500079"
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="53500079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 12:32:38 -0800
X-CSE-ConnectionGUID: vTRHTtHaTAO2oRziRbQEaQ==
X-CSE-MsgGUID: eAbVQPWrTraPNck8jc8dSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="100975871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2024 12:32:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSiup-0007Qx-1B;
	Tue, 31 Dec 2024 20:32:35 +0000
Date: Wed, 1 Jan 2025 04:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2602/2602] drivers/regulator/core.o: warning:
 objtool: regulator_resolve_supply()+0x73e: unreachable instruction
Message-ID: <202501010440.4WBUoJJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: 63b923a7cf01549235373fdd2c844555c2bf398a [2602/2602] regulator: core: Avoid lockdep reports when resolving supplies
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20250101/202501010440.4WBUoJJY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010440.4WBUoJJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010440.4WBUoJJY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/core.o: warning: objtool: regulator_resolve_supply()+0x73e: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
