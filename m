Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857C91AF0AE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743835434; cv=none; b=RtSWhZpHwMtVe6M8vSzWpUjqE8lVFuvv8OBQRVr3JAEVIkuqsOXuoewrhgMo2/+OCDAufMWXXQIfW/Krx49wD0hyFzuIAZSlxrvDeFLh33nEmC57GFbrctuPYGeDwqt1jlcZHuSBHLI6gPKTB6yhfVuOs2O9rJyLBAJs+7Qum6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743835434; c=relaxed/simple;
	bh=t6LjaqKaeET0j0Q+2LQ2moppC7d7WZA52O/Y8vIZTkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQjSNgAFNFJXtBMHLnYMwngAKO0x0HWXwvoDzod0t507vtICq2GN+CABXFxfBFUJCJ55FwNDpRn+EalZduhpERHMpylXXee41MZ7BLu620cagxWe1/2sEKs/+2Br+RHblMB/xroNkQKgHiTA34gJYGYu4FQRT4kcWjP289XrhpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEIUyJDj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEIUyJDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743835433; x=1775371433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6LjaqKaeET0j0Q+2LQ2moppC7d7WZA52O/Y8vIZTkU=;
  b=cEIUyJDjzkFBd4rXhJM2YfPZnlx6UaTOvdHqrVlaf1aVZObGRdHSb+wW
   XKGead/+aLIx9N1ugbW9mItYyL7SgvGerEiSoFjNlQlA1Wb+ML3dhp+uX
   CJm8MTzrpG/b5raBBZGXjVzHqqR7aRcgMxKTdJwfOiiWNUBoMYWQQS5kp
   VnNyDRkuuGh6JgydIb00TeYC5t1qNh8ju8wwgyK5DMMnyDqRInAFgXEXZ
   90Lzfm3zD1HJ3Ioc0kjlZ4p3kojIK6QbY8UZKla8eauhIuwXw5YdOiXU8
   RF2J95i6ZoesMlY7cr/x+4IC4hZRsOWwwIGVCIwfcaoqKUtMVSyKpGD+/
   Q==;
X-CSE-ConnectionGUID: zYvBBLUQQfmm8KZW5L8ZzQ==
X-CSE-MsgGUID: E1TDGboqTTCz9Q47DLxclA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49133825"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="49133825"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 23:43:52 -0700
X-CSE-ConnectionGUID: tLa1dXfgTq+D+1e6U49HbQ==
X-CSE-MsgGUID: 5w1XX8vGTpSG6VB7ksVv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="131638556"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2025 23:43:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0xFs-0001rb-37;
	Sat, 05 Apr 2025 06:43:48 +0000
Date: Sat, 5 Apr 2025 14:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_default_mask 4/4] fs/notify/mark.c:260:54: error: use
 of undeclared identifier 'sb'
Message-ID: <202504051409.afLq1gN2-lkp@intel.com>
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
config: arm-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051409.afLq1gN2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051409.afLq1gN2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051409.afLq1gN2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/notify/mark.c:260:54: error: use of undeclared identifier 'sb'
     260 |                 struct fsnotify_sb_info *sbinfo = fsnotify_sb_info(sb);
         |                                                                    ^
   1 error generated.


vim +/sb +260 fs/notify/mark.c

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
