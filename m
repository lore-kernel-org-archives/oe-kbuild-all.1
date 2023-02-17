Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB45376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 02:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676601238; x=1708137238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xTucAtXIL8+fdcfDDA1AN57JfEYNyE/o/QzIiGXzTJw=;
  b=jDLcRElOQFLRMtvqXQwMsU/EJGIVuT1YyPasyenSQeumZlQnc5SA+Ac3
   0qPhEHMiSafTmCqG4cIMwaeIi72qKL0EPA7U4tcsqprOtyPF70dExVmgr
   UUOn19qivsjH3iWcrQvkLeuDszMe6oeOV0ssHb8CJNQbWh6vswyDGHQUF
   f7Ey98+oBqL30iQrFRXO6lypZAPW8uWUhQh5GmpSRcWm0nReUx93bR9AE
   Nv54SL3kZNUOq8rmrRo+hz9yyt3W3UT9QfXYBGDmu72OYOKcp52uVbtTZ
   VcCzDQUc+yiK3Rt/hzYPKX72SLkOxoaQ4I2Ur1z/zqCusrktsNOW1EhtE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="319994354"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="319994354"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 18:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759205573"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="759205573"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2023 18:33:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSqZQ-000B3F-0H;
	Fri, 17 Feb 2023 02:33:56 +0000
Date: Fri, 17 Feb 2023 10:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jingbo Xu <jefflexu@linux.alibaba.com>, xiang@kernel.or,
	chao@kernel.org, huyue2@coolpad.com, linux-erofs@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] erofs: convert hardcoded blocksize to sb->s_blocksize
Message-ID: <202302171043.1jwcthbb-lkp@intel.com>
References: <20230216094745.47868-1-jefflexu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216094745.47868-1-jefflexu@linux.alibaba.com>

Hi Jingbo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev next-20230216]
[cannot apply to xiang-erofs/fixes linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingbo-Xu/erofs-set-block-size-to-the-on-disk-block-size/20230216-175045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20230216094745.47868-1-jefflexu%40linux.alibaba.com
patch subject: [PATCH 1/2] erofs: convert hardcoded blocksize to sb->s_blocksize
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230217/202302171043.1jwcthbb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/30b09ec3be57f3777d22e71d2d4e5ec70d9227f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jingbo-Xu/erofs-set-block-size-to-the-on-disk-block-size/20230216-175045
        git checkout 30b09ec3be57f3777d22e71d2d4e5ec70d9227f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171043.1jwcthbb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_ldivmod" [fs/erofs/erofs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
