Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06711CB9A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676417126; x=1707953126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TM/bWoha/TxGHZ3QRjyuIsOaRh1/GmyInwpbGqq0W3o=;
  b=XtEgp6hS37x8l1qAJVkDZMWrQwnoktiUtqWIRob1xmje7z2c5T393/9V
   DybMAmT04P8Wd3o47OZajnzYJT5LhI7H4oMDJjJbDJ2Z1jm3ILjIgBSJc
   VeGGFHK9atirwvLxozZfnoJootF0lVzOvxuinWOVAl3s6xahWVX2+hODQ
   a9y3+42RB7jsJGsVZ2gW2oCmOJENsqKfpxbXN9mnK9fgEtnL/+cB6Y6LB
   uT09WBB0MSiLZif7S0J9ZQi1rNNFaPkJYfIC9B5mnWk5dpSSVSNL8JICc
   THSM7QblBcnsjhD8DH0hU4sUfPH++eQyCDridhqmHal3h+SGXkEX5CsL6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314950097"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="314950097"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 15:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699730521"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="699730521"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 15:25:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS4fs-0008qy-1K;
	Tue, 14 Feb 2023 23:25:24 +0000
Date: Wed, 15 Feb 2023 07:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [palmer:for-next 49/53] arch/riscv/mm/hugetlbpage.c:269:13: warning:
 no previous prototype for 'is_napot_size'
Message-ID: <202302150749.xAa0DS9M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   deea8013872bd6868b30610fa43b73b6987a7eaf
commit: dc99ea81b5efa1253972daea23f5591dd423c003 [49/53] riscv: mm: support Svnapot in hugetlb page
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230215/202302150749.xAa0DS9M-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=dc99ea81b5efa1253972daea23f5591dd423c003
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout dc99ea81b5efa1253972daea23f5591dd423c003
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150749.xAa0DS9M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/mm/hugetlbpage.c:269:13: warning: no previous prototype for 'is_napot_size' [-Wmissing-prototypes]
     269 | bool __init is_napot_size(unsigned long size)
         |             ^~~~~~~~~~~~~


vim +/is_napot_size +269 arch/riscv/mm/hugetlbpage.c

   268	
 > 269	bool __init is_napot_size(unsigned long size)
   270	{
   271		unsigned long order;
   272	
   273		if (!has_svnapot())
   274			return false;
   275	
   276		for_each_napot_order(order) {
   277			if (size == napot_cont_size(order))
   278				return true;
   279		}
   280		return false;
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
