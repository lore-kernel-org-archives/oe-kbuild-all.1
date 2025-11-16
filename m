Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501B21507F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763291024; cv=none; b=iCLyzb7irQ0CyXJhkNQmXJYekuwlaFNFLTuUZBD6KPO83zo+L9Ph2JNzPSupvaMLdPCjzXEtaUkEp7qptVkMS1sWwJtcEABBNEak65UDoCLFIg9/tTdMvMe9h9ggpnV3r7I7weUsISGbFnqu/dyQg3AeeLVzIsI2tncQBr4Mygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763291024; c=relaxed/simple;
	bh=X7Cf+Vc8wdtLDBO2z17vgwyPuhtb+xXgmZglnHUfSm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvYa6W2GiydvIIsJqyr+kaAycwE4tFA4VpkZhjHgFBmKsGwV17BYh6Vzji8tY6A5Qwz1FBR8uu+0e7yzRXbajmeJM24ezVkh3tv00lYWqoH9ciJTGF5RPMaxJaRXveyDE3RD4SCP1LEeITkyFW2y538fWd0PLuEJImGwE/eGbCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD10MzYZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD10MzYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763291023; x=1794827023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X7Cf+Vc8wdtLDBO2z17vgwyPuhtb+xXgmZglnHUfSm4=;
  b=PD10MzYZujGtWVg8F3KW2e8jGewISTrhGQBqG9to3+OXNVJogbS8PBnQ
   UGksolwLvhu0UlEVEtyTFJDq8dVE/ur57EAyL1d8CwkkCp6yCOl+fnIRY
   NF/Mc4EnPxG3lT1iPtJn9a10mzbLX564czlbHBb249oqNq/vOQ4pqW6Cw
   psH7Q9NyTn4hWAZgc8NLpKTUiddDu6NIeNTAaHsYIBovRU5LQ7bhmZdIE
   5pL5X3aiM7i7i2xMnJwFc5P291c1aGenmUrkr0+ZCC1w2kJAOvznIonax
   9cyIF0WAvq3B6imniQW41jE1YvI2DUrKVhy2iDErPCXh0/bpzir7O4fJV
   g==;
X-CSE-ConnectionGUID: zVZ9fcY+S8uI588zO3j69Q==
X-CSE-MsgGUID: GRFWkqvsQeqVKf41I3OJdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65197536"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="65197536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 03:03:42 -0800
X-CSE-ConnectionGUID: 4n3e7TpDQuml7dZ/93gCLQ==
X-CSE-MsgGUID: RSQ1gzBGTcCv0bfFxAZoog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="213611250"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2025 03:03:41 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKaXi-0008iH-2W;
	Sun, 16 Nov 2025 11:03:38 +0000
Date: Sun, 16 Nov 2025 19:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific
 Purpose Memory Nodes
Message-ID: <202511161802.4Z4A9qsx-lkp@intel.com>
References: <20251112192936.2574429-5-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112192936.2574429-5-gourry@gourry.net>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 24172e0d79900908cf5ebf366600616d29c9b417]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-constify-oom_control-scan_control-and-alloc_context-nodemask/20251113-033247
base:   24172e0d79900908cf5ebf366600616d29c9b417
patch link:    https://lore.kernel.org/r/20251112192936.2574429-5-gourry%40gourry.net
patch subject: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific Purpose Memory Nodes
config: xtensa-randconfig-002-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161802.4Z4A9qsx-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161802.4Z4A9qsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161802.4Z4A9qsx-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: xtensa-linux-ld: DWARF error: could not find abbrev number 12154
   mm/vmscan.o: in function `mt_set_node_type':
>> vmscan.c:(.text+0x1cd34): multiple definition of `mt_set_node_type'; xtensa-linux-ld: DWARF error: could not find abbrev number 80
   kernel/sched/fair.o:fair.c:(.text+0xbb4c): first defined here
   xtensa-linux-ld: xtensa-linux-ld: DWARF error: could not find abbrev number 682
   mm/memory.o: in function `mt_set_node_type':
   memory.c:(.text+0xab88): multiple definition of `mt_set_node_type'; kernel/sched/fair.o:fair.c:(.text+0xbb4c): first defined here
   xtensa-linux-ld: xtensa-linux-ld: DWARF error: could not find abbrev number 96
   mm/mprotect.o: in function `mt_set_node_type':
   mprotect.c:(.text+0x48bc): multiple definition of `mt_set_node_type'; kernel/sched/fair.o:fair.c:(.text+0xbb4c): first defined here
   xtensa-linux-ld: xtensa-linux-ld: DWARF error: could not find abbrev number 82
   mm/migrate.o: in function `mt_set_node_type':
   migrate.c:(.text+0x55dc): multiple definition of `mt_set_node_type'; kernel/sched/fair.o:fair.c:(.text+0xbb4c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
