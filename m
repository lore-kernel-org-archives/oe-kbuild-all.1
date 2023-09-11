Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52750259B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694420811; x=1725956811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iCY/BIim5vbeWGlK5PspP2psohBuRFW8H+2Rmu3goaU=;
  b=Hdeq6jlNWoBpnunVACDy7KX+86FswXHpXgxVyk0vfnWIAZ9Wp47vO1nD
   bhACnWtGHBggmwPNCCridpdQyUhRkdOn3Zj/AKGfExGJMXlGdgx64buJ1
   XzHcTjEKL0k9nzBOO+5GZTpGHUSyt6GbbBkJ3C+AUdyrkKwF83kgjhMkq
   gQu/Bc18tstLds0WHwHzCn19QOuuNvDBXcMJ7raz2YKKuFd3I+kqjak6H
   UBE9nmjfZDFF7tOC28Gxwwe50GxO729P6Qwwpn6jPCpV/qtXli9490V0V
   MV108ihK9Wa9PISOcQb4vcxHrcs0rconpc/JamA2qtqKlEJdkHkKhDpGm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="408993925"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="408993925"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 01:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="719912123"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="719912123"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2023 01:26:49 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfcFr-0005ze-0l;
	Mon, 11 Sep 2023 08:26:47 +0000
Date: Mon, 11 Sep 2023 16:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 75/88]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c:43:1: sparse: sparse: symbol
 'ad102_gsps' was not declared. Should it be static?
Message-ID: <202309111634.EHdICDnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   89551217290c31848a7662d659ced417db386bc7
commit: 7d17cbb24a70f9a41a9893cab9607e8eff59ae5b [75/88] WIPdrm/nouveau/gsp/r535: add support for booting GSP-RM
config: x86_64-randconfig-121-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111634.EHdICDnj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111634.EHdICDnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111634.EHdICDnj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c:43:1: sparse: sparse: symbol 'ad102_gsps' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
