Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B872D3EDF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618048; cv=none; b=MFJ7HjWHx0PQ2BIo9SD0h+1p2d78q00x4ldbpoB3qJIaeAhMYxVKKfwVuyYtGgyUD3i3ojvNF9ECJm80OPbBXqM9JsuXPKzkYEftgpYQETvqwRZw7zQ6/Z3GzQnkVa2oOAnG67TJFihbGjZUlFFgzkbawQmToIZRTA/JtzDGttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618048; c=relaxed/simple;
	bh=Dh8kwWwcq5RJsGllQi6Y16p/U7st+u3RTBXPt5hzivY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEG0vhbc+YgfK+NLQaTTA/9A3vZoPiwy+CS1LtHtAG4wiuewR2LDvGHQAHVe8o+YagHWq1gePfMqx2R9BaOxjDCmnV85TAmqe0eT+PumarNH6DdXliTWr/EZzXHdPhsGqH/ByjewrctDwi2vBn09CkuMdbR9Du5T3D5pAU4Nz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMGvxriY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMGvxriY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765618047; x=1797154047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dh8kwWwcq5RJsGllQi6Y16p/U7st+u3RTBXPt5hzivY=;
  b=cMGvxriYNL8Zvw2NdpucBj4ldAgKBa7etx4TjE8922URGDuQZZCFQ6RD
   WGvdp23vpZ6ykrjEG1wFqsHpNCMAa+ZHyijQ5L5K1ilTpsKfIaDQid7or
   4HRGkmT2cFuXfNgfxrZo4nKXKti0b1JPSpPIfBx1BNp8fvZu7plgAo+J8
   83QcToe6I+SkhOMnssLKZ7EtKg+Rh1L9AHIEvyKl1gBjO37PgfMrqGpKr
   l6O3V80egYaDZb8bMT+wcKnB2xuvy4dNcx7Ba9EWu1fjmdTvm6tVSoH5K
   aFa4LrFORUzzZxgjoEBGEZqm9VjMP1sJCZrDRm6+to4W+U0HpUWCzuau2
   Q==;
X-CSE-ConnectionGUID: S95ru2jeS+m4j6gP6awRrw==
X-CSE-MsgGUID: 5zpLrBZBTKixzZPi8gSz5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78245706"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78245706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:27:27 -0800
X-CSE-ConnectionGUID: S0U7ojPiQo+3KbGZFOVVlg==
X-CSE-MsgGUID: QHrRGw4hQQ6XfziBPB9w4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="220667882"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 01:27:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULuN-000000007QD-0LGh;
	Sat, 13 Dec 2025 09:27:23 +0000
Date: Sat, 13 Dec 2025 17:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Chenchen <dongchenchen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] net/ipv4/arp.c:1106:5:
 warning: comparison of distinct pointer types ('typeof (dev->addr_len) *'
 (aka 'unsigned char *') and 'typeof (sizeof (r->arp_ha.sa_data)) *' (aka
 'unsigned long *'))
Message-ID: <202512131710.Bn5roOQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kuniyuki,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 7ad207616673722d5cf52c18d9464e0d3184ffc9 [1941/1941] arp: Prevent overflow in arp_req_get().
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131710.Bn5roOQf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131710.Bn5roOQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131710.Bn5roOQf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/arp.c:116:
   In file included from include/net/dst_metadata.h:6:
   In file included from include/net/ip_tunnels.h:19:
   In file included from include/net/dst_cache.h:8:
   include/net/ip6_fib.h:228:10: warning: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     228 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:107:3: note: expanded from macro 'time_after'
     107 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
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
   2 warnings generated.


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
