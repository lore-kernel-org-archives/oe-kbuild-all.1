Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A8B7E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682936045; x=1714472045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HG9D+JsQb/gZAdFvPbTVO/txt38ZCSsLMBkMYFRbwCA=;
  b=LaxUpVyBSJ2wBlI2oRrV/YwUXEZ4UuqqRciqkOmqibkAqC4VSuTAVUwi
   mXGHyh6IDs8+pmrPcz+cVhuv4VkIQxvI5jHnT5ujCYHHybPXm0v08/sxQ
   +tDO3sNG6YBEdzOEeGQsTWKbM2T6b+xUdRGKTnCff2Buxnj6D42EAubYM
   bZqu2jiUQxsQLh52NiHgmfeSiPaTIcuFIHfj1nnV3YzCMcPknv/q1Dr4N
   gp23j2YlOrfC+RpKIUSMB09Eus4CyZ6K0LLY0agZ5eAHdjYbI/MKd3C+s
   1tfeHFePng5VhTeXOlazwTXQTmWdPFKH2Z3uNPtwKQzC3evLzZJQ1RanK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="328475079"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="328475079"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 03:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695742002"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="695742002"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 May 2023 03:14:03 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptQXi-0000Ox-2C;
	Mon, 01 May 2023 10:14:02 +0000
Date: Mon, 1 May 2023 18:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: xtensa-linux-ld: section .start VMA
 [00000000d1000000,00000000d1000007] overlaps section .image VMA
 [00000000d0003000,00000000d123cffb]
Message-ID: <202305011847.5DPP1bgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
commit: bb2ff6c27bc9e1da4d3ec5e7b1d6b9df1092cb5a drm: Disable dynamic debug as broken
date:   3 months ago
config: xtensa-randconfig-r016-20230430 (https://download.01.org/0day-ci/archive/20230501/202305011847.5DPP1bgJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bb2ff6c27bc9e1da4d3ec5e7b1d6b9df1092cb5a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bb2ff6c27bc9e1da4d3ec5e7b1d6b9df1092cb5a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011847.5DPP1bgJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .start VMA [00000000d1000000,00000000d1000007] overlaps section .image VMA [00000000d0003000,00000000d123cffb]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
