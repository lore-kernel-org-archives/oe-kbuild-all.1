Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D0A210C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683405385; x=1714941385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19oKYO0kq/w3kqqrXuyiLWFZfH34Uo5ZD93M77W88N0=;
  b=bTQa9aJ8BHWrr7zX81Psr+fKoOOPgxPGvy/HX3F2lqRg6sPm53yD9QYx
   l9c3FW2UEjORvR4nVJ7AVKxaSzvONbRcMuI7JjOLPQCkxuaQP3vvgxl3N
   1l8nAVn7WI1vgna6hcptbdgYt6iZDNhebb4jMdD9HPKfOSzRX3a3vbmDg
   HOiGZ/uwh1NNtzXFBFCsUl65P5pVCxbxYpbATkzV0MLL0nJbflJLAcwgG
   ACxUVZlwDsiMo7H56z7jFN4+Kii3thWR+3RrOuHD6hkD6Lzq2jTp5TJbl
   XmM0Lfa+5pYf9YJf3N1QqbmCuDaUHmpnWfGVawmWPk4e9RpIygsbFMWjw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="412665569"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="412665569"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 13:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="692118532"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="692118532"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 May 2023 13:36:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvOdi-0000TO-2B;
	Sat, 06 May 2023 20:36:22 +0000
Date: Sun, 7 May 2023 04:35:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-stable 775/2570] (.text+0x800): multiple
 definition of `pcap_init';
 arch/um/drivers/pcap_kern.o:pcap_kern.c:(.text+0x40): first defined here
Message-ID: <202305070444.M8s1IrfP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-stable
head:   7e83b5e75b20f49d4940bf35dfc1e38f3f95e5dc
commit: 76751e14d179119739c548cc95ffbaa6ff52785d [775/2570] Compiler attributes: GCC cold function alignment workarounds
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230507/202305070444.M8s1IrfP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=76751e14d179119739c548cc95ffbaa6ff52785d
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-stable
        git checkout 76751e14d179119739c548cc95ffbaa6ff52785d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070444.M8s1IrfP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: /usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu/libpcap.a(pcap.o): in function `pcap_init':
>> (.text+0x800): multiple definition of `pcap_init'; arch/um/drivers/pcap_kern.o:pcap_kern.c:(.text+0x40): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
