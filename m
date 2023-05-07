Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA62A179
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683419306; x=1714955306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vldJcUcV+arc/yRG4q8/+E55D149ND6AFnd55bKlR6k=;
  b=cMVIJETZ1ky8jzQiZ2cux+jRox+SXbjpo58g6CVLDt7iDzq3FI59EPmM
   zmU3PD8aS/U5FvqzKNvnmRpRUv42fP4yJm3ctTCfJ1p/X2GAf1hDuj/x8
   QHpBSZ/6bW9dXNuMqMf3P9mhzqU5fOu7DdVbDwX+uJoInQyAucUO0vWks
   FTuwT/uhpzNxzGnRmLA1R6QlBjuMjmFs3ubyY0BiIV9Rdp7mwdzqlQh/9
   xLnq59mJ0Mj9OvqJjB2oW5eFtDYHa4POxGrAIrlF8Hji03QpTncmrN8P9
   3uXlXgRVhICqIkVLdjNxUeC13MaEphsaudNB+Wu1nXEQNzgD0oa8E7kVS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435748035"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435748035"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 17:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="700970683"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="700970683"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 May 2023 17:28:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvSGG-0000X3-0z;
	Sun, 07 May 2023 00:28:24 +0000
Date: Sun, 7 May 2023 08:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 14680/14811] mm/filemap.c:4250:1: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202305070840.X0G3ofjl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   83e5775d7afda68f6d7576d21f7a080fbfeecc4f
commit: d39c65bc7fcb1dad22dc1585fc669b5bfe5d3108 [14680/14811] cachestat: implement cachestat syscall
config: s390-randconfig-s041-20230507 (https://download.01.org/0day-ci/archive/20230507/202305070840.X0G3ofjl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d39c65bc7fcb1dad22dc1585fc669b5bfe5d3108
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d39c65bc7fcb1dad22dc1585fc669b5bfe5d3108
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070840.X0G3ofjl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/filemap.c:1416:17: sparse: sparse: context imbalance in 'migration_entry_wait_on_locked' - unexpected unlock
>> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL pointer
>> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL pointer
>> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL pointer
>> mm/filemap.c:4250:1: sparse: sparse: Using plain integer as NULL pointer

vim +4250 mm/filemap.c

  4215	
  4216	/*
  4217	 * The cachestat(2) system call.
  4218	 *
  4219	 * cachestat() returns the page cache statistics of a file in the
  4220	 * bytes range specified by `off` and `len`: number of cached pages,
  4221	 * number of dirty pages, number of pages marked for writeback,
  4222	 * number of evicted pages, and number of recently evicted pages.
  4223	 *
  4224	 * An evicted page is a page that is previously in the page cache
  4225	 * but has been evicted since. A page is recently evicted if its last
  4226	 * eviction was recent enough that its reentry to the cache would
  4227	 * indicate that it is actively being used by the system, and that
  4228	 * there is memory pressure on the system.
  4229	 *
  4230	 * `off` and `len` must be non-negative integers. If `len` > 0,
  4231	 * the queried range is [`off`, `off` + `len`]. If `len` == 0,
  4232	 * we will query in the range from `off` to the end of the file.
  4233	 *
  4234	 * The `flags` argument is unused for now, but is included for future
  4235	 * extensibility. User should pass 0 (i.e no flag specified).
  4236	 *
  4237	 * Currently, hugetlbfs is not supported.
  4238	 *
  4239	 * Because the status of a page can change after cachestat() checks it
  4240	 * but before it returns to the application, the returned values may
  4241	 * contain stale information.
  4242	 *
  4243	 * return values:
  4244	 *  zero        - success
  4245	 *  -EFAULT     - cstat or cstat_range points to an illegal address
  4246	 *  -EINVAL     - invalid flags
  4247	 *  -EBADF      - invalid file descriptor
  4248	 *  -EOPNOTSUPP - file descriptor is of a hugetlbfs file
  4249	 */
> 4250	SYSCALL_DEFINE4(cachestat, unsigned int, fd,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
