Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D071730F9C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 23:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kImskCVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697240781; x=1728776781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bW1SZWdelds/lkiW3SdokPbSY1AXm9DYvOfwLHYRM18=;
  b=kImskCVh/biF3VQEfZp3CVB8pujx8uIPx7hoFNwFMIthkIcaP7SAElkN
   utr3dgNzt86Ts1r/r5dqUnzW4nrzYWeEOZ+4xfr+OUdzgmTSxnU0YSAsK
   hk8r00FDkx4LRPblMbyYciYQ4IjKcGtcbANb9Uk1cjOaXyAcVQ9Qv2mZk
   fMtKTugat3Cwvfwo6IiFWWg4uQ06i/Qgvm2Vu1dy74Aseib0O70xbXiBv
   oKf9ek4G8Ek9ZBT220Liw/L7z7zVBZOkvLlLP5dZQtWOk1p8gc/FXVZ59
   Fxs/uQ5A8nQe2DUPZrHJ/CdLkiaeT97G8aWBNhQVipwNfFPGsUEEiqNEB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389146483"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="389146483"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 16:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754884193"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="754884193"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 16:46:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrRrC-0005Wf-1z;
	Fri, 13 Oct 2023 23:46:14 +0000
Date: Sat, 14 Oct 2023 07:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Malaterre <malat@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: cc1: error: AltiVec not supported in this target
Message-ID: <202310140737.65pfgcSI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mathieu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cb1f10d8c4b716c88b87ae4402a3305d96e5db2
commit: ebd1d3b74f8542a8f3bb80b453692d6d18f84071 powerpc/32: Move the old 6xx -mcpu logic before the TARGET_CPU logic
date:   4 years, 10 months ago
config: powerpc-randconfig-002-20230923 (https://download.01.org/0day-ci/archive/20231014/202310140737.65pfgcSI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140737.65pfgcSI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140737.65pfgcSI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: AltiVec not supported in this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
