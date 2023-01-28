Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9270323A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 05:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674883160; x=1706419160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G5BZ4kLw+OyUpOJOCVyS5W7IWpkmZfVdAN317b+Lr+M=;
  b=dCg3v6u+ounFZ0IdH4+tdG1+f+Su9AmG4YBPb3kzfEeFclQc3yRgSj1r
   qnxFs6Y8NmPA1W6LR1d/jnBlhI91hHzymEh8Wz09D1rc9GM0ImTiGKQO1
   uKxPVQn54CqiCvUZdsD5+K/o5Bpni7Y0rGRerEjb433ujgWJblP0YC/El
   acR6bG02j/wMsMyi3W7h1WW8AxPuwmi02hmif44EFCbf7zCDx0PZGiFHR
   jwWa+Yw+/NfNUhEegyA0908BqDSl5lSAW0JnKeb8J/whdedvnAA/sETAn
   WCqG5PS5HRMHlIjXPz93O1CiU5IHjAewaT8xXvgURoMRA/gW0KKQLo8fR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="391818196"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="391818196"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 21:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="992311961"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="992311961"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2023 21:19:18 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLdcT-0000Pl-1p;
	Sat, 28 Jan 2023 05:19:17 +0000
Date: Sat, 28 Jan 2023 13:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: [broonie-ci:fileWlMtF8 78/82] sound/soc/codecs/tas5720.c:217:17:
 error: 'tas5720' undeclared; did you mean 'TAS5720'?
Message-ID: <202301281308.A7o0Z364-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileWlMtF8
head:   de1e8a397245db0cab67ec2f98d7d1037232decb
commit: de3c8ab7c6973225f26ac5becfb20aee4f4b7f8d [78/82] ASoC: codecs: tas5720: add support for TAS5720A-Q1 (automotive) variant
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230128/202301281308.A7o0Z364-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=de3c8ab7c6973225f26ac5becfb20aee4f4b7f8d
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci fileWlMtF8
        git checkout de3c8ab7c6973225f26ac5becfb20aee4f4b7f8d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/codecs/tas5720.c: In function 'tas5720_mute_soc_component':
>> sound/soc/codecs/tas5720.c:217:17: error: 'tas5720' undeclared (first use in this function); did you mean 'TAS5720'?
     217 |         switch (tas5720->devtype) {
         |                 ^~~~~~~
         |                 TAS5720
   sound/soc/codecs/tas5720.c:217:17: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/codecs/tas5720.c:214:33: warning: unused variable 'val' [-Wunused-variable]
     214 |         unsigned int reg, mask, val;
         |                                 ^~~


vim +217 sound/soc/codecs/tas5720.c

   211	
   212	static int tas5720_mute_soc_component(struct snd_soc_component *component, int mute)
   213	{
   214		unsigned int reg, mask, val;
   215		int ret;
   216	
 > 217		switch (tas5720->devtype) {
   218		case TAS5720A_Q1:
   219			reg = TAS5720_Q1_VOLUME_CTRL_CFG_REG;
   220			mask = TAS5720_Q1_MUTE;
   221			break;
   222		default:
   223			reg = TAS5720_DIGITAL_CTRL2_REG;
   224			mask = TAS5720_MUTE;
   225			break;
   226		}
   227	
   228		ret = snd_soc_component_update_bits(component, reg, mask, mute ? mask : 0);
   229		if (ret < 0) {
   230			dev_err(component->dev, "error (un-)muting device: %d\n", ret);
   231			return ret;
   232		}
   233	
   234		return 0;
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
