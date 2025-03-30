Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271A38F80
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743325872; cv=none; b=jalp2SbsaLS2JGohEnNL2yQSFA9Zs3PeUsx7j/2+72KbpxmmNYBjAdyF1cT884VFnzN2LAvbWijLnnaQoiEjWFTXT6vPmrqVR3yauq9LuViJT/6AE2YxQmmwfji+oQ5pvI+Q8KUOGwDU3pzC7sRWTfqv2Nt5AI4XI9dCSErlen4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743325872; c=relaxed/simple;
	bh=DzKBHbami3HdjBjvCA/XtHrKLfo9HYceVBCag26f+Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJp34VkX9XNV7eA6x0fS8YWTlYqEK+cNgxdJq5TGa7L6NwlY3keiTwRz883MLV6V1xMSiK8PTH02b1x62tXUP1fW9TreFdYuIPkYKdFVguLZnvcYTK9bZWQUcHpAb6R1w5hG560Ge/DxjtaRK7Eqrq1QPX7l9cRjGO/puT9KIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFYWX4iY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFYWX4iY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743325871; x=1774861871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DzKBHbami3HdjBjvCA/XtHrKLfo9HYceVBCag26f+Aw=;
  b=MFYWX4iYwwJZqBwgxWUcdglqfQZohcSvmOJsOjkzvi4bditur932+WNv
   NKC9EhPPH6zDaI1hF2eo1a3m+S3ijgaZqhR4O2gaViaqPjh1MVRl9VRSa
   e8EpAd1Kcu18eXCCsukjRgoUPPkbR7tnvbnbW0pzcmrmmz9Bn0MHiRyWT
   lZNanD9zpNwdv+jPrUq0ptg4TxdZaduancZwme5+aUr5x9tllzUvFPYH+
   +473oGr32u6KtNaWE+93Kv4wxe4iJmBS/R7GioJnDJNu1T+NgrdXpyvVG
   2le+eWBx5h1fH4sYtdo0wKEJlpJb5QK9Oaz2PFo6oW370BXNm9NQMNY6C
   g==;
X-CSE-ConnectionGUID: K6g++12KTHOoo4nBaqOggQ==
X-CSE-MsgGUID: PiKyzDO4R1iuvWAwlUT47g==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44547683"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="44547683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 02:11:10 -0700
X-CSE-ConnectionGUID: f0DHGfr2RAiPdXfxy5wY4Q==
X-CSE-MsgGUID: ZdyX54y4R+ipCuT+7rWhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="125661366"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2025 02:11:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyoh8-0008c6-1x;
	Sun, 30 Mar 2025 09:11:06 +0000
Date: Sun, 30 Mar 2025 17:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 28/67] lib/dynamic_debug.c:1249:10: warning: expression
 which evaluates to zero treated as a null pointer constant of type 'struct
 _ddebug_class_param *'
Message-ID: <202503301649.F8nnK3Oo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   eb82e500a03a890bca5e5ca2515875d2a6c8ad17
commit: dd17dc5dd81956ecbac7b184addc4a66d65d8990 [28/67] dyndbg: restore classmap protection when theres a controlling_param
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250330/202503301649.F8nnK3Oo-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301649.F8nnK3Oo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301649.F8nnK3Oo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1249:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct _ddebug_class_param *' [-Wnon-literal-null-conversion]
    1249 |                 return false;
         |                        ^~~~~
   1 warning generated.


vim +1249 lib/dynamic_debug.c

  1241	
  1242	static struct _ddebug_class_param *
  1243	ddebug_get_classmap_kparam(const struct kernel_param *kp,
  1244				   const struct _ddebug_class_map *map)
  1245	{
  1246		struct _ddebug_class_param *dcp;
  1247	
  1248		if (kp->ops != &param_ops_dyndbg_classes)
> 1249			return false;
  1250	
  1251		dcp = (struct _ddebug_class_param *)kp->arg;
  1252	
  1253		return (map == dcp->map) ? dcp : NULL;
  1254	}
  1255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
