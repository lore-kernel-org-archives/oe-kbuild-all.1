Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0543C2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686594914; x=1718130914;
  h=date:from:cc:subject:message-id:mime-version;
  bh=eP8PsfLAfKggS1NUM83O50ckMNzvq0tVLIT+YpthaHE=;
  b=f6pjYhn6PkQPfEMoJif1ey6OyTGWMBRlxKwVDnRXgY3+dqOdhKjmLnZr
   H0qs+5Q/pWTTRCzgc96lPFccJu8OEGkOGbRqn2ZI3+dCyv64z/QXzX6Y8
   1h+DYQ+uNonEX4aoxXp7yfQtRggQiJLzrxmHngR+H3P43kE5S/KypLEom
   6B8oZlhAbGEPTk0IATpCMp+iThZbaJdKc44XHSPsJINbEiMQiSr3nyE0F
   9DD+7RvcSDxF5f0mcuDcftXLdfq7EEDPV6tbhdxEhmiDVybnulyQDpjbi
   fY9IZRjgQraqV51UJnNZzrG1uCvFBEWSHmD5le4rEKMZFPk7/Dwvf+NTP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337766682"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="337766682"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 11:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="661686696"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="661686696"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jun 2023 11:35:12 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8mNj-0000ZE-1W;
	Mon, 12 Jun 2023 18:35:11 +0000
Date: Tue, 13 Jun 2023 02:34:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [linux-next:master 1288/8413] xtensa-linux-ld: section
 .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data
 VMA [00000000,0008e717]
Message-ID: <202306130212.NljLSRbK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   53ab6975c12d1ad86c599a8927e8c698b144d669
commit: ff32fcca64437f679a2bf1c0a19d5def389a18e2 [1288/8413] Merge drm/drm-next into drm-misc-next
config: xtensa-buildonly-randconfig-r005-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130212.NljLSRbK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ff32fcca64437f679a2bf1c0a19d5def389a18e2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ff32fcca64437f679a2bf1c0a19d5def389a18e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130212.NljLSRbK-lkp@intel.com/

Note: the linux-next/master HEAD 53ab6975c12d1ad86c599a8927e8c698b144d669 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data VMA [00000000,0008e717]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
