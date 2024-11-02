Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C771A76D2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730565713; cv=none; b=cUmzIShrsb6kodA2AKOeg7ovnpHmPh+dEPJoLH1LgeM9iXnWLrr5UsnZ/E/3b1BBbNMuDrm2I47RfkauLVweng1F4FCrrOB34x+hMVtvkxSf2QH3pOF+o+hEmwDqm1OfEQVo8mhFZHEDF6mX47NLNmVaW/Mu6A5BbjFweuOK/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730565713; c=relaxed/simple;
	bh=8eJNOpsoxzv7j39wBOnqkPrmkqI00gtVAHasD6qe9is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGHPcMVd3xvMLko7x89aMNwjdhdU5J/biS06m4X4qf1yVIrIosuWX/OF0xmOd7S2Ywv4y5HnsAq8G8mbLxjYae/Fw2ev7QGLDYgmfAGW8KMR69Ffh5vwvtRXKT3ztS4LUrhPza0fMAfOfsZ2c4NyufgG6F7Gy6UY9iiMr66MGpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCFTSqpe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCFTSqpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730565712; x=1762101712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8eJNOpsoxzv7j39wBOnqkPrmkqI00gtVAHasD6qe9is=;
  b=YCFTSqpeqRcrSMTF1svb7D9crDnEtqtXP7f5ypKsuAWZ5LHcb6MUoOPN
   cWqCUUGHhyw3M8kpuIsNSAQc/seYVS+Jz0goALj5LgJLSLpqq4WhQU0wZ
   oydB6T757GNh2/UTo21rWTDB+919XDC2FmmOYUDuaUH+b5LBxnwX4/gl4
   dO0oLi6Evl1v5a7UkuaFTBpob5wwuYAufD3PDBA2kZP5WwW7I2zGDi17g
   FdFLhZG3xjgjdwLGGhwBun/kgsFC+/qt7J8WKkbU8dZ+5MJAM/FNOnuV7
   ijSnLVSJ8YAv21Zx79KCCPkCsH3NjyEH9xEV+ulyYlZe6Hqg+P3T2mRPC
   Q==;
X-CSE-ConnectionGUID: 8uXW4iX2Tze8eDR1ZlSXXA==
X-CSE-MsgGUID: aYkUDa96R6m+Gc78rL5efg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34000602"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34000602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 09:41:48 -0700
X-CSE-ConnectionGUID: qNdRniwOSrC94yjsLA8GZQ==
X-CSE-MsgGUID: MbXpxPoESIWjPtcdr0vJsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="120697681"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 09:41:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7HC2-000jAe-1y;
	Sat, 02 Nov 2024 16:41:42 +0000
Date: Sun, 3 Nov 2024 00:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	sonicadvance1@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, linux-api@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v2 2/3] futex: Create set_robust_list2
Message-ID: <202411030038.W5DgvCYP-lkp@intel.com>
References: <20241101162147.284993-3-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241101162147.284993-3-andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on tip/sched/core linus/master v6.12-rc5 next-20241101]
[cannot apply to tip/x86/asm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Use-explicit-sizes-for-compat_exit_robust_list/20241102-002419
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20241101162147.284993-3-andrealmeid%40igalia.com
patch subject: [PATCH v2 2/3] futex: Create set_robust_list2
config: i386-randconfig-062-20241102 (https://download.01.org/0day-ci/archive/20241103/202411030038.W5DgvCYP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030038.W5DgvCYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030038.W5DgvCYP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/futex/core.c:915:59: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:915:59: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *head @@     got unsigned int [usertype] * @@
   kernel/futex/core.c:915:59: sparse:     expected unsigned int [noderef] [usertype] __user *head
   kernel/futex/core.c:915:59: sparse:     got unsigned int [usertype] *
   kernel/futex/core.c:1108:42: sparse: sparse: cast removes address space '__user' of expression
>> kernel/futex/core.c:1108:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct robust_list_head32 [noderef] __user *head @@     got struct robust_list_head32 * @@
   kernel/futex/core.c:1108:42: sparse:     expected struct robust_list_head32 [noderef] __user *head
   kernel/futex/core.c:1108:42: sparse:     got struct robust_list_head32 *
   kernel/futex/core.c: note: in included file (through include/linux/smp.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1108 kernel/futex/core.c

  1095	
  1096	static void futex_cleanup(struct task_struct *tsk)
  1097	{
  1098		struct robust_list2_entry *curr, *n;
  1099		struct list_head *list2 = &tsk->robust_list2;
  1100	
  1101	#ifdef CONFIG_64BIT
  1102		if (unlikely(tsk->robust_list)) {
  1103			exit_robust_list64(tsk, tsk->robust_list);
  1104			tsk->robust_list = NULL;
  1105		}
  1106	#else
  1107		if (unlikely(tsk->robust_list)) {
> 1108			exit_robust_list32(tsk, (struct robust_list_head32 *) tsk->robust_list);
  1109			tsk->robust_list = NULL;
  1110		}
  1111	#endif
  1112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
