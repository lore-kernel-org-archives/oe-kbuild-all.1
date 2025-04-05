Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A891AED5C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 05:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743830508; cv=none; b=msstICRlV3ipOMwcpMuabzN0/Fau/180R5sVPhj+S0C6ihdKIKAnguR/Wq8THdiWq4wS25HMd+1li9RFLw2+Z2gAaJLfyEProaGdDMsNvPeYC8vpGYJx0tut39vaCQBKeeCjJrGS7ABg9wAiYl2zcAMAJ7acwBooA4j4c3FATjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743830508; c=relaxed/simple;
	bh=prCmpnVLrSIjmB45RvaZ43s1DrNTGM+V9K/zdhQUOuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N54kbR+Lt7luhn1NUE+59ZMg4ZSafozWc5qv1ngmR5hFOicuWNIBZSW8rAqLS/9RKuUF+KNnq5kOA5huSVDZKNsS8eGAuXcaSWHQr3TLQXs8Y5L0p1AqVxWF3U7Whf2ziFYzS16psKrFx6kexH0JUspeo4XL5gHDmJpcjw0Y+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQKG570o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQKG570o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743830507; x=1775366507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prCmpnVLrSIjmB45RvaZ43s1DrNTGM+V9K/zdhQUOuY=;
  b=MQKG570oionJeQ5XT6ORLm8ScmBAYpqFKoC7PodYkb9eploIht0UTUjy
   xuFEn854a6nujl8XbbpobZabTXE62OT1eK5FZYHCi10FNWlTRfE7cn5t4
   PiLIjErYOpRC1g1Krlhb2yQXgd7mfDgEkt7D4YB4eJD+aQjM8WMia+t/K
   mdUn9vaBB/+TO8TIwI3eVjv9BO+yLMEi5MklilX3xPSWP7+pODFk78q+Z
   YcLlUHVvq3cnAydpGdaQ/320ZxsyB0jb1xWUFTrPkE96eCjlYb3EcZPFw
   RgjZ+8rWRPLH9+iyficZph2SU6EDaEe8v4xZLVMaKFkx/hAd2FVK4HBLw
   A==;
X-CSE-ConnectionGUID: YCo9YT/uTEWiOMQXEYS08w==
X-CSE-MsgGUID: OHd1Jn8ARE2+uZyF1B7YAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="48930293"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="48930293"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 22:21:46 -0700
X-CSE-ConnectionGUID: 3Icge36wS7mO03wQ8ldohA==
X-CSE-MsgGUID: Kw/w1X+NRqGrA5ttucCfag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="128400513"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Apr 2025 22:21:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0vyQ-0001pp-2t;
	Sat, 05 Apr 2025 05:21:42 +0000
Date: Sat, 5 Apr 2025 13:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_default_mask 4/4] fs/notify/mark.c:260:68: error: 'sb'
 undeclared; did you mean 's8'?
Message-ID: <202504051329.NV0J7wxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_default_mask
head:   cef314fc4b9e924b574214917dacc41af5f576f8
commit: cef314fc4b9e924b574214917dacc41af5f576f8 [4/4] fsnotify: implement sb default_mask
config: arc-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051329.NV0J7wxN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051329.NV0J7wxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051329.NV0J7wxN-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/notify/mark.c: In function '__fsnotify_recalc_mask':
>> fs/notify/mark.c:260:68: error: 'sb' undeclared (first use in this function); did you mean 's8'?
     260 |                 struct fsnotify_sb_info *sbinfo = fsnotify_sb_info(sb);
         |                                                                    ^~
         |                                                                    s8
   fs/notify/mark.c:260:68: note: each undeclared identifier is reported only once for each function it appears in


vim +260 fs/notify/mark.c

   239	
   240	static void *__fsnotify_recalc_mask(struct fsnotify_mark_connector *conn)
   241	{
   242		u32 new_mask = 0;
   243		bool want_iref = false;
   244		struct fsnotify_mark *mark;
   245	
   246		assert_spin_locked(&conn->lock);
   247		/* We can get detached connector here when inode is getting unlinked. */
   248		if (!fsnotify_valid_obj_type(conn->type))
   249			return NULL;
   250		hlist_for_each_entry(mark, &conn->list, obj_list) {
   251			if (!(mark->flags & FSNOTIFY_MARK_FLAG_ATTACHED))
   252				continue;
   253			new_mask |= fsnotify_calc_mask(mark);
   254			if (conn->type == FSNOTIFY_OBJ_TYPE_INODE &&
   255			    !(mark->flags & FSNOTIFY_MARK_FLAG_NO_IREF))
   256				want_iref = true;
   257		}
   258	
   259		if (conn->type == FSNOTIFY_OBJ_TYPE_SB) {
 > 260			struct fsnotify_sb_info *sbinfo = fsnotify_sb_info(sb);
   261	
   262			if (sbinfo)
   263				new_mask |= sbinfo->default_mask;
   264		}
   265	
   266		/*
   267		 * We use WRITE_ONCE() to prevent silly compiler optimizations from
   268		 * confusing readers not holding conn->lock with partial updates.
   269		 */
   270		WRITE_ONCE(*fsnotify_conn_mask_p(conn), new_mask);
   271	
   272		return fsnotify_update_iref(conn, want_iref);
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
