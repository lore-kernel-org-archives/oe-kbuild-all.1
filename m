Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C762A46
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 05:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679202723; x=1710738723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KRRTM0zLw/rTNVP7kfhjVZnlnd/2DpgsrPEXQqzspxU=;
  b=Rp9EooGqtuiLb2jcgqWD48UQwjdrk9ayk/ntBXzdiHiCr1pOHBojdKpo
   JCSFv45/XomVkjzBSKiaLPLzRU+aiTgriOMPtbWK2dP++mEQyBzr3e+Xd
   43peioRZaTcg21QChuI+/w4ZI0g2P8RG7bEYcCWtxmvSuYlrWShlwR/09
   dzhBIyQLShDp6E6V6oOkIo3vFQ9AsPlvwEZdIA3BDExDEes6/VTdUAKdR
   H675ugJujd5lxorDiT2E2y1nrNVgpn1nRN2vL0TQtNsAB0HUk1uXRoonw
   /rdvBxsgzPl0CMkfGoXKnhl1opd6Wq4H2ImZKqYdMQfBOvrwMUbA2/WM6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="338503894"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="338503894"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 22:12:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="744975595"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="744975595"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2023 22:12:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdlKr-000APG-0e;
	Sun, 19 Mar 2023 05:12:01 +0000
Date: Sun, 19 Mar 2023 13:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-noreturn 38/39] vmlinux.o: warning: objtool:
 hlt_play_dead(): missing __noreturn
Message-ID: <202303191336.YoCg1wKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-noreturn
head:   1a9145211975418e41e0dbe38726975a06f14b1d
commit: c5aba28ba4d2ee5fcb1465209bf39843f504e940 [38/39] objtool: Add "missing __noreturn" warning
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20230319/202303191336.YoCg1wKJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=c5aba28ba4d2ee5fcb1465209bf39843f504e940
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-noreturn
        git checkout c5aba28ba4d2ee5fcb1465209bf39843f504e940
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191336.YoCg1wKJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: hlt_play_dead(): missing __noreturn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
