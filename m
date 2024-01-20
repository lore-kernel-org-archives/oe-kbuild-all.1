Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000FDF46
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705757923; cv=none; b=XaafY5mfKd3zCSqi7aKJ8KTtpDelPcAhHhGoI7B7x3LdbGWQlmjKVAIz6li8B5Ato/tUlfxku83BiY+nmhmNR7IWGsrLlSH0TjysPfWSw38NAuSBUJ6WBGNa9tL3EeE75CcRitWPxvX1BbExiHOWUqHip57BcQFdqZS06XaY1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705757923; c=relaxed/simple;
	bh=4XwVLbb0PHdx7PoxJrvnvyK50JakBx4o6W1R/xeDPNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJ+DgpiLc6NPQBsi6dezoLeHMRpMOtDQHbvSbBNYP1FFOw8jc/Tw1XzMWoSfCJn+F7BThFvACdhg4ajmSI3q9GKvMgFhDC6KSN1GchL7PEWFwzuzhTQ+7sCC5FDtvU/Gm6Ty0sMcZ9AXNgnVHtQuPQfkx6soF53TadmZhR1v1bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1yMI9Qx; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1yMI9Qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705757921; x=1737293921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4XwVLbb0PHdx7PoxJrvnvyK50JakBx4o6W1R/xeDPNY=;
  b=N1yMI9QxkDsVGH6axi+FJMNX9dhEHP7HxTnLAhZogY3V/PP5YQJXMPoW
   J3bM1KXO1ayEvWjtPaP1lHobdwqdb2vMkyqhUiZNHtaJ1JjHuoKkinMP4
   XsPewK77hcvhkk7fCTgxU0OSYvbnjDmSsAbKdE9Sfdd1NPZzU522gu7+n
   LHhxxUiFTurVHNLrRcCMURBvg9YA/9neFNlobKS6VC/JvfShJtIBm6Ih7
   hD6mTQmDUoYQm+IvKLZHOwKswzxVRLhh1qYoD8JuIqO21zeA3cgWxg0nD
   Nr8a1IQnEKBlZ4v+YCI/DwO6UvVxJwak7yGUvZIgPIMhK914LNF28ZuEd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404708253"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="404708253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 05:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="19607592"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2024 05:38:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRBYT-00057k-2n;
	Sat, 20 Jan 2024 13:38:37 +0000
Date: Sat, 20 Jan 2024 21:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 149/150] kernel/sched/sched.h:3625:13: error:
 inlining failed in call to 'always_inline' 'is_cpu_allowed': function body
 not available
Message-ID: <202401202126.NGy6nZud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8d727c541fb1354691d382ff487a8c37162c75c2
commit: 038a281bf38c25684d80d3ac0e076bbc65930bc4 [149/150] !4053  sched: basic infrastructure for scheduler bpf
config: x86_64-openeuler_defconfig-OLK-6.6-func (https://download.01.org/0day-ci/archive/20240120/202401202126.NGy6nZud-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401202126.NGy6nZud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401202126.NGy6nZud-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:57:
   kernel/sched/sched.h: In function 'select_task_rq_fair':
>> kernel/sched/sched.h:3625:13: error: inlining failed in call to 'always_inline' 'is_cpu_allowed': function body not available
    3625 | inline bool is_cpu_allowed(struct task_struct *p, int cpu);
         |             ^~~~~~~~~~~~~~
   kernel/sched/fair.c:8526:33: note: called from here
    8526 |                 if (ret >= 0 && is_cpu_allowed(p, ret)) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/sched.h:3625:13: error: inlining failed in call to 'always_inline' 'is_cpu_allowed': function body not available
    3625 | inline bool is_cpu_allowed(struct task_struct *p, int cpu);
         |             ^~~~~~~~~~~~~~
   kernel/sched/fair.c:8526:33: note: called from here
    8526 |                 if (ret >= 0 && is_cpu_allowed(p, ret)) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~


vim +3625 kernel/sched/sched.h

af4cf40470c22e Peter Zijlstra 2023-05-31  3623  
5cbe2342f2acd3 Guan Jing      2024-01-17  3624  #ifdef CONFIG_BPF_SCHED
5cbe2342f2acd3 Guan Jing      2024-01-17 @3625  inline bool is_cpu_allowed(struct task_struct *p, int cpu);
5cbe2342f2acd3 Guan Jing      2024-01-17  3626  #endif
5cbe2342f2acd3 Guan Jing      2024-01-17  3627  

:::::: The code at line 3625 was first introduced by commit
:::::: 5cbe2342f2acd308ace6a75ab9ca2515452a0f98 sched: programmable: Add hook in select_task_rq_fair()

:::::: TO: Guan Jing <guanjing6@huawei.com>
:::::: CC: Lu Jialin <lujialin4@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
