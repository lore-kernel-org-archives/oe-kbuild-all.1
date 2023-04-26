Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313A56ADC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682537214; x=1714073214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0bI8G9ZDBlhdRFffU/P7F0Ayww7ERWmduAf++G30qA=;
  b=mYsCBpifxSVWD6FS1W4K+mJP0/dCMTCqWsKxm69Cv5roCE2eutZQe/00
   0qbDH2rWIIcjhi9/ay41w3EO9xeeoe1YSxrLx36O09Fv+iE/D2Ia2C3K2
   AZC7eQOHSxyhYho05AXmYLfojSY0zxDMlK9XceShhv2m0oobQavYQLKpM
   TLRAu5pPUiRV98xdxKiT5CVIZF2lEMcrZUwjwTCPkEoHa8zhZkyoi+yrs
   hxK4kq9vFgSGBnh3Mx+ghZQKd4B9tZUMbM2zx2abn6YpaFfNst6UEEmIC
   aUA2CP3Hy6cf83O22XrQdNxF0fDQNb/e9Go1bInyKuVgxFijbtOEgJgKx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433504550"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="433504550"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 12:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="726688093"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="726688093"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Apr 2023 12:26:51 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prkmw-0000Ta-2A;
	Wed, 26 Apr 2023 19:26:50 +0000
Date: Thu, 27 Apr 2023 03:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rakesh Ughreja <rakesh.a.ughreja@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Curtis Malainey <cujomalainey@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 3581/6555]
 sound/pci/hda/hda_hwdep.c:39: Error: unrecognized opcode `csrs sstatus,s3'
Message-ID: <202304270324.oxaWEHBc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: ff84d736ac384f7d79f33290d6638207f5ae495c [3581/6555] UPSTREAM: ASoC: hdac_hda: add asoc extension for legacy HDA codec drivers
config: riscv-randconfig-r042-20230426 (https://download.01.org/0day-ci/archive/20230427/202304270324.oxaWEHBc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/ff84d736ac384f7d79f33290d6638207f5ae495c
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout ff84d736ac384f7d79f33290d6638207f5ae495c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash M=sound/pci/hda

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270324.oxaWEHBc-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/hda/hda_hwdep.c: Assembler messages:
   sound/pci/hda/hda_hwdep.c:81: Error: unrecognized opcode `csrs sstatus,a4'
   sound/pci/hda/hda_hwdep.c:81: Error: unrecognized opcode `csrc sstatus,a4'
>> sound/pci/hda/hda_hwdep.c:39: Error: unrecognized opcode `csrs sstatus,s3'
>> sound/pci/hda/hda_hwdep.c:39: Error: unrecognized opcode `csrc sstatus,s3'
   sound/pci/hda/hda_hwdep.c:43: Error: unrecognized opcode `csrs sstatus,s3'
   sound/pci/hda/hda_hwdep.c:43: Error: unrecognized opcode `csrc sstatus,s3'
   sound/pci/hda/hda_hwdep.c:53: Error: unrecognized opcode `csrs sstatus,a3'
   sound/pci/hda/hda_hwdep.c:53: Error: unrecognized opcode `csrc sstatus,a3'
   sound/pci/hda/hda_hwdep.c:65: Error: unrecognized opcode `csrs sstatus,a3'
   sound/pci/hda/hda_hwdep.c:65: Error: unrecognized opcode `csrc sstatus,a3'


vim +39 sound/pci/hda/hda_hwdep.c

2807314d467e7d Takashi Iwai 2007-07-27  30  
2807314d467e7d Takashi Iwai 2007-07-27  31  /*
2807314d467e7d Takashi Iwai 2007-07-27  32   * write/read an out-of-bound verb
2807314d467e7d Takashi Iwai 2007-07-27  33   */
2807314d467e7d Takashi Iwai 2007-07-27  34  static int verb_write_ioctl(struct hda_codec *codec,
2807314d467e7d Takashi Iwai 2007-07-27  35  			    struct hda_verb_ioctl __user *arg)
2807314d467e7d Takashi Iwai 2007-07-27  36  {
2807314d467e7d Takashi Iwai 2007-07-27  37  	u32 verb, res;
2807314d467e7d Takashi Iwai 2007-07-27  38  
2807314d467e7d Takashi Iwai 2007-07-27 @39  	if (get_user(verb, &arg->verb))
2807314d467e7d Takashi Iwai 2007-07-27  40  		return -EFAULT;
2807314d467e7d Takashi Iwai 2007-07-27  41  	res = snd_hda_codec_read(codec, verb >> 24, 0,
2807314d467e7d Takashi Iwai 2007-07-27  42  				 (verb >> 8) & 0xffff, verb & 0xff);
2807314d467e7d Takashi Iwai 2007-07-27  43  	if (put_user(res, &arg->res))
2807314d467e7d Takashi Iwai 2007-07-27  44  		return -EFAULT;
2807314d467e7d Takashi Iwai 2007-07-27  45  	return 0;
2807314d467e7d Takashi Iwai 2007-07-27  46  }
2807314d467e7d Takashi Iwai 2007-07-27  47  

:::::: The code at line 39 was first introduced by commit
:::::: 2807314d467e7dd929c42050031aabbd28e78f0b [ALSA] hda-intel - Add hwdep interface

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
