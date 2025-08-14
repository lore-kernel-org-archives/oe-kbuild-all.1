Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70132143E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755186740; cv=none; b=RaCk6CuQfbHfadbs51xBDDXDNPBTHL6A1we7qKDBqU8FQE2BLtt4X3qMHIV0mBmTsnN48tWkNs2P3JFQfMgopUZetF8WXhTnf4moUftb/K2F0ec3Ef2km2GGMMJyM3o5IPKfV5yb0PSQipjmxTtqj8ZV3Hb6USRQktiRhZp8N5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755186740; c=relaxed/simple;
	bh=KODtqyVIhRkErDnzlrT1E7HBchBMc+/FedUjzOTsoTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CXRGBNfxUU65sVrnT+V66PZwWca6ESBFlx5R7MY+CjlNRh3Xtjwrosw4Yz9tONYDDTxknojp/x5YAgxp2u+bkUkxQKrVpEybqIgy+Xx4eKseyPoO5hXclZLXCAD8owx/+FlQAtqb5GbGVxOXp9roztyTM3Wj9hVGf9ksiLMkRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B13A0/kW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B13A0/kW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755186738; x=1786722738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KODtqyVIhRkErDnzlrT1E7HBchBMc+/FedUjzOTsoTo=;
  b=B13A0/kWJ7I2iAS0jprZv205YkCrpvd9U5vDk/NQ92tL8vwty8sgRPvu
   SwGCn5cqgCRghyt5gDHXd+SkH+62BhZVeBk+pdoJKZASV82LSCyX0ODR/
   RTtf71l8I4ERmWaJ8sE9ddPUjHM5Gb4GKP8EGDl9+4WuJGwhYUCu7t4is
   EWfI5oPjNF/W8e/Ei96dkrA7nS2eaP/hZhfwLOni0g0rNe+EwOGxN58G3
   kqt/GaNpxCzuwSpM+RUVDc0PfspcldP9wIezYZLSNOZweOQosHYis5hMa
   GSstnZuPZEpPX0Q7wKd0NBsok9XybCadW4Jaz5fMUqUfYeafMK7tpkdhD
   g==;
X-CSE-ConnectionGUID: cx0dXF64RNqRos+XzF1DVw==
X-CSE-MsgGUID: O2wl4ldhQ+SV6oVUHfP5Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57415754"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57415754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 08:52:18 -0700
X-CSE-ConnectionGUID: IFoI8BW9SHegebPF61kUwg==
X-CSE-MsgGUID: OXtJmvOaShqAlXWFkYO5ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167050240"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 08:52:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umaFR-000B5y-2s;
	Thu, 14 Aug 2025 15:52:13 +0000
Date: Thu, 14 Aug 2025 23:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] block/blk-cgroup.c:2320:18: warning:
 no previous prototype for function 'bpf_blkcg_get_dev_iostat'
Message-ID: <202508142302.3YamVK7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: 969159a7bdeceb8bf814c6e0bf3b5360d9d9b167 [2679/2679] bpf-rvi: blk-cgroup: Add bpf_blkcg_get_dev_iostat() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250814/202508142302.3YamVK7A-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142302.3YamVK7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142302.3YamVK7A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-cgroup.c:2320:18: warning: no previous prototype for function 'bpf_blkcg_get_dev_iostat' [-Wmissing-prototypes]
    2320 | __bpf_kfunc void bpf_blkcg_get_dev_iostat(struct blkcg *blkcg, int major, int minor,
         |                  ^
   block/blk-cgroup.c:2320:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2320 | __bpf_kfunc void bpf_blkcg_get_dev_iostat(struct blkcg *blkcg, int major, int minor,
         |             ^
         |             static 
   1 warning generated.


vim +/bpf_blkcg_get_dev_iostat +2320 block/blk-cgroup.c

  2306	
  2307	/*
  2308	 * Basically inmitating:
  2309	 *
  2310	 *   - v1:
  2311	 *     - tg_print_rwstat_recursive() in block/blk-throttle.c
  2312	 *     - bfqg_print_rwstat_recursive() in block/bfq-cgroup.c
  2313	 *   - v2:
  2314	 *     - blkcg_print_stat()
  2315	 *
  2316	 * without the final printing (e.g. the __blkg_prfill_rwstat() part).
  2317	 *
  2318	 * Note that a subsystem can only exist in either cgroup v1 or v2 at the same time.
  2319	 */
> 2320	__bpf_kfunc void bpf_blkcg_get_dev_iostat(struct blkcg *blkcg, int major, int minor,
  2321						  struct blkg_rw_iostat *iostat, bool is_v2)
  2322	{
  2323		struct blkcg_gq *blkg;
  2324		char dev_name[64];
  2325	
  2326		if (!blkcg || !iostat)
  2327			return;
  2328	
  2329		if (is_v2) {
  2330			if (blkcg == &blkcg_root)
  2331				blkcg_fill_root_iostats();
  2332			else
  2333				cgroup_rstat_flush_atomic(blkcg->css.cgroup);
  2334		}
  2335	
  2336		snprintf(dev_name, sizeof(dev_name), "%d:%d", major, minor);
  2337		rcu_read_lock();
  2338		hlist_for_each_entry_rcu(blkg, &blkcg->blkg_list, blkcg_node) {
  2339			if (strcmp(dev_name, blkg_dev_name(blkg)))
  2340				continue;
  2341			spin_lock_irq(&blkg->q->queue_lock);
  2342			if (is_v2)
  2343				blkcg_get_one_stat_v2(blkg, iostat);
  2344			else
  2345				blkcg_get_one_stat_v1(blkg, iostat);
  2346			spin_unlock_irq(&blkg->q->queue_lock);
  2347			break;
  2348		}
  2349		rcu_read_unlock();
  2350	}
  2351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
