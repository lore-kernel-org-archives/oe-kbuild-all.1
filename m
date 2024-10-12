Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59AE208C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728750912; cv=none; b=N2H7OhXl8R6acxmQKRQaKayWkAZO52XCQDKmJMJvBncFY/vq5O7Tf55080+l7XX2xOBr43Hlo1JaxA7b89jP4Q+jCtHoplDhmi8hDS3Da+kIcD8ajgTLaEzo5AF3C2xxc9kHgTGkha2phvXG2VjJuCben6hXQXtj5dpOJsq8obI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728750912; c=relaxed/simple;
	bh=0h3hgazhzOkaNhPcEYIeis7mJcg1+FONBUDl1TBWeN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cco3axHA8+QapY5ASPejHLGZga1QDoD3joy9oOawpWSLs6JeTr3v55jVZfYRVZL5ZgH7ir8pDPrL4TM56pcldHpSUo9fFsBtfM3dgMuHmmZPcjqDiywt6sbqM9wQJ8XPIc9E0qaZ1SRjEnIj3rRbfx2osdsFjQ1no8ZFYovB2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDoeCbGV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDoeCbGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728750911; x=1760286911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0h3hgazhzOkaNhPcEYIeis7mJcg1+FONBUDl1TBWeN8=;
  b=nDoeCbGV71hhuu9vXJL/J4UuGKSHQThBNcRJXvDZ/BVfffvP/9tDocqx
   /g1oYwAHQ+gQwVadaCakTSL2Xoi/StlPld9fqtjjiIYamtNyWWltSDtiu
   EPlFQp+0sAAKMYeNM/VW17ViNSdGfJHq4v2eQ/xPSXekbKjXJzhdL5iMQ
   6jwd8AeKkbX9OwvM7IoWlzYVHdqgFgiH17zCbhZfkK+yY0s9y17Jc//re
   53b42KF3BjT96xtF6Akdps56H4Thhy/pZWdA4Fzb3W7lau057lyWxKYtG
   iMjlvG77CNfrI7lJvq78preI00E89c+CebWswXyQQKtekanKGP4gAaBfI
   A==;
X-CSE-ConnectionGUID: VSU5FZy4STqrUGILH4E5uw==
X-CSE-MsgGUID: Xmk4ralGQ9+XLBRWKVD7wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28313199"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28313199"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 09:35:10 -0700
X-CSE-ConnectionGUID: a9oroXfUQ+i+/sMeAKVM0w==
X-CSE-MsgGUID: N9ddPLfURZO5Kt1EZtxMSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="76807287"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Oct 2024 09:35:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szf59-000DWb-1G;
	Sat, 12 Oct 2024 16:35:07 +0000
Date: Sun, 13 Oct 2024 00:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next_wrap3 1/13] include/linux/objpool.h:173:13:
 warning: variable 'start' set but not used
Message-ID: <202410130023.hgT4wUXj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next_wrap3
head:   30107b2de3c581d5718e15054519cc903871d3a6
commit: 5ffb282ad6da69dee853d19f42237a66a42bb80e [1/13] objpool: rework objpool_pop()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241013/202410130023.hgT4wUXj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130023.hgT4wUXj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130023.hgT4wUXj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kprobes.h:29,
                    from init/main.c:36:
   include/linux/objpool.h: In function 'objpool_pop':
>> include/linux/objpool.h:173:13: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     173 |         int start, cpu;
         |             ^~~~~


vim +/start +173 include/linux/objpool.h

   162	
   163	/**
   164	 * objpool_pop() - allocate an object from objpool
   165	 * @pool: object pool
   166	 *
   167	 * return value: object ptr or NULL if failed
   168	 */
   169	static inline void *objpool_pop(struct objpool_head *pool)
   170	{
   171		void *obj = NULL;
   172		unsigned long flags;
 > 173		int start, cpu;
   174	
   175		/* disable local irq to avoid preemption & interruption */
   176		raw_local_irq_save(flags);
   177	
   178		start = raw_smp_processor_id();
   179		for_each_possible_cpu_wrap(cpu, start) {
   180			obj = __objpool_try_get_slot(pool, cpu);
   181			if (obj)
   182				break;
   183		}
   184		raw_local_irq_restore(flags);
   185	
   186		return obj;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
