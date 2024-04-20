Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E020238C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 00:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713572719; cv=none; b=faNc9FzWMdR3IkxhW8fXsyofhylYg90KdzfQ/obfVOQcfaAMaiB5i7zKzkuuUILK5lBAO7a6s+QfxbbtrpVApueBl/QRhzRrUXbSjeNyjPr/Hd0qbYjhG1xTFQKhhAH7jleidaE6HaslqS6LH/Ne8mA3e/3HIAUvCRwDtLgKQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713572719; c=relaxed/simple;
	bh=ntWw2fsZGaO6wbZd/+b0SsLGEb/0rlhcOksFgaCqoe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JezbRXz4J3BMD9vnmvPJwF89nml8VPUbovpYrVgAyyK+N+KEUc2C600G8G4DRYG777Ui5OhuEBTV9rv/Q8ERYKvuEMGAOaZu+cE5H1wpVtgX13cIAu5uwAopqVtBReJazDjqY4bW6dsTq1rBEycJ/STajSbeA5asKOP040vGUa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBVxBU58; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBVxBU58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713572717; x=1745108717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntWw2fsZGaO6wbZd/+b0SsLGEb/0rlhcOksFgaCqoe4=;
  b=OBVxBU58nTxGqNFMjwvPHJoCwi0449+9QzJ1d5WnLNoea1vpkhQbo6QB
   q7ybD/X/B8+VaGJFJ8/+llg91mX19ONHPJeTqLDYuzI+9fkUZwmvMqjB6
   vrUAJ5OBgK0PSuhHQ2h879PlDHkdUgiqbb1W3r/gVVvnH80sZzCmlPhIZ
   d/ROfEH1m7LYuU+f95vy8b36mRnKW+vrDp94mTeNDqH/AMi/axceigA3k
   h8GVe/lTP+5M6mNRWME2M14Un09UfNXe8gc8HyMmbmMKsZ4IC8sjkAkDw
   y7OXVQzOWD48IMjQ41xPTtsnYwQ9oQBpSebj5Z0OLkmcWNgZNW5jvYJc+
   A==;
X-CSE-ConnectionGUID: t0zgpaFDSa236vJP9+gzFQ==
X-CSE-MsgGUID: 5DJwlyeJRXOaAXdDNXc2nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9113855"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9113855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 17:25:16 -0700
X-CSE-ConnectionGUID: ktDw0vvTQ26xsl0hMCwt3A==
X-CSE-MsgGUID: tGaiBeKMTi6BKsrcyS86rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="23544411"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2024 17:25:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxyXY-000AaY-2O;
	Sat, 20 Apr 2024 00:25:12 +0000
Date: Sat, 20 Apr 2024 08:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Chenchen <dongchenchen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22145/22156] net/ipv4/arp.c:1105:25:
 sparse: sparse: incompatible types in comparison expression (different type
 sizes):
Message-ID: <202404200856.zpZdiUY9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e9eac2f8ec0d6e36fe87c658851c3c77f990b098
commit: 7ad207616673722d5cf52c18d9464e0d3184ffc9 [22145/22156] arp: Prevent overflow in arp_req_get().
config: x86_64-randconfig-121-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200856.zpZdiUY9-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200856.zpZdiUY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200856.zpZdiUY9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/arp.c:1105:25: sparse: sparse: incompatible types in comparison expression (different type sizes):
   net/ipv4/arp.c:1105:25: sparse:    unsigned char *
   net/ipv4/arp.c:1105:25: sparse:    unsigned long *
   In file included from include/linux/list.h:9,
                    from include/linux/module.h:10,
                    from net/ipv4/arp.c:78:
   net/ipv4/arp.c: In function 'arp_req_get':
   include/linux/kernel.h:851:43: warning: comparison of distinct pointer types lacks a cast
     851 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                           ^~
   include/linux/kernel.h:865:18: note: in expansion of macro '__typecheck'
     865 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/kernel.h:875:31: note: in expansion of macro '__safe_cmp'
     875 |         __builtin_choose_expr(__safe_cmp(x, y), 16-      |                               ^~~~~~~~~~
   include/linux/kernel.h:884:25: note: in expansion of macro '__careful_cmp'
     884 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   net/ipv4/arp.c:1106:33: note: in expansion of macro 'min'
    1106 |                                 min(dev->addr_len, sizeof(r->arp_ha.sa_data)));
         |                                 ^~~

vim +1105 net/ipv4/arp.c

  1090	
  1091	/*
  1092	 *	Get an ARP cache entry.
  1093	 */
  1094	
  1095	static int arp_req_get(struct arpreq *r, struct net_device *dev)
  1096	{
  1097		__be32 ip = ((struct sockaddr_in *) &r->arp_pa)->sin_addr.s_addr;
  1098		struct neighbour *neigh;
  1099		int err = -ENXIO;
  1100	
  1101		neigh = neigh_lookup(&arp_tbl, &ip, dev);
  1102		if (neigh) {
  1103			if (!(neigh->nud_state & NUD_NOARP)) {
  1104				read_lock_bh(&neigh->lock);
> 1105				memcpy(r->arp_ha.sa_data, neigh->ha,
  1106					min(dev->addr_len, sizeof(r->arp_ha.sa_data)));
  1107				r->arp_flags = arp_state_to_flags(neigh);
  1108				read_unlock_bh(&neigh->lock);
  1109				r->arp_ha.sa_family = dev->type;
  1110				strlcpy(r->arp_dev, dev->name, sizeof(r->arp_dev));
  1111				err = 0;
  1112			}
  1113			neigh_release(neigh);
  1114		}
  1115		return err;
  1116	}
  1117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
