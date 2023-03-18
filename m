Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AF136C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679139405; x=1710675405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YA/YlhFWg3v90bS4BsD8oJGyJweR/4NwxzeYNqhWLl8=;
  b=n0wk602eRA5Q1r1hZTTVBixaoTxO/6LM8B5fIUXw8q8a+2e0OymSoydH
   5feMCCA0pn2sx0e/S/eFsqeJup4RQf2eaJBTPa+APlegWrSkNZZy9Q2UC
   bN+5OJs1ZmP1TmUxqqo6i46xa56woHNDskCii9Eja4F1ckFVmI76afluq
   EQaz5zp7kdoKRuC6q+xEuEIkNqRc1RA6hEGCjTh+cATKrcm5RpAqbSZRu
   AFKQbe+Y3/iJ57i8dD2ToN5IOxiRGEroCXgbrTLkrY75gpBM5nW9/2W6u
   0UpvPIYERKxxN/TuoDTAqv1vwH1xoDvszAczDQnPYEhRbkGJ+hRflj1vJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="403298744"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="403298744"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 04:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="713044804"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="713044804"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Mar 2023 04:36:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdUra-000A2I-1j;
	Sat, 18 Mar 2023 11:36:42 +0000
Date: Sat, 18 Mar 2023 19:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [linux-next:master 1753/4413] kismet: WARNING: unmet direct
 dependencies detected for RISCV_ALTERNATIVE when selected by
 RISCV_ISA_SVNAPOT
Message-ID: <202303181908.kXBoTMsN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f08c1de13a9403341c18b66638a05588b2663ce
commit: 23ad288aaf153a78b042e10062be1a6284909f95 [1753/4413] riscv: mm: modify pte format for Svnapot
config: riscv-kismet-CONFIG_RISCV_ALTERNATIVE-CONFIG_RISCV_ISA_SVNAPOT-0-0 (https://download.01.org/0day-ci/archive/20230318/202303181908.kXBoTMsN-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=23ad288aaf153a78b042e10062be1a6284909f95
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 23ad288aaf153a78b042e10062be1a6284909f95
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_RISCV_ALTERNATIVE --selectors CONFIG_RISCV_ISA_SVNAPOT -a=riscv
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=riscv olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181908.kXBoTMsN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE when selected by RISCV_ISA_SVNAPOT
   
   WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
     Depends on [n]: !XIP_KERNEL [=y]
     Selected by [y]:
     - RISCV_ISA_SVNAPOT [=y] && 64BIT [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
