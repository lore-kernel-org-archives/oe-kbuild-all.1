Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670FE52F93
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re2YBlGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703535364; x=1735071364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6BnSte6SZJoK6x38nB8py59WV53mLXW85/vnQ3BCFI=;
  b=Re2YBlGiWbmdzrekS2Pel9cSHxxdTmPlhzpRVj17FiQepKgaz3jGF7+A
   Qr6ZlHq85kKMRVwdYTmhCcoGX4EVyWeabBb3cWlerrRWFdQeN7pSQNFC4
   ncq58UfPrCH49A6ei2svY+1E+vMIj1cE/iMKQV4sMQQnOA2BdkUHxFuKs
   4tkAPXasK1GouumZwC9RjxHbdRdZZG/u+glgjxqURcHu7Yis0okTgFRv1
   RE+fxzNwn+siNlCCyli4l/mujpGWfvYWOt4RmOLsGopxRBHox/JoDoXnz
   n9eU7HqVYEUi0OTHaV38lUbo1+BW+j/aMuL2fs/3kaWybeHrRZPEKYiI1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3134481"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3134481"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 12:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="753993985"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="753993985"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Dec 2023 12:16:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHrMi-000Ded-2C;
	Mon, 25 Dec 2023 20:15:57 +0000
Date: Tue, 26 Dec 2023 04:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 11/42]
 sound/soc/soc-utils.c:251:34: warning: unused variable 'soc_dummy_ids'
Message-ID: <202312260449.JkrDDoWw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   b30de2d93893b64d7886860417b12948ec22be5a
commit: 5c1fa02438f03e25bddb0c82ff0b1fe4296cbdbc [11/42] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: i386-buildonly-randconfig-006-20231225 (https://download.01.org/0day-ci/archive/20231226/202312260449.JkrDDoWw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260449.JkrDDoWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260449.JkrDDoWw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-utils.c:251:34: warning: unused variable 'soc_dummy_ids' [-Wunused-const-variable]
   static const struct of_device_id soc_dummy_ids[] = {
                                    ^
   1 warning generated.


vim +/soc_dummy_ids +251 sound/soc/soc-utils.c

   250	
 > 251	static const struct of_device_id soc_dummy_ids[] = {
   252		{ .compatible = "linux,snd-soc-dummy", },
   253		{ }
   254	};
   255	MODULE_DEVICE_TABLE(of, soc_dummy_ids);
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
