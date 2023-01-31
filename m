Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027D7E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 00:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675124429; x=1706660429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YC7s3p+Tj42xrmy5v4cDZMXK6QB1llH1wDlkhLZWbc8=;
  b=mEGCRGwsj2prxEkZlxbEzeXJIecFCJGMRb/kleCbw7pJH/aRdne4D2jc
   b4OlhZTREiZwJbcATv5WNnMntys4UsEf/Xh4B+ObjgqS04mHOPsOUs6S1
   38rvS7rZMlwtED9pPxUroKe3tFDRVqiqhA4GLz3ztt2qf7K6MLf0OMWaC
   cBAhVur3aiSdFZifezlD/9uTRXKWVw/yqDbhU4rZIdWbGPnJm36h51dzX
   8VzMXsbjEsPxn+TEK33Rrrl5jiprpfe1FAn2O1KwpZSofIFUHF/e2JJjN
   Kvxc6423r16R9V+Tbpkl2atrFkPAvOLBGNlNMLPipji636yqsvxGakZND
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307366822"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="307366822"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 16:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="788227863"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="788227863"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Jan 2023 16:20:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMeNs-00040A-2a;
	Tue, 31 Jan 2023 00:20:24 +0000
Date: Tue, 31 Jan 2023 08:20:15 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [soc:sunxi/drivers 3/3] kismet: WARNING: unmet direct dependencies
 detected for PM_GENERIC_DOMAINS when selected by SUN20I_PPU
Message-ID: <202301310814.4bjewTLz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sunxi/drivers
head:   0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d
commit: 0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d [3/3] soc: sunxi: Add Allwinner D1 PPU driver
config: riscv-kismet-CONFIG_PM_GENERIC_DOMAINS-CONFIG_SUN20I_PPU-0-0 (https://download.01.org/0day-ci/archive/20230131/202301310814.4bjewTLz-lkp@intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc sunxi/drivers
        git checkout 0e30ca5ab0a80fdc7f1055f63c1436dfdc4d317d
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
           kismet --linux-ksrc=linux --selectees CONFIG_PM_GENERIC_DOMAINS --selectors CONFIG_SUN20I_PPU -a=riscv
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=riscv olddefconfig

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS when selected by SUN20I_PPU
   .config:4683:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
     Depends on [n]: PM [=n]
     Selected by [y]:
     - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
