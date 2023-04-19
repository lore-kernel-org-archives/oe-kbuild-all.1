Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66C0D2EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 20:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681935548; x=1713471548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VY84knn+qne8QfA5OMOBL73+DU9BMrIqscEw4mQ6kCw=;
  b=E/azQk49YvNmuleY+if5ikFxqZdkxoJZmUZHc6WSyacumjvC3gsWZl0+
   tUWn8NsDRq4E3wLI4sD2ZGnB7881ia8Q2HGnpLKs+A77Co2pOIr9mxZrU
   h/C8WhEPTN46yC6XHW0l5+sl+nJGA+2Y2uuctNLLbfsCK335q4C9g04qJ
   NQlhRibJTEakVdJ29kF5mj9JUxQF2PNmaGGfrc4TorYBc+PkVc/WOxe7w
   ObMyCvmNTHlJs57xJMfjwXG50Lpv7Abx86ies5EhtOz+hNQOFbN0SgUfB
   +oQmAEDBiBSEhtUhpnKW37iDRShFVsRJnJPFRTR6W7FFPBsTkkXTCMSH+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347407276"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="347407276"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 13:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="756229394"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="756229394"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2023 13:19:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppEGd-000fAa-0C;
	Wed, 19 Apr 2023 20:19:03 +0000
Date: Thu, 20 Apr 2023 04:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 1/4] block: constify partition prober array
Message-ID: <202304200454.r3d73iaw-lkp@intel.com>
References: <20230419-const-partition-v1-1-2d66f2d83873@weissschuh.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230419-const-partition-v1-1-2d66f2d83873@weissschuh.net>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on af67688dca57999fd848f051eeea1d375ba546b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/block-constify-partition-prober-array/20230419-155356
base:   af67688dca57999fd848f051eeea1d375ba546b2
patch link:    https://lore.kernel.org/r/20230419-const-partition-v1-1-2d66f2d83873%40weissschuh.net
patch subject: [PATCH 1/4] block: constify partition prober array
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230420/202304200454.r3d73iaw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/9bc1f4308c10322c327c9e86ede6bb9e862440aa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Wei-schuh/block-constify-partition-prober-array/20230419-155356
        git checkout 9bc1f4308c10322c327c9e86ede6bb9e862440aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200454.r3d73iaw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/partitions/core.c:24:9: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected int ( const * )( ... ) @@     got int ( * )( ... ) @@
   block/partitions/core.c:24:9: sparse:     expected int ( const * )( ... )
   block/partitions/core.c:24:9: sparse:     got int ( * )( ... )
   block/partitions/core.c:47:9: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected int ( const * )( ... ) @@     got int ( * )( ... ) @@
   block/partitions/core.c:47:9: sparse:     expected int ( const * )( ... )
   block/partitions/core.c:47:9: sparse:     got int ( * )( ... )
   block/partitions/core.c:53:9: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected int ( const * )( ... ) @@     got int ( * )( ... ) @@
   block/partitions/core.c:53:9: sparse:     expected int ( const * )( ... )
   block/partitions/core.c:53:9: sparse:     got int ( * )( ... )
   block/partitions/core.c:56:9: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected int ( const * )( ... ) @@     got int ( * )( ... ) @@
   block/partitions/core.c:56:9: sparse:     expected int ( const * )( ... )
   block/partitions/core.c:56:9: sparse:     got int ( * )( ... )
   block/partitions/core.c:68:9: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected int ( const * )( ... ) @@     got int ( * )( ... ) @@
   block/partitions/core.c:68:9: sparse:     expected int ( const * )( ... )
   block/partitions/core.c:68:9: sparse:     got int ( * )( ... )
   block/partitions/core.c:71:9: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected int ( const * )( ... ) @@     got int ( * )( ... ) @@
   block/partitions/core.c:71:9: sparse:     expected int ( const * )( ... )
   block/partitions/core.c:71:9: sparse:     got int ( * )( ... )

vim +24 block/partitions/core.c

387048bf67eeff Christoph Hellwig 2020-03-24  14  
9bc1f4308c1032 Thomas Weiﬂschuh  2023-04-19  15  static const int (*check_part[])(struct parsed_partitions *) = {
387048bf67eeff Christoph Hellwig 2020-03-24  16  	/*
387048bf67eeff Christoph Hellwig 2020-03-24  17  	 * Probe partition formats with tables at disk address 0
387048bf67eeff Christoph Hellwig 2020-03-24  18  	 * that also have an ADFS boot block at 0xdc0.
387048bf67eeff Christoph Hellwig 2020-03-24  19  	 */
387048bf67eeff Christoph Hellwig 2020-03-24  20  #ifdef CONFIG_ACORN_PARTITION_ICS
387048bf67eeff Christoph Hellwig 2020-03-24  21  	adfspart_check_ICS,
387048bf67eeff Christoph Hellwig 2020-03-24  22  #endif
387048bf67eeff Christoph Hellwig 2020-03-24  23  #ifdef CONFIG_ACORN_PARTITION_POWERTEC
387048bf67eeff Christoph Hellwig 2020-03-24 @24  	adfspart_check_POWERTEC,
387048bf67eeff Christoph Hellwig 2020-03-24  25  #endif
387048bf67eeff Christoph Hellwig 2020-03-24  26  #ifdef CONFIG_ACORN_PARTITION_EESOX
387048bf67eeff Christoph Hellwig 2020-03-24  27  	adfspart_check_EESOX,
387048bf67eeff Christoph Hellwig 2020-03-24  28  #endif
387048bf67eeff Christoph Hellwig 2020-03-24  29  
387048bf67eeff Christoph Hellwig 2020-03-24  30  	/*
387048bf67eeff Christoph Hellwig 2020-03-24  31  	 * Now move on to formats that only have partition info at
387048bf67eeff Christoph Hellwig 2020-03-24  32  	 * disk address 0xdc0.  Since these may also have stale
387048bf67eeff Christoph Hellwig 2020-03-24  33  	 * PC/BIOS partition tables, they need to come before
387048bf67eeff Christoph Hellwig 2020-03-24  34  	 * the msdos entry.
387048bf67eeff Christoph Hellwig 2020-03-24  35  	 */
387048bf67eeff Christoph Hellwig 2020-03-24  36  #ifdef CONFIG_ACORN_PARTITION_CUMANA
387048bf67eeff Christoph Hellwig 2020-03-24  37  	adfspart_check_CUMANA,
387048bf67eeff Christoph Hellwig 2020-03-24  38  #endif
387048bf67eeff Christoph Hellwig 2020-03-24  39  #ifdef CONFIG_ACORN_PARTITION_ADFS
387048bf67eeff Christoph Hellwig 2020-03-24  40  	adfspart_check_ADFS,
387048bf67eeff Christoph Hellwig 2020-03-24  41  #endif
387048bf67eeff Christoph Hellwig 2020-03-24  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
