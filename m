Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FD144E64A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929649; cv=none; b=il5f9+qa1dkQzSWs/SE2dmm/7L0Ech3EY8qj7iSE5yFBgTJD97izbGcDflfZogN3CHdTjHSAolSbub6Bc9jKeNrDqVyxXZ41kxrbnAAbjraHiVTWwxJ6JvF/AD8UIRDxEgsX+0nWSNTIkqwb9NcJC27ZJGVlp7rdvutQJYYCqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929649; c=relaxed/simple;
	bh=2os8+7s7tVnD0p5XsPXFjZ7P1o6ZWAt0bnMBtmO0R8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FsDq9FFV3WrgTWnf5DZZaB0a6x3QuKHPQpEWvKO9bT3Jkce9GVwKsNGq2yvhppMLr0UUA2nvhKiGv2ctQNEt+ritU9bsVa3HWvQ4ZlPaiE8Fqcw31oQqoWoTEidSdHHFHdxmP4aAQv4ySc/br6ihSq0p3UBVyXlliK9/BTkg3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPqTsQ/j; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPqTsQ/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790929642; x=1822465642;
  h=date:from:to:cc:subject:message-id;
  bh=2os8+7s7tVnD0p5XsPXFjZ7P1o6ZWAt0bnMBtmO0R8k=;
  b=NPqTsQ/jJxxPpNGL6jyYohUo2CVwyjSAALnsRpZAccWxyA/UZPMj14dh
   ZbLoITnHI4Mykv4ZnNqh4arFtw0Q4Cm/PrlE68bZiFigVChMwR4HHq2BJ
   igL/PNGmDBvPHXu//GCwprQJ/GFa1xyNZNnNgbrBOwYxx8Sj+JNnXwUV+
   uBitN9VjWz57iFPxz9zaWCpykn8eZfj1ZkzO45AyGbKFM9zD+bNpkBbUM
   M2OXIpWjXQPhcMPaMFzKHaUy6jXcWfkGRRPmr6dUpyKanKVawgri1oVsI
   A/YJdvQ4EcNDZfAuQuc89U7Bfg9/sLzIpyvP+qmfEWeU3AaOQuXXMkwv4
   A==;
X-CSE-ConnectionGUID: fUdbMKyvSCK3UFthzS7F2Q==
X-CSE-MsgGUID: nt433eg5Q/iPzQTMR4mZ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90751981"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90751981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 01:27:20 -0700
X-CSE-ConnectionGUID: UJRfqFIPR86yV19BUqNP3w==
X-CSE-MsgGUID: KhMf0Cv+RWSM703ZjWiCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275323327"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2026 01:27:18 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCYbr-000000000TH-0BF8;
	Fri, 02 Oct 2026 08:27:15 +0000
Date: Fri, 02 Oct 2026 10:27:07 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-5 23/29]
 fs/netfs/write_collect.c:178:25: error: implicit declaration of function
 'mempool_free'
Message-ID: <202610021029.IzmuVUhC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-5
head:   8e1336a514c9296d8cb62fa11d6fa8b6f6117c9f
commit: 8b4e1988ee6980c07bfa9304296feaaee4d7f50c [23/29] netfs: Simplify writeback cleanup
config: i386-randconfig-r2103-20261001 (https://download.01.org/0day-ci/archive/20261002/202610021029.IzmuVUhC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021029.IzmuVUhC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021029.IzmuVUhC-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/write_collect.c: In function 'netfs_writeback_unlock_folios':
>> fs/netfs/write_collect.c:178:25: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
     178 |                         mempool_free(wback, &netfs_bvecq_pool);
         |                         ^~~~~~~~~~~~


vim +/mempool_free +178 fs/netfs/write_collect.c

   137	
   138	/*
   139	 * Unlock any folios we've finished with.
   140	 */
   141	static void netfs_writeback_unlock_folios(struct netfs_io_request *wreq,
   142						  unsigned int *notes)
   143	{
   144		struct netfs_writeback *wback, *next;
   145	
   146		if (wreq->origin == NETFS_PGPRIV2_COPY_TO_CACHE) {
   147			if (netfs_pgpriv2_unlock_copied_folios(wreq))
   148				*notes |= MADE_PROGRESS;
   149			return;
   150		}
   151	
   152		wback = wreq->writebacks;
   153	
   154		for (;;) {
   155			uoff_t stop_at;
   156			size_t len;
   157	
   158			/* Jump over discontiguities. */
   159			if (wreq->cleaned_to < wback->start)
   160				wreq->cleaned_to = wback->start;
   161	
   162			if (wreq->collected_to <= wreq->cleaned_to)
   163				break;
   164	
   165			/* Order read of region length before reading folios. */
   166			len = smp_load_acquire(&wback->len);
   167	
   168			if (wreq->cleaned_to >= wback->start + len) {
   169				/* Order read of next before recheck length. */
   170				next = smp_load_acquire(&wback->next);
   171				if (!next)
   172					break; /* We don't remove the tail writeback. */
   173	
   174				/* Order read of region length before reading folios. */
   175				if (len != smp_load_acquire(&wback->len))
   176					continue; /* len/next update race. */
   177	
 > 178				mempool_free(wback, &netfs_bvecq_pool);
   179				wreq->writebacks = next;
   180				wback = next;
   181				continue;
   182			}
   183	
   184			stop_at = min(wreq->collected_to, wback->start + len);
   185	
   186			trace_netfs_collect_folios(wreq, wback->start, len);
   187			if (!netfs_writeback_unlock_range(wreq, stop_at))
   188				break;
   189			*notes |= MADE_PROGRESS;
   190		}
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
