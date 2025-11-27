Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A1311C35
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764287029; cv=none; b=KUcK8qSTFrYZgokoCPRzwTnibVBiSEj/e2LXq/Ud0rjnrB8HBGEzgw+QP5TQPiXrXf32g4k9S7zwYIL/MlWWS5F0izHVwEjyIjNg53dxiLGri1zyp6FiEKp0iRnkpTu2NwlBostl0ZDxhqyRa+GiVPBaVBOIGOlCNRej6XZFxvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764287029; c=relaxed/simple;
	bh=Oq5N0ugEDbl58KFO3MRiCPxMrqVnxHpQHUCKEbIZGIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYd7j//g/hVkQwBMvgR5jt4FRa6XVtdHXOV3XMN9CJXuYJ/z5pwFL9ynaPnZ9fZlzxbl1QT0VP/ZWykVpXz/xVwCupdqw4i+zXiXPs4la/PBN9eNit7fwSmhFGoqzz4VmeyJ6cTfVqXz5j/xeWeIqtie1Vd+aSBLTOGH1iRFGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTTRO/gn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTTRO/gn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764287028; x=1795823028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oq5N0ugEDbl58KFO3MRiCPxMrqVnxHpQHUCKEbIZGIE=;
  b=XTTRO/gnweDDEPsS2XZKVga3FlvJ9lbgtg+W4WU9vraNIM8H/J7KwlcZ
   7k6u1Pn28690m0UIYmiry7P3Pe3ogEiXN9/Pr/AlojFGrqNJ+EnU+zm94
   6URdRcEnsv8X5ewGC5al66JcEuKGcEIPnvwjQDSm2FFRwLYM4SkBtHmgC
   ECa1+qx+FxN8gC10DJ0WBFKhNJdyV60IaOXPOVpIo/eG0PJ7iC7pPHMga
   o9KHtBey57FoSDf3NP3KH7+DbDYXeDf8JAdy6qxZwGCpFDFqUYv7pVqlC
   DJp6U0WPU+JlFWuv+Cehdw/QAKgro9H3RlDf+D6ojz5DMz+5QAaGIQqAo
   A==;
X-CSE-ConnectionGUID: gU7lTAWKSGWKBAae9nPAsg==
X-CSE-MsgGUID: dn+DBvInTqu1DXF1A0PttA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66491655"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66491655"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 15:43:47 -0800
X-CSE-ConnectionGUID: 1NlewJlSRcqrm71om2nK6Q==
X-CSE-MsgGUID: 7keEAhSsRCy9yQ65c+/z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="224029724"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2025 15:43:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOleI-000000005qb-2k9m;
	Thu, 27 Nov 2025 23:43:42 +0000
Date: Fri, 28 Nov 2025 07:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3355/3355] block/blk-cgroup.c:2320:18: warning:
 no previous prototype for function 'bpf_blkcg_get_dev_iostat'
Message-ID: <202511280702.XVMyBDu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi GONG,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c246f2d81b5390b10c50870d9ef40337e9a5cb86
commit: 969159a7bdeceb8bf814c6e0bf3b5360d9d9b167 [3355/3355] bpf-rvi: blk-cgroup: Add bpf_blkcg_get_dev_iostat() kfunc
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251128/202511280702.XVMyBDu0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280702.XVMyBDu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280702.XVMyBDu0-lkp@intel.com/

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
