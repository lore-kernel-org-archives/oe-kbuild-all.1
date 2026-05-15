Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5893EAC6B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884554; cv=none; b=DbcFYj/3tkQJpbqhYddlIpkULSXM1yjlqsdjvRix1YgcEUT677pGPtQtZr+NbgE4ZsEdMkFSqeK8X4V/LYFsQWFZPEVjCDFb79fznRa6zI0+m9iBHZ/xNqdUfTKBV7xGbmIdKyG1YHKHj0Nbpv9LgxAaAgcwrDSf6pkChX+wOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884554; c=relaxed/simple;
	bh=EXdM0/0iZ+sLZ82srY+xI+vr/RdjoQeVrXB9LaDvFao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G/XF7iERjLOEu0VE5Bca3VOzjGtKeESWWJjcGCwCRf8d/I0Zwc2MBcksepStBX+ifg5Y6E4tl+IqnpxWnAaYj77Uh96N5qfZu/7vkg85+AS8giQP5/L6Yf+qLGEiiD26wQNoMY1qgB7VSho1nStbs9a8TXzd5QTY08dMBOplkJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAOGrSZs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAOGrSZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778884553; x=1810420553;
  h=date:from:to:cc:subject:message-id;
  bh=EXdM0/0iZ+sLZ82srY+xI+vr/RdjoQeVrXB9LaDvFao=;
  b=fAOGrSZsEoC/AaUKI8cM7JgAEEmAmikLJu/rItIl7PrUY8OZ3aK24DdJ
   ydTE6owRwogVrk9tCHrUIUg6IqjwtR3KbIvDuLb/bHeyXoW+vsYuimR6i
   BHPRvknOG/+wc5X/BpD+AT9DXVwJFov97qNDbC5CEo3S9Ja57k9fGR//y
   hnqrXNBqQuHXRL+mbjcDdZLzaEs5uTNnvbDFrgBR3FCwu+bIOF/sRJeld
   e9PLfPon7AW8nkXlqzxyheKjxASYAk1rAlC99mzyiYmQ7UhVSqpyF7DiA
   4JoLsxXzqr1Q8O71YYzrh38Q2CGhwEL8eeo4KR+Vwa3Skb7x/W/fEn33L
   w==;
X-CSE-ConnectionGUID: n8PuGotWTeGJ64/rOcSOjQ==
X-CSE-MsgGUID: BJK+DewCQ+aOu+D9/wWU3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="91304069"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="91304069"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 15:35:53 -0700
X-CSE-ConnectionGUID: KPH9lnjlQuyssKtInnC3Dg==
X-CSE-MsgGUID: OIjhNH32T0eRCbDIf7nmzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="238935212"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2026 15:35:52 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO18H-000000000BH-1LjB;
	Fri, 15 May 2026 22:35:49 +0000
Date: Sat, 16 May 2026 06:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 0/1]
 drivers/android/binder.c:7476:6: warning: no previous prototype for
 'binder_remove_trace_events'
Message-ID: <202605160645.G6We0dGT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   f815f5cffc922b8894200a0522dcb04211c469ec
commit: 43c26111cafa87d81570c63d96c497e13ec883da [0/1] ANDROID: binder: unload C Binder trace events
config: x86_64-randconfig-016-20260516 (https://download.01.org/0day-ci/archive/20260516/202605160645.G6We0dGT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160645.G6We0dGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160645.G6We0dGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder.c:7476:6: warning: no previous prototype for 'binder_remove_trace_events' [-Wmissing-prototypes]
    7476 | void binder_remove_trace_events(struct module *module)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder.c:7502:5: warning: no previous prototype for 'unload_binder' [-Wmissing-prototypes]
    7502 | int unload_binder(void)
         |     ^~~~~~~~~~~~~


vim +/binder_remove_trace_events +7476 drivers/android/binder.c

  7475	
> 7476	void binder_remove_trace_events(struct module *module)
  7477	{
  7478		struct trace_event_call *call, *tmp;
  7479		const char *name;
  7480	
  7481		mutex_lock(&event_mutex);
  7482		mutex_lock(&trace_types_lock);
  7483		down_write(&trace_event_sem);
  7484		list_for_each_entry_safe(call, tmp, &ftrace_events, list) {
  7485			name = trace_event_name(call);
  7486			if (!name || strncmp(name, "binder_", 7))
  7487				continue;
  7488			if (call->module != module)
  7489				continue;
  7490			remove_event_from_tracers(call);
  7491			list_del_init(&call->list);
  7492		}
  7493		up_write(&trace_event_sem);
  7494		mutex_unlock(&trace_types_lock);
  7495		mutex_unlock(&event_mutex);
  7496	}
  7497	EXPORT_SYMBOL_GPL(binder_remove_trace_events);
  7498	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
