Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2D618EFD3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 23:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722296714; cv=none; b=Mz+CxHhxSW5hIdVrcvG77Vot6/H6YmZ3Z5lAceFRFR+WcjbCkFEeiX7ruh7pQLoTqfvEA7JG8oAPGuwwx9CHDXUq/AACGiMpDwhJe5adw1BAV42kIoZ/9uDbHF/Ol7w7zsmnGf/1kgQwwLL/QqZwowuODUBZ+Tpo5Co1oE8Yyhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722296714; c=relaxed/simple;
	bh=LheOn7uDJIqFdXj2COkdr2NRLvxQQDJ2spMhzXd2Lsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjq5JKS7V+wce4JncCziee3eISHUt6/RxQkh5sfzBiFSi2XkeuGI/91LxNIlmmV6JwiJZ6XyV0RwlCuNWKewODagCCLjLchk+MzQBR73GnsjvEUD44IYWjgnSBUG4L5YESIHnEaSdd8+q5bvas3NV1GvBvNNUzYBnvXrFMFJKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aumulSup; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aumulSup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722296713; x=1753832713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LheOn7uDJIqFdXj2COkdr2NRLvxQQDJ2spMhzXd2Lsg=;
  b=aumulSupE2acpvp1B4pjml3/z3FS1xGsN6lKNz0KY1AeAVn2dnD9VIaD
   O3C+bHDcIsx9snLTNVtykrjjraw3F3LFeLDvKwcqBPdo+qqx1Y/DKUkyB
   VWcHI6Oh7zCzag7XCocxDtvQErpJNNMY7AXzZZ37mNYtLuSCvKjASMnqu
   vJhrZlN6hLVZmt+WGD8r3Mq1M7q6jtjVgjkkTQJdNmKTQoZTpPrAi0AK0
   eA2oZ2V1BJ5sHkGZPiwlG4mP074Qp6GbfzOJ7KRg/e5uQ+bKCZgDBikYJ
   YKwIev7iIVMM5YzhCHvcDUC5dh0ypSi55UfXgsLgBy9SxcY60qVM4R9dq
   A==;
X-CSE-ConnectionGUID: cvg2w6B4TduGV2vsa6/fiA==
X-CSE-MsgGUID: 86jryosXRQqSDzQmdN6Y/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23876210"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="23876210"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 16:45:12 -0700
X-CSE-ConnectionGUID: dw8MvjgGRQW+JPzfIa1SJA==
X-CSE-MsgGUID: AFdnrd2NSSKX5dgKDwZxtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="58753555"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jul 2024 16:45:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYa38-000sC2-2q;
	Mon, 29 Jul 2024 23:45:06 +0000
Date: Tue, 30 Jul 2024 07:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7865/7897] kernel/cgroup/sli.c:642:15: sparse:
 sparse: symbol 'get_cgroup_from_task_id' was not declared. Should it be
 static?
Message-ID: <202407300743.YskWe2K1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   8827461ac92e93f2c805b31a00cd444f7b59f41e
commit: 00423a80429a623a28227d306c3108e801dd0f6f [7865/7897] sli: backport sli function from tk3
config: x86_64-randconfig-121-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300743.YskWe2K1-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300743.YskWe2K1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300743.YskWe2K1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/sli.c:642:15: sparse: sparse: symbol 'get_cgroup_from_task_id' was not declared. Should it be static?
>> kernel/cgroup/sli.c:1247:27: sparse: sparse: dubious: !x & y
>> kernel/cgroup/sli.c:1247:29: sparse: sparse: restricted fmode_t degrades to integer
>> kernel/cgroup/sli.c:1337:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   kernel/cgroup/sli.c:1337:24: sparse:     expected restricted __poll_t
   kernel/cgroup/sli.c:1337:24: sparse:     got int
   kernel/cgroup/sli.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/get_cgroup_from_task_id +642 kernel/cgroup/sli.c

   641	
 > 642	struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
   643	{
   644		int id;
   645		struct cgroup *cgrp;
   646	
   647		id = cpuacct_cgrp_id;
   648		switch (event_nr) {
   649	#if IS_ENABLED(CONFIG_MEMCG)
   650		case SLI_MEM_EVENT:
   651			id = memory_cgrp_id;
   652			break;
   653	#endif
   654		default:
   655			break;
   656		}
   657	
   658		/* First, try to get cpuacct/mem cgroup for V1*/
   659		cgrp = task_cgroup(task, id);
   660		if (cgrp && cgrp->level)
   661			return cgrp;
   662	
   663		/*
   664		 * If can not find cpuacct/mem cgroup or cpuacct/mem cgroup is root, just return
   665		 * dfl_cgrp.
   666		 */
   667		cgrp = task_dfl_cgroup(task);
   668	
   669		return cgrp;
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
