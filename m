Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F172EC0B5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943290; cv=none; b=D5aa1+bH07l7iP4IDZTajn3+yQF8IGXweu7mOmHN31DJRbuozEXyGu1jbAwBiYRBM/L9NHK+ZYTwKdFmqpupWVUAOsK2LGYWATxJ2hoZJziR1Rr2cFvcuZnwKU9p6bg5aOUH9uOPHqesuhslrSfq94fuWx0ZKnVZfcJDI5y9dqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943290; c=relaxed/simple;
	bh=9hXAWUCDiy3B2LJ9syv2caaO47jqqQcir/wJS6/yaPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GnFm3JeO5MC/+aoVRJdp+AIMaUUMpP0aPG45x1buu4dgN4jKl5623VogjLNhdRIMSIHHBCqgtGfKhIyw5kfy2onue3uoweIcEYLHS4+Ofcs4+xkb0uCklpkFhntYloTJ+Cp4qdCLD59ESUvIdbEXBSbYAgNW5bpBL9o44Nek2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRRQAI38; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRRQAI38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767943286; x=1799479286;
  h=date:from:to:cc:subject:message-id;
  bh=9hXAWUCDiy3B2LJ9syv2caaO47jqqQcir/wJS6/yaPw=;
  b=VRRQAI38FmI13oltRwiYI742qkM/eZ5T3ygG+oW7KVPV8AzAnrTNV9OU
   8Zj90xAhzD28B/6X2WAc6yuVsMSS4jttzwSh8CX8i5NIl3g0ZfvyP1xhC
   itDeA3tB6Uw6dZsp0jFlYupSS7p/1yugphxQnwgw/28SsmQybbDTnPNdg
   8B8Xb/Ezwv6M3Tp6C0FWyN8VrpiKI+IbcXcqmxw6oeF5uSR2anTIZDhR+
   C/kBr7MgUrufO8LU2zIoKDCybTMm+Ia/QpaQBNOyQNxLmwKdxOoTqjm/P
   3B8BDKAJenrVPACRuajNbPc7d9X/mgOTHTVtz+tY+SkmuHlGv7v4H8+JH
   g==;
X-CSE-ConnectionGUID: TYR2BJpJSAqO8KqqzVfc4A==
X-CSE-MsgGUID: suVPhpTYQtSBtIYNIjFW1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80775149"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="80775149"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 23:21:25 -0800
X-CSE-ConnectionGUID: oH7hldslQJ+oPBs1rz/ctQ==
X-CSE-MsgGUID: IJHuXqHjTeuXmulk2qhK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203474778"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Jan 2026 23:21:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve6oD-000000005bU-28fT;
	Fri, 09 Jan 2026 07:21:21 +0000
Date: Fri, 09 Jan 2026 15:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 14/14]
 drivers/clk/microchip/clk-mpfs.c:505:60: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202601091514.YoXqHZfN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   a46794f8dcf65d3aa4c3aec62dd9b1ee84cde255
commit: 2dc192c6a328240368616b0f08864c8e7a35abb6 [14/14] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: parisc-randconfig-r122-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091514.YoXqHZfN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091514.YoXqHZfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091514.YoXqHZfN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/microchip/clk-mpfs.c:505:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct regmap *regmap @@
   drivers/clk/microchip/clk-mpfs.c:505:60: sparse:     expected void [noderef] __iomem *base
   drivers/clk/microchip/clk-mpfs.c:505:60: sparse:     got struct regmap *regmap
