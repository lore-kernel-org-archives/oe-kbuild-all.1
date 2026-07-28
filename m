Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54E23E330
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 01:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200970; cv=none; b=cAdvNbwhb7pIyxhYjLIdqjUFpPYEJvanwR0QeO/R/mbdqJ11w1h/lVFMPhXCWobaXSz/3xyBDW8u6AO0FvJvI9H2x1Rn18rkAaPBFyljPghNXp9YLTylWWVMi5mKBx4+s5oLq0IsvKSSdXp0DvKujhz8lIsJ3qvkMTZ7/62rRUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200970; c=relaxed/simple;
	bh=uthb9/Yu7L9PBUgDNb7n6b7djswTg2dYLCvA/yUxKA0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e/PdxWEEqBQk5jS25va+RpUJjU4AuUUNPiD/uW5ZGXn6GNEmuHFUTE4ids296Epz7z1Ol2lgLPziHDuf05mRZ3aZznAJthOkWsUawMBKoWvCmoEqo/Ev2eElLAI89gDDi5YMpyK6R29jsuGvvDYuI7ITkKnKNrvOg4Z6r2xnJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZzAFe8v; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZzAFe8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785200968; x=1816736968;
  h=date:from:to:cc:subject:message-id;
  bh=uthb9/Yu7L9PBUgDNb7n6b7djswTg2dYLCvA/yUxKA0=;
  b=UZzAFe8vsiM56wIVWGhyBZq9G+2jLXHElTaINk4zWOMj2PmbQHy3UX5X
   qEy4qv1eBT6zGcRDNEGcqf7CKT6T8R1Scr38+XCUQO+kxJD3v30Jvx1mv
   UNycqACIVwMzO0ayI2DlOM0mouUh66C/27053VBrtA2jdo/ocOqDkr+Ml
   8VGuAQT1pZf0Iji9Q5VJ7g1q5MorENnpv3VJtRFGOe0vO9pvMhkqKnoPa
   zgp0Y12ZbbgwiAWucDZ6z5fjL2U4DhoruqwBT0NcAze9HyCTL3ztAGPlZ
   0P9aehmrauJqp/CeOZTjDBW7D5e8kRsyEWDmPIsKSgadtERHjBDYTP2Go
   w==;
X-CSE-ConnectionGUID: IQJXPfSyTmODsPvN96GPaQ==
X-CSE-MsgGUID: UPXjJGj4QTOvQfwMFS1eMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85628237"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85628237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 18:09:27 -0700
X-CSE-ConnectionGUID: mrgy71UCRdyZgDJAkrtbkg==
X-CSE-MsgGUID: hQ5pwJZJRd+jlsOKZqQjcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="284098174"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 18:09:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woWJu-000000001oQ-3WlH;
	Tue, 28 Jul 2026 01:09:22 +0000
Date: Tue, 28 Jul 2026 03:08:23 +0200
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/pid.c:767:12: warning: 'proc_do_cad_pid' defined but
 not used
Message-ID: <202607280329.cPhirGTQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oleg-Nesterov/sysctl-remove-CONFIG_PROC_SYSCTL-it-just-mirrors-CONFIG_SYSCTL/20260727-231232
head:   3e7984a76e1b74111e982852c01663e6f6f6dabe
commit: 3e7984a76e1b74111e982852c01663e6f6f6dabe sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL
date:   9 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260728/202607280329.cPhirGTQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280329.cPhirGTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280329.cPhirGTQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/pid.c:767:12: warning: 'proc_do_cad_pid' defined but not used [-Wunused-function]
     767 | static int proc_do_cad_pid(const struct ctl_table *table, int write, void *buffer,
         |            ^~~~~~~~~~~~~~~


vim +/proc_do_cad_pid +767 kernel/pid.c

7863dcc72d0f4b Christian Brauner 2024-11-22  766  
e054bcbe7e7af2 Joel Granados     2025-05-05 @767  static int proc_do_cad_pid(const struct ctl_table *table, int write, void *buffer,
e054bcbe7e7af2 Joel Granados     2025-05-05  768  		size_t *lenp, loff_t *ppos)
e054bcbe7e7af2 Joel Granados     2025-05-05  769  {
e054bcbe7e7af2 Joel Granados     2025-05-05  770  	struct pid *new_pid;
e054bcbe7e7af2 Joel Granados     2025-05-05  771  	pid_t tmp_pid;
e054bcbe7e7af2 Joel Granados     2025-05-05  772  	int r;
e054bcbe7e7af2 Joel Granados     2025-05-05  773  	struct ctl_table tmp_table = *table;
e054bcbe7e7af2 Joel Granados     2025-05-05  774  
e054bcbe7e7af2 Joel Granados     2025-05-05  775  	tmp_pid = pid_vnr(cad_pid);
e054bcbe7e7af2 Joel Granados     2025-05-05  776  	tmp_table.data = &tmp_pid;
e054bcbe7e7af2 Joel Granados     2025-05-05  777  
e054bcbe7e7af2 Joel Granados     2025-05-05  778  	r = proc_dointvec(&tmp_table, write, buffer, lenp, ppos);
e054bcbe7e7af2 Joel Granados     2025-05-05  779  	if (r || !write)
e054bcbe7e7af2 Joel Granados     2025-05-05  780  		return r;
e054bcbe7e7af2 Joel Granados     2025-05-05  781  
e054bcbe7e7af2 Joel Granados     2025-05-05  782  	new_pid = find_get_pid(tmp_pid);
e054bcbe7e7af2 Joel Granados     2025-05-05  783  	if (!new_pid)
e054bcbe7e7af2 Joel Granados     2025-05-05  784  		return -ESRCH;
e054bcbe7e7af2 Joel Granados     2025-05-05  785  
e054bcbe7e7af2 Joel Granados     2025-05-05  786  	put_pid(xchg(&cad_pid, new_pid));
e054bcbe7e7af2 Joel Granados     2025-05-05  787  	return 0;
e054bcbe7e7af2 Joel Granados     2025-05-05  788  }
e054bcbe7e7af2 Joel Granados     2025-05-05  789  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
