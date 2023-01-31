Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A8A922
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 17:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675187835; x=1706723835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4XSnKiv8vSWo21p/W1KrAXKbkENvqiNboiHsio9kaU=;
  b=UV86yQTJwfHQIBkktHgsRAElatmsoN2NAhl3H3NgqaQr/um5nl6HDC5Z
   dgGfhhxrDLRp+OAK5Wea055WLQsyqo+fUEcLx5Z21GtoIkdwg3aW486lD
   WOvoRk0FJUr2Ixs9KzL4qFGlZ8RFgGMAZFXB4oZKSdl25tVUZqzSb/TcP
   xPpUNb9PRo6NrsubzJ0//u+n86M5Jxux0kTlJQQ9xrLlr7/3rqIuZDK93
   uzPYyRDpMf3O7XOVNd4kPilwVn6H7DnIqVBoTFdJOX8+VzWLqt4dZJtwD
   qrS0/Hr4fpbreMbTO8ZZKKXtsOHWmoRBh5mSgfAsnFJHhjz1TkBScBS19
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="325610792"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="325610792"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 09:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="642066770"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="642066770"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Jan 2023 09:57:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMusV-0004bS-09;
	Tue, 31 Jan 2023 17:57:07 +0000
Date: Wed, 1 Feb 2023 01:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kalle Valo <kvalo@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [linux-stable-rc:linux-5.10.y 7843/9999] ERROR: modpost:
 "clk_get_sys" [drivers/net/wireless/ralink/rt2x00/rt2800lib.ko] undefined!
Message-ID: <202302010134.ONZHE0r1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   930bc29c79c40d957f1ec23eba4fc9abec745eb5
commit: a01614447954733a020ae15260d19f8e89a1ad1b [7843/9999] wifi: rt2x00: set SoC wmac clock register
config: m68k-buildonly-randconfig-r003-20230131 (https://download.01.org/0day-ci/archive/20230201/202302010134.ONZHE0r1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=a01614447954733a020ae15260d19f8e89a1ad1b
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout a01614447954733a020ae15260d19f8e89a1ad1b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_get_sys" [drivers/net/wireless/ralink/rt2x00/rt2800lib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
