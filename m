Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1459F1494CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737392607; cv=none; b=krbaNEjmeuKnhTV7Pv6ClpYY4vR+WOmqVyIhc4tBOFnSqNSo58x4CeJcJlHbebvdPBXu25I7L+33Ob8hROyRfQUjEWaNm3Ho4flrJaCwCzz1aDLEPzXIhJOoqPElYFwvGth4xtPyw7aZrR2LV9yueDgWf70jZXB34rTam4AT/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737392607; c=relaxed/simple;
	bh=qpTIlKKRvYaq4W7TnHD6LRBbrE1Mcn1Z3Ehp1Z9PS8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqO/tnhdgMNUJw3SpV1K8EFaHNFvDXahOVV+KCHp6NmPaA9g9c1jkZ2g0Up4gqIkFlbB/hY6k0vfqf6FBfQr0sxhGDPSiJ3RoooMldVjxpwQQ1/LCsTRhpOXnCfZ6SGWCUCMsUSe8f1AfIJp45pe0zKs6aJ/fnuVO2rsdKo6aBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrkrSAGD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrkrSAGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737392605; x=1768928605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpTIlKKRvYaq4W7TnHD6LRBbrE1Mcn1Z3Ehp1Z9PS8I=;
  b=TrkrSAGDMEDwuE8nK4mukRquDXH0wos5VTF0NT4hbL0ymDyuExNrEK58
   +wvL02mOVTY3TdrokQpu0HegipjbiAo9whevYHYJFCxamXxRP+yaegwvx
   1mDghtlXi0DSYfZ7AvL10pnD/8H8EiTUphPbY81bn+545tXPjggax7ic9
   N0MFi9CmjXTmQpVpDNC4U/sqbTgjQFWqFdXo+4BvLyt0hVDWnuhjIRkv3
   FWQCTE6otR/cJfOpt/P+MjzxjQZxlCavay/aZZZh9F+wCYo2oblzf5rhU
   1njjSAFL+stDqOJX0tKKVMafAgWCZ70cZwLOTNOogiCcN97cvuqa1TODv
   Q==;
X-CSE-ConnectionGUID: OCOx/3z+TfeyR3fr/uD3cQ==
X-CSE-MsgGUID: SxjPELNAQgu7P4h4+9g/wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="49193145"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="49193145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 09:03:24 -0800
X-CSE-ConnectionGUID: QhyzIiVrQEWHX97HA7lfeQ==
X-CSE-MsgGUID: MjEa62TbSxarxNHVtEtCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129841343"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2025 09:03:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZvBJ-000WoB-1n;
	Mon, 20 Jan 2025 17:03:21 +0000
Date: Tue, 21 Jan 2025 01:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9182/10024] kernel/trace/trace_events.c:860:5:
 sparse: sparse: undefined preprocessor identifier 'CONFIG_MODULES'
Message-ID: <202501210013.31zPhsdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: b355247df104ef6644288884afd2c08b7bf49897 [9182/10024] tracing: Cache ":mod:" events for modules not loaded yet
config: mips-randconfig-r131-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210013.31zPhsdu-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce: (https://download.01.org/0day-ci/archive/20250121/202501210013.31zPhsdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210013.31zPhsdu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events.c:860:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_MODULES'
   kernel/trace/trace_events.c:1261:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events.c:1261:31: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events.c:1261:31: sparse:     got struct event_filter [noderef] __rcu *filter

vim +/CONFIG_MODULES +860 kernel/trace/trace_events.c

   859	
 > 860	#if CONFIG_MODULES
   861	struct event_mod_load {
   862		struct list_head	list;
   863		char			*module;
   864		char			*match;
   865		char			*system;
   866		char			*event;
   867	};
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
