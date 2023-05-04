Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48F7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 02:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683166665; x=1714702665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huGWW6UwpV+Shm6Ju3GOHKHJsC02sEDam+hB8bc+Tzk=;
  b=eDUe/Kw8ugb3/DjXhC5/oOLVfYtkzw7xB4/gdKwzmQfhrSGja8D5B+Nu
   k2w0GZAAQquYDRwTHE6zV3GWqkQgab+MCqisQEJmIqxSnG5CHjI8UbKcT
   owIutDunScNCEggKJlhmOGVRhU1wnFzjIycdONCSOAortExzPshs7898p
   LVQKk3D37rRSsV58n97X2oNYTyWeNhihDeE5VhfveDfuR8Fewil+3HVT8
   yYQTZWA8mzq6xOMW7l9wi0AurGEvLdr3u8phUuBtT3VpRKdCZSGlIG0Ht
   GEG3ZKNXIu6z0vAGjDhRvlyLxUK9QcJXccGBR/wwOivbZ/rgZFUt3Pmvs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435122144"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="435122144"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 19:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="690927273"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="690927273"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 May 2023 19:17:43 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puOXO-0002Sq-2c;
	Thu, 04 May 2023 02:17:42 +0000
Date: Thu, 4 May 2023 10:17:35 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 15/16] scsi: scsi_debug: Atomic write support
Message-ID: <202305041030.SKXj33Qd-lkp@intel.com>
References: <20230503183821.1473305-16-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503183821.1473305-16-john.g.garry@oracle.com>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on axboe-block/for-next v6.3]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next linus/master next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230503183821.1473305-16-john.g.garry%40oracle.com
patch subject: [PATCH RFC 15/16] scsi: scsi_debug: Atomic write support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230504/202305041030.SKXj33Qd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7d26a440d51ad10c896e77675aeaa5fea5edd05f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
        git checkout 7d26a440d51ad10c896e77675aeaa5fea5edd05f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041030.SKXj33Qd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__moddi3" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "__umoddi3" [drivers/scsi/scsi_debug.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
