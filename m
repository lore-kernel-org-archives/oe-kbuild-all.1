Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2121FBFB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683156158; x=1714692158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WmROnEFy3Lbc89zx0gblitzS1jR4qEf6n7Dl5OU/eGk=;
  b=D90G9CJjeF9fMvMJvQ6W4D4BMYFbr+Tsp4aDg65F2iDjtMpyeteEQAPh
   sVPTtzt0GMFhcNiqJL+e/liJCBhKvoAtXTU/LGcchG0iDYXcHT+rTEF47
   IE5vsXs3uVdiqI/EcGnK71rJ/woYFqI/HEJm/9b5diUMQiBN1cP5cu/Ci
   v9embUk/3ma/ektKcBiJJWT5d6pp79UJXyDf1os4XRSQDSaW3TVs6TAQF
   Rb5zyVdCYtQiOeqb/kSZ0kdi2zINLfziWVW5GoLHsQdibSwWXu0q4hDet
   bmNLfQd7kLuo0d6Et+ga0EAMOLelsiH1+oSzzWbmZ88s8Xl+4wu3kYc5F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="329148884"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="329148884"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 16:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="699616718"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="699616718"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 May 2023 16:22:37 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puLnw-0002Li-2o;
	Wed, 03 May 2023 23:22:36 +0000
Date: Thu, 4 May 2023 07:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 12/16] xfs: Add support for fallocate2
Message-ID: <202305040750.xuMQIvEU-lkp@intel.com>
References: <20230503183821.1473305-13-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503183821.1473305-13-john.g.garry@oracle.com>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on axboe-block/for-next mkp-scsi/for-next jejb-scsi/for-next v6.3]
[cannot apply to linus/master next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230503183821.1473305-13-john.g.garry%40oracle.com
patch subject: [PATCH RFC 12/16] xfs: Add support for fallocate2
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230504/202305040750.xuMQIvEU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c039ce328d699bc17e06c03a18cf8674fc707ffb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
        git checkout c039ce328d699bc17e06c03a18cf8674fc707ffb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305040750.xuMQIvEU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__moddi3" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
