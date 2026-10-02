Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533782F8BC3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790912188; cv=none; b=Z3BoclvkJqXUdDVzRZKehraJ6uogJl69fNT5fQE/wIsPweStvdEhWN4efNrokk1TwEm0SLBwjaS8LBiKNFDvBnj5Yd9kdKxR7QQBu39I2SjfEFMSzFjzXkpBc70wx+EWbylmKsnPgzcP99r4jGSjytjGUCJ2a0lrwKMNEVqwhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790912188; c=relaxed/simple;
	bh=u4UfbVmbd3ifAse0NHaKD3558TDHag6berOyAUU7PLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=frWUofbtZgfVPI1i66KkKEOjHLUMI6xoxveo1pwGkW4M6RQ7UIBNsrlZKpvf+qBXZZe9ybbBA1z8FTrtETxAa8fJvyeBaP2A+ZsqMQmMSefVBkYhlWkT1zVxG5HQRyf6sVceNWNevaXBfMVIDLeGD9c0hUYk4WJKatCLEmn4VoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUz/6u6Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUz/6u6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790912186; x=1822448186;
  h=date:from:to:cc:subject:message-id;
  bh=u4UfbVmbd3ifAse0NHaKD3558TDHag6berOyAUU7PLI=;
  b=FUz/6u6YgjgpnNJpY+RPdd4+1/Rf1oP8JM2Vf0iJz4DVJnO91qSZtrFk
   e4r2nwfmQ97Cv6yDj0005fng79gQNGWPPeg8glsJN5xUMmgJQV1iKaUyi
   U/eaCTnGFtK50R4hOffL0kVL5fvd1hLbXS0oUYsIwGWzPovBtTeQrwr9F
   Y/q86MOxW7xX69UEPYf67R4D1UJz8d3CkjVpXUlcFIB5W2Cy47SrUZa/m
   YnHtA0mZsaKkxTLYZ1A+eVAKwO+kzws6gE/e7fogBsZz5sU6LSFylJ747
   DhZ4v+SpoRw9Yy3egdaTnqmu/lCLKXvyHWLIDA5QjUHi0A1KV0UTS8Cyj
   g==;
X-CSE-ConnectionGUID: 23CW4hJ3QIOmoHDfVj5dAw==
X-CSE-MsgGUID: LAbMNUZ4SsK/lJL/wgQ4xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90583094"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90583094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 20:36:26 -0700
X-CSE-ConnectionGUID: deQGYpmJTImJgBfcx7jd+A==
X-CSE-MsgGUID: Se6D2AIyR9yvk/ur6mllOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276216496"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2026 20:36:24 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCU4M-00000000Sc3-1G7m;
	Fri, 02 Oct 2026 03:36:22 +0000
Date: Fri, 02 Oct 2026 11:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-5 23/29]
 fs/netfs/write_collect.c:178:25: error: implicit declaration of function
 'mempool_free'
Message-ID: <202610021144.U4c09yz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-5
head:   5c15345b43019adfd7a82be7f4f190a37dd19310
commit: 8b4e1988ee6980c07bfa9304296feaaee4d7f50c [23/29] netfs: Simplify writeback cleanup
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021144.U4c09yz8-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021144.U4c09yz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021144.U4c09yz8-lkp@intel.com/

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
