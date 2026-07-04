Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCE933B6C2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 02:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783132531; cv=none; b=FZX6khnAmCfzGtrzZkTe53cbL59hxsrYhiAI5iSWYKMYk40bgq6SrrttQEuCda1y3LSyeJ0qL1GpwqIx46jNhbdweAergI414UwgWU1w1A8ezGqbDlq4zmb2XZKVKZuOpowy19TzAsUGt0IABfBwCGMI+w9MwOj/zsnvUDuUF1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783132531; c=relaxed/simple;
	bh=X9Bbd07MX486kBfUb77/gnGosm8+LK5Pt0D383x/ETQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O7Azn9kOTOmVpoouxH84Yle/SsGH6iv47km2kxmyBRVy69+Snig+1FDuxEo1tO+JmWCFeL+BGesVNcgh5kDJTbIP91MsofatOGtpRzbSgwSgB6Jspv7CfA5eCPafLAMydF04uBYuzItH7Fx28bfTEgUtPrOBzR0qEY3fP/8kL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WycyzolS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WycyzolS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783132529; x=1814668529;
  h=date:from:to:cc:subject:message-id;
  bh=X9Bbd07MX486kBfUb77/gnGosm8+LK5Pt0D383x/ETQ=;
  b=WycyzolSoXsq40rc+ZT7/SoX68i0KgMV6kD0Usy6wWuePFwcJl3WeGsW
   5z9tKbltRwDdylPSGlhXRuSYNdp6XMR0PYI+DmnvwVjiV9NQuahNZN7jH
   Sy0qQbzXQ3ZSKo/zbBXhruQ8L2gttiO1Cxzo/uFB6Z3a43t8RuJ/fEMMe
   Rwc860vvwk6Nrkaf9NS5G0o7LB153fRxapwxR76yfz7n034ghX9dLp5pI
   Zufcr1v5VEQhveSU1ZVRCqtwGXFjdJsGZtNeSGzIo+gOclGnAhFgLqyaD
   n09/q492j5rzIqUtRSKG4fbA+z4Fv9v5f/cPdb3C5dlYR2zxb3XL13yM0
   A==;
X-CSE-ConnectionGUID: Q5PhXda8TDq8K2THyyFTXg==
X-CSE-MsgGUID: Sb+M13VbQcShEUH2gmCsAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87550289"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87550289"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:35:29 -0700
X-CSE-ConnectionGUID: glpBG9qvQlGboD0QOnHiCA==
X-CSE-MsgGUID: OKekIMe7RHiOes1WmdbAWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252762846"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Jul 2026 19:35:27 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfqE0-000000001fF-02z9;
	Sat, 04 Jul 2026 02:35:24 +0000
Date: Sat, 04 Jul 2026 04:34:41 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/locking/lockdep.c:727:21: error: 'CONFIG_RUST'
 undeclared; did you mean 'CONFIG_USB'?
Message-ID: <202607040403.yLeH4bDF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-sync-introduce-a-way-to-create-lock-class-from-caller/20260703-220743
head:   090a8fd3c5e7c50a1ebd6fc2ef51e1dbaaa81378
commit: 090a8fd3c5e7c50a1ebd6fc2ef51e1dbaaa81378 lockdep: delegate Rust lock class printing to Rust code
date:   12 hours ago
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260704/202607040403.yLeH4bDF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040403.yLeH4bDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040403.yLeH4bDF-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c: In function '__print_lock_name':
>> kernel/locking/lockdep.c:727:21: error: 'CONFIG_RUST' undeclared (first use in this function); did you mean 'CONFIG_USB'?
     727 |                 if (CONFIG_RUST && class->name == lockdep_rust_name)
         |                     ^~~~~~~~~~~
         |                     CONFIG_USB
   kernel/locking/lockdep.c:727:21: note: each undeclared identifier is reported only once for each function it appears in


vim +727 kernel/locking/lockdep.c

   716	
   717	static void __print_lock_name(struct held_lock *hlock, struct lock_class *class)
   718	{
   719		char str[KSYM_NAME_LEN];
   720		const char *name;
   721	
   722		name = class->name;
   723		if (!name) {
   724			name = __get_key_name(class->key, str);
   725			printk(KERN_CONT "%s", name);
   726		} else {
 > 727			if (CONFIG_RUST && class->name == lockdep_rust_name)
   728				lockdep_print_rust_name((struct lock_class_key *)(
   729					class->key - class->subclass
   730				));
   731			else
   732				printk(KERN_CONT "%s", name);
   733			if (class->name_version > 1)
   734				printk(KERN_CONT "#%d", class->name_version);
   735			if (class->subclass)
   736				printk(KERN_CONT "/%d", class->subclass);
   737			if (hlock && class->print_fn)
   738				class->print_fn(hlock->instance);
   739		}
   740	}
   741	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
