Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204235672
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 02:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735437637; cv=none; b=nEo3YOoiUSGo3gOewVQ/bu9s+Ysn2IaH1DTpdHwEqpZJjJxMyud9qL5Yh8T8K4JrjQx2Hp2smydaPmMTdi6YUBzl4HDgdl9/GT66QqDAA9WpSzVVnILBJujTBsUNQbhpV0+w37MhuGFcIjW1exwcyllxxaMFwMegbsg6M/2wbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735437637; c=relaxed/simple;
	bh=lZlZ0iCKtbfZtHanAEx/Fq3bhM3KFefHnqD1r2TIWa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvvC55S0KCV0mVFPWMicvNOUWBTyQl4SlYGWfT8SZdMKx4eSwXpCQz9Effh7fpik5crhT+imfXKsIzNdFYgLEi+vBj0I2e+d5GA5hmS6z01ptNhP+xjCe/NaHREHb4n5AXMlDDacDTUY89RImVq5eQe7lD8DFwSOpyv7K5cohuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLUDEY1m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLUDEY1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735437636; x=1766973636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZlZ0iCKtbfZtHanAEx/Fq3bhM3KFefHnqD1r2TIWa8=;
  b=VLUDEY1m4Bil6f9mWrNLnAwfNjIpzIhnI71AJesjw0GyFJ90In6mjuoC
   1zCqNXtTEftdtbGAEzCgK1nZXuY2DwQb4to1Lc9LsoH1xvki51w9HGmpW
   0CEd68ZY/VZTDYGghaVz/GQSeQe59YHVF9MI3Wn+pokel7exL8KYDj06t
   zpdcr5smRLxJspQ/eT+xlo0D1PW57uyj21z63v77AaTQ0pMua0ggxTX6I
   zrwHJdFzUBDb+OFqEvL4jPnuCGxR6HzKEiqfpLt30wpp/46PpDyWTkwTK
   ZgOxe/JSiHaIg+j8/xmfYrtG4Rjr7v22eFKx7eC15C4zk4OL9W5B472rp
   Q==;
X-CSE-ConnectionGUID: JAdpLVQ5RyGYyZztjYFXKA==
X-CSE-MsgGUID: T14WoVP7Q4SBxdNfacUI7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47190640"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="47190640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 18:00:33 -0800
X-CSE-ConnectionGUID: up9ojHzhTxOWjgxeefyw8Q==
X-CSE-MsgGUID: cKWC35ldSKinxswazUReBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123748575"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Dec 2024 18:00:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRibV-0004Qw-1z;
	Sun, 29 Dec 2024 02:00:29 +0000
Date: Sun, 29 Dec 2024 09:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/list_lru.c:514:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202412290924.UTP7GH2Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 28e98022b31efdb8f1ba310d938cd9b97ededfe4 mm/list_lru: simplify reparenting and initial allocation
date:   7 weeks ago
config: i386-randconfig-054-20241229 (https://download.01.org/0day-ci/archive/20241229/202412290924.UTP7GH2Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290924.UTP7GH2Z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/list_lru.c:514:3-8: WARNING: NULL check before some freeing functions is not needed.

vim +514 mm/list_lru.c

   470	
   471	int memcg_list_lru_alloc(struct mem_cgroup *memcg, struct list_lru *lru,
   472				 gfp_t gfp)
   473	{
   474		unsigned long flags;
   475		struct list_lru_memcg *mlru;
   476		struct mem_cgroup *pos, *parent;
   477		XA_STATE(xas, &lru->xa, 0);
   478	
   479		if (!list_lru_memcg_aware(lru) || memcg_list_lru_allocated(memcg, lru))
   480			return 0;
   481	
   482		gfp &= GFP_RECLAIM_MASK;
   483		/*
   484		 * Because the list_lru can be reparented to the parent cgroup's
   485		 * list_lru, we should make sure that this cgroup and all its
   486		 * ancestors have allocated list_lru_memcg.
   487		 */
   488		do {
   489			/*
   490			 * Keep finding the farest parent that wasn't populated
   491			 * until found memcg itself.
   492			 */
   493			pos = memcg;
   494			parent = parent_mem_cgroup(pos);
   495			while (!memcg_list_lru_allocated(parent, lru)) {
   496				pos = parent;
   497				parent = parent_mem_cgroup(pos);
   498			}
   499	
   500			mlru = memcg_init_list_lru_one(gfp);
   501			if (!mlru)
   502				return -ENOMEM;
   503			xas_set(&xas, pos->kmemcg_id);
   504			do {
   505				xas_lock_irqsave(&xas, flags);
   506				if (!xas_load(&xas) && !css_is_dying(&pos->css)) {
   507					xas_store(&xas, mlru);
   508					if (!xas_error(&xas))
   509						mlru = NULL;
   510				}
   511				xas_unlock_irqrestore(&xas, flags);
   512			} while (xas_nomem(&xas, gfp));
   513			if (mlru)
 > 514				kfree(mlru);
   515		} while (pos != memcg && !css_is_dying(&pos->css));
   516	
   517		return xas_error(&xas);
   518	}
   519	#else
   520	static inline void memcg_init_list_lru(struct list_lru *lru, bool memcg_aware)
   521	{
   522	}
   523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
