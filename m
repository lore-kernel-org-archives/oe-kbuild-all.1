Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AFD23A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 04:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674881840; x=1706417840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqN8nA7zpOoa9kSQyBRz2ySuJIGUAC08D1DZWHHlgrI=;
  b=i84J7R3Ck2+k0SgknnO6PSHeZtgJMKMzljYSkQqZHe0qUaU7BocsEmfY
   b+4rfvspBHBX5OeK3mbPkuqI86pzSCBJBVnJEVQPPGQuhxvt5AT2RCmJ/
   4KA3e46ea0X3xP4CIuWp7cnyiGUP1F+W11j/56ikb+lgnGcG3Ev9WN1AB
   LRnZvzoRTbiInaG7/TPQff24XzLTKIQzoL0KB4Bljd8YZNp0rIuLCsWZ5
   3kL+BTv3UESHNlrIwTYIdd7XA7XjvaxqUtmn+PdE2pOkVlGGw8bdEWK9O
   OdLDfj3EGTUzTzkwkGMD2NtOUYVLKb/0D1SlTPg9Z1S7YrZ427OtC3zN4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="306912895"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="306912895"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 20:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="732101405"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="732101405"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jan 2023 20:57:18 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLdHB-0000PJ-16;
	Sat, 28 Jan 2023 04:57:17 +0000
Date: Sat, 28 Jan 2023 12:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: [broonie-ci:fileWlMtF8 78/82] sound/soc/codecs/tas5720.c:214:33:
 warning: unused variable 'val'
Message-ID: <202301281255.yV5CfW3n-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230128/202301281255.yV5CfW3n-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=de3c8ab7c6973225f26ac5becfb20aee4f4b7f8d
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci fileWlMtF8
        git checkout de3c8ab7c6973225f26ac5becfb20aee4f4b7f8d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/tas5720.c: In function 'tas5720_mute_soc_component':
   sound/soc/codecs/tas5720.c:217:17: error: 'tas5720' undeclared (first use in this function); did you mean 'TAS5720'?
     217 |         switch (tas5720->devtype) {
         |                 ^~~~~~~
         |                 TAS5720
   sound/soc/codecs/tas5720.c:217:17: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/codecs/tas5720.c:214:33: warning: unused variable 'val' [-Wunused-variable]
     214 |         unsigned int reg, mask, val;
         |                                 ^~~


vim +/val +214 sound/soc/codecs/tas5720.c

   211	
   212	static int tas5720_mute_soc_component(struct snd_soc_component *component, int mute)
   213	{
 > 214		unsigned int reg, mask, val;
   215		int ret;
   216	
   217		switch (tas5720->devtype) {
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
