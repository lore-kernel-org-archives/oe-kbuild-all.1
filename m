Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDC82848A7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 21:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761513670; cv=none; b=UWryo1KN4MHbO+o8Wm8vQy0DfNtec70r0dLnuvO6A4XQ0sTUxwKZNOwhRTTfHyfqY6FsDo32S9k9biXTDFLF8In8JJf/ubmp35HwdMxt1PxfP4Uw+78BOiIE6DOxslfZaoV6CBM+IkVC+27T8Maw/dd/8N+1p7PYIW73/nj/Xe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761513670; c=relaxed/simple;
	bh=xz8I/HPIhTEv+8fwVecvUGozc12i+96oHYcf3DxLW6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJCb75HJysOv+PRcuIog/ZtJB/F4xhy1il3qEptJ0VCaPfgwvmdEoodJIBM2nnhFciPciHsU16xu9t3p7rpsgXZkgAlm/elKSd6eCVj00wIgjUqln185325hnGKqjc+sAs9tiTQ+ZALvBL7Z/cC34zMCN8aE/mK7jhBmzQ4SCiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0ZZxjB8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0ZZxjB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761513668; x=1793049668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xz8I/HPIhTEv+8fwVecvUGozc12i+96oHYcf3DxLW6A=;
  b=Q0ZZxjB8kw9Dy+zPK5qC0vQs8myUqn+88O85XnwZkkKiPGd7O3VWvEid
   AdzXEtMoxnFHdVf0crd4fkEM3ykdY9pMBhm6E57TMkOtHB3zrhAvv+KEV
   pkLtNJtLdmWV59j1QCVZT7bnEDhLdOApkePtv5NZ6fG2C2ODoiE2GA+B/
   r4zB/D7hGJ40j523vMC4LDiet5aA9P5dJvETQzGAAwrQfmWb0vApCadLd
   wMpMq4nsMkvd4j3D+rLW2XMZmb6MS/cfZhG3RsGVzAQ58GNchODCLKrDB
   66ZWavGhY5wt02UUk4hRlVbMHIiQ1H8hfltI9Ey38D1Sd0QLtbLl+u5ue
   g==;
X-CSE-ConnectionGUID: g+IfXMosR5mv/bBQp0jqgQ==
X-CSE-MsgGUID: K0wYVo6NQyGVdhDqkLy4BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62806904"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="62806904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 14:21:08 -0700
X-CSE-ConnectionGUID: JGqH2cTWRw+Aov6nbDuVpQ==
X-CSE-MsgGUID: how/Z2inQ+GQpY7oqL3ypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184968164"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2025 14:21:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD8Ai-000GLn-1J;
	Sun, 26 Oct 2025 21:21:04 +0000
Date: Mon, 27 Oct 2025 05:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 461/692] fs/bcachefs/util/darray.c:35:17:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202510270541.ivtwU7Ze-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   1df63c2414a8b3e8cc16e06582990371d7f38609
commit: a5c2f21bff6a883e2a0fc96e4f0127350186665e [461/692] bcachefs: move utility code to subdir
config: powerpc-randconfig-r112-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270541.ivtwU7Ze-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270541.ivtwU7Ze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270541.ivtwU7Ze-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/util/darray.c:35:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/util/darray.c:35:17: sparse:    char [noderef] __rcu *
   fs/bcachefs/util/darray.c:35:17: sparse:    char *

vim +35 fs/bcachefs/util/darray.c

73ab9e03861c22 fs/bcachefs/darray.c Kent Overstreet 2023-11-08   8  
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13   9  int __bch2_darray_resize_noprof(darray_char *d, size_t element_size, size_t new_size, gfp_t gfp,
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13  10  				bool rcu)
73ab9e03861c22 fs/bcachefs/darray.c Kent Overstreet 2023-11-08  11  {
73ab9e03861c22 fs/bcachefs/darray.c Kent Overstreet 2023-11-08  12  	if (new_size > d->size) {
73ab9e03861c22 fs/bcachefs/darray.c Kent Overstreet 2023-11-08  13  		new_size = roundup_pow_of_two(new_size);
73ab9e03861c22 fs/bcachefs/darray.c Kent Overstreet 2023-11-08  14  
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  15  		/*
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  16  		 * This is a workaround: kvmalloc() doesn't support > INT_MAX
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  17  		 * allocations, but vmalloc() does.
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  18  		 * The limit needs to be lifted from kvmalloc, and when it does
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  19  		 * we'll go back to just using that.
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  20  		 */
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  21  		size_t bytes;
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  22  		if (unlikely(check_mul_overflow(new_size, element_size, &bytes)))
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  23  			return -ENOMEM;
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  24  
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13  25  		void *old = d->data;
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13  26  		void *new = likely(bytes < INT_MAX)
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  27  			? kvmalloc_noprof(bytes, gfp)
f0d3302073e60b fs/bcachefs/darray.c Kent Overstreet 2024-10-19  28  			: vmalloc_noprof(bytes);
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13  29  		if (!new)
73ab9e03861c22 fs/bcachefs/darray.c Kent Overstreet 2023-11-08  30  			return -ENOMEM;
73ab9e03861c22 fs/bcachefs/darray.c Kent Overstreet 2023-11-08  31  
2e118ba36d56ac fs/bcachefs/darray.c Tavian Barnes   2024-06-21  32  		if (d->size)
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13  33  			memcpy(new, old, d->size * element_size);
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13  34  
68230270e04d5e fs/bcachefs/darray.c Kent Overstreet 2025-08-13 @35  		rcu_assign_pointer(d->data, new);

:::::: The code at line 35 was first introduced by commit
:::::: 68230270e04d5ebe026e89137d23bed6201bae6c bcachefs: darray_make_room_rcu()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
