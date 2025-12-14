Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DFE233707
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765678321; cv=none; b=eQrKYEfUfJJrMelEWZD2GV4Dke3q+68G8FY6oYAevXxTWqjP4iFYXt5lt9m0HtYYzZko/vSQaSGtlnBu6l96jK4e5VnzXM7d8C8WktzldoklrXw6kQuoqchC6fOelgaDH+QvXUjSRMu5CDzp53HGjoQrJfeFlh6fgn+y0vVDDNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765678321; c=relaxed/simple;
	bh=rsQAiLnhpj6z133/5Lqmn7HIIvegt0UCf36MrIpEmbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qckDXE+L2ve+/IJRoXtKGBqb2gUd4e/xpypucXJ3NhDfqt34jeTVKqwWTHySGrQuGebQQf6jWxCK1eA2O+iVk5QJzDlaViAMjqIH8gfZW+lBnqn7IMHIfdMz5BhXzNFI/0sYUJFl1ugDAu8rWnxgYT86lbSOzVe7uaHuZTFCKv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yx1IcuXH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yx1IcuXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765678320; x=1797214320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsQAiLnhpj6z133/5Lqmn7HIIvegt0UCf36MrIpEmbg=;
  b=Yx1IcuXH2XR5o9xJgnLJo2lkNxEWlhcxpVA4VF/CGCjmN4i2GAkOTjk/
   yFAPljVOJzu3HelG7irsPLa4V/ITiuFTIqDhLCjyc8JqOAgErD8/dKKli
   Z3FW0aEWuVES0yjUs71Ikybsz1r1WRHr2fgVIoldaQKE/1xDgIQtkdrUL
   fg2QWaK0ngmb2knhrGb+EJquv16CnUGFPDVf6wUWgh7uSeUxwp0+seD6z
   puyFkjsytP6tx9nvDzAaxTeRm237LnSf5O6qQIqKvOMlDNRQdXU6hKko/
   tbCIJa/fKOqHzRtvoQO78dYoZc4dQWBAHLaEjHt3d7hsQUlOOwo3ploYI
   g==;
X-CSE-ConnectionGUID: v89SvaDsQJ+wg/TlLVAFrA==
X-CSE-MsgGUID: UYtxHmqAS7WHWG/E8kL2sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71257158"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71257158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:11:58 -0800
X-CSE-ConnectionGUID: LxoYu2bHScy3uRZ0XRuBOA==
X-CSE-MsgGUID: trDM8w1ySymMZpRDBBEDdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201845660"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 18:11:43 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbaC-000000002FE-2a8s;
	Sun, 14 Dec 2025 02:11:36 +0000
Date: Sun, 14 Dec 2025 03:11:11 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] kernel/sched/fair.c:4146:6:
 warning: no previous prototype for 'set_group_prefer_node'
Message-ID: <202512140342.7G3GhhrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: a0afbf3c5d0386fa940ad3ee5e5cda8ad0e3eced [50/50] anolis: sched: add Numa Affine feature
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140342.7G3GhhrT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140342.7G3GhhrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140342.7G3GhhrT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:4146:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4146 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/set_group_prefer_node +4146 kernel/sched/fair.c

  4137	
  4138	static inline u64 cfs_rq_last_update_time(struct cfs_rq *cfs_rq)
  4139	{
  4140		return u64_u32_load_copy(cfs_rq->avg.last_update_time,
  4141					 cfs_rq->last_update_time_copy);
  4142	}
  4143	#ifdef CONFIG_FAIR_GROUP_SCHED
  4144	DEFINE_PER_CPU(struct cpumask, cpus_allowed_alt);
  4145	/* Decide which node for @tg to run on*/
> 4146	void set_group_prefer_node(struct task_group *tg)
  4147	{
  4148		int cpu, node;
  4149		unsigned long min_load = ULONG_MAX, now = jiffies, load;
  4150		static int prev_node;
  4151		static unsigned long prev_jiffies;
  4152	
  4153		/* Choose Round-Robin way with frequent call */
  4154		if (now - prev_jiffies < HZ) {
  4155			prev_jiffies = now;
  4156	
  4157			prev_node = next_online_node(prev_node);
  4158			if (prev_node >= 0 && prev_node < MAX_NUMNODES) {
  4159				tg->prefer_node = prev_node;
  4160				return;
  4161			}
  4162	
  4163			prev_node = first_online_node;
  4164			tg->prefer_node = prev_node;
  4165			return;
  4166		}
  4167	
  4168		prev_jiffies = now;
  4169	
  4170		/* find the idlest node */
  4171		prev_node = first_online_node;
  4172		for_each_online_node(node) {
  4173			load = ULONG_MAX;
  4174			for_each_cpu(cpu, cpumask_of_node(node))
  4175				load += cpu_load(cpu_rq(cpu));
  4176			if (load < min_load) {
  4177				min_load = load;
  4178				prev_node = node;
  4179			}
  4180		}
  4181	
  4182		tg->prefer_node = prev_node;
  4183	}
  4184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
