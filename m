Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4112CCD3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710511340; cv=none; b=heIByM0VNB4clYhivL68yWMegG8Dh8YfdWfGAahyCD7Pd5HQI0JHSCQ26msEVvTnsY8bYjSkTPXNOjFxQW/xl7iJ71PNStlZRGbI3fSPaM/AsmUZ1r3Wdxx69UeHns/n5ZggUsFc4orE+wa34+KQ6LGk7Vl8roAFflyQPYnSIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710511340; c=relaxed/simple;
	bh=Sy8MiB80xsfr3h7kIHoYfly2rp8V8I8kUb6+GbRCXaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AgCaNAFNrGY0u8bqF5vDt5gx4AgoRC2/DzT0ExAkwVYZnmDfoUXhYKAdkp0FhJb4+Q/2Nhjq7VIvViont8lqGMOxRlX+UErNolIRkdIwU7PE6JpeCzHz2OQrnjlYyseqd/wwSRRbzgCoYC3KYUmiLH8eH7oJh8C2lApycwr//ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MltrWhNZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MltrWhNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710511337; x=1742047337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sy8MiB80xsfr3h7kIHoYfly2rp8V8I8kUb6+GbRCXaQ=;
  b=MltrWhNZk8JqfzZriiwjU//PHw9OW5789/wlnrjL2KmFvsBHAvCki/oY
   lgc43oQP81+20zUvITxAG8D8YTKtrEic0fcMRmktt+TJeg0zN6KuJ09HC
   wh6dJdZhFfi9kTg1v1VHBKTR/ni1qUvfTjLix4trY4w2KJPAxZX5Ouh66
   0DJJqXLzHC7xbEJmnxMCgH68HKoDVBw546RLE8a4yud3Rnd4+Z2fnGE0V
   xODq8p7xXxAkLRI0v0EhloLcrdKyZxI5PTCYcddKOiqx/dfO6MAANlCdV
   YoMQbXKZhxpt/K3ea00rZbKQL3w1qkyozwtH5zMkr2fQmmvAk+TIv78Xp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5513891"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5513891"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 07:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="12719409"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Mar 2024 07:02:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl88P-000EU7-1G;
	Fri, 15 Mar 2024 14:02:09 +0000
Date: Fri, 15 Mar 2024 22:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26801/27507] mm/unevictable.c:595:37:
 warning: 'del_fops' defined but not used
Message-ID: <202403152126.oB9SKhJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: ba400ae6a9f6d527f49b375ca1762b1cc197b6a1 [26801/27507] Revert "proc: convert everything to "struct proc_ops""
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240315/202403152126.oB9SKhJh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403152126.oB9SKhJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403152126.oB9SKhJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/unevictable.c:182:6: warning: no previous prototype for 'del_unevict_task' [-Wmissing-prototypes]
     182 | void del_unevict_task(struct task_struct *tsk)
         |      ^~~~~~~~~~~~~~~~
   mm/unevictable.c: In function 'add_pid_start':
   mm/unevictable.c:353:15: error: implicit declaration of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=implicit-function-declaration]
     353 |         ctx = vzalloc(sizeof(*ctx) + proc_pids_count * sizeof(int));
         |               ^~~~~~~
         |               kzalloc
   mm/unevictable.c:353:13: warning: assignment to 'struct add_pid_seq_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     353 |         ctx = vzalloc(sizeof(*ctx) + proc_pids_count * sizeof(int));
         |             ^
   mm/unevictable.c:389:9: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
     389 |         vfree(ctx);
         |         ^~~~~
         |         kfree
   mm/unevictable.c: At top level:
   mm/unevictable.c:587:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     587 | const static struct file_operations add_fops = {
         | ^~~~~
   mm/unevictable.c:595:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     595 | const static struct file_operations del_fops = {
         | ^~~~~
>> mm/unevictable.c:595:37: warning: 'del_fops' defined but not used [-Wunused-const-variable=]
     595 | const static struct file_operations del_fops = {
         |                                     ^~~~~~~~
>> mm/unevictable.c:587:37: warning: 'add_fops' defined but not used [-Wunused-const-variable=]
     587 | const static struct file_operations add_fops = {
         |                                     ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/del_fops +595 mm/unevictable.c

   586	
 > 587	const static struct file_operations add_fops = {
   588		.open		= proc_open_add_pid,
   589		.read		= seq_read,
   590		.write		= write_add_pid,
   591		.llseek		= seq_lseek,
   592		.release	= seq_release,
   593	};
   594	
 > 595	const static struct file_operations del_fops = {
   596		.write		= write_del_pid,
   597	};
   598	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
