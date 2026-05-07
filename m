Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B749636AF6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 18:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179117; cv=none; b=tFRmEA5MkJbVaNKStgUlNEEFan7SK83wdKkyOui2zYJaSyd9L5otmYcboBvsUPwnXgqIpnZMBargXpBOohLF7Ju/eCV0GuYO2a9hAfKG+5pTFku4exPeRr1Ml1XPjQV+HWM2LKvtgWDxgXV80u/MXRDPTft9YvL1B4QC7fJ3CMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179117; c=relaxed/simple;
	bh=OGGuYk+AylbBzQU/sH5uVI8ycEKs9MnOFoBT2NMLUUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T6YPugOxMwFgtuGgVqP1oHdzjxMJNiQ1ylVrzejhBpGR8ACm/FRREKJ6qUt44hQTqIbCOZKjxxwK3NuOrvQLIO5rO2U1Wtr7PTgu+BjgW6eU3e9vW0RekTDIxtj5g3IXFBRzdbIlEyAFYJfWAqwIh0jQYdQOF9MDWdExbtgkuGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGzLc+CV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGzLc+CV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778179117; x=1809715117;
  h=date:from:to:cc:subject:message-id;
  bh=OGGuYk+AylbBzQU/sH5uVI8ycEKs9MnOFoBT2NMLUUE=;
  b=kGzLc+CVSDXDeJxpttIHPhSYNV2XGyChyw2sszOq5j6TIroJK5KVBNZN
   NJu6NRnne2z0eF0o5mqu87nDuQ8ikIsXj4L2ZtVS4hTZ+jK1cOkYJSJ0S
   g7ky2UjeVTsae8kcgBhFysoV+FXcl7bi5FsRM9yzBDIzBY9CMv5zldvBx
   80h2VDRPwORLV9a2qFXsK0tfaqmMKTowr0NpymFb0Xfm6QJrAg7yxWeno
   ZQ5D54uXPm5vxSJ4EINYBl3mA4ylGenybFwFjm+o77gjaLrsADkFDZHq0
   yAEKZgnuxJUIW36Q/qSYL8h2hlHZO/yJ5PjBZO6jci+xIi+zCRJSf7wDm
   Q==;
X-CSE-ConnectionGUID: CKzK2PxYSYWCzcyghw4VMQ==
X-CSE-MsgGUID: sgcVYYnKRxqPiF4U6YX+lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79249809"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79249809"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:38:36 -0700
X-CSE-ConnectionGUID: pDjMsa+XS/mk/0ld8BgdFw==
X-CSE-MsgGUID: /wbcpp7GQYC1GdTxH90UAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="235706016"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2026 11:38:34 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL3cG-000000000NB-02c1;
	Thu, 07 May 2026 18:38:32 +0000
Date: Fri, 08 May 2026 02:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Carstens <hca@linux.ibm.com>
Subject: [frederic-dynticks:timers/core-v4 6/15]
 arch/s390/kernel/vtime.c:247:17: error: too few arguments to function
 'vtime_flush'
Message-ID: <202605080250.Jcm5fllW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v4
head:   4c91a3f3d50ec8ceda89c083db92beb25a5526ee
commit: 63c65224d76c60da9e25ae962223d2fd5565c45e [6/15] s390/time: Prepare to stop elapsing in dynticks-idle
config: s390-randconfig-001-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080250.Jcm5fllW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080250.Jcm5fllW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080250.Jcm5fllW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kernel/vtime.c: In function 'vtime_account_softirq':
>> arch/s390/kernel/vtime.c:247:17: error: too few arguments to function 'vtime_flush'
     247 |                 vtime_flush();
         |                 ^~~~~~~~~~~
   arch/s390/kernel/vtime.c:203:6: note: declared here
     203 | void vtime_flush(struct task_struct *tsk)
         |      ^~~~~~~~~~~
   arch/s390/kernel/vtime.c: In function 'vtime_account_hardirq':
   arch/s390/kernel/vtime.c:260:17: error: too few arguments to function 'vtime_flush'
     260 |                 vtime_flush();
         |                 ^~~~~~~~~~~
   arch/s390/kernel/vtime.c:203:6: note: declared here
     203 | void vtime_flush(struct task_struct *tsk)
         |      ^~~~~~~~~~~


vim +/vtime_flush +247 arch/s390/kernel/vtime.c

   241	
   242	void vtime_account_softirq(struct task_struct *tsk)
   243	{
   244		if (!__this_cpu_read(s390_idle.idle_dyntick))
   245			get_lowcore()->softirq_timer += vtime_delta();
   246		else
 > 247			vtime_flush();
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
