Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE819D065
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jul 2026 04:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785040155; cv=none; b=dNXJksfSlc4ZO6RjSqze9XuNQsLzkwCUbYbuOj5c6JAVfCFuN5Xqm1XgDhpZkyIXxLFhv9bpqOH/90B+bpwyeJ82idRYWcX8w98v+5n7/yH5nFwVWq8uhH73AT/+DBqgIegh0gdbDGN6i6XX0qRoHmJJoY1Mfj2nnrwa5qSpHvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785040155; c=relaxed/simple;
	bh=xgV6xW3R4J/iPovwxFzbEk15YT3Jhr4mEuH3M1tZ1Bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ex8kVfofK1xigPpIoaZvgvvKKW2l8gRp78Oxy63bhxmOT+7aqhR+8c3NRNIYg0jLCDwNR1Yuai49swlYVoMS4e8IHKxNqA2BnOsvyuMYoHFmehBBZyyb+AGHQS95Co4NBRwcfZRX4lFiZcouRSWa/AnJ7AzJjhkBU5I3VDWLro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FP70ucDu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FP70ucDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785040154; x=1816576154;
  h=date:from:to:cc:subject:message-id;
  bh=xgV6xW3R4J/iPovwxFzbEk15YT3Jhr4mEuH3M1tZ1Bw=;
  b=FP70ucDuj9ABGVKV67NVlPPswmb1bYd16F6OzrjBoSkHwMCIiiQcb/cW
   rWK9Ecca4Wm2+g2pIxBzlS2V9jTqv/zyPBtu2R1HCc6wEzuesDocfcnYe
   +2ygQw+gWY4MuSjpRk64yOILACd+OQ1hdELWlgQcyaA+x9ZI2CLP4prnQ
   U/LUYNmFvvlQMB+AwmjLc0yI2b163WdM2b4Hzt7OuYLb9mPO7b9WCOfr1
   ZnxoOelP20/FtEUeNpVFO6VXpJBmIO7pue0g/FCWzpP2w3Gv/GHeTin37
   aBeCAGuzZk+jaBjt32sMvzpZKKYHJG1W6gHhIr7tr56i/9Ln9947Oez1G
   A==;
X-CSE-ConnectionGUID: YH1/4xLCQWarIbrzkN8nIA==
X-CSE-MsgGUID: xRzC/xihRFakknsIrhpjTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="111191479"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="111191479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 21:29:13 -0700
X-CSE-ConnectionGUID: 5wtjUW0NQYGf4MwI9Ua3ig==
X-CSE-MsgGUID: wmr5dTSoTRayn6dnTUlhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="255161043"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jul 2026 21:29:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnqU9-00000000cHb-0aOa;
	Sun, 26 Jul 2026 04:29:09 +0000
Date: Sun, 26 Jul 2026 12:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 4/4]
 fs/netfs/rolling_buffer.c:30:12: error: assignment to 'struct folio_queue *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202607261226.UKiNaeYD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   f30eb942050fff68206625e9a9d2e84d0eb77a48
commit: f30eb942050fff68206625e9a9d2e84d0eb77a48 [4/4] netfs: Fix folio_queue ENOMEM in writeback by adding a mempool
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260726/202607261226.UKiNaeYD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261226.UKiNaeYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261226.UKiNaeYD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/rolling_buffer.c: In function 'netfs_folioq_alloc':
   fs/netfs/rolling_buffer.c:30:14: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
      30 |         fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |              ^~~~~~~~~~~~~
         |              mm_alloc
>> fs/netfs/rolling_buffer.c:30:12: error: assignment to 'struct folio_queue *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      30 |         fq = mempool_alloc(&netfs_folioq_pool, gfp);
         |            ^
   fs/netfs/rolling_buffer.c: In function 'netfs_folioq_free':
   fs/netfs/rolling_buffer.c:53:9: error: implicit declaration of function 'mempool_free' [-Wimplicit-function-declaration]
      53 |         mempool_free(folioq, &netfs_folioq_pool);
         |         ^~~~~~~~~~~~


vim +30 fs/netfs/rolling_buffer.c

    15	
    16	/**
    17	 * netfs_folioq_alloc - Allocate a folio_queue struct
    18	 * @rreq_id: Associated debugging ID for tracing purposes
    19	 * @gfp: Allocation constraints
    20	 * @trace: Trace tag to indicate the purpose of the allocation
    21	 *
    22	 * Allocate, initialise and account the folio_queue struct and log a trace line
    23	 * to mark the allocation.
    24	 */
    25	struct folio_queue *netfs_folioq_alloc(unsigned int rreq_id, gfp_t gfp,
    26					       unsigned int /*enum netfs_folioq_trace*/ trace)
    27	{
    28		struct folio_queue *fq;
    29	
  > 30		fq = mempool_alloc(&netfs_folioq_pool, gfp);
    31		if (fq) {
    32			netfs_stat(&netfs_n_folioq);
    33			folioq_init(fq, rreq_id);
    34			fq->debug_id = atomic_inc_return(&debug_ids);
    35			trace_netfs_folioq(fq, trace);
    36		}
    37		return fq;
    38	}
    39	EXPORT_SYMBOL(netfs_folioq_alloc);
    40	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
