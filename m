Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1BE24205
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712300495; cv=none; b=PMtxYiGLGB/M10kJcfy+FzQchLhs0dvbe6Zj2H91rLXHXZrE80DQOmhfqJGByZnl9w2d3w3P8gUMp+eCyo9wC+auOC5lrSE1q4ZmSttlFOw0OQZZ7sMBDFc8Na1PckM70cf5HPEblp9FwnGXDhL6ekE+kCF/h3gltFm88OZxEKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712300495; c=relaxed/simple;
	bh=JTF++bQ2ccnEZcDcRDqdEZTQNd5vaEks6s35aMbtKMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jh1GD9vklohLjHkQ3sUm6rO1Oae+jiafUuLuuNfGhyp+5Qau3FxTiwP2ZCL8r+d6L/gyArwvQB+kp3fiaCOLiO3PHGVOnmKgx5pDF1vlOFKPrYScumInQt+FUd5wZM7aMfUwRcXAUJShtSTwwK/dOag8EpxiDK1tIWM1pWt4nFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNISG6Jr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNISG6Jr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712300494; x=1743836494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTF++bQ2ccnEZcDcRDqdEZTQNd5vaEks6s35aMbtKMM=;
  b=DNISG6Jr/wnyHacuwXtK29ICSmzc2XQ/140oib/Nqie+Ai3GGMymyJ/Z
   u9sSlCjVjAQ9AchsAIR3Xs+XK9sNNHPa86NLuWMNl9Cn5pZaqNEaHyxcM
   B6MAts+dOC2YrUpPmvKEqFbIyFnChwXPnKiSfCRP7gR4t1MWWbtJgaJdC
   6XJAawo+IViLGVXssyi9Z+ssOtbZ0RlhtjdxLkOExcs6ldtUR0XsMvdsQ
   AkdWVRMpwH8YVpdsf4u14sRkVySrbVuocfGi+Xl03iV+ne1CrxdzaDtNV
   sm0H6u1g/c4uUWD7bbtP9ELhpartPjb6kdJV8NI7nyH4b1IHOyIYRKPWn
   w==;
X-CSE-ConnectionGUID: JtFaDEq6SqWY3LCcV2EVqA==
X-CSE-MsgGUID: NiJSUcYiQpaauaYPFCU+Lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7458998"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7458998"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 00:01:34 -0700
X-CSE-ConnectionGUID: gK0OmGB+QTCOOix/PA6BzA==
X-CSE-MsgGUID: 7lb1GC1fT1K8l0Z+No2nxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19515576"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Apr 2024 00:01:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsdZq-0001zu-0E;
	Fri, 05 Apr 2024 07:01:30 +0000
Date: Fri, 5 Apr 2024 15:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 126/162] fs/xfs/libxfs/xfs_fs.h:901:16:
 warning: cast to pointer from integer of different size
Message-ID: <202404051404.a5N42gcG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   85240c8c44aab15d3c6506be48f62eb9b7807f29
commit: bfb94a70e7a4ca92d7e895de9c485f01a5a8cd0b [126/162] xfs: Add parent pointer ioctls
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240405/202404051404.a5N42gcG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051404.a5N42gcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051404.a5N42gcG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_linux.h:74,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_trace.c:6:
   fs/xfs/libxfs/xfs_fs.h: In function 'xfs_getparents_first_rec':
>> fs/xfs/libxfs/xfs_fs.h:901:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     901 |         return (struct xfs_getparents_rec *)gp->gp_buffer;
         |                ^
--
   In file included from fs/xfs/xfs_linux.h:74,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_handle.c:7:
   fs/xfs/libxfs/xfs_fs.h: In function 'xfs_getparents_first_rec':
>> fs/xfs/libxfs/xfs_fs.h:901:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     901 |         return (struct xfs_getparents_rec *)gp->gp_buffer;
         |                ^
   fs/xfs/xfs_handle.c: In function 'xfs_getparents':
>> fs/xfs/xfs_handle.c:804:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     804 |         if (copy_to_user((void *)gpx->gph.gph_request.gp_buffer,
         |                          ^
--
   In file included from fs/xfs/xfs_linux.h:74,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_iwalk.c:6:
   fs/xfs/libxfs/xfs_fs.h: In function 'xfs_getparents_first_rec':
>> fs/xfs/libxfs/xfs_fs.h:901:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     901 |         return (struct xfs_getparents_rec *)gp->gp_buffer;
         |                ^
   fs/xfs/xfs_iwalk.c: In function 'xfs_iwalk_run_callbacks':
   fs/xfs/xfs_iwalk.c:354:42: warning: variable 'irec' set but not used [-Wunused-but-set-variable]
     354 |         struct xfs_inobt_rec_incore     *irec;
         |                                          ^~~~
--
   In file included from fs/xfs/xfs_linux.h:74,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_trans.c:7:
   fs/xfs/libxfs/xfs_fs.h: In function 'xfs_getparents_first_rec':
>> fs/xfs/libxfs/xfs_fs.h:901:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     901 |         return (struct xfs_getparents_rec *)gp->gp_buffer;
         |                ^
   fs/xfs/xfs_trans.c: In function 'xfs_trans_unreserve_and_mod_sb':
   fs/xfs/xfs_trans.c:601:33: warning: variable 'error' set but not used [-Wunused-but-set-variable]
     601 |         int                     error;
         |                                 ^~~~~


vim +901 fs/xfs/libxfs/xfs_fs.h

   897	
   898	static inline struct xfs_getparents_rec *
   899	xfs_getparents_first_rec(struct xfs_getparents *gp)
   900	{
 > 901		return (struct xfs_getparents_rec *)gp->gp_buffer;
   902	}
   903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
