Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B727913FEE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 01:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727918993; cv=none; b=ulr2XFOQxs22FUXfheqnri3MQ/7rSGv7XBS3oAvfIzVADH1pvEsksytqQCrf4Vo5xFiv75E/lvXXTxYkb1lCOtDq545PEGIYWYSW3a/93EhbFT9mgcCOxMQjbRolavBmuYsnBHNVEhXhe6821DRQggFfIotYuWzXtGCYtgZQ280=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727918993; c=relaxed/simple;
	bh=xLUB0PSwZA72TQE5v+MUxaJouX7SeDR5OZmmYtqbkNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mil7vtcQLHydnOWX6PRnbaihAi5fBLkyDPoKX3yApr11dQM1yFg1IC7TfGOnhnFnA/W6u0HhYnWm4bB1Mn8xwXw/OIRfS+xL5bMqs9ecY5S/lRj9RdNhsWzA1zWSUAqcys5HECLDk/vucauD9CbbeFTJG/mGqahBhdUtE7+vLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilspwXE1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilspwXE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727918991; x=1759454991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLUB0PSwZA72TQE5v+MUxaJouX7SeDR5OZmmYtqbkNI=;
  b=ilspwXE1j/gIg03jpDi+Gq+siWPMeucPbel9aU1+/ZmKWNrATawBuDui
   QWCf6kfVw2WtK9cBVs1clxdMgRwlq86fMg9SX/SQeTi7mBeSApUGv6awl
   lfHkxRwGXTl0saO2ZUq71lXQQvP/o38hUEBVJUaojQ5cTLhaGiPEspMP3
   Vo40UjvLMTBLsVaKa89KMnCmPw2DCPaVmrakBJYEvg3FyjHx30dVabgHO
   Mlhk3RZc/jf0r/3qGITe9ADH83KssCk7NK2Cikf9pLIoCnpzqyKKL5PNs
   XjO/D99tdtzgfQaue1IPGHhtmT6sh1YjbnW6HHrnWhhxUh1xcZJNMzKca
   w==;
X-CSE-ConnectionGUID: wD13ySBCTCGFvvLKbPt+sw==
X-CSE-MsgGUID: b3wEZwaCRgWME3hd5y8vDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26974693"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="26974693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 18:29:49 -0700
X-CSE-ConnectionGUID: lk17S5FZQ8m2MO1V2aaZgw==
X-CSE-MsgGUID: 2AQD/e23QEe3VkN8VYw6/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="111652581"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2024 18:29:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swAf4-000Umv-0n;
	Thu, 03 Oct 2024 01:29:46 +0000
Date: Thu, 3 Oct 2024 09:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20638/23811]
 drivers/i2c/busses/.tmp_i2c-zhaoxin.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202410030906.pfPY7k7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 735c81b4d33c46ea097f6437f63ea624ccf6dee1 [20638/23811] i2c: Add Zhaoxin I2C driver
config: x86_64-buildonly-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20241003/202410030906.pfPY7k7C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030906.pfPY7k7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030906.pfPY7k7C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/.tmp_i2c-zhaoxin.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
