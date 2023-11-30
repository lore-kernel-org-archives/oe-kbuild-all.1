Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CD913AC8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H56wbixP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316502; x=1732852502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0xKy901/7VwT5TNjOgy05fhkzB5Mzul0r5osl4qal0=;
  b=H56wbixPPThDBitdiqORABwNgePN9/5hptai9H+5a/VjAb5dOT2R7bpQ
   a3niClvLuu4ypLktUevpRIj6xLl+IleRISxDU0ompHlk1nO5ZDVSLZ7Kl
   jiByl5dbqDnnw65abaFhf3hOFKxPhQA07rdaS+UBNHatnHKT5yUlwndNB
   qyA5JKsJuRaaZIPlhs89hEkLWoz181IhAyFCScum0l6qbt6XtkrGI1YEd
   IsE0TiNnQVY0T+M3w80M7tgwR04xH47UzC6B4tUDmYviFyzo+gCsrKpiC
   0lWkubB1ugkiN5k54V8HAQ4OdPqeb2BB7gfrfzvvG7FO610gl9WbdyBr0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459757277"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="459757277"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 19:55:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745488150"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745488150"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 19:55:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Y8g-0001J5-0i;
	Thu, 30 Nov 2023 03:54:58 +0000
Date: Thu, 30 Nov 2023 11:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4851/15770] csky-linux-gcc: error:
 unrecognized command-line option '-mtune=cortex-a9'
Message-ID: <202311300813.YhcskB3l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/15770] Merge branch 'mxc/next' into next
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311300813.YhcskB3l-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300813.YhcskB3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300813.YhcskB3l-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   csky-linux-gcc: note: valid arguments to '-march=' are: ck801 ck802 ck803 ck807 ck810 ck860
   csky-linux-gcc: error: unrecognized argument in option '-mfpu=neon'
   csky-linux-gcc: note: valid arguments to '-mfpu=' are: auto fpv2 fpv2_divd fpv2_sf fpv3 fpv3_hf fpv3_hsf fpv3_sdf
>> csky-linux-gcc: error: unrecognized command-line option '-mtune=cortex-a9'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
