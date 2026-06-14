Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406D72627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 02:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781404755; cv=none; b=ZJ9oY1FWjLbiAp9Bru/9xUltdX4Y2r0JI3j4HXRps2P/bBZuM6u54abxSwqfeb/JjHavM42jjxX2arZkFaVbRVhH3jjCCOAnoVMBwwjQRa4H1M0qVo6an50HCYxBeXLM4IbtU6RgfcJ81Gl6uICFUz1BKPEMVNHeP01UwbFlNVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781404755; c=relaxed/simple;
	bh=wWykf7DfGr/E/BblvFpM7Oyj5GzLIPFogL3VAvHi0H4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WxcVHEWjAzZ+PEixQYejv2ZeQN1W1IyEjyAcs0pt0kBB8m0aXIgl0KQlY30SrCOzza5OIYDC0sUYNvZS+StUP5dtGs49cXNTjIvNhGsccFpqYYInBToWSq+jyYKPTr/f4/GeSXYFb9PRJyFN05N4TpOXlo+zev1xN1i9FVh+o8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLg51XS9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLg51XS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781404754; x=1812940754;
  h=date:from:to:cc:subject:message-id;
  bh=wWykf7DfGr/E/BblvFpM7Oyj5GzLIPFogL3VAvHi0H4=;
  b=WLg51XS9BZCtnGtdJYrnX5lAChlDKFS1Q5Xn+XB0EwyCNnmAHfQKjI9K
   GgoEs7EV5+YhVKHbszMEMWcZ0ZuDF7vaJU6rYB25I9lPOlPdlpf6odH0H
   iYK8fsS+BjI+OJowmrMchN+Vbkv4z0Se8ek+RR48RNwbBTzhBpD1xiN6w
   hhG9xBEIerTrKQ0pvdIW59g9DKaktorE4p1E7znTYDFT1bGpcKRvmfU5T
   BFl8lMz8O4E6KTefkQe9UirzvxViwmb/Z6qHc5tWz50oYg9KflP5XN3+b
   MeMYPINpN78FlRnM+IrNHntLiYrOIs49z72Yo54FvUZAPDXuqYlDlegvI
   Q==;
X-CSE-ConnectionGUID: iWfnByr5S4O/5ibit4+7tQ==
X-CSE-MsgGUID: 7yzJgICvSHOcExokN+v9Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82170600"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82170600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 19:39:13 -0700
X-CSE-ConnectionGUID: 3OFP7M4BQLig6gHpLlDFsg==
X-CSE-MsgGUID: r4A3dBVcTJ6+AHkNljrQUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="285258875"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jun 2026 19:39:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYakf-00000000QUU-0LRI;
	Sun, 14 Jun 2026 02:39:09 +0000
Date: Sun, 14 Jun 2026 10:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Subject: [linux-next:master 10901/13763] fs/bpf_fs_kfuncs.c:366:26:
 sparse: sparse: symbol 'bpf_real_inode' was not declared. Should it be
 static?
Message-ID: <202606141045.D2ewdvNp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 9af8c8a54f6ef1ec8e97836e456827dd5161b355 [10901/13763] bpf: add bpf_real_inode() kfunc
config: arm64-randconfig-r123-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141045.D2ewdvNp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141045.D2ewdvNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141045.D2ewdvNp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bpf_fs_kfuncs.c:366:26: sparse: sparse: symbol 'bpf_real_inode' was not declared. Should it be static?

vim +/bpf_real_inode +366 fs/bpf_fs_kfuncs.c

   355	
   356	/**
   357	 * bpf_real_inode - get the real inode backing a dentry
   358	 * @dentry: dentry to resolve
   359	 *
   360	 * If the dentry is on a union/overlay filesystem, return the underlying, real
   361	 * inode that hosts the data.  Otherwise return the inode attached to the
   362	 * dentry itself.
   363	 *
   364	 * Return: The real inode backing the dentry, or NULL for a negative dentry.
   365	 */
 > 366	__bpf_kfunc struct inode *bpf_real_inode(struct dentry *dentry)
   367	{
   368		return d_real_inode(dentry);
   369	}
   370	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
