Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A6746B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679172595; x=1710708595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1uPvqFkj6xuETldZ6mZqMSkNUnGUIg7Gas4Q9O07BA8=;
  b=S+ZKQ0uWqan3rVniwaLJo6ZfwOUmIAlhdCer1OL63WsoyiW4kfIBmQVb
   vWKyYUWouXEwAjGlHQTrexapAo6pX4fOm/vfVjm3ESJSUyJpxDkN6PojM
   IG7RhiXxbmndnbLBIYZXdsJeXkQrV59LX+GAhw49+s/QSln2hO27MHMGO
   SNdMl5tK9/Ff0Q+PZtbZUTeZR3VYpl/fKhJNjcYossEpUPADUQvdeiGH4
   kTREuVmO5gFk3SmfLxlcR5WoL9j0SKDIhhrpeS1ec7HjtsXAE3ymYEXuG
   1BXy5iw7iL++qmW8Wo0hkw4ICuPtN0UUBhkG0o7GgGM1z8fPoTmsOgDsi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="322307176"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="322307176"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 13:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="657923989"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="657923989"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 13:49:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pddUv-000AGd-29;
	Sat, 18 Mar 2023 20:49:53 +0000
Date: Sun, 19 Mar 2023 04:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: undefined reference to `ftrace_likely_update'
Message-ID: <202303190415.4WEArirP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   534293368afa1a953c283310b82e4dc58309d51e
commit: 54d9469bc515dc5fcbc20eecbe19cea868b70d68 fortify: Add run-time WARN for cross-field memcpy()
date:   6 months ago
config: s390-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230319/202303190415.4WEArirP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=54d9469bc515dc5fcbc20eecbe19cea868b70d68
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 54d9469bc515dc5fcbc20eecbe19cea868b70d68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303190415.4WEArirP-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/purgatory/purgatory: in function `sha256_update':
>> (.text+0x248c): undefined reference to `ftrace_likely_update'
>> s390-linux-ld: (.text+0x2984): undefined reference to `ftrace_likely_update'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
