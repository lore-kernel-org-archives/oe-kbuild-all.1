Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C506FD3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675726342; x=1707262342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSveWSN9LIH1SusRnPgsZ1zebn/fho6S16OVGEYM44s=;
  b=GVE8Tj/1zlgNp/wntMT6ro7qD1PCJAPcGSXkIgiC320PDfMscTXSg11e
   aoP9RpDVcNSl8pQVTLdEnntLEKOepOnfjuGHY8f+r3GDzZSfg0KTWJKct
   Cdr1GJzOZ8dMgy7/gjGmtYYGOKbHJ5PMIt0fM4A8t5IrdcXO8loDkZSaM
   zR+hPSXmAu7TV09Vgkbi8LyTy7p810iT5PcW4iQclvWmh9iWyFA4TYvtE
   0/rf7xt5LkNBIdispe1fckS1BWJHyk5hr0qXtzas9ljXNWXN1vz+O/D0O
   lMboUOwRFP1tLtWN6gFx+0yIhmmUO9d4qUuWmLIvPJyAhLO9exxGD39gG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327028854"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327028854"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 15:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="668573205"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="668573205"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Feb 2023 15:32:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPAyC-0002rK-1N;
	Mon, 06 Feb 2023 23:32:20 +0000
Date: Tue, 7 Feb 2023 07:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 1859/9999]
 drivers/base/devres.c:92:13: sparse: sparse: incompatible types in
 comparison expression (different type sizes):
Message-ID: <202302070750.lcRhdtUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: 9780924cd85d20dca59c929153c3004ed41208be [1859/9999] UPSTREAM: device: Use overflow helpers for devm_kmalloc()
config: m68k-randconfig-s051-20230205 (https://download.01.org/0day-ci/archive/20230207/202302070750.lcRhdtUN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/9780924cd85d20dca59c929153c3004ed41208be
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout 9780924cd85d20dca59c929153c3004ed41208be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/base/ drivers/iio/adc/ drivers/usb/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/base/devres.c:1055:9: sparse: sparse: cast removes address space '<asn:3>' of expression
>> drivers/base/devres.c:92:13: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/base/devres.c:92:13: sparse:    unsigned long *
>> drivers/base/devres.c:92:13: sparse:    unsigned int *
>> drivers/base/devres.c:92:13: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/base/devres.c:92:13: sparse:    unsigned long *
>> drivers/base/devres.c:92:13: sparse:    unsigned int *
>> drivers/base/devres.c:92:13: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/base/devres.c:92:13: sparse:    unsigned long *
>> drivers/base/devres.c:92:13: sparse:    unsigned int *
>> drivers/base/devres.c:92:13: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> drivers/base/devres.c:92:13: sparse:    unsigned long *
>> drivers/base/devres.c:92:13: sparse:    unsigned int *

vim +92 drivers/base/devres.c

    84	
    85	static __always_inline struct devres * alloc_dr(dr_release_t release,
    86							size_t size, gfp_t gfp, int nid)
    87	{
    88		size_t tot_size;
    89		struct devres *dr;
    90	
    91		/* We must catch any near-SIZE_MAX cases that could overflow. */
  > 92		if (unlikely(check_add_overflow(sizeof(struct devres), size,
    93						&tot_size)))
    94			return NULL;
    95	
    96		dr = kmalloc_node_track_caller(tot_size, gfp, nid);
    97		if (unlikely(!dr))
    98			return NULL;
    99	
   100		memset(dr, 0, offsetof(struct devres, data));
   101	
   102		INIT_LIST_HEAD(&dr->node.entry);
   103		dr->node.release = release;
   104		return dr;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
