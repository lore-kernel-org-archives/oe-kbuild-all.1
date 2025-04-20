Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35E212E5D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745173831; cv=none; b=LaWy5XCSwENz9UqHSrus2/hrjHq/OGwJ+/YX6BfaLvbE7TWywnfpwObS/Qq6M7T56mAEf3UECL7lxAa98odNBJm2pev0/qXpIzKdDgtTcOojCiO/Ji/S+IJ3LfJoLVmYVWkxy1P+szufwLy0B7V/QXnqw35p3Y7vkEcufZHcFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745173831; c=relaxed/simple;
	bh=0pQXA50SmeH1NwbQzAwhyPMEeB4Ttkdst15yW/ym/5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDcZEIiP79Th42K3a0qEpX4TsFRTdjlpjYqIjv/l7Hn9hTEEmx10sNmP7k3J1hGxUneYb8lbmprFzr2UQZEBGq/bCYTvBH9WsXgb+vGYvF7fkhCYNQqtpLRyhuqPYg5Fvqpxj9qbPEV4j4fcLiK/yk9YeHNWbE+UFGzF8SpzTnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+xuDTkq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+xuDTkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745173830; x=1776709830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0pQXA50SmeH1NwbQzAwhyPMEeB4Ttkdst15yW/ym/5I=;
  b=V+xuDTkqZng6WTbgnEDFmU5NQOCTAB2UwBrB4+PBECUuWgoRq3lbjYiB
   8Y9ejVS5cYbiSTnvjrjRaYlz8v1ErPrCZs9JG0fa2n/KAdhkHlvR/5Zp4
   zi/055YhGp98BlpDgnDT6z2zdvr+oY/LLAOGoEIi6r/QC54qGos68jjWG
   qX4dfNnmNR2aQD4QBQJtzdrKjJaOwDcolhjvjY7yvXOgbOuqfJVgJ+xIW
   7bJEQjB0jsiDtYdZVqEnZThklP59NXOYSIx6tMQjKcsRmux+5kN+tK/eQ
   uRauvcr9fjQtUPw5k8vZ+K9qPEUSEEWJgAvrF0ZtAalx0MX9Lm878qZME
   w==;
X-CSE-ConnectionGUID: I20FA4dvQ/yuL1BZiGYlrg==
X-CSE-MsgGUID: B9K2prb3QSekMRb5oiSYSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50516423"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="50516423"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 11:30:29 -0700
X-CSE-ConnectionGUID: CZoC8TwKT+mZ2okw3IPmaQ==
X-CSE-MsgGUID: hN04UABZRxeGiWYKHrNVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="135630845"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2025 11:30:28 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6ZQw-0004qj-06;
	Sun, 20 Apr 2025 18:30:26 +0000
Date: Mon, 21 Apr 2025 02:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 119/119]
 fs/bcachefs/enumerated_ref.h:44:41: error: 'struct enumerated_ref' has no
 member named 'ref'; did you mean 'refs'?
Message-ID: <202504210243.1gDGeFLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ef6d44169fbdd9d845e7f734b50ceaa7facc5fca
commit: ef6d44169fbdd9d845e7f734b50ceaa7facc5fca [119/119] bcachefs: bch_dev.io_ref -> enumerated_ref
config: csky-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504210243.1gDGeFLg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504210243.1gDGeFLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504210243.1gDGeFLg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/sb-members.h:7,
                    from fs/bcachefs/disk_accounting.h:7,
                    from fs/bcachefs/btree_write_buffer.h:6,
                    from fs/bcachefs/disk_accounting.c:8:
   fs/bcachefs/enumerated_ref.h: In function 'enumerated_ref_is_zero':
>> fs/bcachefs/enumerated_ref.h:44:41: error: 'struct enumerated_ref' has no member named 'ref'; did you mean 'refs'?
      44 |         return percpu_ref_is_zero(&ref->ref);
         |                                         ^~~
         |                                         refs
--
   In file included from fs/bcachefs/sb-members.h:7,
                    from fs/bcachefs/super-io.h:9,
                    from fs/bcachefs/checksum.h:7,
                    from fs/bcachefs/btree_io.h:8,
                    from fs/bcachefs/btree_io.c:8:
   fs/bcachefs/enumerated_ref.h: In function 'enumerated_ref_is_zero':