--
   kernel/sched/ext.c:948:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:999:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:999:48: sparse:    struct task_struct *
   kernel/sched/ext.c:999:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1140:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1140:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1140:66: sparse:    struct task_struct *
   kernel/sched/ext.c:1343:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1343:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1343:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1467:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1467:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1467:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1514:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1514:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1514:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1563:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1563:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1563:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1607:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1607:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1607:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1608:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1608:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1608:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:1618:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:1618:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:1618:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1619:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1619:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1619:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2148:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2148:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2148:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2297:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2297:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2297:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2353:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2353:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2353:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2394:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2394:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2394:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2448:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2448:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2448:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2556:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2556:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2556:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2617:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2617:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2617:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2636:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2636:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2636:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2758:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2758:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2758:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2837:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2837:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2837:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2890:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2890:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2890:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2918:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2918:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2918:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2931:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2931:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2931:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3061:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3061:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3061:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3077:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3077:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3077:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3145:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3145:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3145:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3174:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3174:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3174:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3187:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3187:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3187:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3236:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3236:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3236:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3255:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3255:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3255:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3273:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3273:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3273:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3289:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3289:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3289:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3306:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3306:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3306:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
>> kernel/sched/ext.c:4188:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4188:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:4188:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:4191:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4191:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4191:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4191:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4191:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4191:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4492:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4535:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4646:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:4723:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4726:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4726:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4726:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4735:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4735:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4735:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5438:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5565:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5893:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
>> kernel/sched/ext.c:6808:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext.c:6982:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:6982:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:6982:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:736:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:756:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1410:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1410:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1410:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1270:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/syscalls.c:1335:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1659:15: sparse: sparse: dereference of noderef expression

vim +505 drivers/clk/microchip/clk-mpfs.c

c6f2dddfa7f957 Conor Dooley 2025-10-29  485  
c6f2dddfa7f957 Conor Dooley 2025-10-29  486  static inline int mpfs_clk_old_format_probe(struct mpfs_clock_data *clk_data,
c6f2dddfa7f957 Conor Dooley 2025-10-29  487  					    struct platform_device *pdev)
c6f2dddfa7f957 Conor Dooley 2025-10-29  488  {
c6f2dddfa7f957 Conor Dooley 2025-10-29  489  	struct device *dev = &pdev->dev;
c6f2dddfa7f957 Conor Dooley 2025-10-29  490  
c6f2dddfa7f957 Conor Dooley 2025-10-29  491  	dev_warn(&pdev->dev, "falling back to old devicetree format");
c6f2dddfa7f957 Conor Dooley 2025-10-29  492  
c6f2dddfa7f957 Conor Dooley 2025-10-29  493  	clk_data->base = devm_platform_ioremap_resource(pdev, 0);
c6f2dddfa7f957 Conor Dooley 2025-10-29  494  	if (IS_ERR(clk_data->base))
c6f2dddfa7f957 Conor Dooley 2025-10-29  495  		return PTR_ERR(clk_data->base);
c6f2dddfa7f957 Conor Dooley 2025-10-29  496  
c6f2dddfa7f957 Conor Dooley 2025-10-29  497  	clk_data->msspll_base = devm_platform_ioremap_resource(pdev, 1);
c6f2dddfa7f957 Conor Dooley 2025-10-29  498  	if (IS_ERR(clk_data->msspll_base))
c6f2dddfa7f957 Conor Dooley 2025-10-29  499  		return PTR_ERR(clk_data->msspll_base);
c6f2dddfa7f957 Conor Dooley 2025-10-29  500  
c6f2dddfa7f957 Conor Dooley 2025-10-29  501  	clk_data->regmap = devm_regmap_init_mmio(dev, clk_data->base, &mpfs_clk_regmap_config);
c6f2dddfa7f957 Conor Dooley 2025-10-29  502  	if (IS_ERR(clk_data->regmap))
c6f2dddfa7f957 Conor Dooley 2025-10-29  503  		return PTR_ERR(clk_data->regmap);
c6f2dddfa7f957 Conor Dooley 2025-10-29  504  
781f60e45bdfe3 Conor Dooley 2025-11-10 @505  	return mpfs_reset_controller_register(dev, clk_data->regmap);
c6f2dddfa7f957 Conor Dooley 2025-10-29  506  }
c6f2dddfa7f957 Conor Dooley 2025-10-29  507  

:::::: The code at line 505 was first introduced by commit
:::::: 781f60e45bdfe351aad692ac0fa89e36f8bf4a36 reset: mpfs: add non-auxiliary bus probing

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
