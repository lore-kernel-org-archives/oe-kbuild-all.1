Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E6EAD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686860218; x=1718396218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kH5Cb/L5WSB063d6Udb7CJM348wIGhZElgRYNsAxI6Q=;
  b=Rsi194ww18FZLhh4t1+wvewDCZ0xseDzQ4gXSx4UV7rSabHGrOeiH86I
   cIvkPYvRRI5bHCf6lwADGBGT7EMqEDVInrYEC4qrfSQbk56sneSPz+2rA
   CMZlTLVeObPX6ZbBWhw57G6LSRk5ey7NjeYYQSpEJ5QwoFvtsk89Pho3h
   3RKwFHyrhvyPan81K1cdg0haOt/0VCBrAj8VBLz7SY5ICykzly7azlA9D
   OpkKiBn9CBSFy2z5Rm1FI3Dx17AjDtKdZsmQDeENkyE+vISvtzlro8EyE
   66Eq3xBqrv8j+hkWBH8YtmmW/lQ0yGKz12ldwMrYIWPpnFWNfzgBFJSiE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339371141"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="339371141"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 13:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="886821065"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="886821065"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jun 2023 13:16:49 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9tOi-0000Lp-1h;
	Thu, 15 Jun 2023 20:16:48 +0000
Date: Fri, 16 Jun 2023 04:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 17409/27777] htmldocs:
 Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc"
 directive:
Message-ID: <202306160415.OBRM8JrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WeiXiong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39a9b92e9828f28d3c1bfae81b3121d973b76ad3
commit: c0003a71672a751ec23d85451cbe43ff64609ab1 [17409/27777] UPSTREAM: Documentation: Add details for pstore/blk
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout c0003a71672a751ec23d85451cbe43ff64609ab1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160415.OBRM8JrT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc" directive:
>> Documentation/admin-guide/pstore-blk.rst: WARNING: document isn't included in any toctree

vim +152 Documentation/admin-guide/pstore-blk.rst

   151	
 > 152	.. kernel-doc:: fs/pstore/blk.c
   153	   :identifiers: register_pstore_blk
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
