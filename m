Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE7E574
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690220666; x=1721756666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9YvUtEHKDKan7TIOhe6Uid1gNy8jUS4E+uwEEjxUGE=;
  b=np3slZPHD3DcjgQMCilHl8nMNbs1sU8hOl2aUW57SP+cqV1zXC7gx4EQ
   HmhAU8wQqqxbwZWHcg2BRnaeNsWuAfst1X8F+/EpfIQIlUpLWlt5mGsw+
   oWayk6ZPQJ3YHqFY3z1FYH2XXOMt5NuBYAVtj5k3Z+IZbMlGlCKz7gTNP
   K1rOKFgUs8w6QWrx+mU9mUqs537t/z2Ng/9Eg6hxCf7cD+avkPTjyIvEK
   Y5F4zYZ1Sdj9ytnEWwVUowNC5lMmZjEHq7ny4en/1VSqEoEUFzC92u4OU
   Bbx97JUpvBWIrf500xToTQs9JpErCrQ8C7Xq7gWckPHQ8fdXyJvrAcf2n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="364969529"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="364969529"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="849720097"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="849720097"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Jul 2023 10:44:23 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNzbb-0009vQ-0C;
	Mon, 24 Jul 2023 17:44:23 +0000
Date: Tue, 25 Jul 2023 01:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [stable:linux-5.10.y 119/9999] WARNING: modpost:
 lib/test_bitmap.o(.text.unlikely+0xd8): Section mismatch in reference from
 the function bitmap_equal() to the variable .init.rodata:clump_exp
Message-ID: <202307250102.tkAnbAPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   381518b4a9165cd793599c1668c82079fcbcbe1f
commit: b506450ce3d904386c1bd7e33c74f9343548d2d8 [119/9999] seccomp: Add missing return in non-void function
config: xtensa-randconfig-r032-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250102.tkAnbAPJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250102.tkAnbAPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250102.tkAnbAPJ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: lib/test_bitmap.o(.text.unlikely+0xd8): Section mismatch in reference from the function bitmap_equal() to the variable .init.rodata:clump_exp
The function bitmap_equal() references
the variable __initconst clump_exp.
This is often because bitmap_equal lacks a __initconst
annotation or the annotation of clump_exp is wrong.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
