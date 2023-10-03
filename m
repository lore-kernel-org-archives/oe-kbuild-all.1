Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67109219FB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696348621; x=1727884621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPQr+yIgAB3SbE09gEdsMWRDl16XYNhpjuX73seY8Ts=;
  b=cv8fCan/VXrJ2FdWKFKLNGqoMicuRw8RK21UkXbjqyFwgK1yFhG0CqgL
   EgQzkG+anNL7pscULuLJ64L59gUlxaxrpNOw0hnAua3M6dBBSgSy8nk7a
   shGiDOUKj/a+FG8RJiiD4tR5Ls3wyKEQv7YkYVVRuw4rAkHj+6cNQjXLA
   0jCJj+30D8cgXUimWiIsJejecCaKeSO7Um0inYuK38dWhWO3UwW6sSEn/
   zWSl28ZLC1anPqRhT+Hwag1ueYfi7MHvIIZtdMBXp07Ia6yTTDlyg46tg
   Etes8RcqalPuA5s4z180bxv2AlzxPxAGesIi2RkkW/G5IJ+emZD4KNuWf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380187289"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="380187289"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 08:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754496116"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="754496116"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Oct 2023 08:56:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnhlZ-0007Fr-0N;
	Tue, 03 Oct 2023 15:56:57 +0000
Date: Tue, 3 Oct 2023 23:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 28/34] misc.c:undefined reference to
 `fscache_dirty_folio'
Message-ID: <202310032328.Z1qIKToE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: 05c401d9e7587fec51682adc573c2f3d88b47c1d [28/34] netfs: Provide a function to pass along dirty info to fscache
config: csky-randconfig-001-20231002 (https://download.01.org/0day-ci/archive/20231003/202310032328.Z1qIKToE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310032328.Z1qIKToE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310032328.Z1qIKToE-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/netfs/misc.o: in function `netfs_dirty_folio':
>> misc.c:(.text+0x94): undefined reference to `fscache_dirty_folio'
   csky-linux-ld: fs/netfs/misc.o: in function `netfs_xa_store_and_mark':
   misc.c:(.text+0x164): undefined reference to `fscache_dirty_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
