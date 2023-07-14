Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290213727
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 13:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689339886; x=1720875886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F2nSM0pK3le+8MSjHVQhupIT6BdUnuOOKFHme9n5IBI=;
  b=BZeaQ8ExTXqYEMdEPHgwSKQ4E5BU4jEQnzKGCwd8j2RD4gBQh6ZNH2h2
   eW1Nz91zecN65uadBBLd4Cg9OFLQK9nWxbJl+4iKTx5esXBdhSe9dIFP6
   dGkBEgxPtB7rMoZT7PS40PK+ICIbaC40SF3FMwTfq+zrtGeBrjovCI9n1
   voWqh2xIs9G/uOFNE261Xj8+2zKWM3QpgDblAFGo1yQH67Au3tk8ORnIY
   QprhTqpYu3DEK/lq4BsMEfCFkY8ClQnKKHLHk4jLIrP2IkDSOJALaLWi5
   qwivysv2mSiHVjQtqTLWADRUf1qnotqtljYRYIBHW5/vVEV2iPCMEV4xL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365507960"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="365507960"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 06:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="836036155"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="836036155"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2023 06:04:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKITK-0007SJ-2s;
	Fri, 14 Jul 2023 13:04:34 +0000
Date: Fri, 14 Jul 2023 21:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 36/9999] lib/test_ubsan.o: warning: objtool:
 test_ubsan_init()+0x20: unreachable instruction
Message-ID: <202307142010.XstUUnyz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d54cfc420586425d418a53871290cc4a59d33501
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-buildonly-randconfig-r002-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142010.XstUUnyz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142010.XstUUnyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142010.XstUUnyz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_ubsan.o: warning: objtool: test_ubsan_init()+0x20: unreachable instruction


objdump-func vmlinux.o test_ubsan_init:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
