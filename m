Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9201292F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713534844; cv=none; b=U44y86drl3ngJsbmzj1qsS+z5svW9J+j6HxznXV+bO9YZxzjKFLS40tLWyN3TnC7TVb5frdCvuIQtWtXe4DPZq7wii1uJ/8lmyQu8Mdx8DFlKZL8POSu020odCmHf0aHjCF47Hx/UqDxBXH/2E2/31/1RfNeCW0Odpx3Hhw/iJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713534844; c=relaxed/simple;
	bh=MKc9jcVU5nW/NFQWBKctsxqq+xg6QwzelIzDt9xeDb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtQaaQUheIpk11zD0WXXQpS39sjEBIRLcbn+AofNNl8vBKQVuBKxphUwsXuDI+6TtkZKWpDLkaZPesS8XkGzzWsJ2b+Y+JUJd+RLA42fxQqes5s5qOUVhN2RQ9DCUBTsAlqHcxJ8pqDj5j8GKsJel3mSdomewAYMabNwhMJ0yko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUV5hHp7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUV5hHp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713534841; x=1745070841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKc9jcVU5nW/NFQWBKctsxqq+xg6QwzelIzDt9xeDb0=;
  b=bUV5hHp7wOH7Z+nkLtqUq4A7seOMPAQKsQ5vPS4us9ykJXkEWpW46Mzv
   FQxo46SwSYTOUnrn6bhLE45lKoT7/4gz0jJY2jjZi8bCuw93ZsuZCMFze
   ZeEFJq7f2bfwGXGSQh7VZEqljXnaSTe63ByKxu934K9n0xOzwnwgUUfBl
   YOsj9Up05syp1rdYnLfvVqBt+Ja1QMoXiSHBEuqEtYjgS7iXggHik+89n
   berQrGHdxR28Ukk1+CjXQqXsj9L8s+ULWHmSFFSWxIuWtfnsA1avpEZ2a
   HS8QTiES0uUJKuOpfsQD3dZnh5KojXDjIGTr5siUe3iFcVF0UEvFyYGOH
   w==;
X-CSE-ConnectionGUID: ML1bYxKYQqW/tfTcG181Tw==
X-CSE-MsgGUID: H3WIp+0RSIiWAebvD5FtDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12078760"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12078760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:54:00 -0700
X-CSE-ConnectionGUID: v/34/BKZSPO4IZGw5fBdEQ==
X-CSE-MsgGUID: lQ93kDFMQZCMpJyAKjmpbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23319061"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2024 06:53:59 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxoge-000ABg-19;
	Fri, 19 Apr 2024 13:53:56 +0000
Date: Fri, 19 Apr 2024 21:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Chenchen <dongchenchen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22145/22156] net/ipv4/arp.c:1106:5:
 warning: comparison of distinct pointer types ('typeof (dev->addr_len) *'
 (aka 'unsigned char *') and 'typeof (sizeof (r->arp_ha.sa_data)) *' (aka
 'unsigned long *'))
Message-ID: <202404192145.IFJnkcXo-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240419/202404192145.IFJnkcXo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404192145.IFJnkcXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404192145.IFJnkcXo-lkp@intel.com/

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
