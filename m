Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE601851
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 17:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688838274; x=1720374274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MiXC+ajh1OmnPggMuNVxc4a3Q0DuCcqGKOIl/YqVpDs=;
  b=CsWsOzyhS/BkWiRue2PorkKx15XWnet+xzyMOx9kcSB4Z4pI910FJAWJ
   NalAFdGNdbGI6qvmZ/m2Iqe79iXtyc56W2fSIacQFvndDMBQ+la4ujf3j
   akrT4t3u5JtkGhDrTBoRGRZnc37tL2BrWEQnoKTPpSbW+sFqa6uSiXiME
   i2wxuDYAN2WNCLy0B2VTPstxCxmSsTe34dm/f0WbTghcclUmjShhkpalM
   nXP68JUvnqq37Ic/mHM945HTCHCLmoIVVD/GCFLmelwElZUxIfsZZTOHk
   vkcEDKjXPYJXbo3TZwKue78Aplfond+zCK26/oGBgjOkFrgzQcSGssmJn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="343677148"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="343677148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 10:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="894316697"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="894316697"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jul 2023 10:44:32 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIByx-0002ps-28;
	Sat, 08 Jul 2023 17:44:31 +0000
Date: Sun, 9 Jul 2023 01:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 151/372]
 drivers/gpu/drm/bridge/tc358768.c:954:2-3: Unneeded semicolon
Message-ID: <202307090134.7EvVyMbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   73a7788a3288bd71ad780326a7320681482a03be
commit: b80f853beeffb045161b5a08059a9c08ef838f56 [151/372] drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
config: sparc64-randconfig-r063-20230705 (https://download.01.org/0day-ci/archive/20230709/202307090134.7EvVyMbZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090134.7EvVyMbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307090134.7EvVyMbZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/tc358768.c:954:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
