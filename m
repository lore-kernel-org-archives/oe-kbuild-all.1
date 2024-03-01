Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E8365
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709325209; cv=none; b=po5GThjlWjcbDQk//RScknN8p6P1+lBg/CICqzSo7KqGuGjBeoLqR8yO6KpdOL0jfAAuCt2Or/G2LZ0x9bpSy5XqPr2Us6FoGaaJCEcQFnTP//Al/3mNcZc0f4stfrPVnGtF/Lc9JF35s1Kbpn6qu3jD2Bip9QagLoQU96r3Ly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709325209; c=relaxed/simple;
	bh=Tqx24KMmELGXTQsdlLJbdNJXBR7jNdhNS8zVcu7osy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZd/3q4o84YQvfDtdG9rdSTiaEOTQGh3tAU0fJerZzV4Paoj5XxwGLKNf+6+YVjjOLfFGa2Js4lqPT9Rg8gcj5eHlijmKBSvWLQcbpc3SJAakGE/dH2j2vKfAAlbOxTv/aVr7hnpBORU9rpb/lnJF4/T0OvHAHz0sRtO/dtfwMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfO5tOrX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfO5tOrX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709325208; x=1740861208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tqx24KMmELGXTQsdlLJbdNJXBR7jNdhNS8zVcu7osy4=;
  b=IfO5tOrXSPxjb1Ydz4Hgz3aP8Ui+ChHG6cpRdlQ7vuZqCpy+XqrbOtqq
   8Yp7/sXSUlbtxBZkZv9joutX5B2dnJPj8DDrsLJXDyu+/mSP0SmxXpRdj
   z35qmmfZuc0WWIWiiTdU0Oa9w/T4CXGc34wuIY4dynniOppAD44X/j72D
   R2iH6egaU14ii0daSxXfyuLI7HvaEsR6iLL4piXQ5Q9Wlh3pJXTWLR05I
   1Qn7yKMy7ciS8Ot3Ce/f9v2bB/LTqqsQEjYztUAcS6/LZYE/NUTu0s6wh
   VwWhkTTkCL+5b384xNlFb4Mxs6fdm1j4NXsBbUGoWPxxN7WA27mAtvuYN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4052219"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="4052219"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 12:33:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="12895744"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2024 12:33:24 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg9Z8-000E4x-1V;
	Fri, 01 Mar 2024 20:33:16 +0000
Date: Sat, 2 Mar 2024 04:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 78/98] mm/page-writeback.c:1644:6: warning: no
 previous prototype for 'blkcg_update_bandwidth'
Message-ID: <202403020423.7wOYdBZ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 654899c63919700fc86017419a41419e38d7aed1 [78/98] blkcg: add buffer IO throttle for cgroup v1
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240302/202403020423.7wOYdBZ5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020423.7wOYdBZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020423.7wOYdBZ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page-writeback.c:1644:6: warning: no previous prototype for 'blkcg_update_bandwidth' [-Wmissing-prototypes]
    1644 | void blkcg_update_bandwidth(struct blkcg *blkcg)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/blkcg_update_bandwidth +1644 mm/page-writeback.c

  1643	
> 1644	void blkcg_update_bandwidth(struct blkcg *blkcg)
  1645	{
  1646		unsigned long now = jiffies;
  1647		unsigned long dirtied;
  1648		unsigned long elapsed;
  1649	
  1650		if (!blkcg)
  1651			return;
  1652		if (!spin_trylock(&blkcg->lock))
  1653			return;
  1654	
  1655		elapsed = now - blkcg->bw_time_stamp;
  1656		dirtied = percpu_counter_read(&blkcg->nr_dirtied);
  1657	
  1658		if (elapsed > MAX_PAUSE * 2)
  1659			goto snapshot;
  1660		if (elapsed <= MAX_PAUSE)
  1661			goto unlock;
  1662	
  1663		blkcg_update_dirty_ratelimit(blkcg, dirtied, elapsed);
  1664	snapshot:
  1665		blkcg->dirtied_stamp = dirtied;
  1666		blkcg->bw_time_stamp = now;
  1667	unlock:
  1668		spin_unlock(&blkcg->lock);
  1669	}
  1670	#endif
  1671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
