Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B142DE6FC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 05:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751519071; cv=none; b=Q4LkMmglcGjLtdzVV9FbyIhi0Q8Z+y3JnDJeXG1iaYpHJOg2/azMyP/LhD2nktTM/tB9TwafTJLarJFsrIOeUL030CaHJPjRaI6X8XTW0nP6TG0g/Ck6gkslmNIP6Bt/Wn2H+3TaK2whAecIWaT3lHbHO2EXuggBm9KBc+6vfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751519071; c=relaxed/simple;
	bh=hHivDlWGvJNGmRzBn9ahF3KPXKzvK9WGIvLl43NmRTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gH73IQJ7GDIemVE5DGVnzA/5sHmYiMBBikXwUBPNTBH2B6M54yp5ZXzOXc48olqpBQ9aaGAKCpWWHzQEIFRlFzqmetXci/MaiBcm35kdjCyFPKKHKc+sudR/Q9mpInrV5x+F0rgRjqjPWwm140Vx2bygY3Q4CNHsTWY9a//Ebeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmKNZJuq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmKNZJuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751519068; x=1783055068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHivDlWGvJNGmRzBn9ahF3KPXKzvK9WGIvLl43NmRTE=;
  b=DmKNZJuqQ0SBz3O3R9AJBEtnkRUR2uVUMwKJztNQaMSd+Coi8xhCQEsR
   tsMIvQZPNKxFD6iT3aZGCm4ZjhdoH1VcbhYPFCNRIwEnr0/aAMPN+DW5l
   DgYcr8jrJCrLrISoadJqxxNSbJxJE9K8EkVb5crC5JeLiFJCbVB0LPiWt
   2K6nVQYeAuPE8oOXQlke1oPfnL3Hg02w1BtpeJNQhdcAaDMNrIR6i5gr/
   RvDOuEqIDQEt3YZvAquPG6EW8RxBFRKkDOH1eRMfryG3wG5f111JcqGlM
   RC5ba5D4gwxqAXsT2PGliKDYrk19cZ2l2wS0WMSMj4OaBww7bepwR9zyP
   g==;
X-CSE-ConnectionGUID: /N1Ut5bmRRSYvKcyP3KvRw==
X-CSE-MsgGUID: Ita0fsIDR5OuidrBYex6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57506446"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="57506446"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 22:04:28 -0700
X-CSE-ConnectionGUID: qWgMHQd1R3ew+jsJTck+4A==
X-CSE-MsgGUID: f+BnoCGJQcWgiNSUfMMrew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158307669"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jul 2025 22:04:26 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXC7U-0000PF-09;
	Thu, 03 Jul 2025 05:04:24 +0000
Date: Thu, 3 Jul 2025 07:04:04 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Chenchen <dongchenchen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] net/ipv4/arp.c:1106:5:
 warning: comparison of distinct pointer types ('typeof (dev->addr_len) *'
 (aka 'unsigned char *') and 'typeof (sizeof (r->arp_ha.sa_data)) *' (aka
 'unsigned long *'))
Message-ID: <202507030748.cQODcYRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   382711115afc1197da2c288679079946650ef017
commit: 7ad207616673722d5cf52c18d9464e0d3184ffc9 [1605/1605] arp: Prevent overflow in arp_req_get().
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250703/202507030748.cQODcYRb-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030748.cQODcYRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030748.cQODcYRb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/arp.c:1106:5: warning: comparison of distinct pointer types ('typeof (dev->addr_len) *' (aka 'unsigned char *') and 'typeof (sizeof (r->arp_ha.sa_data)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    1106 |                                 min(dev->addr_len, sizeof(r->arp_ha.sa_data)));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:884:19: note: expanded from macro 'min'
     884 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:875:24: note: expanded from macro '__careful_cmp'
     875 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:865:4: note: expanded from macro '__safe_cmp'
     865 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:851:29: note: expanded from macro '__typecheck'
     851 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                            ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   1 warning generated.
   net/ipv4/arp.o: warning: objtool: missing symbol for section .init.text


vim +1106 net/ipv4/arp.c

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
  1105				memcpy(r->arp_ha.sa_data, neigh->ha,
> 1106					min(dev->addr_len, sizeof(r->arp_ha.sa_data)));
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
