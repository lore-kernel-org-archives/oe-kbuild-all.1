Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D4215531B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706542968; cv=none; b=TIlN+yTzqlFWEsHpxjDAdQaettxv7affi+nl0Ec0AVXrnsCAZ3FEcRjPyuRN0gEXesF7xu3GfAAJrGzg9Kvr29XYEnzosHdcK7/rPjI5ZX2ENDKKEZFoAHvGcVhlOCKpFGuBrLgSXdj1F6MCse84UC12N3oJ2FAOdKtf+J+OTug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706542968; c=relaxed/simple;
	bh=BkRIrBKtUr1psiIm36zWQCJ9I5lpr7dUlYZyZzjtf1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R28la2SjX0Vzsi6jlmxyCoRhGXnGkARxxhQRX8X9XSoYbC54YSCkbXOX/WLVl7KsOmhiWJrtJ4xKYBgNzz/QtogvvtFzGf5zwyfcMXDpee4NFIo3JKduokjzIuGKn+Pxnklwu6cRqVogitp8RNWYGULU0PvFW3HMPwO6wgOt6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgM/Y37M; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgM/Y37M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706542966; x=1738078966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkRIrBKtUr1psiIm36zWQCJ9I5lpr7dUlYZyZzjtf1g=;
  b=FgM/Y37MJ1kUzDCg/XvycQ6Re/FUlv5SgOlJyAu9jPQKEYzycrgmsi2K
   btAbi76Ahru0Ex3Ba/MIkUOc0G3ffvP3yWrlf1dHDBVmL+v53Rhqaq/Oh
   e21iNoiGWEhXMdTTz97PqWk+6Z7sQvd8yzigVNlOYaz42bPDiOLSW4v69
   deNcBYbJ3L8RZYZN2YcPmV6G903oLg4ckvPR08OcIO+e/WcMzOBz8hHv1
   lCA0d9NVyTBL7jT0kZHcXH7I26qFdaW+Lr+KgRhwu9dBKTkrKAXHRVPCb
   F/pAQkwd4s+XoDw0LaVIQz5XLh+8SCucwO8wDf7vtZD+C5o9PeLLHuBSg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393420753"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="393420753"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 07:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="960920903"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="960920903"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2024 07:42:43 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUTmT-0004Ng-1J;
	Mon, 29 Jan 2024 15:42:41 +0000
Date: Mon, 29 Jan 2024 23:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/2] mm/vmscan.c:5449 shrink_many()
 error: uninitialized symbol 'lruvec'.
Message-ID: <202401292349.7H7vhm0W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   2730733d54b61c35b835ce5c21fab0e280e52577
commit: 0500235e3f9d430936afc1377ac2efd76487ae9a [1/2] ANDROID: vendor_hook: Add vendor hook to decide scan abort policy
config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/archive/20240129/202401292349.7H7vhm0W-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292349.7H7vhm0W-lkp@intel.com/

smatch warnings:
mm/vmscan.c:5449 shrink_many() error: uninitialized symbol 'lruvec'.

vim +/lruvec +5449 mm/vmscan.c

  5397	
  5398	static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
  5399	{
  5400		int op;
  5401		int gen;
  5402		int bin;
  5403		int first_bin;
  5404		struct lruvec *lruvec;
  5405		struct lru_gen_folio *lrugen = NULL;
  5406		struct mem_cgroup *memcg;
  5407		const struct hlist_nulls_node *pos;
  5408	
  5409		bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
  5410	restart:
  5411		op = 0;
  5412		memcg = NULL;
  5413		gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
  5414	
  5415		rcu_read_lock();
  5416	
  5417		hlist_nulls_for_each_entry_rcu(lrugen, pos, &pgdat->memcg_lru.fifo[gen][bin], list) {
  5418			if (op)
  5419				lru_gen_rotate_memcg(lruvec, op);
  5420	
  5421			mem_cgroup_put(memcg);
  5422	
  5423			lruvec = container_of(lrugen, struct lruvec, lrugen);
  5424			memcg = lruvec_memcg(lruvec);
  5425	
  5426			if (!mem_cgroup_tryget(memcg)) {
  5427				op = 0;
  5428				memcg = NULL;
  5429				continue;
  5430			}
  5431	
  5432			rcu_read_unlock();
  5433	
  5434			op = shrink_one(lruvec, sc);
  5435	
  5436			rcu_read_lock();
  5437	
  5438			if (should_abort_scan(lruvec, sc))
  5439				break;
  5440		}
  5441	
  5442		rcu_read_unlock();
  5443	
  5444		if (op)
  5445			lru_gen_rotate_memcg(lruvec, op);
  5446	
  5447		mem_cgroup_put(memcg);
  5448	
> 5449		if (lruvec && should_abort_scan(lruvec, sc))
  5450			return;
  5451	
  5452		/* restart if raced with lru_gen_rotate_memcg() */
  5453		if (gen != get_nulls_value(pos))
  5454			goto restart;
  5455	
  5456		/* try the rest of the bins of the current generation */
  5457		bin = get_memcg_bin(bin + 1);
  5458		if (bin != first_bin)
  5459			goto restart;
  5460	}
  5461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
