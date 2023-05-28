Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAFB7E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 03:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685245735; x=1716781735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N52BUgxVaFJqgu2uoARGUIDPn5UXkSDFtsv+VoyNjqw=;
  b=GNUlVXd8CEQFZWNfS8/+z1obtftYYWpQ26DVzMBo+HQjPLqzfx2qlCWU
   PNU5TPiP86v/i07IqPtO3/jwep+cb3OHRGNnnBqAUvThQphrPjP1u8NzA
   6u0mQr38WPZGzxnCO6G/NVaCUOdBZDdytfe7aOXPgCrXOAw2/kTo41zYj
   GADrvwH8bKwvzHuz0cHCRcw3f+PTz7/Z88s4NzuIVx6NcG3ySdHHjIZiw
   jsi1Rw0+KyH3ZXbi6VbIRLzHDr2zkpqPg9L2wo/xTIi7zYejoXjheWkty
   cC2C1mwNd31Y1w6CmGOq5WJo52mW/X6Px5tjn58CDIIHnj6dcyCF5KyAP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334833739"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334833739"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 20:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="817998576"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="817998576"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2023 20:48:53 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q37On-000KPq-0x;
	Sun, 28 May 2023 03:48:53 +0000
Date: Sun, 28 May 2023 11:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diet 32/34] drivers/net/thunderbolt/main.o:
 warning: objtool: unexpected relocation symbol type in
 .rela.discard.unreachable
Message-ID: <202305281102.O6yloOPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diet
head:   e83011919f26dc7d7363b27a94472cfe8e586ffe
commit: dd1773eb20fcce01411dccf60ee256407ad11431 [32/34] objtool: Get rid of reloc->rel[a]
config: powerpc-randconfig-m041-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281102.O6yloOPp-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=dd1773eb20fcce01411dccf60ee256407ad11431
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-diet
        git checkout dd1773eb20fcce01411dccf60ee256407ad11431
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/ drivers/ fs/ kernel/ mm//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281102.O6yloOPp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/thunderbolt/main.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> drivers/crypto/hifn_795x.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> arch/powerpc/mm/dma-noncoherent.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> arch/powerpc/platforms/4xx/pci.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> arch/powerpc/mm/nohash/40x.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> fs/ntfs/file.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> fs/ntfs/usnjrnl.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> fs/ntfs/bitmap.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> fs/ntfs/lcnalloc.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> fs/ntfs/logfile.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
--
>> kernel/time/tick-common.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
