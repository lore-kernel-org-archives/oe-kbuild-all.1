Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70DA2D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683190399; x=1714726399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwDDxnA/XvzGgwBsv8GlmvLNxlcu+WAowrA7ej1ixFU=;
  b=SdkKwk/z/bqIHUixS1s+/4afp3eYJAsGWivg+9fHUgW77s0mMZUhb2+2
   ThFosil//LK6CZsa4iiRZ8IuQEZuQHbzJWwiXzQ2ai1kbvH3FdYRogxm5
   C5+q6DE4lb2I01bOhuTQ3AW8HRlb/gE8Bd0j37Bm9XLjyhvC0SpnT8wKL
   u4F1VqwXbAYyhACjvL4A0nmPb+VP2fLXU+uR7ezf7OkDFPGwGh3WI8hav
   kRgr4i9So5Mj/sM5OHLsJeXimzI8PTPaCIrCjX1Y+2JdZOKZ0YW8Qb8q9
   eTiLZdh1u/b1VaD+NoMwYrh2A7xAjPq4NKZ+1vkij+HV2GrdFTGeRR7uf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348916596"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="348916596"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 01:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786439810"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="786439810"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 01:53:13 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puUi8-0002jY-1Q;
	Thu, 04 May 2023 08:53:12 +0000
Date: Thu, 4 May 2023 16:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup 9/12] ld: warning: section `.pgtable' type
 changed to PROGBITS
Message-ID: <202305041652.QiRagWlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup
head:   d19cef90fb0bff9916366748b6bd1ac55247a86b
commit: 67dd00f48bd9e38b1bbf430b3708ec63e88361d1 [9/12] x86: decompressor: Merge trampoline cleanup with switching code
config: x86_64-randconfig-a004-20230501 (https://download.01.org/0day-ci/archive/20230504/202305041652.QiRagWlp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=67dd00f48bd9e38b1bbf430b3708ec63e88361d1
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup
        git checkout 67dd00f48bd9e38b1bbf430b3708ec63e88361d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041652.QiRagWlp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld: warning: section `.pgtable' type changed to PROGBITS

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
