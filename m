Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1248D2FAE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 17:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676222450; x=1707758450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/WI+38d79SKsbYIVTEcbocIpm5vRjSqj6BSHsk4pmlo=;
  b=EUBHMMMabG4MEjnbyiKh0oDm1y5FwGsSWXjGUHTDHIKob3MWzvXG6y2l
   NB30DnO2d3vSc/ghvURnBIpX2jrWmy1AwfuoZjpd6bd9DgM2jydEzBnJ3
   uzf5zJSbX6yBKlalU1jbkrCrTzAlJDQvDVpuARCn1GMnISHEEMYiBmK7H
   /IzFAp72SNWnx9JVy/yb6p8307+k9Oautlo/YiJ0bXKzEWqepD6YLc8EB
   foa8vEtubcMH7ZlEF+jV9dDQHKGjxBjci875JCQJBnNY9nq/Hr/fkZ2iH
   1/HYWmF5n3bs3rXP7IvKwKDXE9otwSGNK+JNnQOkOrf1RyoM6vuv8e0Yv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="329362474"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="329362474"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 09:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="811353841"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="811353841"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2023 09:20:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRG1v-0007Jz-39;
	Sun, 12 Feb 2023 17:20:47 +0000
Date: Mon, 13 Feb 2023 01:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:asahi-6.2-rc3-7_dp-altmode-wip 5/6]
 drivers/usb/typec/mux.c:422:53: warning: format specifies type 'unsigned
 int' but the argument has type 'unsigned long'
Message-ID: <202302130149.0uvzNnWh-lkp@intel.com>
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
config: hexagon-buildonly-randconfig-r005-20230212 (https://download.01.org/0day-ci/archive/20230213/202302130149.0uvzNnWh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/040e50c16296093a0a739743387b95e51beedf55
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik asahi-6.2-rc3-7_dp-altmode-wip
        git checkout 040e50c16296093a0a739743387b95e51beedf55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/typec/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130149.0uvzNnWh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/mux.c:422:53: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                   dev_warn(&mux_dev->dev, "%s: 0x%02x\n", __func__, state->mode);
                                                  ~~~~               ^~~~~~~~~~~
                                                  %02lx
   include/linux/dev_printk.h:146:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.
--
   drivers/usb/typec/tipd/displayport.c:213:30: warning: unused variable 'partner' [-Wunused-variable]
           const struct typec_altmode *partner = typec_altmode_get_partner(alt);
                                       ^
>> drivers/usb/typec/tipd/displayport.c:210:5: warning: no previous prototype for function 'tps6598x_displayport_notify' [-Wmissing-prototypes]
   int tps6598x_displayport_notify(struct typec_altmode *alt, unsigned long conf,
       ^
   drivers/usb/typec/tipd/displayport.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tps6598x_displayport_notify(struct typec_altmode *alt, unsigned long conf,
   ^
   static 
   2 warnings generated.


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
