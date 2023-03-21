Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C69D30A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 18:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679423087; x=1710959087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/OPOaZBG94bnUu5+WnoUSVHsYAWUcFyzTwwYpwKu44=;
  b=KyBv26vUTY1dNxrVC50afzsMTvpfF4Cdy0+MxsmHup4JMgyxl2Ylr2N3
   1cBNtwd7G9ih61HKuPJXiayNX4JLBCOwYrt2lWC3Rp+KMmnnulDOVoR8c
   T5Jz3qsTIvBPleApbC2SX3Po6HC7n1xazqqUrEqfODZj65o2pdq6UvZUW
   l3Wp1zHJcn0pyG9+xKtbir93EknXnZdt+6jZmCie85WH6vOu+qHb486Ls
   kTNRLWMxJXNJOB0oCtKeBZLU7flp5N4JCFOcZ2NuqDwvUASBrexS/kPQt
   /epSRwa7ulYF+d4J1ZhBzUM3cuJi2U/FjZdU74/MAJmmKcdTB0D9vEX7s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341382168"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="341382168"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 11:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="683997323"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="683997323"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2023 11:24:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pegf7-000CGM-04;
	Tue, 21 Mar 2023 18:24:45 +0000
Date: Wed, 22 Mar 2023 02:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 4/20]
 drivers/nvme/common/keyring.c:44:18: warning: format '%lu' expects argument
 of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned
 int'}
Message-ID: <202303220209.lmYkQp0C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: 2f9635844a163239304dbb22b32d38c702246c6e [4/20] nvme-keyring: define a 'psk' keytype
config: m68k-randconfig-r026-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220209.lmYkQp0C-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=2f9635844a163239304dbb22b32d38c702246c6e
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout 2f9635844a163239304dbb22b32d38c702246c6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/nvme/common/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220209.lmYkQp0C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/common/keyring.c:14:14: warning: no previous prototype for 'nvme_keyring_id' [-Wmissing-prototypes]
      14 | key_serial_t nvme_keyring_id(void)
         |              ^~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/nvme/common/keyring.c:6:
   drivers/nvme/common/keyring.c: In function 'nvme_tls_psk_match':
>> drivers/nvme/common/keyring.c:44:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      44 |         pr_debug("%s: match '%s' '%s' len %lu\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:345:21: note: in definition of macro 'pr_fmt'
     345 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:247:9: note: in expansion of macro '__dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:268:9: note: in expansion of macro '_dynamic_func_call'
     268 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/common/keyring.c:44:9: note: in expansion of macro 'pr_debug'
      44 |         pr_debug("%s: match '%s' '%s' len %lu\n",
         |         ^~~~~~~~
   drivers/nvme/common/keyring.c:44:45: note: format string is defined here
      44 |         pr_debug("%s: match '%s' '%s' len %lu\n",
         |                                           ~~^
         |                                             |
         |                                             long unsigned int
         |                                           %u
   drivers/nvme/common/keyring.c: At top level:
   drivers/nvme/common/keyring.c:69:13: warning: no previous prototype for 'nvme_tls_psk_lookup' [-Wmissing-prototypes]
      69 | struct key *nvme_tls_psk_lookup(key_ref_t keyring,
         |             ^~~~~~~~~~~~~~~~~~~
   drivers/nvme/common/keyring.c:104:5: warning: no previous prototype for 'nvme_keyring_init' [-Wmissing-prototypes]
     104 | int nvme_keyring_init(void)
         |     ^~~~~~~~~~~~~~~~~
   drivers/nvme/common/keyring.c:126:6: warning: no previous prototype for 'nvme_keyring_exit' [-Wmissing-prototypes]
     126 | void nvme_keyring_exit(void)
         |      ^~~~~~~~~~~~~~~~~


vim +44 drivers/nvme/common/keyring.c

    25	
    26	static bool nvme_tls_psk_match(const struct key *key,
    27				       const struct key_match_data *match_data)
    28	{
    29		const char *match_id;
    30		size_t match_len;
    31	
    32		if (!key->description) {
    33			pr_debug("%s: no key description\n", __func__);
    34			return false;
    35		}
    36		match_len = strlen(key->description);
    37		pr_debug("%s: id %s len %zd\n", __func__, key->description, match_len);
    38	
    39		if (!match_data->raw_data) {
    40			pr_debug("%s: no match data\n", __func__);
    41			return false;
    42		}
    43		match_id = match_data->raw_data;
  > 44		pr_debug("%s: match '%s' '%s' len %lu\n",
    45			 __func__, match_id, key->description, match_len);
    46		return !memcmp(key->description, match_id, match_len);
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
