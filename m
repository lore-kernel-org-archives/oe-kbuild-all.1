Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94F36B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 00:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcGeeC8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700353548; x=1731889548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xe7/oYrFAzeKbvmIbj20khlDsQwQANsaoH/Og4XQSII=;
  b=UcGeeC8MJNzklrX6ihNdtr1cJuyYu//9nzsMtMMqlnsXnXm4wtO0SL8C
   b1YAtKNBlwngfEfKm0VEvNcYxe9YZwgXU3dTjlfHKGj1jgqcYgoiVaqSQ
   6NBWX9P+xtuuJFnwZaZNyBuchVEGwmDYWhvg+jJN6/fc/dZYYA6xlSdLw
   GYMhckaNbmioBCqttINVil+SIDp8BYL4ziA5kRdi61CkikmtyWDcCuJki
   41Nvbyk2QVa09bYIYx0Q4OLVDj7ajEM3ZotmMlMbk97CZN0e87I1yEQaa
   zrLLpYSRhKmf4E7x5Uhd2F3KBeEy3rPCpu9gHUbjiBKGGP/a05daZOCSf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="388609732"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="388609732"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 16:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="795141615"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="795141615"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Nov 2023 16:25:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Vd8-0004T9-1g;
	Sun, 19 Nov 2023 00:25:42 +0000
Date: Sun, 19 Nov 2023 08:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yuan Tan <tanyuan@tinylab.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: kismet: WARNING: unmet direct dependencies detected for ADB_CUDA
 when selected by PPC_PMAC
Message-ID: <202311190853.4Bo76T6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f1fa2419c19c81bc386a6b350879ba54a573e1
commit: a3ef2fef198c25c1d9ac6ff89fd50230e9507207 powerpc/32: Add dependencies of POWER_RESET for pmac32
date:   9 weeks ago
config: powerpc-kismet-CONFIG_ADB_CUDA-CONFIG_PPC_PMAC-0-0 (https://download.01.org/0day-ci/archive/20231119/202311190853.4Bo76T6U-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311190853.4Bo76T6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190853.4Bo76T6U-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ADB_CUDA when selected by PPC_PMAC
   
   WARNING: unmet direct dependencies detected for ADB_CUDA
     Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
     Selected by [y]:
     - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
