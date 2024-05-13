Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E495146A90
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 07:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715585770; cv=none; b=hLlDcHWOaRXNsDATII75saWVOFQxWtNZq0MNSMk6fSMfbGKdhpa1i18WrgzSL605m6weyqsatyOT+sQxbaizBCMeQcMaLHZJxDyO6bMf75+R7+uc4XqXFsefh+PdpAAyxKM/qNV4ZpnEqOxPGVVdleYvZgmOzq8JM0tmgZVGjUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715585770; c=relaxed/simple;
	bh=QpJvNoqDIWl1lGZ8AoZF48u1/Yk2s6UlkJe9sxEZlrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzJOmVYDb1DvXhHGLZOIoTMWhnMGNAxkuTa87QfmE+wEoh6FU6L9OuZVimta9QgK54QHDjX764bQ+vtQCtYJccsX+LQ/2nY/bBzupc9BTsZkK01yA9+ZHNsTXTG0442RRC7YnMJrNEVC/Ywwl8W/C2WAiSifAt4c7sVRurkGD8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXznmglX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXznmglX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715585769; x=1747121769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QpJvNoqDIWl1lGZ8AoZF48u1/Yk2s6UlkJe9sxEZlrE=;
  b=eXznmglXbQLdjzj47LERcenRqTLVglKJM2Zhx4EV7L9DkC/CeQQxkouu
   q3udvJQ2C3ksi81dTtQxTKzCaANOO/ULWjlpzlrcaevIGn7JnDVxz4xxl
   FZee4Q2JjkEuL2zEfP4OxOqGaLCQ1zDhT+UhGr5nkSqQJsMz4iu8zEw9f
   GguGX8Jd1QdITrNA5i/WORvDW/JHWNRtNZy5dpvAL5NESvzqf0YrV4nsg
   pvuKY2v3TNMYahtYZhdTWRWzoYA71nGy2C59h2kt+Gy/YVLUEYd21Dac9
   I+4fjiyMAWjCN83NzMTOoBDl1mGoOnLNXYvH+eUwbQSwrtHEmtNXy/ab1
   w==;
X-CSE-ConnectionGUID: zfFGNZL/Rze49mvkkzih5g==
X-CSE-MsgGUID: lofmhfsjS0+GlTRRXXgMUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11681659"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11681659"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 00:36:08 -0700
X-CSE-ConnectionGUID: L/mWtxCzT5OjKqKwljDvlg==
X-CSE-MsgGUID: xeDGiTTzRvqsAuN+1TOh5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34946294"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2024 00:36:06 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6QE7-0009dv-38;
	Mon, 13 May 2024 07:36:03 +0000
Date: Mon, 13 May 2024 15:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Wenchao Hao <haowenchao2@huawei.com>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Wenchao Hao <haowenchao22@gmail.com>
Subject: Re: [PATCH] workqueue: Fix rescuer task's name truncated
Message-ID: <202405131400.sEYZHYk2-lkp@intel.com>
References: <20240513030639.3772468-1-haowenchao2@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513030639.3772468-1-haowenchao2@huawei.com>

Hi Wenchao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-wq/for-next]
[also build test WARNING on linus/master v6.9 next-20240510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/workqueue-Fix-rescuer-task-s-name-truncated/20240513-110849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-next
patch link:    https://lore.kernel.org/r/20240513030639.3772468-1-haowenchao2%40huawei.com
patch subject: [PATCH] workqueue: Fix rescuer task's name truncated
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240513/202405131400.sEYZHYk2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131400.sEYZHYk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131400.sEYZHYk2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/workqueue.c: In function 'init_rescuer':
>> kernel/workqueue.c:5558:57: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 24 [-Wformat-truncation=]
    5558 |         snprintf(rescuer->desc, sizeof(rescuer->desc), "%s", wq->name);
         |                                                         ^~
   kernel/workqueue.c:5558:9: note: 'snprintf' output between 1 and 32 bytes into a destination of size 24
    5558 |         snprintf(rescuer->desc, sizeof(rescuer->desc), "%s", wq->name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +5558 kernel/workqueue.c

  5528	
  5529	/*
  5530	 * Workqueues which may be used during memory reclaim should have a rescuer
  5531	 * to guarantee forward progress.
  5532	 */
  5533	static int init_rescuer(struct workqueue_struct *wq)
  5534	{
  5535		struct worker *rescuer;
  5536		int ret;
  5537	
  5538		if (!(wq->flags & WQ_MEM_RECLAIM))
  5539			return 0;
  5540	
  5541		rescuer = alloc_worker(NUMA_NO_NODE);
  5542		if (!rescuer) {
  5543			pr_err("workqueue: Failed to allocate a rescuer for wq \"%s\"\n",
  5544			       wq->name);
  5545			return -ENOMEM;
  5546		}
  5547	
  5548		rescuer->rescue_wq = wq;
  5549		rescuer->task = kthread_create(rescuer_thread, rescuer, "kworker/R");
  5550		if (IS_ERR(rescuer->task)) {
  5551			ret = PTR_ERR(rescuer->task);
  5552			pr_err("workqueue: Failed to create a rescuer kthread for wq \"%s\": %pe",
  5553			       wq->name, ERR_PTR(ret));
  5554			kfree(rescuer);
  5555			return ret;
  5556		}
  5557	
> 5558		snprintf(rescuer->desc, sizeof(rescuer->desc), "%s", wq->name);
  5559	
  5560		wq->rescuer = rescuer;
  5561		if (wq->flags & WQ_UNBOUND)
  5562			kthread_bind_mask(rescuer->task, wq_unbound_cpumask);
  5563		else
  5564			kthread_bind_mask(rescuer->task, cpu_possible_mask);
  5565		wake_up_process(rescuer->task);
  5566	
  5567		return 0;
  5568	}
  5569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
