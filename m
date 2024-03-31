Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D362AE66
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711880609; cv=none; b=ZP1Ajk3BnOdNjyQP3yjNUNOk1ypjTYIwafrDlr7k4BIXEjvz/BKU5J1x1akxe6gNK2ZDVArH4eqBZukJmiazr67IIwyQl6GC3mXD57oEimrpXSGBXYSNpqCq0moxAiimA9cHiACi/xOwwzpWfdZV2apdbgXkdydBgkN9cl5YwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711880609; c=relaxed/simple;
	bh=KaoJaQbxbOhgGC7wr9sI/ilxxZwj8c14MIAubXqSUic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/kCLte1OYbwYP2pQvslMBG94IRtBxFROhFs7H313IaPik1KTT5Fgmi8mx/+4896ne1F9mcukve+v7KnFUNXV9hwrdQom0quFuiB0dLZRSNyVg/8f6afm3DSsFMTlQedDFmazRdhUKYb/8ZUfwom2CCT3aol5banq7yJNHukdSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKlgzKrm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKlgzKrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711880608; x=1743416608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaoJaQbxbOhgGC7wr9sI/ilxxZwj8c14MIAubXqSUic=;
  b=TKlgzKrmzjuIDnHiqIIE2A7myTxE2F8dUsccw0aCzsG5GpwgAr5eclC7
   4yi9U7ifOBuokuBRu8nStV2TYssOlLrgHoix7Zn6ulzFoKZGtRKYCmmrs
   iD2QHp8YBI0ZPBcB7Nf9o8EiW+kCSRkixMANQoMP3nfGig1+iX8jBvrZo
   dBcDmFGRUYzDIhGsahXNgvDV30ELJ6l9kcrcoqWv6aAx1cyEmG5UQU6DI
   C+q0xHCnhunGpa2Rm9+gNx7WsFCEGAArmmbpqA1r4JtMGbM4EvgNCdg3Q
   qpGXcrqabFk0JDYWGXr0fI9BuDWslX8pOYFPkVhJyajc1mohHdNo83i0Q
   A==;
X-CSE-ConnectionGUID: tl7C8uHdTbGy5F5DG7ZlHA==
X-CSE-MsgGUID: AS8beZ4HR7GIjrjSdydE9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="6853122"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="6853122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 03:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="48633543"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2024 03:23:23 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqsLQ-00011R-1y;
	Sun, 31 Mar 2024 10:23:20 +0000
Date: Sun, 31 Mar 2024 18:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hao Xiang <hao.xiang@bytedance.com>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [akpm-mm:mm-unstable 263/270] mm/memory-tiers.c:769:13: warning:
 variable 'rc' set but not used
Message-ID: <202403311826.SNOu8jAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   0cef2c0a2a356137b170c3cb46cb9c1dd2ca3e6b
commit: fbc8b54896eef0b4d9aaa793523867c7eb86e788 [263/270] memory tier: create CPUless memory tiers after obtaining HMAT info
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240331/202403311826.SNOu8jAt-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311826.SNOu8jAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311826.SNOu8jAt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory-tiers.c: In function 'mt_perf_to_adistance':
>> mm/memory-tiers.c:769:13: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     769 |         int rc = 0;
         |             ^~


vim +/rc +769 mm/memory-tiers.c

   766	
   767	int mt_perf_to_adistance(struct access_coordinate *perf, int *adist)
   768	{
 > 769		int rc = 0;
   770	
   771		mutex_lock(&default_dram_perf_lock);
   772		if (default_dram_perf_error) {
   773			rc = -EIO;
   774			goto out;
   775		}
   776	
   777		if (perf->read_latency + perf->write_latency == 0 ||
   778		    perf->read_bandwidth + perf->write_bandwidth == 0) {
   779			rc = -EINVAL;
   780			goto out;
   781		}
   782	
   783		if (default_dram_perf_ref_nid == NUMA_NO_NODE) {
   784			rc = -ENOENT;
   785			goto out;
   786		}
   787		/*
   788		 * The abstract distance of a memory node is in direct proportion to
   789		 * its memory latency (read + write) and inversely proportional to its
   790		 * memory bandwidth (read + write).  The abstract distance, memory
   791		 * latency, and memory bandwidth of the default DRAM nodes are used as
   792		 * the base.
   793		 */
   794		*adist = MEMTIER_ADISTANCE_DRAM *
   795			(perf->read_latency + perf->write_latency) /
   796			(default_dram_perf.read_latency + default_dram_perf.write_latency) *
   797			(default_dram_perf.read_bandwidth + default_dram_perf.write_bandwidth) /
   798			(perf->read_bandwidth + perf->write_bandwidth);
   799	
   800	out:
   801		mutex_unlock(&default_dram_perf_lock);
   802		return 0;
   803	}
   804	EXPORT_SYMBOL_GPL(mt_perf_to_adistance);
   805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
