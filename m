Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D1023A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 06:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681970970; x=1713506970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SG27xfyd1pu70s35OFm2RfUWyIVOiPiWvUPQJF6uQhw=;
  b=QmLCgtvStg2hBLqB0hMa7QoHr/1bsA5MuQTQ4ODVc9FcB3qHvroyggvH
   uGZrqphNWrZH6GCQCC4Te6sneIdJJtVrqkVvLdV/eHc6ytQ32kqvwFfwQ
   yLrosANI0T1lVBvjosWw43icEp7dykyxSkMlRMz8VbjHn6GxJDhHpBs/3
   R2c3hYzy4JKv2bsNU0IveJx/dNPEfk44RtpQqRT6ayYAKVv92BimVXKCv
   WUheSeVbD8FPwJs2G8qLrNSmInoCPF1kFi5aUcWy8umTWhDosNdHt3MKK
   atg3+5ITwHVbykG2gIy3TxbY2qixRyY5H09UVgCy7022qU3Y57Fv2JLdJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="329820053"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="329820053"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 23:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815891380"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="815891380"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Apr 2023 23:09:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppNU0-000fX8-1R;
	Thu, 20 Apr 2023 06:09:28 +0000
Date: Thu, 20 Apr 2023 14:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-x86-zboot 10/10]
 drivers/firmware/efi/libstub/zboot.c:64:21: warning: no previous prototype
 for 'efi_exit'
Message-ID: <202304201454.QBGKLv1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-zboot
head:   b442525d3c465de95c5fa7810520133dd049b146
commit: b442525d3c465de95c5fa7810520133dd049b146 [10/10] efi/zboot: x86: Add mixed mode support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304201454.QBGKLv1W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=b442525d3c465de95c5fa7810520133dd049b146
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-zboot
        git checkout b442525d3c465de95c5fa7810520133dd049b146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201454.QBGKLv1W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/zboot.c:64:21: warning: no previous prototype for 'efi_exit' [-Wmissing-prototypes]
      64 | efi_status_t __weak efi_exit(efi_handle_t handle, efi_status_t status)
         |                     ^~~~~~~~
   drivers/firmware/efi/libstub/zboot.c:70:1: warning: no previous prototype for 'efi_zboot_entry' [-Wmissing-prototypes]
      70 | efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
         | ^~~~~~~~~~~~~~~


vim +/efi_exit +64 drivers/firmware/efi/libstub/zboot.c

    63	
  > 64	efi_status_t __weak efi_exit(efi_handle_t handle, efi_status_t status)
    65	{
    66		return status;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
