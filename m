Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D87028F5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 06:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731825069; cv=none; b=IewSYHSB/EMXBRmYTOwIdl3awf6TSheX/Ao9HPRY1/G0dbRxl0No7TPtVzjRlLBaS2JIwOt8qvBSVV9oOVKPgQzBKPXmem6bXvC9voC2Jd5w8sn0znxU1nAHb9l+L61r4X6CUXQ/d09EIiDdU7LF3SaJaoaWgkOk4CE13O1aLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731825069; c=relaxed/simple;
	bh=Lsp4q6IBsPmY53vrFSieT1nyTBQLZbrugkLZcqeG1BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZraAK0cERFFsjVQM4iZUEYszRxCwfpXh7L4/KEjOrbtNgH8sYd+VuQ471IYi4kVmlgP7LRvXUIURj83pTdSQYWuSI068i3+2G0htR2+KgIvDQSoSzJyZEaVCl2Kf2mHamlOY+ehMQfzp/hv9jAsQIZBKse157E7FI+j86snMSpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epBoqeRJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epBoqeRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731825064; x=1763361064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lsp4q6IBsPmY53vrFSieT1nyTBQLZbrugkLZcqeG1BQ=;
  b=epBoqeRJjkwn/ToBvLpaS6gI24rAA9HG4ey/njMZps4KBU7PoGCBAPfZ
   ooAdqOAFYJCFIr4j0dSaHtNlzL3Xb9IsYxfNiY3zett3k3UtPp0kYd1x5
   nmDzJjTwfOVpe86i1C08VxQKaOxfxbzvgTwXl7KwWJPQmJpD1hOJEr0eg
   pLaDRYI3nXITIkXY7oPTLD5br5wR3XZUjlwBkjT4zwql00X0Dk834Bo0Y
   Slo2wHiFOyTiG/R1Y0JeBc6xfLvRpJnwnsf5eT8tPmVO+k4uEFItsX1VM
   MamCfvHIJhuo19pmGSSpMe76ZDsI2AshaMiAhZJeiULgsirhSRB7LmLwa
   A==;
X-CSE-ConnectionGUID: Vl5arLjUS2211bLey5UpZA==
X-CSE-MsgGUID: p3VGdh4YQyu4FiMrfu3AQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="49322293"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="49322293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 22:31:04 -0800
X-CSE-ConnectionGUID: Hq5zgO+WSv2ECutw4mUcAA==
X-CSE-MsgGUID: GDQN9cLETF6HOc19q0d4mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="119777306"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2024 22:31:02 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCYoG-0001bB-0W;
	Sun, 17 Nov 2024 06:31:00 +0000
Date: Sun, 17 Nov 2024 14:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2439/2439] arch/x86/kernel/fpu/core.o: warning:
 objtool: can't decode instruction at .text:0x26e0
Message-ID: <202411171458.FfbMIe5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4cbb736395eb31ff181c4488182276601992fa0b
commit: 592d168ba66d3bfe054e06e484c53267990f3606 [2439/2439] !13239  scsi: pm80xx: Set phy->enable_completion only when we wait for it
config: x86_64-randconfig-073-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171458.FfbMIe5v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171458.FfbMIe5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171458.FfbMIe5v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/core.o: warning: objtool: can't decode instruction at .text:0x26e0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
