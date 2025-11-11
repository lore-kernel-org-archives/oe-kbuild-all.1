Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4935CBC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762904800; cv=none; b=SixCMizUOYJHd+KUi7BfbOUtv96CgoXyqRCdBBFYvzDIrivyfcc65dGpq340F4hvxEpugsVyaHoeEUAQxoEvo4O2ygRGUI8d7QAjgeoGjT9zp8shVjFOOpdMa54MMOSftgms8X5pPelHiA3FvS9UESx6Yzi6Io9piIPkGf4JITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762904800; c=relaxed/simple;
	bh=/aeE3T1zFv34e5DwKB095sC6q9xsJ2ngxIovRpo0sLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kOG8KbKNBJAND0e3CTqTfek4+BIZgKxkhOt+9CQ+oa4sH8609Z5wsM7QCAR8/2rAXJVAU9IpnSkrKRsI4Tovn4zu4Duf8oqSaLM0ER6Pja5/O0JbCzlutp0U8w0vbK2QREcFC+r+E0WYMgF8o2eh8+RqEG/kkBB/h9olsAEF3ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVY3wY4W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVY3wY4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762904798; x=1794440798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/aeE3T1zFv34e5DwKB095sC6q9xsJ2ngxIovRpo0sLo=;
  b=cVY3wY4WxJEqCq2UpVbB84STrPDiCOdUxb1t5nYeZHudASZbhhMqco4N
   Mywliw+/2HeumyJt22vG1R5o/JsJezV2PAztUuf4OjRzlEH24pRzekTRq
   /NtsW0usnL4bg2PwalcPWUKrV7Zk11vP93tIbjQJI1cHXX4a2ZX8i9NkE
   qQyBDJtT0mYNkYYoM2zB42IjHscJs7mH8PRu3ZuyA1XlvQEmSryoxhBXE
   zZz8VMLZXEPhbhAl/ZP/n9X/4AoTTgm4d+SJyvegB6nIttAayM1y2grPJ
   3kkMcPJQvlrFJfq0xYg7stDJ/lL0/4ihvIzAjX+dfnuKqNBMIFisAanEZ
   w==;
X-CSE-ConnectionGUID: V/2HQxkzTqmHbVQjURjhPQ==
X-CSE-MsgGUID: uwqOsFMmSAyST6cmiDKJjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64872556"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="64872556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 15:46:36 -0800
X-CSE-ConnectionGUID: ZCAnfMARSHijpcUMX4Ur0w==
X-CSE-MsgGUID: VaxhGTRLTEiqh2XIK/9jvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="193321150"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2025 15:46:35 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIy4H-0003fn-37;
	Tue, 11 Nov 2025 23:46:33 +0000
Date: Wed, 12 Nov 2025 07:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:asi/next 27/49] include/linux/set_memory.h:77:20: error:
 redefinition of 'direct_map_sensitive'
Message-ID: <202511120744.Ej8ITYYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   3c0474df6f211ae4eebffa6f5538335687dd9e0b
commit: c1f37f806e373cf7de31395a0cb72c0e11a1593a [27/49] mm/asi: bad_page() when ASI mappings are wrong
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251112/202511120744.Ej8ITYYu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120744.Ej8ITYYu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120744.Ej8ITYYu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/filter.h:19,
                    from kernel/extable.c:14:
   include/linux/set_memory.h:73:5: error: redefinition of 'set_direct_map_sensitive'
      73 | int set_direct_map_sensitive(struct page *page, unsigned long nr, bool sensitive)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/set_memory.h:48:19: note: previous definition of 'set_direct_map_sensitive' with type 'int(struct page *, long unsigned int,  bool)' {aka 'int(struct page *, long unsigned int,  _Bool)'}
      48 | static inline int set_direct_map_sensitive(struct page *page,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/set_memory.h:77:20: error: redefinition of 'direct_map_sensitive'
      77 | static inline bool direct_map_sensitive(struct page *page) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~
   include/linux/set_memory.h:54:20: note: previous definition of 'direct_map_sensitive' with type 'bool(struct page *)' {aka '_Bool(struct page *)'}
      54 | static inline bool direct_map_sensitive(struct page *page) { return false; }
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/direct_map_sensitive +77 include/linux/set_memory.h

d253ca0c3865a8 Rick Edgecombe  2019-04-25  69  
6dd7718570d9a8 Brendan Jackman 2025-09-11  70  /* Without ASI, sensitivity ops are a nop regardless of ARCH_HAS_SET_DIRECT_MAP. */
6dd7718570d9a8 Brendan Jackman 2025-09-11  71  #ifndef CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION
6dd7718570d9a8 Brendan Jackman 2025-09-11  72  static inline
6dd7718570d9a8 Brendan Jackman 2025-09-11  73  int set_direct_map_sensitive(struct page *page, unsigned long nr, bool sensitive)
6dd7718570d9a8 Brendan Jackman 2025-09-11  74  {
6dd7718570d9a8 Brendan Jackman 2025-09-11  75  	return 0;
6dd7718570d9a8 Brendan Jackman 2025-09-11  76  }
6dd7718570d9a8 Brendan Jackman 2025-09-11 @77  static inline bool direct_map_sensitive(struct page *page) { return false; }
6dd7718570d9a8 Brendan Jackman 2025-09-11  78  #endif /* !CONFIG_MITIGATION_ADDRESS_SPACE_ISOLATION */
6dd7718570d9a8 Brendan Jackman 2025-09-11  79  

:::::: The code at line 77 was first introduced by commit
:::::: 6dd7718570d9a84ab2563fd3e9d696935dfd904b mm/asi: support changing pageblock sensitivity

:::::: TO: Brendan Jackman <jackmanb@google.com>
:::::: CC: Brendan Jackman <jackmanb@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
