Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F623FB8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732726997; cv=none; b=PTrVNNfQCtSyMuszI+Z3kq/RCkYYYT8rDniLEMhb1RnQ3vBzImlyFJSLSM3E614uaJIjtMKH1v66KyRNgpn6aXsMKDl8hx7PdUtVrVP9Dqd0J+geql+zXBd0UsVmjdpP51/s062Fu104ugI5Q8eVAiNdUTg9SL5dUoeypJO05V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732726997; c=relaxed/simple;
	bh=I6MEP3tF/jGph5Gu5aA/IZWMv0J8oH+mJQs99u7d6Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=skUiYsJl/Pw9QE/jKP9zZqrZZqdqRVTrsYiwwr6KOsP169LirzfFYVFTVqYwwALefXjV62OROO+WuhqnL3LzpN0COYwcSa55zG7shsssiS6PqpEHxnxS7lqwbTXy1EXWEvfH4c4Xt6ak04JSzSj1zb4bFV2jOr2YqqsJsx4PfcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmdsK2pc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmdsK2pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732726996; x=1764262996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6MEP3tF/jGph5Gu5aA/IZWMv0J8oH+mJQs99u7d6Nc=;
  b=LmdsK2pcB69oBoC7bCyxR1+0JGT/DBdORLTS/eNUMkgM10VP9UQ5mjn2
   5hAGffWlyp0LkG5ss3VvwQajwB9eQsdsvc8uqAMCJdX2jbqg1Gx77rotE
   e6RMeTrMfGnIe7n9QhY5Z5xGstMDS5yG6kyyrgw5S2/PzZ6qci5CPDTj9
   j/HWO//KpmlSOhHLIJNwUKI9yR5PwXIJgRd/rLdA63RLqyw3ExHYSBFRE
   dCN12Y2vd6R9jAoDH3wI4Ymlt+2ghB2Vtau2HwpTMp/FVXLh/m6p7Thdw
   wv2AXbSGlOlDdLYvsYi5Mk+PyQtE00GbP4vFUXyq0CdNsOWbdCr+IbXvX
   A==;
X-CSE-ConnectionGUID: 3yW7+LjHSG2vyCzmHUvWrA==
X-CSE-MsgGUID: kCclMztjS6WcSX1/uykCRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36866882"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36866882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 09:03:10 -0800
X-CSE-ConnectionGUID: 0j8/piqiRRiFdbDS5b1s4g==
X-CSE-MsgGUID: ZgEkzY+YTSOlvvUI8a+HbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91869440"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2024 09:03:08 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGLRS-0008Bf-1N;
	Wed, 27 Nov 2024 17:03:06 +0000
Date: Thu, 28 Nov 2024 01:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlelli:test/futex-local-hash-rfc-v3-stats 10/10]
 kernel/futex/core.c:1361:12: warning: 'proc_show_futex_stats' defined but
 not used
Message-ID: <202411280000.jZQNdMhp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jlelli/linux.git test/futex-local-hash-rfc-v3-stats
head:   803ce6cb1575a67e9d69fa158bfa7c747162f03c
commit: 803ce6cb1575a67e9d69fa158bfa7c747162f03c [10/10] futex: Add stats
config: csky-randconfig-002-20241127 (https://download.01.org/0day-ci/archive/20241128/202411280000.jZQNdMhp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280000.jZQNdMhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280000.jZQNdMhp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.c:1361:12: warning: 'proc_show_futex_stats' defined but not used [-Wunused-function]
    1361 | static int proc_show_futex_stats(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/proc_show_futex_stats +1361 kernel/futex/core.c

  1360	
> 1361	static int proc_show_futex_stats(struct seq_file *seq, void *offset)
  1362	{
  1363		long fh_used, fh_unused, fh_auto_create, fh_collisions, fh_global_use = 0;
  1364		int i;
  1365	
  1366		fh_used = atomic64_read(&futex_hash_stats_used);
  1367		fh_unused = atomic64_read(&futex_hash_stats_unused);
  1368		fh_auto_create = atomic64_read(&futex_hash_stats_auto_create);
  1369		fh_collisions = atomic64_read(&futex_hash_stats_collisions);
  1370	
  1371		for (i = 0; i < futex_hashsize; i++) {
  1372			if (futex_hb_waiters_pending(&futex_queues[i]))
  1373				fh_global_use++;
  1374		}
  1375	
  1376		seq_printf(seq, "local used: %ld unsued: %ld auto: %ld | global buckets: %lu inuse: %ld collisions: %ld\n",
  1377			fh_used, fh_unused, fh_auto_create, futex_hashsize, fh_global_use, fh_collisions);
  1378		return 0;
  1379	}
  1380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
