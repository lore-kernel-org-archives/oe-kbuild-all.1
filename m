Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD70944E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 21:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682027703; x=1713563703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t3czZOqFysE70gZ1FG7p9KYiKP26cjyeQp3Qt2Ds+PE=;
  b=NfxJIHx9uhyQHVgDnAWEwJiVDODF40cA+7wtHalnp4Vo0KMIOCKeVapv
   qg6W1OBiLo9nlcMk9sHNdoQrGOrDsDt45tmnM1Iv2APPRn6mE5GJpD94J
   i6sbxCznOyXv9YnUtqSXDicNDfeA9Ux7mwHYF+NV4lCv97Vr1an+jz9gv
   CdbofSNHumlBbDEoUMRvnGzYjaGlRVM6AhfGQudFGmkm84oHs21J1baDm
   KkZdpg06NK9iwkojJZ3FgCQ9y9LL5kTCuSlJt2tve7CPyrfdWL8CbvJLg
   g/beejfX+mT+Ualz+3qvxl1MrGT0Q4Kzw1w26rcjypZ360ewrqlXARQHY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408793415"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="408793415"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 14:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692068702"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="692068702"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 14:55:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppcEx-000g8E-0u;
	Thu, 20 Apr 2023 21:54:55 +0000
Date: Fri, 21 Apr 2023 05:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Down <chris@chrisdown.name>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Petr Mladek <pmladek@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>, kernel-team@fb.com
Subject: Re: [PATCH v4 1/2] printk: Do not delay messages which aren't
 solicited by any console
Message-ID: <202304210550.jdh8v273-lkp@intel.com>
References: <43d7f8d6e4b45a1a76fceef2d117bbc3954bc0bf.1681994221.git.chris@chrisdown.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43d7f8d6e4b45a1a76fceef2d117bbc3954bc0bf.1681994221.git.chris@chrisdown.name>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on cb0856346a60fe3eb837ba5e73588a41f81ac05f]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Down/printk-Do-not-delay-messages-which-aren-t-solicited-by-any-console/20230420-204202
base:   cb0856346a60fe3eb837ba5e73588a41f81ac05f
patch link:    https://lore.kernel.org/r/43d7f8d6e4b45a1a76fceef2d117bbc3954bc0bf.1681994221.git.chris%40chrisdown.name
patch subject: [PATCH v4 1/2] printk: Do not delay messages which aren't solicited by any console
config: arc-randconfig-r043-20230416 (https://download.01.org/0day-ci/archive/20230421/202304210550.jdh8v273-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/db9fb81bc5f175ef48cb317c24da85d0f6d4391d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chris-Down/printk-Do-not-delay-messages-which-aren-t-solicited-by-any-console/20230420-204202
        git checkout db9fb81bc5f175ef48cb317c24da85d0f6d4391d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs// kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210550.jdh8v273-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/printk/printk.c: In function 'boot_delay_msec':
>> kernel/printk/printk.c:1297:64: error: expected ')' before 'return'
    1297 |         if ((boot_delay == 0 || system_state >= SYSTEM_RUNNING)
         |            ~                                                   ^
         |                                                                )
    1298 |                 return;
         |                 ~~~~~~                                          
>> kernel/printk/printk.c:1315:1: error: expected expression before '}' token
    1315 | }
         | ^
   kernel/printk/printk.c:1295:23: warning: unused variable 'timeout' [-Wunused-variable]
    1295 |         unsigned long timeout;
         |                       ^~~~~~~
   kernel/printk/printk.c:1294:28: warning: unused variable 'k' [-Wunused-variable]
    1294 |         unsigned long long k;
         |                            ^


vim +1297 kernel/printk/printk.c

bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1291  
db9fb81bc5f175 kernel/printk/printk.c Chris Down      2023-04-20  1292  static void boot_delay_msec(void)
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1293  {
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1294  	unsigned long long k;
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1295  	unsigned long timeout;
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1296  
ff48cd26fc4889 kernel/printk/printk.c Thomas Gleixner 2017-05-16 @1297  	if ((boot_delay == 0 || system_state >= SYSTEM_RUNNING)
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1298  		return;
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1299  
3a3b6ed2235f2f kernel/printk.c        Dave Young      2009-09-22  1300  	k = (unsigned long long)loops_per_msec * boot_delay;
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1301  
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1302  	timeout = jiffies + msecs_to_jiffies(boot_delay);
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1303  	while (k) {
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1304  		k--;
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1305  		cpu_relax();
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1306  		/*
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1307  		 * use (volatile) jiffies to prevent
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1308  		 * compiler reduction; loop termination via jiffies
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1309  		 * is secondary and may or may not happen.
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1310  		 */
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1311  		if (time_after(jiffies, timeout))
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1312  			break;
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1313  		touch_nmi_watchdog();
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1314  	}
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16 @1315  }
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1316  #else
db9fb81bc5f175 kernel/printk/printk.c Chris Down      2023-04-20  1317  static inline void boot_delay_msec(void)
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1318  {
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1319  }
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1320  #endif
bfe8df3d314bdd kernel/printk.c        Randy Dunlap    2007-10-16  1321  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
