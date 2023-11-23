Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7428C3D9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 01:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJVAscEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704510; x=1732240510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YGGmJtt1IjEG94Jb1QiOtu7AZ7FP7UWnwmnhuKFgrIg=;
  b=KJVAscEFwbsp6chjEC6+67Ef3ZQ8zRXtySiS6gPwkBfB3WSfW6vAj2mq
   mb/JDBGAdd/jA/ih3QY3I+3ClBMpJcQUJ/SAdhAj4XMKDR0oQHAKo/kOV
   PVM7oDFHjvpjA3ObmbmdxXlbpc1ma8j91HZupf+oxcptJIsqDynsuumd+
   M7Ta+TgX9yzvcTSye6z5JZ+xkMXBx9+ktBIgMOwWJTDm2xXtuYwW4YEJJ
   zCCAX+M62nYYuzKUExJa9iRK7M6QInnfqs4SSdU4txetDhrKSq2GosNYH
   bt0ZfOXxtVVCs03QJ4hY7F1g8NqdHM+NGR4nfiPPupwnU7/wse9FU7Fd2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458674148"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="458674148"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884821102"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="884821102"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 17:55:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvq-000169-2S;
	Thu, 23 Nov 2023 01:55:06 +0000
Date: Thu, 23 Nov 2023 09:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileeNfb1k 27/30] imx-rpmsg.c:undefined reference to
 `i2c_find_device_by_fwnode'
Message-ID: <202311230506.DPF9vvYY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileeNfb1k
head:   b1cea462a79316bd619173f1ded8b28202b5ce3a
commit: 5d9f746ca64c3ebfba3b650dbc4b0de705c83f3b [27/30] ASoC: imx-rpmsg: Force codec power on in low power audio mode
config: i386-buildonly-randconfig-004-20231123 (https://download.01.org/0day-ci/archive/20231123/202311230506.DPF9vvYY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230506.DPF9vvYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230506.DPF9vvYY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/fsl/imx-rpmsg.o: in function `imx_rpmsg_late_probe':
>> imx-rpmsg.c:(.text+0x4f): undefined reference to `i2c_find_device_by_fwnode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
