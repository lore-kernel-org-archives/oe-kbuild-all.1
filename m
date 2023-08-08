Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4F1B7F0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 21:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691528899; x=1723064899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uMVCReipOKw7RyiG4ccxeHqHOfUrvfg6j2USwJ+u+EI=;
  b=SR532+9/JFjSsnxrMhkSEAYZRSanm/qJ1fMckJix5dLf+DmPZeHDN/Gj
   Rwy/9mTxKp2vyk4z6c4TBmMp/Ur1T93AI0xowBkNUhJN6brMTG8Vd4xsJ
   Q7/Dy1O/xUw30lkyrRDVXPiUtIFN8tvTPBqgBJwIK6fVJ+YZI7Y/HPsAQ
   ENYOFLOjSMgPkTONCeoQWEvkj0Ga08JlnyACjANR1Bc936FO2PSX4HpyV
   D8lFRorVP6vvAhP5ywZ/ykNSQdPi3pE2vd+XcdAjkSdS+7Ta+ZVOvKGlz
   JlCn5albo5MzY+qy/p3+5jVlNuqzy4oQHVnIvIHSPiLv0Oa+oQHCEez8E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457335053"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="457335053"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 14:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801475878"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="801475878"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 14:08:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTTw6-0005ca-1s;
	Tue, 08 Aug 2023 21:08:14 +0000
Date: Wed, 9 Aug 2023 05:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 5/5] maple_tree.c:undefined reference
 to `kmem_cache_prefill_percpu_array'
Message-ID: <202308090441.tanpiTSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v1
head:   23793c9cd4b2fc31144dba68dd67554b8e4308e9
commit: 23793c9cd4b2fc31144dba68dd67554b8e4308e9 [5/5] maple_tree: replace preallocation with slub percpu array prefill
config: arc-randconfig-r043-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090441.tanpiTSJ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090441.tanpiTSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090441.tanpiTSJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: lib/maple_tree.o: in function `mas_preallocate':
>> maple_tree.c:(.text+0x7d2c): undefined reference to `kmem_cache_prefill_percpu_array'
>> arc-elf-ld: maple_tree.c:(.text+0x7d2c): undefined reference to `kmem_cache_prefill_percpu_array'
   arc-elf-ld: lib/maple_tree.o: in function `maple_tree_init':
   maple_tree.c:(.init.text+0x22): undefined reference to `kmem_cache_setup_percpu_array'
   arc-elf-ld: maple_tree.c:(.init.text+0x22): undefined reference to `kmem_cache_setup_percpu_array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
