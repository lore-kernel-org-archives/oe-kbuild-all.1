Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97E1364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 02:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681265623; x=1712801623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSzgT6yXpnQH5Mj1yNlGFqItBKZxuX9VRfQ78EMq9RI=;
  b=idelM9OBt66+DglW4ryv8E4gdk5nMclp6iFX/CWC8xOC/XSAGdKcw2k+
   10e9SHOSNM9jYWLaIfASpqOtBG4UcmgymUxcy/ipa/f9hwB8zpjGthnJr
   5MoePeB+K5Pt5j6aEbCoDafPMfRkbezIgmR15aSjV5oxnN9LKTs2X5Dq1
   Byykvgq9A+NT8oGZKVjKmqAu+sT4hlFrmgb6kyP+LJrUwOt1U0sqX+eNY
   EShJy95OZaS1Of56VIqVEqPTzkW674HE2PR5g3G7lpy6UNRsioKA3Z0Uk
   IzY7SE7JTv2D59PVlxcmFgn5aNNnR6nVO8LHxlVEouLKw/VcE7wHY5ovp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341268626"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="341268626"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 19:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="639030958"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="639030958"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Apr 2023 19:13:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmPzR-000X0i-00;
	Wed, 12 Apr 2023 02:13:41 +0000
Date: Wed, 12 Apr 2023 10:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-la57 1/1]
 drivers/firmware/efi/libstub/x86-la57.c:19:35: sparse: sparse: cast
 truncates bits from constant value (fffff becomes ffff)
Message-ID: <202304121042.UfW7lqVi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-la57
head:   f19379b52679e058081ed37ca0bab8817a216aac
commit: f19379b52679e058081ed37ca0bab8817a216aac [1/1] efi/libstub: x86: Perform 4/5 level paging switch from the stub
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230412/202304121042.UfW7lqVi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=f19379b52679e058081ed37ca0bab8817a216aac
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efi-la57
        git checkout f19379b52679e058081ed37ca0bab8817a216aac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121042.UfW7lqVi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/x86-la57.c:19:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   drivers/firmware/efi/libstub/x86-la57.c:20:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   drivers/firmware/efi/libstub/x86-la57.c:21:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)

vim +19 drivers/firmware/efi/libstub/x86-la57.c

    17	
    18	static const struct desc_struct gdt[] = {
  > 19		[GDT_ENTRY_KERNEL32_CS]	= GDT_ENTRY_INIT(0xc09b, 0, 0xfffff),
    20		[GDT_ENTRY_KERNEL_CS]	= GDT_ENTRY_INIT(0xa09b, 0, 0xfffff),
    21		[GDT_ENTRY_KERNEL_DS]	= GDT_ENTRY_INIT(0xc093, 0, 0xfffff),
    22	};
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
