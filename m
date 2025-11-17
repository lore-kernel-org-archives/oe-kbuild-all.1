Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416B3168F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365290; cv=none; b=YOVetmypQxj7rxV3hDE6HKJZX60HfXGeYHXlpnjmiCTrITDWq/IACBwSuOmNWfkKFdSYfTThHNgXpU1Bi+vl8BGgWt5KgU6o+bDqchzs3JdVqNRPsZA9rxC2u0uhTjsrdIJ+VvfVO7che2M3FRYyusb0LkqG71YXv96j1q9/7rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365290; c=relaxed/simple;
	bh=O3mPhR6Pb8Ulpj5g4IbCUTKjd7qN61Qsies0eab7b4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjJazMy26f3X+yb5N3DCc7gSaB2jaZx2or8I8EZnSLc/y+nMjcesO17Yw58aAAH5SlQWISYKIJMBbhc7m3kYEnVg5wmyvLgSCCn8L+XpD2a1rkXqYUFFWWKQod5zZSlq2Ss0gx/plyxhvstX7OIGpwVp4Kf1ByrnKXSTfPyX3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7wYuNvd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7wYuNvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763365289; x=1794901289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O3mPhR6Pb8Ulpj5g4IbCUTKjd7qN61Qsies0eab7b4U=;
  b=V7wYuNvdYEZ+hnWECDa+d5ODU0brkch/naxlHUJkK9Yo8CE1OzUpoWN9
   ZDWJvqtTZkKz7x56kPRdgJFqhn0wKeJDbNHwDbiCzP4xzyGQ4b8dr3dMD
   7GxHT0L9dz8DN3tm8wJonesYj/8R3WvQzui2fi6mru0msP3RWHqE0ghwD
   TbUNW0Gyr8NIWvlkfZANsSCXJly7oSEp3VKWhKX9KqbaOsQbYzlv4uGp+
   Mt3wse/reGaHt8Qp37coPS9yDAsDSEGfAbboy1mCUUZHOwrm9c3BEfhnU
   BiDVFktVayQss8ZDMOhhvePeAiYfaM0nN7KlcyDXM6qswPV2NYYi5psVi
   A==;
X-CSE-ConnectionGUID: AXVM+6JTTXm1lCbA04wzRw==
X-CSE-MsgGUID: +r7tX0Y/QUqpVhJfrGp93g==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65293003"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65293003"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:41:28 -0800
X-CSE-ConnectionGUID: fk78zAJJQMy2vgUUrBgHsw==
X-CSE-MsgGUID: Od8f1MqDSza4QAFb9KFFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190178865"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2025 23:41:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKtrX-0000H5-22;
	Mon, 17 Nov 2025 07:41:23 +0000
Date: Mon, 17 Nov 2025 15:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: cx19970 <cx19970@qq.com>, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org,
	cx19970 <cx19970@qq.com>
Subject: Re: [PATCH] BUG: sysrq: Reset the watchdog during the polling of
 sysrq-t processing tasks
Message-ID: <202511171515.bQfhqZLh-lkp@intel.com>
References: <tencent_B7DDA306E3B6A8CDF3195E4C083C9BD37E07@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B7DDA306E3B6A8CDF3195E4C083C9BD37E07@qq.com>

Hi cx19970,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.18-rc6 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cx19970/BUG-sysrq-Reset-the-watchdog-during-the-polling-of-sysrq-t-processing-tasks/20251117-130012
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/tencent_B7DDA306E3B6A8CDF3195E4C083C9BD37E07%40qq.com
patch subject: [PATCH] BUG: sysrq: Reset the watchdog during the polling of sysrq-t processing tasks
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251117/202511171515.bQfhqZLh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171515.bQfhqZLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171515.bQfhqZLh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'print_cfs_stats':
>> kernel/sched/fair.c:13940:17: error: implicit declaration of function 'touch_nmi_watchdog' [-Wimplicit-function-declaration]
   13940 |                 touch_nmi_watchdog();
         |                 ^~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:13941:17: error: implicit declaration of function 'touch_all_softlockup_watchdogs' [-Wimplicit-function-declaration]
   13941 |                 touch_all_softlockup_watchdogs();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/rt.c: In function 'print_rt_stats':
>> kernel/sched/rt.c:2941:17: error: implicit declaration of function 'touch_nmi_watchdog' [-Wimplicit-function-declaration]
    2941 |                 touch_nmi_watchdog();
         |                 ^~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:2942:17: error: implicit declaration of function 'touch_all_softlockup_watchdogs' [-Wimplicit-function-declaration]
    2942 |                 touch_all_softlockup_watchdogs();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/touch_nmi_watchdog +13940 kernel/sched/fair.c

 13933	
 13934	void print_cfs_stats(struct seq_file *m, int cpu)
 13935	{
 13936		struct cfs_rq *cfs_rq, *pos;
 13937	
 13938		rcu_read_lock();
 13939		for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos) {
 13940			touch_nmi_watchdog();
 13941			touch_all_softlockup_watchdogs();
 13942			print_cfs_rq(m, cpu, cfs_rq);
 13943		}
 13944		rcu_read_unlock();
 13945	}
 13946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
