Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC12561
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUGlxjDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696793173; x=1728329173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iq5x1bYlPRfmYak8QHNAZvk+UNMcEQQ5aTjTjfAOFhs=;
  b=aUGlxjDjNvFP9NR0QuqQDTu7dXzUEy9rX1hLX+eW9oHFlQwtQ66wjspa
   mR8nkEnzXHOiYHnM4Jfn3M2AEtTS318TVawdk9ajPRmLy9Aymyk5/Gb6U
   HZLMjh8oYoOSOwttYXVRUlpvbhhCWoGMXvfTDYcr6KKQS5ofQuL2+NiL9
   hrZXAMt3ou/glZjbm+4c2VOz23/lx1edauSkbmw7s6upCgRYjRLQxcSqi
   t5FKfxY34RWUYHPVueCmaD92E36Sg7fVR2aXIeuCldGXzRrCZ7TQSp52j
   9LTC6P2yb3FAGgG2VEaGrFfhF/YpZvMMNi8Eudby2cbmrXmJKKjNt4QLD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="374354719"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="374354719"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 12:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084103886"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="1084103886"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Oct 2023 12:26:10 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpZPk-0005fz-2W;
	Sun, 08 Oct 2023 19:26:08 +0000
Date: Mon, 9 Oct 2023 03:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Message-ID: <202310090325.xWWpQOHP-lkp@intel.com>
References: <20231008135601.542356-1-jmkrzyszt@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008135601.542356-1-jmkrzyszt@gmail.com>

Hi Janusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Janusz-Krzysztofik/ASoC-ti-ams-delta-Allow-it-to-be-test-compiled/20231008-215910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231008135601.542356-1-jmkrzyszt%40gmail.com
patch subject: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310090325.xWWpQOHP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310090325.xWWpQOHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310090325.xWWpQOHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/ti/ams-delta.c:401:24: error: initialization of 'void (*)(struct tty_struct *, const u8 *, const u8 *, size_t)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const unsigned char *, long unsigned int)'} from incompatible pointer type 'void (*)(struct tty_struct *, const u8 *, const char *, int)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const char *, int)'} [-Werror=incompatible-pointer-types]
     401 |         .receive_buf = cx81801_receive,
         |                        ^~~~~~~~~~~~~~~
   sound/soc/ti/ams-delta.c:401:24: note: (near initialization for 'cx81801_ops.receive_buf')
   cc1: some warnings being treated as errors


vim +401 sound/soc/ti/ams-delta.c

6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  393  
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  394  static struct tty_ldisc_ops cx81801_ops = {
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  395  	.name = "cx81801",
fbadf70a8053b3 sound/soc/ti/ams-delta.c   Jiri Slaby         2021-05-05  396  	.num = N_V253,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  397  	.owner = THIS_MODULE,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  398  	.open = cx81801_open,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  399  	.close = cx81801_close,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  400  	.hangup = cx81801_hangup,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29 @401  	.receive_buf = cx81801_receive,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  402  	.write_wakeup = cx81801_wakeup,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  403  };
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  404  
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
