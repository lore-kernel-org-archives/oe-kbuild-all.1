Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51672564
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677154221; x=1708690221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B/K2jnS5V8fqfJELepg+zVEw5GZ71uH66btwEMIteTE=;
  b=gIOfmTFgByzQ7Q+OBlYxiZW/eCtWQFlF5O10vvjNH/Ookjv9re7Rkk3M
   Jsx81XJVUTZ2/VI0grIr1tMA+Lvq7SBrBFMjDbj27Ud7m7V3Pgp3s7Mph
   /2qMpxHHJNleDBmJTfl2Kc8DW+gj/CFcgGth/IKnEtE8dM7WQBBtyCHcf
   z7z2zbCyDzMOosZ5SMu3lywntHIntWf3H9Q4lCNPjBkumwOECtvde12nz
   h+tD1W4ycDwe/UBwkv4GMQNvarVqOeCks4olzgObf/HlGfLNLcG4koDNO
   1CTh4pwGCqZoxQ5htQbOtv9cTWQqgAyotMEC6x8KRCdElppgfrW77QpMa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="313565449"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="313565449"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 04:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="846534783"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="846534783"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Feb 2023 04:09:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVAQA-0001JZ-1e;
	Thu, 23 Feb 2023 12:09:58 +0000
Date: Thu, 23 Feb 2023 20:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sh4-linux-gcc: error: unrecognized command-line option
 '-Wout-of-line-declaration'; did you mean '-Wold-style-declaration'?
Message-ID: <202302232026.uJMPib2X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a5c95ca18a98d742d0a4a04063c32556b5b66378
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
date:   1 year, 6 months ago
config: sh-randconfig-r033-20230222 (https://download.01.org/0day-ci/archive/20230223/202302232026.uJMPib2X-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e5be40d32fb1907285277c02e74493ed43d77fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302232026.uJMPib2X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sh4-linux-gcc: error: unrecognized command-line option '-Wout-of-line-declaration'; did you mean '-Wold-style-declaration'?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
