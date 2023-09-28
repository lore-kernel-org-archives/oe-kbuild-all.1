Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6C79F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695932910; x=1727468910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCy6eqo/oKm4CVLCojNICH3uPk5kqeZFvJVk2dpz3II=;
  b=ZNcq8HAa9jir1lwRsbo/UM81/XdTRjpsAijVPkxjbCYVWM1U9yU92wTj
   DZnE2sE3waTkM+3E7A/+Ryc5M+h8oI2ZeuqWsNw+Ul1hnaflMQf418d0b
   jSsfQ+l8D+L05/k9SLTUeerTbsOKlPKrkpSrGvap81MVM3T9dI9NIUpK+
   h1xxnmqo51v0/pzMjq1wTg2F/4ai/cQRNGGF+5aSMSXm3wHG9tVyGYeBW
   XUncMRcm5JHVoIyB+RePTlXPtB6dbUC1v4AbPBRwVEgDiMyFWhuJJvLkz
   Me8N90OFAnkeBWC4uRsKGrSuzstLGqGQda2EsRHjpNVcPZgz5Onh31vHN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="367229340"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="367229340"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 13:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="1080686843"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="1080686843"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2023 13:28:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlxcY-0001vN-2T;
	Thu, 28 Sep 2023 20:28:26 +0000
Date: Fri, 29 Sep 2023 04:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Malaterre <malat@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: cc1: error: AltiVec not supported in this target
Message-ID: <202309290441.KPUf5M1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   633b47cb009d09dc8f4ba9cdb3a0ca138809c7c7
commit: ebd1d3b74f8542a8f3bb80b453692d6d18f84071 powerpc/32: Move the old 6xx -mcpu logic before the TARGET_CPU logic
date:   4 years, 9 months ago
config: powerpc-randconfig-r035-20230908 (https://download.01.org/0day-ci/archive/20230929/202309290441.KPUf5M1o-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290441.KPUf5M1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290441.KPUf5M1o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: AltiVec not supported in this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
