Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5007DDC8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/DV9Z75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696692788; x=1728228788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6jrjBluRVmqC5zu73c5PS9PYGuingKG1Aabrw3u/HZI=;
  b=h/DV9Z75Pr+zTitlnT7lLwtCULlKuxh/JI1CPE815m+Ud7Kw9YvneEMx
   I7XaAKFtJc1oI5hc9wMJtI1JQzmDEgeF/AlyKkMwQ14l8pSkTDt+fKBHD
   zdLgww5VZGKGoJSJnp/a98O6d1ht6YxtaNKFRav3EUU4wiuNPQd39SrCz
   9jFJe+uI3gWoMxA33HLq1tcVYqpX2OHB5olaAks8VX9z4O/K4XZPVbte4
   a8/Jw0AYztQlWVz3P+nC56sPgs5DiXwd2fsVX5XqaNsv3eNss1s39Z6xf
   OsI3d51iiZyvNfmjkCTpA/ZCcTuSrr9k9Rs4GQX44gfN1+ITcwD6MM7Cl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="414925003"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="414925003"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 08:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="729196528"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="729196528"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Oct 2023 08:33:06 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qp9Ie-0004V7-22;
	Sat, 07 Oct 2023 15:33:04 +0000
Date: Sat, 7 Oct 2023 23:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 21/44] fs/netfs/misc.c:200: undefined
 reference to `fscache_dirty_folio'
Message-ID: <202310072314.dqKIz5fN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   c535f8e2b3fd3f2da2d9e75c71e216c4c9ff72db
commit: 555a7148e25a7366db83a720deada95555901510 [21/44] netfs: Provide a function to pass along dirty info to fscache
config: i386-randconfig-012-20231007 (https://download.01.org/0day-ci/archive/20231007/202310072314.dqKIz5fN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310072314.dqKIz5fN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310072314.dqKIz5fN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/netfs/misc.o: in function `netfs_dirty_folio':
>> fs/netfs/misc.c:200: undefined reference to `fscache_dirty_folio'
   ld: fs/ceph/addr.o:(.rodata+0x230): undefined reference to `fscache_begin_cache_operation'


vim +200 fs/netfs/misc.c

   192	
   193	#if IS_ENABLED(CONFIG_FSCACHE)
   194	/*
   195	 * Mark a page as having been made dirty and thus needing writeback.  We also
   196	 * need to pin the cache object to write back to.
   197	 */
   198	bool netfs_dirty_folio(struct address_space *mapping, struct folio *folio)
   199	{
 > 200		return fscache_dirty_folio(mapping, folio,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
