Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDC1802AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724325006; cv=none; b=gmYu3SaNfOTj5rsws8L+zfpQvK5UoCd2NstjxxdsMv0Iin3ppmuaeYvMW5HBWVjhUKgGtsrJcw441PBS2JCgYR0HPaui4IYSREcZV775xQ2EkNEXTPvesCzf/GrffWAZseIRNinhkLGIqEcHymCI2BQYo6rNzPy6SeBQSVyVM+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724325006; c=relaxed/simple;
	bh=b6DgUfhLDsbxBk89dE3abya17Vn5XYYg5hvD9Dxbirk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dEC9u0jSawEgxLLVLHBSM+m6XWrm7NtYgNAI0gqG+Mr24Z9amxFBxOhwycVr+sf3JgHpOe1uEZ1Y2bvV7xslnkMpiQeEAR5jJRe3Mcpeer0PaZ+LH9mqG13Dk+jXnJmmgQ1Ur8TKvcwk4Uql2v2r1SEiegqY4ocBBwq2EQX/4aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xf3EBKwy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf3EBKwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724325005; x=1755861005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6DgUfhLDsbxBk89dE3abya17Vn5XYYg5hvD9Dxbirk=;
  b=Xf3EBKwyE9NL+icZMHQ49tykcJKKeldUwyBdxEP5ObNcLdYhI9TjvFKc
   Puf/nS6xn0Y01EVIGCqX+OAXxEoX9Yw2/5dXhgW9WBtKqtLRdc6K4dGDR
   2Xdzvd2D23OvHAS797D9hH0t259u+WR0RetkI4NYBUwrVeYt+TPA65nH2
   95HzUyo+T7H0eFid4CACB3/WbEl2SzKPZcUgHKaMu/ygMxCEVK/9Kme/P
   lnsFKYU84xa3DaPfh2O2selna22PGbb4txOO/U0N280ucDpHOR26j0aGh
   ljQh4gzifvajoGJVDi5fxaltqWjI1yUDdlcpc9oRWNYWxftHRujN8P4/b
   w==;
X-CSE-ConnectionGUID: puzXgxv3Q8Gmn7clSJ2IFw==
X-CSE-MsgGUID: 11Tt0FEgR828B8M1BwShkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22698016"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22698016"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 04:10:04 -0700
X-CSE-ConnectionGUID: 31u6kT8PR5msuZqbdSBjJw==
X-CSE-MsgGUID: fe2bu1uJQKu7mfHRLQ+0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="61123173"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Aug 2024 04:10:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh5hY-000Cgu-0g;
	Thu, 22 Aug 2024 11:10:00 +0000
Date: Thu, 22 Aug 2024 19:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: [linux-next:master 5751/6069]
 arch/s390/kernel/perf_cpum_sf.c:1460:43: warning: variable 'idx_old' set but
 not used
Message-ID: <202408221933.w7zzVrjB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a7917c89f219f09b1d88d09f376000914a52763
commit: 7b3e01be8455386a664a68fad0abb5a7611d2664 [5751/6069] s390/cpum_sf: Rework debug_sprintf_event() messages
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240822/202408221933.w7zzVrjB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221933.w7zzVrjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221933.w7zzVrjB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/s390/kernel/perf_cpum_sf.c: In function 'aux_reset_buffer':
>> arch/s390/kernel/perf_cpum_sf.c:1460:43: warning: variable 'idx_old' set but not used [-Wunused-but-set-variable]
    1460 |         unsigned long i, range_scan, idx, idx_old;
         |                                           ^~~~~~~


vim +/idx_old +1460 arch/s390/kernel/perf_cpum_sf.c

