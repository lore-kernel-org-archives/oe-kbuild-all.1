Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86129CE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730003292; cv=none; b=qLoDsL4Guq65glXnuS8bvo/K5EPKac4voUnmCYbIPTICyJEXUtaEuwEwKLs9CZJ/cbXRMjrvzavoDXtHwMGnMUbaMViLtXh/Oigb+9eMAb93S/Tp/j2UP3tMyuyjhmU/U5JbVRt2O+cej4YWRMVPGdX/jwVUaeUrNzEwigtKRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730003292; c=relaxed/simple;
	bh=4vXAGxPrLXfg3sX/zrT9HSN0JFHrSrSBlLCKhpQN2BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQur4sHCJJoj9SXdJQeWmI/8mw04VfI1o4/9a3NUpuEfPjVXfIeQ795AGkycRm9j+wAtoLaJVoCy3sWroddADPTfP565mCc6ct3vrwl2jupCku/tAMcmfehAVi2YmV45Kpd5ZRXJ0BzlA7jI47djdlyXJglPMvnAeMT1TFmj6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUFcDmvH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUFcDmvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730003289; x=1761539289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vXAGxPrLXfg3sX/zrT9HSN0JFHrSrSBlLCKhpQN2BQ=;
  b=lUFcDmvHRFyXW1r++ukIvxNZa+8lJKLL0S5tfYzpMxWvWSCIZ6WhD4iF
   BrJCLARQtHceijEwLPNMjfBQrGpvcyrMaGDTTti9XLnQf0lLZBHb4PtsV
   uNP/r9CXZ4ja4cL+DN3BNPoBbSPe0MrPG/Uads0xX1H9uClE4sZEbirYy
   2BPx/GvnyAz3TeLE7V1gy+dDfjd9koYgJO9xFstYa6lrdBIKYj98j1JAa
   ViY8jHQ5JxRJH7NYnwjvS+12jKzK+Fxusx6ktc8zwWW14VSUAkRORqA2E
   +VQ7Oc2FI9HzjaWOQ+PqeBzDGglkawmmnxPyi4jhYjn+LVkKggqZlYfBb
   A==;
X-CSE-ConnectionGUID: msJFrwyvS/2C5qjbEn1oHw==
X-CSE-MsgGUID: YAWnm2GRTY6AqvcxZaaFyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="17264208"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="17264208"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:28:09 -0700
X-CSE-ConnectionGUID: XWpbNrVlQcmWu3h+Y/eBEw==
X-CSE-MsgGUID: tbm6VbrQQ9Sixm215pj2BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86050349"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2024 21:28:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4usn-000aME-2u;
	Sun, 27 Oct 2024 04:28:05 +0000
Date: Sun, 27 Oct 2024 12:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2357/15331] mm/memcontrol.c:4344:5: warning: no
 previous prototype for 'memcg_swapmax_read'
Message-ID: <202410271234.e3i6rnjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [2357/15331] memcg: add restrict to swap to cgroup1
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271234.e3i6rnjW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271234.e3i6rnjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271234.e3i6rnjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c:3223:6: warning: no previous prototype for 'hisi_oom_recover' [-Wmissing-prototypes]
    3223 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^~~~~~~~~~~~~~~~
>> mm/memcontrol.c:4344:5: warning: no previous prototype for 'memcg_swapmax_read' [-Wmissing-prototypes]
    4344 | u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
         |     ^~~~~~~~~~~~~~~~~~


vim +/memcg_swapmax_read +4344 mm/memcontrol.c

  4343	
> 4344	u64 memcg_swapmax_read(struct cgroup_subsys_state *css, struct cftype *cft)
  4345	{
  4346		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  4347	
  4348		if (!static_branch_likely(&memcg_swap_qos_key))
  4349			return PAGE_COUNTER_MAX * PAGE_SIZE;
  4350	
  4351		return READ_ONCE(memcg->swap_dev->max) * PAGE_SIZE;
  4352	}
  4353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
