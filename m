Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD1BE4C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679232909; x=1710768909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnRo+o/kzzIblf4ZeyPIPEeMbm0P1kC4GN3JrJrHgTo=;
  b=crX11ziCSIY7Sr8qrpxnhkXHxU3RzXwlszUlHknNrSPVJznDB7gINsQN
   JbjFUJU7b2ePGhy7File0jp7rRzY23okUI6PENoEHBvXvZPUgznWAKqMD
   sOQfAV84iSpLUDZzyghuDRyFYHmHSlAVJGCYPU7wlRuVSPCKc/O9zSGjH
   fpnw72siRbAHBOxkqibk+BT1SNaIXp/KaTMmAsTUrRfOWAmUt71B5E99l
   wyNtN5lOCIA3Sn2uFUSECJyW2WKMjFcyM4as4Pj/5WxFfhPj/BDrQAaxf
   AHMn3HjcNh586Sd7vMQ3bN9bZ2lxgPDYBKdByL5CPy8uX+cFE3e+N9ZRH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="318909339"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="318909339"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 06:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="926695310"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="926695310"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Mar 2023 06:35:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdtBj-000AXC-0O;
	Sun, 19 Mar 2023 13:35:07 +0000
Date: Sun, 19 Mar 2023 21:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/030-misc 25/25] grep: include/config/auto.conf: No
 such file or directory
Message-ID: <202303192149.6ofSe4Dt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   a292f9932bf74b5d3412a734bac1dea12a8a4198
commit: a292f9932bf74b5d3412a734bac1dea12a8a4198 [25/25] scripts: Exclude Rust CUs with pahole
config: sh-buildonly-randconfig-r006-20230319 (https://download.01.org/0day-ci/archive/20230319/202303192149.6ofSe4Dt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/a292f9932bf74b5d3412a734bac1dea12a8a4198
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/030-misc
        git checkout a292f9932bf74b5d3412a734bac1dea12a8a4198
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh distclean

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303192149.6ofSe4Dt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> grep: include/config/auto.conf: No such file or directory
--
>> grep: include/config/auto.conf: No such file or directory
>> grep: include/config/auto.conf: No such file or directory
>> grep: include/config/auto.conf: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
