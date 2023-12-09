Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20875394
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxPyYDS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702106819; x=1733642819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/qoP10sKcA44ezfHxQ82xdxxyKqVOShZ1QXcpJR/+s=;
  b=mxPyYDS5GyAoPBpYrUSfsCOoRB2hjEe6Tnk24xReeyo/2XWTJ05TXJ0v
   FSOSJ5IKmEmQxnh3pcrwGVEFLIUjONIOhwxz2Q5EB3lNCpvVb1PNEPJ7Y
   qDoin00WBuCQY3lR5FIRJHsnxExvm6VdCG9JgPZfBka8QRTtMBUeaYuWX
   Kqjtvzv5M28AWodzsNYed6zJqubAgDxWuA3q0rhSAoGk20Py5m/10yUbM
   fVO7Rd/VQn9/FEn3syTXADgYxgeMEr0E1tf3+sKt1Etic4kg4wvTTCTuK
   K4oipPzDLp/bkkV3qLsh1hmGDTqCVub5TR1Bph15/tlXtB/EPxiSAho00
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="393366774"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="393366774"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 23:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="772370655"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="772370655"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Dec 2023 23:26:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBrjf-000Ey3-1y;
	Sat, 09 Dec 2023 07:26:54 +0000
Date: Sat, 9 Dec 2023 15:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5610/6165] cache.c:(.text.cpu_cache_init+0xe0):
 undefined reference to `r3k_cache_init'
Message-ID: <202312091549.3vakRgsQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
commit: 13446ee48dac9ce1ef935cbe140534146a0a69a0 [5610/6165] mips: move cache declarations into header
config: mips-randconfig-r001-20211212 (https://download.01.org/0day-ci/archive/20231209/202312091549.3vakRgsQ-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091549.3vakRgsQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091549.3vakRgsQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: arch/mips/mm/cache.o: in function `cpu_cache_init':
>> cache.c:(.text.cpu_cache_init+0xe0): undefined reference to `r3k_cache_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
