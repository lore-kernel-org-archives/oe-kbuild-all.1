Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E271534E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719570441; cv=none; b=cxRiAonVHrqHUfytfyi1pPO7UuezMpHnqOOWIFtjkXyYi/SN6ccHemRGmna73Q+QOgDKbqUIGAtHZ+o/brCNCyC8Lbx7M7t2FE0AgqoIPJxBoSkAGF/fS//R0Nb+AHGQqxs9frPCFE6WOug+SnlJ5iguXFZfd4yg6THon8UQs0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719570441; c=relaxed/simple;
	bh=Pt+z/uPvFQflrl3ZqmjjNLxR79GxJZz4kzGUX6UldKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShY5xBswdz1N+cIlyEY29yfGqKpmPJ3iFJPil47z/k+bxLmoai/M0CwlX5KUwxirZCSM+QyKu72CzFSwMVTliOHg2N+5bram/oyxP5+zgDLjD0gErkGw02ZfdDEDdPJbjdfLQiEc496daIGM03jqccY90IuEPRjZ05lGHTGNEN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDz71Cut; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDz71Cut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719570440; x=1751106440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pt+z/uPvFQflrl3ZqmjjNLxR79GxJZz4kzGUX6UldKk=;
  b=RDz71CutHA+w2WFLisdsbaWCujOyGR20dtHVaMJr0tuTYFw2vfuyNSS2
   p9bq4mfvciXtEkKd2rE9tkprysl0V3vR0ekyyWCIdY/pTnLWnFzsO0x6u
   y3RJd/oAZaNL8/vUZ6hEXVAOyirQTWzqHCGf8JG4OcUK3+HHi5xioKyNJ
   +9EhWbh/a2h/fWh5wxAiFnzDVZ0woFWz96qS3z/1DWNkROczq6a2J+1IJ
   9XNfTNTQ+xG6g1xS+l7TJSa7DV+gL5753uGi+pRrLd7nYK2Fhqlqka8Tu
   wU/2nqFgaC56X/kmImox4aMIt1+9SMTD0kHob2EYRdJHHVKNebc2BMN5x
   w==;
X-CSE-ConnectionGUID: 8J/9xlngRsaMaGhZmOXhDw==
X-CSE-MsgGUID: cR+cnZ4iS6WHF3M63fUxfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27432946"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="27432946"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 03:27:19 -0700
X-CSE-ConnectionGUID: 7++NGojCQ0OxoVAk2W0pDQ==
X-CSE-MsgGUID: s7Gg0C7CRS66ybw+Xtr6rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="45442958"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jun 2024 03:27:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN8p1-000GzG-15;
	Fri, 28 Jun 2024 10:27:15 +0000
Date: Fri, 28 Jun 2024 18:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [kdave-btrfs-devel:misc-next 18/21] fs/btrfs/tests/../fs.h:229:56:
 warning: left shift count >= width of type
Message-ID: <202406281835.dcjD6iSm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   2eed75cd05c7d61c183d018f3032f20dcff2e986
commit: c7c36d123d0489d845d8727c7e71d851786fb397 [18/21] btrfs: introduce new "rescue=ignoresuperflags" mount option
config: arc-randconfig-001-20240628 (https://download.01.org/0day-ci/archive/20240628/202406281835.dcjD6iSm-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281835.dcjD6iSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281835.dcjD6iSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/tests/../ctree.h:20,
                    from fs/btrfs/tests/qgroup-tests.c:8:
>> fs/btrfs/tests/../fs.h:229:56: warning: left shift count >= width of type [-Wshift-count-overflow]
     229 |         BTRFS_MOUNT_IGNORESUPERFLAGS            = (1UL << 32),
         |                                                        ^~


vim +229 fs/btrfs/tests/../fs.h

   190	
   191	/*
   192	 * Flags for mount options.
   193	 *
   194	 * Note: don't forget to add new options to btrfs_show_options()
   195	 */
   196	enum {
   197		BTRFS_MOUNT_NODATASUM			= (1UL << 0),
   198		BTRFS_MOUNT_NODATACOW			= (1UL << 1),
   199		BTRFS_MOUNT_NOBARRIER			= (1UL << 2),
   200		BTRFS_MOUNT_SSD				= (1UL << 3),
   201		BTRFS_MOUNT_DEGRADED			= (1UL << 4),
   202		BTRFS_MOUNT_COMPRESS			= (1UL << 5),
   203		BTRFS_MOUNT_NOTREELOG   		= (1UL << 6),
   204		BTRFS_MOUNT_FLUSHONCOMMIT		= (1UL << 7),
   205		BTRFS_MOUNT_SSD_SPREAD			= (1UL << 8),
   206		BTRFS_MOUNT_NOSSD			= (1UL << 9),
   207		BTRFS_MOUNT_DISCARD_SYNC		= (1UL << 10),
   208		BTRFS_MOUNT_FORCE_COMPRESS      	= (1UL << 11),
   209		BTRFS_MOUNT_SPACE_CACHE			= (1UL << 12),
   210		BTRFS_MOUNT_CLEAR_CACHE			= (1UL << 13),
   211		BTRFS_MOUNT_USER_SUBVOL_RM_ALLOWED	= (1UL << 14),
   212		BTRFS_MOUNT_ENOSPC_DEBUG		= (1UL << 15),
   213		BTRFS_MOUNT_AUTO_DEFRAG			= (1UL << 16),
   214		BTRFS_MOUNT_USEBACKUPROOT		= (1UL << 17),
   215		BTRFS_MOUNT_SKIP_BALANCE		= (1UL << 18),
   216		BTRFS_MOUNT_PANIC_ON_FATAL_ERROR	= (1UL << 19),
   217		BTRFS_MOUNT_RESCAN_UUID_TREE		= (1UL << 20),
   218		BTRFS_MOUNT_FRAGMENT_DATA		= (1UL << 21),
   219		BTRFS_MOUNT_FRAGMENT_METADATA		= (1UL << 22),
   220		BTRFS_MOUNT_FREE_SPACE_TREE		= (1UL << 23),
   221		BTRFS_MOUNT_NOLOGREPLAY			= (1UL << 24),
   222		BTRFS_MOUNT_REF_VERIFY			= (1UL << 25),
   223		BTRFS_MOUNT_DISCARD_ASYNC		= (1UL << 26),
   224		BTRFS_MOUNT_IGNOREBADROOTS		= (1UL << 27),
   225		BTRFS_MOUNT_IGNOREDATACSUMS		= (1UL << 28),
   226		BTRFS_MOUNT_NODISCARD			= (1UL << 29),
   227		BTRFS_MOUNT_NOSPACECACHE		= (1UL << 30),
   228		BTRFS_MOUNT_IGNOREMETACSUMS		= (1UL << 31),
 > 229		BTRFS_MOUNT_IGNORESUPERFLAGS		= (1UL << 32),
   230	};
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