>> fs/bcachefs/enumerated_ref.h:44:41: error: 'struct enumerated_ref' has no member named 'ref'; did you mean 'refs'?
      44 |         return percpu_ref_is_zero(&ref->ref);
         |                                         ^~~
         |                                         refs
   In file included from fs/bcachefs/btree_io.c:3:
   fs/bcachefs/btree_io.c: In function 'bch2_btree_node_read':
   fs/bcachefs/bcachefs.h:1281:57: warning: statement with no effect [-Wunused-value]
    1281 | #define async_object_list_add(head, obj, idx)           0
         |                                                         ^
   fs/bcachefs/btree_io.c:1753:9: note: in expansion of macro 'async_object_list_add'
    1753 |         async_object_list_add(&c->btree_read_bio_list, rb, &rb->list_idx);
         |         ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_io.c: In function '__bch2_btree_node_write':
   fs/bcachefs/bcachefs.h:1281:57: warning: statement with no effect [-Wunused-value]
    1281 | #define async_object_list_add(head, obj, idx)           0
         |                                                         ^
   fs/bcachefs/btree_io.c:2478:9: note: in expansion of macro 'async_object_list_add'
    2478 |         async_object_list_add(&c->btree_write_bio_list, wbio, &wbio->list_idx);
         |         ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/bcachefs/sb-members.h:7,
                    from fs/bcachefs/buckets.h:13,
                    from fs/bcachefs/alloc_background.h:7,
                    from fs/bcachefs/super.c:11:
   fs/bcachefs/enumerated_ref.h: In function 'enumerated_ref_is_zero':
>> fs/bcachefs/enumerated_ref.h:44:41: error: 'struct enumerated_ref' has no member named 'ref'; did you mean 'refs'?
      44 |         return percpu_ref_is_zero(&ref->ref);
         |                                         ^~~
         |                                         refs
>> fs/bcachefs/enumerated_ref.h:51:1: warning: control reaches end of non-void function [-Wreturn-type]
      51 | }
         | ^
--
   In file included from fs/bcachefs/sb-members.h:7,
                    from fs/bcachefs/buckets.h:13,
                    from fs/bcachefs/alloc_background.h:7,
                    from fs/bcachefs/io_read.c:10:
   fs/bcachefs/enumerated_ref.h: In function 'enumerated_ref_is_zero':
>> fs/bcachefs/enumerated_ref.h:44:41: error: 'struct enumerated_ref' has no member named 'ref'; did you mean 'refs'?
      44 |         return percpu_ref_is_zero(&ref->ref);
         |                                         ^~~
         |                                         refs
   In file included from fs/bcachefs/io_read.c:9:
   fs/bcachefs/io_read.c: In function '__bch2_read_extent':
   fs/bcachefs/bcachefs.h:1281:57: warning: statement with no effect [-Wunused-value]
    1281 | #define async_object_list_add(head, obj, idx)           0
         |                                                         ^
   fs/bcachefs/io_read.c:1208:17: note: in expansion of macro 'async_object_list_add'
    1208 |                 async_object_list_add(&c->rbio_list, rbio, &rbio->list_idx);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs.h:1281:57: warning: statement with no effect [-Wunused-value]
    1281 | #define async_object_list_add(head, obj, idx)           0
         |                                                         ^
   fs/bcachefs/io_read.c:1223:17: note: in expansion of macro 'async_object_list_add'
    1223 |                 async_object_list_add(&c->rbio_list, rbio, &rbio->list_idx);
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +44 fs/bcachefs/enumerated_ref.h

    40	
    41	static inline bool enumerated_ref_is_zero(struct enumerated_ref *ref)
    42	{
    43	#ifndef BCH_REFCOUNT_DEBUG
  > 44		return percpu_ref_is_zero(&ref->ref);
    45	#else
    46		for (unsigned i = 0; i < ref->nr; i++)
    47			if (atomic_long_read(&ref->refs[i]))
    48				return false;
    49		return true;
    50	#endif
  > 51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
