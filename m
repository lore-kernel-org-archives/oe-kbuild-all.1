Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7AAA2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 02:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683944043; x=1715480043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ExPqp5ZE11QpIdH2pTu3JHKjuILuwCxXKI4WNXrFg9c=;
  b=iCLiVGqI2Pr4yaZ47nliq4TVKavi6/UmVe7L6CZGGS0ua9fOJuO0MGoc
   lEoKhI8BC5UdpJLLiGuYmIwz/Nu+VNCw5PcE0tv/YsbA8RPTfwCDl+ABp
   unXbzVzNMOTek0UA9vHrKKRK3+FhKfoLIc4qAaakTFuTNwdk8Nb17fv8B
   +MWoaAUKldjt9bY3MOWD8tbdAKewrtI5feal1hSlRu2X30CO7Hx82xT/L
   6EYObBlHAc0WPFtALDH75HS+5zPwcZuwxI0DTamxekTN6Y444S1r3y7LA
   8yjgxj2dPWwaw/zwgrGBpFP8KZcieOJ0Vd3cJAckPFrtVcSUe03naqREC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="354055838"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="354055838"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 19:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="824551718"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="824551718"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2023 19:14:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxelk-0005FA-21;
	Sat, 13 May 2023 02:14:00 +0000
Date: Sat, 13 May 2023 10:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 5380/9999] signal.c:undefined reference to
 `uml_pm_wake'
Message-ID: <202305131024.Enb8OaOc-lkp@intel.com>
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
head:   f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
commit: b58294ce1a8ac8e234abd991255b1d1905520aed [5380/9999] um: Allow PM with suspend-to-idle
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230513/202305131024.Enb8OaOc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
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
| Link: https://lore.kernel.org/oe-kbuild-all/202305131024.Enb8OaOc-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: arch/x86/um/checksum_32.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions
   /usr/bin/ld: arch/um/os-Linux/signal.o: in function `sigusr1_handler':
>> signal.c:(.text+0x211): undefined reference to `uml_pm_wake'
>> collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
