Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F09DDD1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690213353; x=1721749353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdLtYXXeRSF6hAJmF0LuEPwcPGRXvluS+PVhqHPviVk=;
  b=Y6/MQG8nLf6IyH2coh348QiiKXDttjpvJBV49n4fLZPuBsC6oPk4Tfxz
   hsnhqE3Wk18TXfpDhrKTGhwhfqouO1RUbMfUNpdv4DuBkBn16mQO3cMPb
   4U/iTXAjZct7F5cJeW2NynYq2CdbhouSzozIw/DcFWqb8ccFWmN78B4PF
   OvTAIUT0KaHL3In2efuyO+dupL7taYZ2OUmL1bmmLh8sQqS1Fg5nB2xdj
   0TbuZh/hV04M/pTf4iKoABLcRnOuFfsa9lBGZxseObeg1AC8fa+bjU1E4
   uuSfsEJyfHdXt5S8ricPYQ/5udDzVwP52MYq53fQuntgesoTBmdtL6WUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347080067"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="347080067"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 08:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791013178"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="791013178"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 08:42:13 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNxhM-0009pI-2E;
	Mon, 24 Jul 2023 15:42:12 +0000
Date: Mon, 24 Jul 2023 23:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/ac97/bus.c:465:1: sparse: sparse: symbol 'dev_attr_vendor_id'
 was not declared. Should it be static?
Message-ID: <202307242300.Oy0Dp2QI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
commit: 5eab9265759e2fb042aa452931c3d06ab7ab8dae ASoC: PXA: make SND_PXA2XX_SOC_AC97 user-selectable
date:   6 months ago
config: nios2-randconfig-r072-20230723 (https://download.01.org/0day-ci/archive/20230724/202307242300.Oy0Dp2QI-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242300.Oy0Dp2QI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242300.Oy0Dp2QI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/ac97/bus.c:465:1: sparse: sparse: symbol 'dev_attr_vendor_id' was not declared. Should it be static?

vim +/dev_attr_vendor_id +465 sound/ac97/bus.c

74426fbff66eea Robert Jarzmik 2017-09-02  457  
74426fbff66eea Robert Jarzmik 2017-09-02  458  static ssize_t vendor_id_show(struct device *dev,
74426fbff66eea Robert Jarzmik 2017-09-02  459  			      struct device_attribute *attr, char *buf)
74426fbff66eea Robert Jarzmik 2017-09-02  460  {
74426fbff66eea Robert Jarzmik 2017-09-02  461  	struct ac97_codec_device *codec = to_ac97_device(dev);
74426fbff66eea Robert Jarzmik 2017-09-02  462  
7450320ec7ab11 Takashi Iwai   2022-08-01  463  	return sysfs_emit(buf, "%08x", codec->vendor_id);
74426fbff66eea Robert Jarzmik 2017-09-02  464  }
74426fbff66eea Robert Jarzmik 2017-09-02 @465  DEVICE_ATTR_RO(vendor_id);
74426fbff66eea Robert Jarzmik 2017-09-02  466  

:::::: The code at line 465 was first introduced by commit
:::::: 74426fbff66eea8e8d1f42c8238c268d1e63a832 ALSA: ac97: add an ac97 bus

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