ca5955cdeae744 Pu Hou         2016-11-11  1434  
ca5955cdeae744 Pu Hou         2016-11-11  1435  /*
ca5955cdeae744 Pu Hou         2016-11-11  1436   * aux_reset_buffer() - Scan and setup SDBs for new samples
ca5955cdeae744 Pu Hou         2016-11-11  1437   * @aux:	The AUX buffer to set
ca5955cdeae744 Pu Hou         2016-11-11  1438   * @range:	The range of SDBs to scan started from aux->head
ca5955cdeae744 Pu Hou         2016-11-11  1439   * @overflow:	Set to overflow count
ca5955cdeae744 Pu Hou         2016-11-11  1440   *
ca5955cdeae744 Pu Hou         2016-11-11  1441   * Set alert indicator on the SDB at index of aux->alert_mark. If this SDB is
ca5955cdeae744 Pu Hou         2016-11-11  1442   * marked as empty, check if it is already set full by the hardware sampler.
ca5955cdeae744 Pu Hou         2016-11-11  1443   * If yes, that means new data is already there before we can set an alert
ca5955cdeae744 Pu Hou         2016-11-11  1444   * indicator. Caller should try to set alert indicator to some position behind.
ca5955cdeae744 Pu Hou         2016-11-11  1445   *
ca5955cdeae744 Pu Hou         2016-11-11  1446   * Scan the SDBs in AUX buffer from behind aux->empty_mark. They are used
ca5955cdeae744 Pu Hou         2016-11-11  1447   * previously and have already been consumed by user space. Reset these SDBs
ca5955cdeae744 Pu Hou         2016-11-11  1448   * (clear full indicator and alert indicator) for new data.
ca5955cdeae744 Pu Hou         2016-11-11  1449   * If aux->alert_mark fall in this area, just set it. Overflow count is
ca5955cdeae744 Pu Hou         2016-11-11  1450   * recorded while scanning.
ca5955cdeae744 Pu Hou         2016-11-11  1451   *
ca5955cdeae744 Pu Hou         2016-11-11  1452   * SDBs between aux->head and aux->empty_mark are already reset at last time.
ca5955cdeae744 Pu Hou         2016-11-11  1453   * and ready for new samples. So scanning on this area could be skipped.
ca5955cdeae744 Pu Hou         2016-11-11  1454   *
ca5955cdeae744 Pu Hou         2016-11-11  1455   * Return true if alert indicator is set successfully and false if not.
ca5955cdeae744 Pu Hou         2016-11-11  1456   */
ca5955cdeae744 Pu Hou         2016-11-11  1457  static bool aux_reset_buffer(struct aux_buffer *aux, unsigned long range,
ca5955cdeae744 Pu Hou         2016-11-11  1458  			     unsigned long long *overflow)
ca5955cdeae744 Pu Hou         2016-11-11  1459  {
ee5c4ccfd51d5d Thomas Richter 2019-12-17 @1460  	unsigned long i, range_scan, idx, idx_old;
82d3edb50a11bf Heiko Carstens 2023-01-05  1461  	union hws_trailer_header old, prev, new;
82d3edb50a11bf Heiko Carstens 2023-01-05  1462  	unsigned long long orig_overflow;
ca5955cdeae744 Pu Hou         2016-11-11  1463  	struct hws_trailer_entry *te;
ca5955cdeae744 Pu Hou         2016-11-11  1464  
78157b4791a3e3 Thomas Richter 2023-01-13  1465  	if (range <= aux_sdb_num_empty(aux))
ca5955cdeae744 Pu Hou         2016-11-11  1466  		/*
ca5955cdeae744 Pu Hou         2016-11-11  1467  		 * No need to scan. All SDBs in range are marked as empty.
ca5955cdeae744 Pu Hou         2016-11-11  1468  		 * Just set alert indicator. Should check race with hardware
ca5955cdeae744 Pu Hou         2016-11-11  1469  		 * sampler.
ca5955cdeae744 Pu Hou         2016-11-11  1470  		 */
ca5955cdeae744 Pu Hou         2016-11-11  1471  		return aux_set_alert(aux, aux->alert_mark, overflow);
ca5955cdeae744 Pu Hou         2016-11-11  1472  
ca5955cdeae744 Pu Hou         2016-11-11  1473  	if (aux->alert_mark <= aux->empty_mark)
ca5955cdeae744 Pu Hou         2016-11-11  1474  		/*
ca5955cdeae744 Pu Hou         2016-11-11  1475  		 * Set alert indicator on empty SDB. Should check race
ca5955cdeae744 Pu Hou         2016-11-11  1476  		 * with hardware sampler.
ca5955cdeae744 Pu Hou         2016-11-11  1477  		 */
ca5955cdeae744 Pu Hou         2016-11-11  1478  		if (!aux_set_alert(aux, aux->alert_mark, overflow))
ca5955cdeae744 Pu Hou         2016-11-11  1479  			return false;
ca5955cdeae744 Pu Hou         2016-11-11  1480  
ca5955cdeae744 Pu Hou         2016-11-11  1481  	/*
ca5955cdeae744 Pu Hou         2016-11-11  1482  	 * Scan the SDBs to clear full and alert indicator used previously.
ca5955cdeae744 Pu Hou         2016-11-11  1483  	 * Start scanning from one SDB behind empty_mark. If the new alert
ca5955cdeae744 Pu Hou         2016-11-11  1484  	 * indicator fall into this range, set it.
ca5955cdeae744 Pu Hou         2016-11-11  1485  	 */
78157b4791a3e3 Thomas Richter 2023-01-13  1486  	range_scan = range - aux_sdb_num_empty(aux);
ee5c4ccfd51d5d Thomas Richter 2019-12-17  1487  	idx_old = idx = aux->empty_mark + 1;
ca5955cdeae744 Pu Hou         2016-11-11  1488  	for (i = 0; i < range_scan; i++, idx++) {
ca5955cdeae744 Pu Hou         2016-11-11  1489  		te = aux_sdb_trailer(aux, idx);
5e02c74905cb00 Heiko Carstens 2023-02-24  1490  		prev.val = READ_ONCE_ALIGNED_128(te->header.val);
ca5955cdeae744 Pu Hou         2016-11-11  1491  		do {
82d3edb50a11bf Heiko Carstens 2023-01-05  1492  			old.val = prev.val;
82d3edb50a11bf Heiko Carstens 2023-01-05  1493  			new.val = prev.val;
82d3edb50a11bf Heiko Carstens 2023-01-05  1494  			orig_overflow = old.overflow;
82d3edb50a11bf Heiko Carstens 2023-01-05  1495  			new.f = 0;
82d3edb50a11bf Heiko Carstens 2023-01-05  1496  			new.overflow = 0;
ca5955cdeae744 Pu Hou         2016-11-11  1497  			if (idx == aux->alert_mark)
82d3edb50a11bf Heiko Carstens 2023-01-05  1498  				new.a = 1;
ca5955cdeae744 Pu Hou         2016-11-11  1499  			else
82d3edb50a11bf Heiko Carstens 2023-01-05  1500  				new.a = 0;
497cc42bf53b55 Peter Zijlstra 2023-05-31  1501  			prev.val = cmpxchg128(&te->header.val, old.val, new.val);
82d3edb50a11bf Heiko Carstens 2023-01-05  1502  		} while (prev.val != old.val);
ca5955cdeae744 Pu Hou         2016-11-11  1503  		*overflow += orig_overflow;
ca5955cdeae744 Pu Hou         2016-11-11  1504  	}
ca5955cdeae744 Pu Hou         2016-11-11  1505  
ca5955cdeae744 Pu Hou         2016-11-11  1506  	/* Update empty_mark to new position */
ca5955cdeae744 Pu Hou         2016-11-11  1507  	aux->empty_mark = aux->head + range - 1;
ca5955cdeae744 Pu Hou         2016-11-11  1508  
ca5955cdeae744 Pu Hou         2016-11-11  1509  	return true;
ca5955cdeae744 Pu Hou         2016-11-11  1510  }
ca5955cdeae744 Pu Hou         2016-11-11  1511  

:::::: The code at line 1460 was first introduced by commit
:::::: ee5c4ccfd51d5dbaa9b9ddeed97c8d5526e55f17 s390/cpum_sf: Convert debug trace to common layout

:::::: TO: Thomas Richter <tmricht@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
