Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C387F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682171628; x=1713707628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xV18Ynz3dsjzvNoOmzTOX+8rkphFKSXyTJT0+pIozXY=;
  b=DLSMW7vuRRYUWe+meioVwXMKNxucL2MxRDh5++UjmcpAtCHOptF8k8X/
   FwHd/Cry53OSuVY50TsJRa6qO86wjLBbzBmLwa1hgUG2RQMlDSGw9SfU0
   db10u9LWLFDcfJfSVy3nnFRjN0IlKFyUBrz+CSSW3pZtzzngXNHdM4+46
   zpoyIhTp6wTWJuBgS0tMBXYTOsVw331XT93AYO822HNxBCyDbaJOSGYQY
   ZXMo2L484INgWdo58BvmAJLDilP2sKU9/HgihAJUCU8LurwJSkIY5kVA3
   0XRBZC6AXaH59I2gB+ZzXJN10Y5LPpmO+QIB3MA1lVPLuKDwN5DbAzNT0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="335044230"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="335044230"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 06:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="725146117"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="725146117"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Apr 2023 06:53:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqDgO-000hKG-2u;
	Sat, 22 Apr 2023 13:53:44 +0000
Date: Sat, 22 Apr 2023 21:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: {standard input}:924: Error: unrecognized opcode: `eieio'
Message-ID: <202304222120.WcBMaHXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e41e0a575664d26bb87e012c39435c4c3914ed9
commit: ff7c76f66d8bad4e694c264c789249e1d3a8205d powerpc/boot: Don't always pass -mcpu=powerpc when building 32-bit uImage
date:   3 months ago
config: powerpc-buildonly-randconfig-r006-20230422 (https://download.01.org/0day-ci/archive/20230422/202304222120.WcBMaHXo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff7c76f66d8bad4e694c264c789249e1d3a8205d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ff7c76f66d8bad4e694c264c789249e1d3a8205d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304222120.WcBMaHXo-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:924: Error: unrecognized opcode: `eieio'
   {standard input}:1094: Error: unrecognized opcode: `eieio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
