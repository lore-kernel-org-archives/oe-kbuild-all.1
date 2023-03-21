Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54802D516
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 19:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679428013; x=1710964013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bc2r8mDOthYqP4YNMFl7fsqImkcW+tCJwuQtDcgCbRM=;
  b=Tce0lqxv1/xRtskdu05qistXSeV5fms/NARHTDcvvrxublZ25R6QNTLP
   Hd7oBi6dLoQHbECaXen9y31Sbkx6xbUXTwEjsx1X+7xLk2aYrvEcUA9Bu
   rs2NqD03OxwqmYMTHKmSG7oQZyROKe9e7I8dVG1nEmUK9HWCzOUITrUAB
   LQSkDw0p1UAzxsA3m+Ei1IKj5YNeF78VkxZ23KsaZeohnldCKmWwe1kHz
   yMWwDmuntUMpOg7VYpeN9h9P+lzS/89RMsnwe5q/YgtGFfSD7iOmKLUkB
   Bn9g5A6YG0lc00j5sjwlfHTreQYCJ0h/myPVVll4sZNtSlLM2zZCVYSTK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425337776"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="425337776"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 12:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792225889"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792225889"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 12:46:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pehwZ-000CLq-0X;
	Tue, 21 Mar 2023 19:46:51 +0000
Date: Wed, 22 Mar 2023 03:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 6023/9999] mm/page_idle.c:95:6: warning:
 no previous prototype for 'page_idle_clear_pte_refs'
Message-ID: <202303220306.DsNZkbaC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: a29243e2e89010e5c6e34454d1284cf9c035b39a [6023/9999] alinux: mm: Support kidled
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230322/202303220306.DsNZkbaC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/a29243e2e89010e5c6e34454d1284cf9c035b39a
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout a29243e2e89010e5c6e34454d1284cf9c035b39a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220306.DsNZkbaC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_idle.c:95:6: warning: no previous prototype for 'page_idle_clear_pte_refs' [-Wmissing-prototypes]
      95 | void page_idle_clear_pte_refs(struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/page_idle_clear_pte_refs +95 mm/page_idle.c

    94	
  > 95	void page_idle_clear_pte_refs(struct page *page)
    96	{
    97		/*
    98		 * Since rwc.arg is unused, rwc is effectively immutable, so we
    99		 * can make it static const to save some cycles and stack.
   100		 */
   101		static const struct rmap_walk_control rwc = {
   102			.rmap_one = page_idle_clear_pte_refs_one,
   103			.anon_lock = page_lock_anon_vma_read,
   104		};
   105		bool need_lock;
   106	
   107		if (!page_mapped(page) ||
   108		    !page_rmapping(page))
   109			return;
   110	
   111		need_lock = !PageAnon(page) || PageKsm(page);
   112		if (need_lock && !trylock_page(page))
   113			return;
   114	
   115		rmap_walk(page, (struct rmap_walk_control *)&rwc);
   116	
   117		if (need_lock)
   118			unlock_page(page);
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
