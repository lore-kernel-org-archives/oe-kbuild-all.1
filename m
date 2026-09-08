Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C54AE12B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865970; cv=none; b=cneOSfQ1ro+ImArKYvX3gy0NwQsUGQG5uySThfKEKTF7Lli33UhRvQF5P+1VZpxU3ZO4WH7OpUMoyHhfN5euaC3J0LCuysq5h1IVNgkY7hasauzhq5CaKnJ8EDpE+m8+fhmdb6NvdIAH1DddxXSa94+Y3WQtMFm8qekea0ERhGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865970; c=relaxed/simple;
	bh=XsLUDZs40pF20x1WXVI5IgqQwuPflJyG7K+O9is7aDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OfyGC1OPdz9USrJIc57b1w+Tt204AtU04Uz0eo/MGLuz8ZKsKEcq7y8VmY9M0CxBG39bPPBqe26BH/069Tp1lCx1oiuDggRyTUrfjbOyEiUutWj4dkCK5h3ksYbKvCptowN4XNQo6nKRuk2NdpkT/BsYZ8jilfXwC623nM9W7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGz7gJaK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGz7gJaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788865961; x=1820401961;
  h=date:from:to:cc:subject:message-id;
  bh=XsLUDZs40pF20x1WXVI5IgqQwuPflJyG7K+O9is7aDk=;
  b=oGz7gJaKdW5eaxqCerhIqGd3s8g0+G0rSJ6DMq9+1YtQlbIvt+L07kTX
   sV4TheuWQhoFQPAUdWi8/pFyqTFq4rN8ypTjNGl5zqLPGl5myZvE1flfv
   AcVoV9LQq2h2UKPjG0Umizetd8khaKs2nXjBYISfMbeUArgyRhLKeb9NY
   fVcDw2ze/RmxkrpVKCE8yUuio3fpP2D6w82CidKrsfAZCUCoDPnM2M9LQ
   cstCE8HcOThNkPwMpEpdAKvvxKeY9wx/zg15GclGqW93gcOfSrtNp2GTK
   mE1LokQzQS3IBjC/C6mCPJ/gyNk3YAWf7+DjdVFJcfV4FedAH2Qlvmfg1
   A==;
X-CSE-ConnectionGUID: s4cdPLmeTKaQX4sVzwcEwA==
X-CSE-MsgGUID: z8ieg/uwTt6jc4AE33NgVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91775848"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="91775848"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:12:36 -0700
X-CSE-ConnectionGUID: FJxQHVnUTma9GDJcuIkGBQ==
X-CSE-MsgGUID: tDvJs9avQy2Ccr+zeDYarw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270481332"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2026 04:12:35 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3tke-000000000fm-2vf0;
	Tue, 08 Sep 2026 11:12:32 +0000
Date: Tue, 08 Sep 2026 13:11:40 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1019/1019]
 mm/memcontrol.c:8390:9: error: implicit declaration of function
 'unevict_task_fork'; did you mean 'exit_task_work'?
Message-ID: <202609081337.J1ul7JmK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b4ec01ca5aac08347802786e2513d22bcc37d843
commit: d30f7906f08ec3a4b9d04521557c5cf4dcea6d7a [1019/1019] anolis: mm/unevictable: arm forked children via memcg fork hook
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260908/202609081337.J1ul7JmK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081337.J1ul7JmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081337.J1ul7JmK-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol.c: In function 'mem_cgroup_fork':
>> mm/memcontrol.c:8390:9: error: implicit declaration of function 'unevict_task_fork'; did you mean 'exit_task_work'? [-Wimplicit-function-declaration]
    8390 |         unevict_task_fork(task);
         |         ^~~~~~~~~~~~~~~~~
         |         exit_task_work


vim +8390 mm/memcontrol.c

  8387	
  8388	static void mem_cgroup_fork(struct task_struct *task)
  8389	{
> 8390		unevict_task_fork(task);
  8391	}
  8392	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
