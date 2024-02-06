Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B518004B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707199377; cv=none; b=AKh9+8AV9LZkn1gCuplOBP+PEYTtQGlt+ayWEi22Ezsj8LUsXYesPbEBWNy/YOXKa9MWgdQ9yyfGSVkZj3B5PrHE53zrqqmCcSSjCOejihf6GIbep+GirsiKEmoM22yAUMZNpi5WWG3l7Engd6XzXEJPq6PePwlB+dTgcRZVz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707199377; c=relaxed/simple;
	bh=smw+O4TXzIYY6f5CCBm7ekXKIde/Py/3PMObwm1MNXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uh9HkA5VP/J2GeeENODIOqsnIWTYEFeUjxjV1/l+cQ+vf3N4Uq8eg52TMO5SKv/MA6vV+QzZKYSqKSLce8Be6RoZGp7V5KZ4PEbYAPlfolDnGQkKcUqlJIbLu5WCr5OkY3/CKh4nQRQRFpVrPN3r7LU4G2xb3E/48t7vD5u25+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7ZY5dHM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7ZY5dHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707199375; x=1738735375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smw+O4TXzIYY6f5CCBm7ekXKIde/Py/3PMObwm1MNXE=;
  b=A7ZY5dHMuOfoDRHZXr7i9EWVRXIwgaQkZ+g7jW6MWaURVPMg/MeweC+T
   wTGCvXb8VPT9k1lxOE6E5PtySL3Z7YY3Kw/bHIKpMEhOtOlpth+/r7GPS
   75IwLtaBexPnlZW27okPhuBYK9VRd7fv2Ymd/ukr8h+1aolYPGDWl5Lzh
   I98fg7y5l4NCSVuZhY02a6+UgjU1+3+09Dr/ybA9H6TeHjQ/gXW/UN6Gw
   PPOt7/I8gzUINy1v6YLEoEkMF/Tk4NbZysdTiEj72x5wKm/nmmBcMx1TV
   6FQDBAFC7hi44OVpuRa724niGgem58KUIriiUL5JS7NrwbNIIIq8J7TiR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="934490"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="934490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 22:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="824077587"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="824077587"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2024 22:02:52 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXEXi-000176-0e;
	Tue, 06 Feb 2024 06:02:50 +0000
Date: Tue, 6 Feb 2024 14:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ma Wupeng <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 22575/30000] mm/memcontrol.c:5402:26: error:
 implicit declaration of function 'ksm_process_profit'
Message-ID: <202402061338.z4QXS13G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   afe6e074c110cd23d846380b34eb75227af9e24a
commit: 0f6fb3570be40b783d8c756d64297be1a8e3d2b3 [22575/30000] memcg: support ksm merge any mode per cgroup
config: x86_64-buildonly-randconfig-002-20240206 (https://download.01.org/0day-ci/archive/20240206/202402061338.z4QXS13G-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061338.z4QXS13G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061338.z4QXS13G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:5402:26: error: implicit declaration of function 'ksm_process_profit' [-Werror,-Wimplicit-function-declaration]
    5402 |                 ksm_process_profits += ksm_process_profit(mm);
         |                                        ^
   1 error generated.


vim +/ksm_process_profit +5402 mm/memcontrol.c

  5379	
  5380	static int memory_ksm_show(struct seq_file *m, void *v)
  5381	{
  5382		unsigned long ksm_merging_pages = 0;
  5383		unsigned long ksm_rmap_items = 0;
  5384		long ksm_process_profits = 0;
  5385		unsigned int tasks = 0;
  5386		struct task_struct *task;
  5387		struct mm_struct *mm;
  5388		struct css_task_iter it;
  5389		struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
  5390	
  5391		css_task_iter_start(&memcg->css, CSS_TASK_ITER_PROCS, &it);
  5392		while ((task = css_task_iter_next(&it))) {
  5393			mm = get_task_mm(task);
  5394			if (!mm)
  5395				continue;
  5396	
  5397			if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
  5398				tasks++;
  5399	
  5400			ksm_rmap_items += mm->ksm_rmap_items;
  5401			ksm_merging_pages += mm->ksm_merging_pages;
> 5402			ksm_process_profits += ksm_process_profit(mm);
  5403			mmput(mm);
  5404		}
  5405		css_task_iter_end(&it);
  5406	
  5407		seq_printf(m, "merge any state: %d\n", READ_ONCE(memcg->ksm_merge_any));
  5408		seq_printf(m, "merge any tasks: %u\n", tasks);
  5409		seq_printf(m, "ksm_rmap_items %lu\n", ksm_rmap_items);
  5410		seq_printf(m, "ksm_merging_pages %lu\n", ksm_merging_pages);
  5411		seq_printf(m, "ksm_process_profits %ld\n", ksm_process_profits);
  5412		return 0;
  5413	}
  5414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
