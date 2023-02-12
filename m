Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD22FAE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676220589; x=1707756589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sC5HhrSBAtgf/43+i5cNnzoN8UqRfa8nA28LWkhHUew=;
  b=LP1Ht7xtydjmBSxVI1z4uWjiddgkK5c7w1tdpKkPgjeU2QAVQdLGCS53
   5cU29ImQlxQRf8Y44BqEQHYoIoZEdXGT3ilzpAwPSZvXKYkwvzLozVUxB
   t6v4lb/KWxyzl6tfiYeQey6xC5JGTQiaQORi7vMqp2cTRpJDdG36t17sH
   D2f0cZAC9EnYPtYbJ709+tZr/nzd7oZxb9FNOV5tQrfpB1dS8lwX1P4Wm
   SOcxS6ans+AhaW7A2uLkpMSYsqBkwkAG2AfZshajyQNt+td/n0UZeWJus
   +WJ+7EhllvsHEMxbgqoI0PivsCUpQ119xP4LngKK8uFmCjvhlTHgsFe1U
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318753834"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="318753834"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 08:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="661929113"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="661929113"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2023 08:49:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRFXv-0007Ic-0X;
	Sun, 12 Feb 2023 16:49:47 +0000
Date: Mon, 13 Feb 2023 00:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:asahi-6.2-rc3-7_dp-altmode-wip 5/6]
 drivers/usb/typec/mux.c:422:41: warning: format '%x' expects argument of
 type 'unsigned int', but argument 4 has type 'long unsigned int'
Message-ID: <202302130004.KZeiAyAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux asahi-6.2-rc3-7_dp-altmode-wip
head:   72e7196879b629343123a0459d858ef161061600
commit: 040e50c16296093a0a739743387b95e51beedf55 [5/6] WIP: typec/tipd/altmode/displayport: debugging
config: sparc64-randconfig-r015-20230212 (https://download.01.org/0day-ci/archive/20230213/202302130004.KZeiAyAB-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/040e50c16296093a0a739743387b95e51beedf55
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik asahi-6.2-rc3-7_dp-altmode-wip
        git checkout 040e50c16296093a0a739743387b95e51beedf55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/usb/typec/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130004.KZeiAyAB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/usb/typec/mux.c:10:
   drivers/usb/typec/mux.c: In function 'typec_mux_set':
>> drivers/usb/typec/mux.c:422:41: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
     422 |                 dev_warn(&mux_dev->dev, "%s: 0x%02x\n", __func__, state->mode);
         |                                         ^~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/usb/typec/mux.c:422:17: note: in expansion of macro 'dev_warn'
     422 |                 dev_warn(&mux_dev->dev, "%s: 0x%02x\n", __func__, state->mode);
         |                 ^~~~~~~~
   drivers/usb/typec/mux.c:422:51: note: format string is defined here
     422 |                 dev_warn(&mux_dev->dev, "%s: 0x%02x\n", __func__, state->mode);
         |                                                ~~~^
         |                                                   |
         |                                                   unsigned int
         |                                                %02lx
--
>> drivers/usb/typec/tipd/displayport.c:210:5: warning: no previous prototype for 'tps6598x_displayport_notify' [-Wmissing-prototypes]
     210 | int tps6598x_displayport_notify(struct typec_altmode *alt, unsigned long conf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tipd/displayport.c: In function 'tps6598x_displayport_notify':
   drivers/usb/typec/tipd/displayport.c:213:37: warning: unused variable 'partner' [-Wunused-variable]
     213 |         const struct typec_altmode *partner = typec_altmode_get_partner(alt);
         |                                     ^~~~~~~


vim +422 drivers/usb/typec/mux.c

   410	
   411	int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
   412	{
   413		struct typec_mux_dev *mux_dev;
   414		unsigned int i;
   415		int ret;
   416	
   417		if (IS_ERR_OR_NULL(mux))
   418			return 0;
   419	
   420		for (i = 0; i < mux->num_mux_devs; i++) {
   421			mux_dev = mux->mux_devs[i];
 > 422			dev_warn(&mux_dev->dev, "%s: 0x%02x\n", __func__, state->mode);
   423	
   424			ret = mux_dev->set(mux_dev, state);
   425			if (ret)
   426				return ret;
   427		}
   428	
   429		return 0;
   430	}
   431	EXPORT_SYMBOL_GPL(typec_mux_set);
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
