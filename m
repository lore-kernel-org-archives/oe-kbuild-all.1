Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19422367B8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251990; cv=none; b=SWF+yC3GovVkF0/gDDO9VCD1fxUcCIHAHg+adX8oU9v54mS9xXssANr6FMixUGxzu8GYNlTA2+k4fiuTtUpXZiL3HQWyyoPcaHRLClPRmlNEyMWrMYCOPip9oweKMlvK61lSQFXVVJbaACqrY+LWBDg7hqpIlFcxh7LCEqH0GzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251990; c=relaxed/simple;
	bh=B6qKHitAlUwDlbEq4zLglHDoX6qLE4dZ7ySXeje+Qng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gjNu9Nnsrbhly+zjf7NQIJJf5sENmeDXnSWd4ieWGCMRUr1QsLBR5wWlNyPYu/Iif+9K5tJ4wH79DkdWKOMYv8EMFuALxLM/DqZEe79QkcQvrosOozplJ57QceEtA0YZs1rNYxOmoJLDVVEjxUej5GrZfa4PkasDXSN3M7QBlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6zFBu2m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6zFBu2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762251989; x=1793787989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B6qKHitAlUwDlbEq4zLglHDoX6qLE4dZ7ySXeje+Qng=;
  b=E6zFBu2moY6Cq+ldX2uehWiPFNEvD+bb0F75JofQjvMrvEC7VNytIvmR
   B0Zqzx0oBGlJUwUVHRqPACvDZlqS3oMrL4hSuxDD8hf3Kp6px2n6utX+e
   Q/84WP134Mo5C8SkdBYEUbwH3l9m1rIzJvafoy8QaYkdAb8HDVwivKDMZ
   qa/VRo2tI7t8kqomx/Puq4YrS0H/z/IXA0+3dF0oWtESgpV/Okex3SlIh
   MvIvpoCv/Q1ocJY+lXAZmakHF/wfNqs4L9FV02Dq6ZSPWciO+ujTCW8nP
   UWsKmjoMfjLl22hTzquQCx1AxEP2juFj2Aw9xnUFdUxGklLhAItjaK9q1
   Q==;
X-CSE-ConnectionGUID: 8BwXn+IhQ1W4M+8wmyguFQ==
X-CSE-MsgGUID: ovaKEzSKS6ajvnp/2WNguA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="67996493"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="67996493"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 02:26:28 -0800
X-CSE-ConnectionGUID: BJA78LeaSWqajm+uA1F1xg==
X-CSE-MsgGUID: HisYVvG3SkW98JFCCPzrvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="224372754"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2025 02:26:27 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGEF7-000RGk-06;
	Tue, 04 Nov 2025 10:26:25 +0000
Date: Tue, 4 Nov 2025 18:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] block/bpf-rvi.c:36:28: error: implicit
 declaration of function 'css_to_blkcg'; did you mean 'pd_to_blkg'?
Message-ID: <202511041808.gFZ75q5u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   25097b0e8b7a08363a1cba931a5762548a3b0e16
commit: 89fa7dcff5e533bd14396601f40c388cfb6c1e59 [3098/3098] bpf-rvi: block: Add diskstats iterator target
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041808.gFZ75q5u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041808.gFZ75q5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041808.gFZ75q5u-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/bpf-rvi.c: In function 'bpf_disk_seqf_start':
>> block/bpf-rvi.c:36:28: error: implicit declaration of function 'css_to_blkcg'; did you mean 'pd_to_blkg'? [-Wimplicit-function-declaration]
      36 |         priv->task_blkcg = css_to_blkcg(task_css(reaper ?: current, io_cgrp_id));
         |                            ^~~~~~~~~~~~
         |                            pd_to_blkg
>> block/bpf-rvi.c:36:69: error: 'io_cgrp_id' undeclared (first use in this function); did you mean 'cpu_cgrp_id'?
      36 |         priv->task_blkcg = css_to_blkcg(task_css(reaper ?: current, io_cgrp_id));
         |                                                                     ^~~~~~~~~~
         |                                                                     cpu_cgrp_id
   block/bpf-rvi.c:36:69: note: each undeclared identifier is reported only once for each function it appears in


vim +36 block/bpf-rvi.c

    20	
    21	/*
    22	 * Basically the same with disk_seqf_start() but without allocating iter and
    23	 * then overwriting seqf->private, which points to priv_data->target_private
    24	 * in bpf_iter case (see prepare_seq_file()), and is needed to retrieve
    25	 * struct bpf_iter_priv_data. Here we allocate iter via setting
    26	 * .seq_priv_size and turning priv_data->target_private into iter.
    27	 */
    28	static void *bpf_disk_seqf_start(struct seq_file *seqf, loff_t *pos)
    29	{
    30		loff_t skip = *pos;
    31		struct diskstats_seq_priv *priv = seqf->private;
    32		struct class_dev_iter *iter;
    33		struct device *dev;
    34		struct task_struct *reaper = get_current_level1_reaper();
    35	
  > 36		priv->task_blkcg = css_to_blkcg(task_css(reaper ?: current, io_cgrp_id));
    37		if (reaper)
    38			put_task_struct(reaper);
    39	
    40		iter = &priv->iter;
    41		class_dev_iter_init(iter, &block_class, NULL, &disk_type);
    42		do {
    43			dev = class_dev_iter_next(iter);
    44			if (!dev)
    45				return NULL;
    46		} while (skip--);
    47	
    48		return dev_to_disk(dev);
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
