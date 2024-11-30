Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E129A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 05:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732943812; cv=none; b=f6TJXuEhGEEmgWWeaAK0VmDRm/FPQ7yM0+tWI8qJ7IcUlzMUUQxuNTKyUbfrpxojNUlyYhmK3ZqfVL2Nyg8XzZM6j/iC9Zmov9APwV5CWNkMX0l5ytpOEKS4s0GTRmRUHriofUMyXhcza6LaZ08Z8MY+XYd9HY1eqLtqqLHr87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732943812; c=relaxed/simple;
	bh=lRu+yUSuXkPZCiBNh2YQ3FFy3DKu8wfiOEjUEBQVpwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkxvSUaX27zajvXrW6PW0yrbmsgvWKqZ1BWD7uTfKdtJv+pOb0F/9Sd5f4W19yZOmkU8+lRr6E6ok5oAHfjkt9yDzsemiRgMbTEpV2SAK3vRRuKzJ97dQzAVy5Ng98NDkBEszYhekwy/F6NXTytDkDhL7+GiXmAxzvBdv+GWVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJj2915C; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJj2915C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732943809; x=1764479809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lRu+yUSuXkPZCiBNh2YQ3FFy3DKu8wfiOEjUEBQVpwQ=;
  b=mJj2915Ck6cSgPrpJkczjLgv4cVdbWjq9DQk/P0QnccEMEMuYMWgJceC
   2x/nkNn0kF6Z3bcGJB5b4WnohKuIPuLNjSffFFvpUAm7hCEBgZ8KWgyEq
   MhGGIxxgrdik11I28Lt2t6yr2qjbJh+X+cwZ6DaySCpxFWiUoOSI9Gd22
   izhGUpUZmmAxwDhPrsqYT8JGBOlSlbDKPF//ViyGz6EIvX/H+BoVSr8ml
   m0MQhKD9HZllVYysKNcoH/TCyyNWIyed3urlphoXVUfE1znLo+zn1VB2q
   CVteaAkxcocCwmwGLPf44YRK/3mRnhf84WCyH+MHOjJXo16qAuA5Skhqj
   A==;
X-CSE-ConnectionGUID: DfD02VQtQZm5/dJPv2GSuw==
X-CSE-MsgGUID: EVSm8/zrRaaRx+ewzJmI0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33219598"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="33219598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 21:16:48 -0800
X-CSE-ConnectionGUID: djA8/ARWQE+aX1G0lswQGg==
X-CSE-MsgGUID: DvnVD0Q7TcGORMcI6td4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="115901646"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Nov 2024 21:16:48 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHFqE-000067-1u;
	Sat, 30 Nov 2024 05:16:34 +0000
Date: Sat, 30 Nov 2024 13:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 162/162] fs/bcachefs/fs.c:433:12:
 warning: 'ptrcmp_fn' defined but not used
Message-ID: <202411301339.1z9poGn4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9409825501d87ecf84b2f59aed749647d86b72f2
commit: 9409825501d87ecf84b2f59aed749647d86b72f2 [162/162] bcachefs: Add lockdep support for two_state_shared_lock
config: arm-randconfig-001-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301339.1z9poGn4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301339.1z9poGn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301339.1z9poGn4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fs.c:433:12: warning: 'ptrcmp_fn' defined but not used [-Wunused-function]
     433 | static int ptrcmp_fn(const struct lockdep_map *l,
         |            ^~~~~~~~~


vim +/ptrcmp_fn +433 fs/bcachefs/fs.c

   432	
 > 433	static int ptrcmp_fn(const struct lockdep_map *l,
   434			     const struct lockdep_map *r)
   435	{
   436		return cmp_int(l, r);
   437	}
   438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
