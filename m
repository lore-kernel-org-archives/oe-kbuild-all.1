Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23494524D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680451331; x=1711987331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=In396u1h0ngb28kgIAqYMTKt0bLwiHiH6kMywYkPi3c=;
  b=PHJPyaz2rC4KcxACkkE+TL0+xBBSBaKi4sH9bTErBt9dthyIszT2l93w
   dzozk2luAEGOvsaPWBofYY3n45T/AzSu4QT9SvHos+iFJxOFrnbQahJdd
   dEZeTsMqvsSCdJvuppVs+KC4YNImuL6Bin0RIk4IVxcwZY2SKVZ8spFDu
   X3Xqbf09qJglco3vAfnqMEQUkGkuufXZ/+QHhO2rKKLDlrp1VcEgmj5X/
   +FJb32sLJEI9Nx/v5XfO2m4ii8+HGHxJAQn4NqiKqy7cZNdVKYRtHJ/Qc
   fryTKX7pbo4q9Effa5R8WtbsE+HX53Td7+SG6DdYZFFerVRVIBuKs7jv9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="321403763"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="321403763"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 09:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="635843077"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="635843077"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Apr 2023 09:02:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj09g-000NVh-1G;
	Sun, 02 Apr 2023 16:02:08 +0000
Date: Mon, 3 Apr 2023 00:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Georgiev <glipus@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v2] Add NDOs for hardware timestamp get/set
Message-ID: <202304022331.MYm0NhmV-lkp@intel.com>
References: <20230402142435.47105-1-glipus@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230402142435.47105-1-glipus@gmail.com>

Hi Maxim,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxim-Georgiev/Add-NDOs-for-hardware-timestamp-get-set/20230402-222504
patch link:    https://lore.kernel.org/r/20230402142435.47105-1-glipus%40gmail.com
patch subject: [PATCH net-next RFC v2] Add NDOs for hardware timestamp get/set
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230402/202304022331.MYm0NhmV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9c768404248f059870f899ce676098d83bacdf18
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxim-Georgiev/Add-NDOs-for-hardware-timestamp-get-set/20230402-222504
        git checkout 9c768404248f059870f899ce676098d83bacdf18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304022331.MYm0NhmV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/net_tstamp.h:94:9: error: unknown type name 'u8'
      94 |         u8 dummy;
         |         ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
