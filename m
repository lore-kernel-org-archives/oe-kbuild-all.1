Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682E4250E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 20:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705524261; cv=none; b=mHY0NS0MGUL0VLU7eeeqHwiExCkISJmkFFKB1ixjwRKefm6X1xMg3Z1QHlAeiO4fS38aTbiyGmvFbbr9DNBLQ8eydHTmZwWPOS9Tc2BaKsZ6iCmfXSLz8+5szUoGpB7e4+PUciVlvGWa0VpmcQRhF/FxPggvDKj9n0ImXDh7TDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705524261; c=relaxed/simple;
	bh=XFNRoqVfu+XzpLxDaLk5DPJvc0/vaY2GYM5SnMm0Mps=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=sR3EKUbvoSZjR3gzQVhFMBkxK1YN9GIop9iYm8DB7hCucG9Loh4x5LYq8iZ3c1tEVQuc8XtAxkY1wyRTCSe5y2aazMzSgkkVM7P58PUZ5vYSXTk9pORQe5HYsW+sKZCI5q0jU2czhaq0vnBeEUm0hv9SsP03obcKWyJ/f62P+DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJWOJZ7y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJWOJZ7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705524259; x=1737060259;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XFNRoqVfu+XzpLxDaLk5DPJvc0/vaY2GYM5SnMm0Mps=;
  b=hJWOJZ7yUew2BIAHtaQwWtm/gGROIvFjeq6AER7PWTIHbR997jUzLRSD
   HXSStZzuV9N3RYrfsDmXq1B+x8mFaDPnvYr7D95JDR0ssW/1tzRvyx3VY
   y7JIt/7pRulEc1BtlngGhiiCORbbLiR3SPcHPwwz5+8EHe6SMn1MHYS5F
   9gpSTgSrD8JM9GdpkgabA/MSK5FLV5/GYpo+IqA2Y9v8ZsK3/tKEJ1gMz
   /52uQDkSab+VLDcs983gOeAVKFP+lvgCgCt5FfhsmRpIttr+tRf7YIkwJ
   IfPJSAtChi3jSJAH8Zr+Ll2Nt2lHAjetgqdkKC1/v6Jh7ZHKnyD/TDPAW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13627546"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="13627546"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 12:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="182893"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jan 2024 12:44:18 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQClj-0002KH-10
	for oe-kbuild-all@lists.linux.dev;
	Wed, 17 Jan 2024 20:44:15 +0000
Date: Thu, 18 Jan 2024 04:43:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 7414/9999]
 security/container/process.c:367:5: warning: no previous prototype for
 'csm_set_contid'
Message-ID: <202401180411.aPUEx6IX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 92dff21f44ad18e109b6e086a29141fe474b3782 [7414/9999] CHROMIUM: security: Container Monitoring LSM
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240118/202401180411.aPUEx6IX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180411.aPUEx6IX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180411.aPUEx6IX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/container/process.c:367:5: warning: no previous prototype for 'csm_set_contid' [-Wmissing-prototypes]
     367 | u64 csm_set_contid(struct task_struct *task)
         |     ^~~~~~~~~~~~~~


vim +/csm_set_contid +367 security/container/process.c

   366	
 > 367	u64 csm_set_contid(struct task_struct *task)
   368	{
   369		u64 cid;
   370	
   371		/* TODO: Report error to the backend */
   372		if (WARN_ON(!task->audit))
   373			return AUDIT_CID_UNSET;
   374	
   375		cid = atomic_inc_return(&contid);
   376		task->audit->contid = cid;
   377		return cid;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
