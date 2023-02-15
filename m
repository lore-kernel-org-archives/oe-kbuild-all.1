Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E94D2F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 21:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676497814; x=1708033814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJbxGM1at82ithL2YDgk0zfw5naSstj9UdHguBTKTEA=;
  b=B+kOfFqYjpdvCwOndafxgz/h7JOOmG9UiJUBCAtSmS4A9mlEayGTOZ2U
   2XN0bbOvY13wrrkEm8lsI4MukDqdp0KIz0A9jx2N4QXYQNAfLLZW/VfdM
   EigRKl0ljGgxf2a63UHbi71ZU3a7ShLc1l4BiGuuZPPi1ExJP62I+m94M
   GXiHAeaVHUEcMuqnTzRQI+z2lmcYYSjp1KEuDs3Vuh4iIKcdk9DiULvKx
   p/Lhchsmq8S32KbKbi8nh7oA34dESu00dRXPSRIiVXc3Gu6iNhkcBzWoa
   1/yWQTUTjMgTU1+kN6pDb6yVVSPqW/4WS1FNuQbK0ZuCXtRGdbpu0R9k4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="315221418"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="315221418"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 13:50:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812695584"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="812695584"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2023 13:50:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSPfC-0009p1-1g;
	Wed, 15 Feb 2023 21:50:06 +0000
Date: Thu, 16 Feb 2023 05:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 6574/9999] signal.c:undefined reference to
 `uml_pm_wake'
Message-ID: <202302160557.XuckggpI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   707c48210a5384a72c82655a37895b7e822755f2
commit: b58294ce1a8ac8e234abd991255b1d1905520aed [6574/9999] um: Allow PM with suspend-to-idle
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230216/202302160557.XuckggpI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b58294ce1a8ac8e234abd991255b1d1905520aed
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout b58294ce1a8ac8e234abd991255b1d1905520aed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160557.XuckggpI-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/checksum_32.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/um/os-Linux/signal.o: in function `sigusr1_handler':
>> signal.c:(.text+0x211): undefined reference to `uml_pm_wake'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
