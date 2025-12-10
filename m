Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A153B8D75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765394211; cv=none; b=gQXh022vDNQE8fSmLcbl+F3RcJ9nOmko25WXviXFL2aoNDxDrd70T9GyGUMxuWJFVVegrRB4WQ9ATJlFkek3gAnKsGmb1L+W3a5q4+pJh23nWOBmyELTFO8Sj2TOG1i3zfAtrRqXNQZ4CRe4SXJwH8jop/VJblWyEsd3KsKL4dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765394211; c=relaxed/simple;
	bh=TuM76vJ39YfW2BZV5bIVksK8PVMoaMd2lQTwEK8mW2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npRcd65YUcIh4b0DJf7k6PW/pPPpkxewtoM2v7AIq8uA97yX8Rtfm8ATj9pW0afbFVnhfhDKwoL+c59/kMlEkyU7hoj3HtznYcG6dt4V9rcJ98pZMCv0p+1yixlYLxZGKO5c7ZMOoWEFrYdUwJC54N4vdLDChnyDc5Ij9O8T0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1Yj0ugH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1Yj0ugH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765394210; x=1796930210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TuM76vJ39YfW2BZV5bIVksK8PVMoaMd2lQTwEK8mW2s=;
  b=Y1Yj0ugHq8HBpYgSmk3NHLJpYH7ojdhF6IiZeborKreBA/goC/sYTeq7
   5+1l9KCpFqIRA+7OmnRRveonSfve9vYcU108SzLWBDNoPbi8m3QVPnnTZ
   UNhDJMsEVuflsE541CbOeI+T6y1wC6nK6SlC+5aQcbzs+D0HElAt0uhvu
   82ML6VhcW8nj6HhdG107dy+VfPNMBB4/81Y/B5VViMBfR57mgMo7LQjKz
   LUBvXMCxNc3iqAb4YaEARNt2gdHLhOtM0u4MCVSqwbk67cxOH3POgTIhM
   ipB3Dg6KEVrxKiRQt412iWgSeiXwsM07rsl8NID+9Nua+9H9ByzMrwmCe
   Q==;
X-CSE-ConnectionGUID: I2RTydcJS1OT6RdkWtGUXw==
X-CSE-MsgGUID: 0OHPEW49RwqcSDB/NZC7og==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90019298"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="90019298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 11:16:50 -0800
X-CSE-ConnectionGUID: auTBiNQ/S3GNTMIBKkGNTg==
X-CSE-MsgGUID: AXMpPcdAThmG5FXjWUI0Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="195869839"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Dec 2025 11:16:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPg6-000000003gG-1heR;
	Wed, 10 Dec 2025 19:16:46 +0000
Date: Thu, 11 Dec 2025 03:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] fs/binfmt_misc.c:95: warning:
 Excess function parameter 'misc' description in 'search_binfmt_handler'
Message-ID: <202512110306.NEASEgZ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eed7f8d4a5572c294712b683d6b4890a3b5e1267
commit: 5ee7df8143c1bf81086dda152b05883ccb0b09da [0/1] binfmt_misc: cleanup on filesystem umount
config: i386-randconfig-015-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110306.NEASEgZ6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110306.NEASEgZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110306.NEASEgZ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/binfmt_misc.c:95: warning: Excess function parameter 'misc' description in 'search_binfmt_handler'
   fs/binfmt_misc.c:144: warning: Excess function parameter 'misc' description in 'get_binfmt_handler'
   fs/binfmt_misc.c:681: warning: Excess function parameter 'misc' description in 'remove_binfmt_handler'


vim +95 fs/binfmt_misc.c

bbaecc088245e8 Mike Frysinger    2014-10-13   83  
5ee7df8143c1bf Christian Brauner 2021-10-28   84  /**
5ee7df8143c1bf Christian Brauner 2021-10-28   85   * search_binfmt_handler - search for a binary handler for @bprm
5ee7df8143c1bf Christian Brauner 2021-10-28   86   * @misc: handle to binfmt_misc instance
5ee7df8143c1bf Christian Brauner 2021-10-28   87   * @bprm: binary for which we are looking for a handler
5ee7df8143c1bf Christian Brauner 2021-10-28   88   *
5ee7df8143c1bf Christian Brauner 2021-10-28   89   * Search for a binary type handler for @bprm in the list of registered binary
5ee7df8143c1bf Christian Brauner 2021-10-28   90   * type handlers.
5ee7df8143c1bf Christian Brauner 2021-10-28   91   *
5ee7df8143c1bf Christian Brauner 2021-10-28   92   * Return: binary type list entry on success, NULL on failure
^1da177e4c3f41 Linus Torvalds    2005-04-16   93   */
5ee7df8143c1bf Christian Brauner 2021-10-28   94  static Node *search_binfmt_handler(struct linux_binprm *bprm)
^1da177e4c3f41 Linus Torvalds    2005-04-16  @95  {
^1da177e4c3f41 Linus Torvalds    2005-04-16   96  	char *p = strrchr(bprm->interp, '.');
5ee7df8143c1bf Christian Brauner 2021-10-28   97  	Node *e;
^1da177e4c3f41 Linus Torvalds    2005-04-16   98  
6b899c4e9a049d Mike Frysinger    2014-12-10   99  	/* Walk all the registered handlers. */
5ee7df8143c1bf Christian Brauner 2021-10-28  100  	list_for_each_entry(e, &entries, list) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  101  		char *s;
^1da177e4c3f41 Linus Torvalds    2005-04-16  102  		int j;
^1da177e4c3f41 Linus Torvalds    2005-04-16  103  
6b899c4e9a049d Mike Frysinger    2014-12-10  104  		/* Make sure this one is currently enabled. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  105  		if (!test_bit(Enabled, &e->flags))
^1da177e4c3f41 Linus Torvalds    2005-04-16  106  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16  107  
6b899c4e9a049d Mike Frysinger    2014-12-10  108  		/* Do matching based on extension if applicable. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  109  		if (!test_bit(Magic, &e->flags)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  110  			if (p && !strcmp(e->magic, p + 1))
^1da177e4c3f41 Linus Torvalds    2005-04-16  111  				return e;
^1da177e4c3f41 Linus Torvalds    2005-04-16  112  			continue;
^1da177e4c3f41 Linus Torvalds    2005-04-16  113  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  114  
6b899c4e9a049d Mike Frysinger    2014-12-10  115  		/* Do matching based on magic & mask. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  116  		s = bprm->buf + e->offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  117  		if (e->mask) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  			for (j = 0; j < e->size; j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  119  				if ((*s++ ^ e->magic[j]) & e->mask[j])
^1da177e4c3f41 Linus Torvalds    2005-04-16  120  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  121  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  122  			for (j = 0; j < e->size; j++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  123  				if ((*s++ ^ e->magic[j]))
^1da177e4c3f41 Linus Torvalds    2005-04-16  124  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  125  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  126  		if (j == e->size)
^1da177e4c3f41 Linus Torvalds    2005-04-16  127  			return e;
^1da177e4c3f41 Linus Torvalds    2005-04-16  128  	}
5ee7df8143c1bf Christian Brauner 2021-10-28  129  
^1da177e4c3f41 Linus Torvalds    2005-04-16  130  	return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  131  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  132  

:::::: The code at line 95 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
