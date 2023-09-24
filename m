Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E7FC17
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 23:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695597000; x=1727133000;
  h=date:from:cc:subject:message-id:mime-version;
  bh=gGVJA0vp1zjf4iF0RwIJ8vWUrzyo+pBOPnZG5JeM0AE=;
  b=ZqMG2S6mcF7q8xC3ja7Ux2CLmC09INpY6E2cyEQCpYTyLXdnP9QNVgfs
   gWi8bR5TcCtWvP0lMzLoLszIOk4sjnP2T9NTApDAV6a9K/jQcZcUymdvI
   AIjabWdztZYyZEUjQ7y5nNbkudHztxp2JVGpM2JZ0bsSc5+8pgVuVVbkg
   hz1rxhF/ltWwemR8Uuyrs4qhGVQ6FzBS/ENa7oeej3Yq7DGxxzHENzuxo
   i0/uWhgn79PDXtRVnT4v30MRIB5v236RPRlP7bt6pDrJE0cU661RZniYu
   eumagPTdeTjozQwCbclWzNU32pq6lNki5Yfts33hpEWQi7LeUn72B9QR7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="383890598"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="383890598"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 16:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741703824"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="741703824"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Sep 2023 16:09:59 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkYEf-0000aL-18
	for oe-kbuild-all@lists.linux.dev;
	Sun, 24 Sep 2023 23:09:57 +0000
Date: Mon, 25 Sep 2023 07:08:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 3581/6555]
 sound/pci/hda/hda_hwdep.c:39: Error: unrecognized opcode `csrs sstatus,s3',
 extension `zicsr' required
Message-ID: <202309250746.6RxaOJ2S-lkp@intel.com>
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
config: riscv-randconfig-r011-20230905 (https://download.01.org/0day-ci/archive/20230925/202309250746.6RxaOJ2S-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250746.6RxaOJ2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250746.6RxaOJ2S-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/hda/hda_hwdep.c: Assembler messages:
   sound/pci/hda/hda_hwdep.c:53: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   sound/pci/hda/hda_hwdep.c:53: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   sound/pci/hda/hda_hwdep.c:65: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   sound/pci/hda/hda_hwdep.c:65: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   sound/pci/hda/hda_hwdep.c:81: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   sound/pci/hda/hda_hwdep.c:81: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> sound/pci/hda/hda_hwdep.c:39: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
>> sound/pci/hda/hda_hwdep.c:39: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   sound/pci/hda/hda_hwdep.c:43: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   sound/pci/hda/hda_hwdep.c:43: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required


vim +39 sound/pci/hda/hda_hwdep.c

2807314d467e7dd Takashi Iwai 2007-07-27  30  
2807314d467e7dd Takashi Iwai 2007-07-27  31  /*
2807314d467e7dd Takashi Iwai 2007-07-27  32   * write/read an out-of-bound verb
2807314d467e7dd Takashi Iwai 2007-07-27  33   */
2807314d467e7dd Takashi Iwai 2007-07-27  34  static int verb_write_ioctl(struct hda_codec *codec,
2807314d467e7dd Takashi Iwai 2007-07-27  35  			    struct hda_verb_ioctl __user *arg)
2807314d467e7dd Takashi Iwai 2007-07-27  36  {
2807314d467e7dd Takashi Iwai 2007-07-27  37  	u32 verb, res;
2807314d467e7dd Takashi Iwai 2007-07-27  38  
2807314d467e7dd Takashi Iwai 2007-07-27 @39  	if (get_user(verb, &arg->verb))
2807314d467e7dd Takashi Iwai 2007-07-27  40  		return -EFAULT;
2807314d467e7dd Takashi Iwai 2007-07-27  41  	res = snd_hda_codec_read(codec, verb >> 24, 0,
2807314d467e7dd Takashi Iwai 2007-07-27  42  				 (verb >> 8) & 0xffff, verb & 0xff);
2807314d467e7dd Takashi Iwai 2007-07-27  43  	if (put_user(res, &arg->res))
2807314d467e7dd Takashi Iwai 2007-07-27  44  		return -EFAULT;
2807314d467e7dd Takashi Iwai 2007-07-27  45  	return 0;
2807314d467e7dd Takashi Iwai 2007-07-27  46  }
2807314d467e7dd Takashi Iwai 2007-07-27  47  
2807314d467e7dd Takashi Iwai 2007-07-27  48  static int get_wcap_ioctl(struct hda_codec *codec,
2807314d467e7dd Takashi Iwai 2007-07-27  49  			  struct hda_verb_ioctl __user *arg)
2807314d467e7dd Takashi Iwai 2007-07-27  50  {
2807314d467e7dd Takashi Iwai 2007-07-27  51  	u32 verb, res;
2807314d467e7dd Takashi Iwai 2007-07-27  52  	
2807314d467e7dd Takashi Iwai 2007-07-27 @53  	if (get_user(verb, &arg->verb))
2807314d467e7dd Takashi Iwai 2007-07-27  54  		return -EFAULT;
69fa6f19b955976 Takashi Iwai 2018-04-24  55  	/* open-code get_wcaps(verb>>24) with nospec */
69fa6f19b955976 Takashi Iwai 2018-04-24  56  	verb >>= 24;
69fa6f19b955976 Takashi Iwai 2018-04-24  57  	if (verb < codec->core.start_nid ||
69fa6f19b955976 Takashi Iwai 2018-04-24  58  	    verb >= codec->core.start_nid + codec->core.num_nodes) {
69fa6f19b955976 Takashi Iwai 2018-04-24  59  		res = 0;
69fa6f19b955976 Takashi Iwai 2018-04-24  60  	} else {
69fa6f19b955976 Takashi Iwai 2018-04-24  61  		verb -= codec->core.start_nid;
69fa6f19b955976 Takashi Iwai 2018-04-24  62  		verb = array_index_nospec(verb, codec->core.num_nodes);
69fa6f19b955976 Takashi Iwai 2018-04-24  63  		res = codec->wcaps[verb];
69fa6f19b955976 Takashi Iwai 2018-04-24  64  	}
2807314d467e7dd Takashi Iwai 2007-07-27  65  	if (put_user(res, &arg->res))
2807314d467e7dd Takashi Iwai 2007-07-27  66  		return -EFAULT;
2807314d467e7dd Takashi Iwai 2007-07-27  67  	return 0;
2807314d467e7dd Takashi Iwai 2007-07-27  68  }
2807314d467e7dd Takashi Iwai 2007-07-27  69  

:::::: The code at line 39 was first introduced by commit
:::::: 2807314d467e7dd929c42050031aabbd28e78f0b [ALSA] hda-intel - Add hwdep interface

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
