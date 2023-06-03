Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C6C2E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685829418; x=1717365418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seyM8S7lCiiRW4k/vs7HKRZy/jrS9FZ8OZRUxFI5i5Q=;
  b=PQO6b2viXKQfFpid9R7q7Kl8eclnhmWx1gfQZSKMBH5N2HQtJYghG317
   9trpFvSOFS15UK9aLBvmQ+NbijGktPcx0v3/7u6oH5KAbmP6aywF2OkZM
   j3KwWcLTyNfbtdooXS1ij9Cc3qnv2Kwv7yQIflfCjez+aly4QoRSudzxT
   ix/R4kMIkGbE81s/DhghkMWvAVeWpuy9Z8B53Md/qZEFQsP6sHOjMo360
   h5bDAHfMcCpExLALjU71pL7hw5id9/8aP9grWYY/8B+st1D1/Xk6F1kcL
   ZO+exOvGad3X1+mYw+afg+ojidLlDcpiAwFzwtmlX+cnn8z9xw591Ytdm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="353609999"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="353609999"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 14:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="708211713"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="708211713"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jun 2023 14:56:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5ZF2-00022b-0l;
	Sat, 03 Jun 2023 21:56:56 +0000
Date: Sun, 4 Jun 2023 05:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup-v5 13/21]
 drivers/firmware/efi/libstub/x86-5lvl.c:16:35: sparse: sparse: cast
 truncates bits from constant value (fffff becomes ffff)
Message-ID: <202306040556.A8u8VbxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup-v5
head:   bd5653d7a6d31ccffc8ad30157730a923df99f5d
commit: 8857251ea60f26ab14e995a1ea8cdab2fa0c3661 [13/21] x86/efistub: Perform 4/5 level paging switch from the stub
config: x86_64-randconfig-s022-20230604 (https://download.01.org/0day-ci/archive/20230604/202306040556.A8u8VbxG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=8857251ea60f26ab14e995a1ea8cdab2fa0c3661
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup-v5
        git checkout 8857251ea60f26ab14e995a1ea8cdab2fa0c3661
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306040556.A8u8VbxG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/x86-5lvl.c:16:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   drivers/firmware/efi/libstub/x86-5lvl.c:17:35: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)

vim +16 drivers/firmware/efi/libstub/x86-5lvl.c

    14	
    15	static const struct desc_struct gdt[] = {
  > 16		[GDT_ENTRY_KERNEL32_CS] = GDT_ENTRY_INIT(0xc09b, 0, 0xfffff),
    17		[GDT_ENTRY_KERNEL_CS]   = GDT_ENTRY_INIT(0xa09b, 0, 0xfffff),
    18	};
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
