Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50472F47
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674924828; x=1706460828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+o3QfgICgB0ULTb1/dVk5Tk167jK8QaEZNxbvJhNeQY=;
  b=QehlXf6vRQaTaBvn9vmm17GTPXznOS8KA+/3suocBiKa9LmM64H+5kha
   VpgNtpnSfPK3lWRbUgZhgXDrZEbRQw4Px5IrNzv6E5lZw20fAvykrNW+w
   EoEPhz3q653+YH7cvVXxb8n6iu4sAY43vGnUFclxirj86fxw7ZOL7mx3f
   qWqnJIOhQpceoEmmGPGpcabSRa2oLiatC+K2NMLmcJMP1P0fT2S+0Z063
   dkhf+gFF5ly7kWxjF/T0P1+dLXhc5thYhWwuTl4R5xJY0+pnFvt0w+Y9m
   zoZmIK584NSYfD77QVLHUoffRNyuKXsYb+X0OQ+FJkIGvs0SpoHHjDZU/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413530232"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413530232"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 08:53:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="787540586"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="787540586"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2023 08:53:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLoSV-0000vX-1V;
	Sat, 28 Jan 2023 16:53:43 +0000
Date: Sun, 29 Jan 2023 00:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Theodore Tso <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>
Cc: oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 03/31] ext4: Convert ext4_bio_write_page() to use a folio
Message-ID: <202301290044.oKaK49Hs-lkp@intel.com>
References: <20230126202415.1682629-4-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126202415.1682629-4-willy@infradead.org>

Hi Matthew,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20230127]
[cannot apply to tytso-ext4/dev xfs-linux/for-next linus/master v6.2-rc5 v6.2-rc4 v6.2-rc3 v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/fs-Add-FGP_WRITEBEGIN/20230128-150212
patch link:    https://lore.kernel.org/r/20230126202415.1682629-4-willy%40infradead.org
patch subject: [PATCH 03/31] ext4: Convert ext4_bio_write_page() to use a folio
config: loongarch-randconfig-r001-20230123 (https://download.01.org/0day-ci/archive/20230129/202301290044.oKaK49Hs-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f6e4c5cfaf2ef7b8ee6c5354bbbd5f1ee758746f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/fs-Add-FGP_WRITEBEGIN/20230128-150212
        git checkout f6e4c5cfaf2ef7b8ee6c5354bbbd5f1ee758746f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bio_add_folio" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
