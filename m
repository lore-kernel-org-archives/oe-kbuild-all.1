Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F25BEC2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693205879; x=1724741879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dC8cUnMy9lQ3r5tff54acsSzk/MSodVDGfJ7c6neKU=;
  b=eqTVCM+fIbPq6K8kfD23FK4frdbrHmXnNg3rYPTolWpKo3maSv12bHO1
   cP/XYkJglh1P/x24hbPv+vG0HDw0JVqxre9EfPiddsbSMugZ7weOtbQL8
   4laBIm4cE81Dm11E54lTiyKoubI3cfHTLdFQiO426j6KALz1v3doNwMxN
   kyBXj/u11SqJkIi5gQwdY+d7PZ5rvfoyznbUw0wk6ShJwaqvbXuLMwT0z
   ePSSFULJe4rC7up+b4flCtc0y9p4iip2hzoLaK3zXypXkbI+hEdgYOeuI
   LU4BlYKUHjxnI8Surs/a8MrbfqAgZcFnReiEhQozZXw5wNIDVTDfPsTzf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="360027222"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="360027222"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 23:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="828237787"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="828237787"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2023 23:57:48 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaWBT-0007eN-2r;
	Mon, 28 Aug 2023 06:57:33 +0000
Date: Mon, 28 Aug 2023 14:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 21/21] mm/shmem.c:95:8: warning: type
 qualifiers ignored on function return type
Message-ID: <202308281433.WAS6oHIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   a8f31bd038880e11b0786822f42ef8fa6276c303
commit: a8f31bd038880e11b0786822f42ef8fa6276c303 [21/21] shmem: 16K on 4K hack
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20230828/202308281433.WAS6oHIn-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281433.WAS6oHIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308281433.WAS6oHIn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:95:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      95 | static const unsigned long shmem_base_nr(struct address_space *mapping) {
         |        ^~~~~


vim +95 mm/shmem.c

    94	
  > 95	static const unsigned long shmem_base_nr(struct address_space *mapping) {
    96		return 1L << mapping->order;
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
