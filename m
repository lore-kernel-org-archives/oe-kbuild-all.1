Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350B1BD9EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 20:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730320478; cv=none; b=RgqIIg5QCy7uEOkX2HWy9OdHUdIpAkd0uslPW/35wfcrMdJ0oKqQTYGJ1YlFfXohy05py7JJzZHF/dIHT7EPzrqlbrX2oQtVZwQztQFasf8gKQEbLEVVFd043SQFU2ngIqTcOBcmjtV9SSbc9ccfp8I0+2YbZMkqBkCiHcMpxg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730320478; c=relaxed/simple;
	bh=qb2w4/XvZUokyOXsRRYGVRoCnJ8eqsvxitDOxo7kKLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeMncdCjMd0bIH2cxYxQ9z9skYevaaZl2tmuyjUzcadKbdhkr4cMiZ5SfmoxC0SM948HAbZfIzYyPvTDT1sdy41lTnY7+yb4T2YefKbttA68iHGeWpQUU5RjC30Ms42pPvjGcgvMzKX78wKaphqU2i8pzP86/aWIlmQbTC/M6R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JK/oaCl8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JK/oaCl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730320476; x=1761856476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qb2w4/XvZUokyOXsRRYGVRoCnJ8eqsvxitDOxo7kKLA=;
  b=JK/oaCl8uBzaYggaUjzYtkXKFoi4AAB7RDu2NYRz+4tIWVA17uLlHF8G
   zU6v1LTEHnbZ0OG/UNtpk2KoaKfTM+a3FgwMghYBCoGPvfdy15elXCJXq
   isBZQBxxYbatGNDsTtiizSENjoNMCcM/8JtOWj7MSvKq6dAXRLppLJ9+l
   +gKTq9l0MqYNZiFxYtBfha0D0BiYk0ZP0mfy/ICVMQzx0j1aRPVWvVDVb
   7H0O3cZ1UimsiDIL6E+f3nSzZrRae88lfRniOoenLsxqiWxro+SFeRN1T
   g2PiTW8IE4Po6JTn/uQGyFCnHror6O5ca2M3TEb8bPQzanuoKRUoyf9p5
   w==;
X-CSE-ConnectionGUID: 8n4RX3lbRDa1+rw6qWhw2A==
X-CSE-MsgGUID: QIeH6//QQJCUECDjcVXakQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41440262"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="41440262"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 13:34:34 -0700
X-CSE-ConnectionGUID: ZTLR8Pe9RlOjgossnn64YQ==
X-CSE-MsgGUID: pOKBJ6yAQwawRKuq/3QPYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="83247481"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2024 13:34:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6FOg-000fHc-22;
	Wed, 30 Oct 2024 20:34:30 +0000
Date: Thu, 31 Oct 2024 04:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Drew Fustini <drew@beagleboard.org>
Subject: [esmil:visionfive 31/31] firmware/brcm/brcmfmac43430-sdio.bin:
 warning: ignored by one of the .gitignore files
Message-ID: <202410310436.nUWb00Jy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   19c7c4e87e562af27aac5add4be1ba1f483900da
commit: 2c60958976538fa12d5900b74825ad20ef644600 [31/31] [NOT-FOR-UPSTREAM] Add build instructions
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241031/202410310436.nUWb00Jy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310436.nUWb00Jy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310436.nUWb00Jy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> firmware/brcm/brcmfmac43430-sdio.bin: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
