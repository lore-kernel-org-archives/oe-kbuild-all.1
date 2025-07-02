Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E928EA55
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461442; cv=none; b=CMHDMl0c2oUTM+h4i6InN1JlEmzZYWFjxMhY/jIy5E8eL4L+3ctYNLuuaApVZcaDz0+hkvp9DIdyJR3VUaPEZ/rgxhwFitbGg2ubcA9O/SIc9EPn+8S2DtuDFecwKlzMGVYVyB3OiMrgWEb4jTitUaOw24vmGh7tuk2Mo6J7kgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461442; c=relaxed/simple;
	bh=2Adhf3IcZ7pdlhGW44nK22vAL4wwlb93kGwl8cbsiHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bed/h31oElRXKruTySk6ZiDG+FJ9kZ2SrJb16iYVFZYlbGaQpgGdWdaU15UB1gqI7+qzTLqCiDAbSc8eWFs64yPGTqlYj1XtqwwtShCNraRmKNG4nAZWdwy//AQbO0Zo5C7phwSE2VXBAu9ZN75Ml5mgEOABgVTCHGmeqfyoq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfVSx0nV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfVSx0nV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751461440; x=1782997440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Adhf3IcZ7pdlhGW44nK22vAL4wwlb93kGwl8cbsiHs=;
  b=PfVSx0nVJluPC9iTTp76mTQ7jKn69jH7bZ+3w0ExUmPQGUNLQcb7hbmc
   pl408UsD0JNSz09n8peSPv6uk4St3uM41iw6H0Wme3CRKtYMocghHbarw
   eEfdL22/VCQsCjcEitD5e8KBhp+Amu2LWoklXfS7oMzr+r9jOfPK8Dwk7
   xDc+Se5S8/OQTr8iOhtQUgm8/9Sgl+/JFIVZDQ9QJtTTJ7dvVzepWmIZW
   VEUGIohnQd4RTudS0oTkeYGpmUIVNFcRSh5lu+Yo/LHXNCAIzt4Q/spw8
   YxrSIsad3cOO3CGhJtwtCbkzTfCqQdXC2O7BuuDsUTMC9JHL75giRwX6f
   w==;
X-CSE-ConnectionGUID: 7h0SLTilTVqeMERbXudRJw==
X-CSE-MsgGUID: O4zUI1SXSOqCXBqrtStCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64352214"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64352214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:03:59 -0700
X-CSE-ConnectionGUID: 0bqrG0hdS4ym9HONIimbZA==
X-CSE-MsgGUID: h66RRA5lS5CUrfu2sUbXkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158451203"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2025 06:03:58 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWx7z-0000Ht-1m;
	Wed, 02 Jul 2025 13:03:55 +0000
Date: Wed, 2 Jul 2025 15:03:37 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] kernel/cgroup/cgroup.c:6217: warning:
 Function parameter or member 'f' not described in 'cgroup_get_from_file'
Message-ID: <202507021519.N5QrYRTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4755f6a2b98f251edcf63f98f416b5d76425f8c
commit: 590ef7039097222551e104343ae4ba74e4ed2f87 [2882/2882] cgroup: add cgroup_v1v2_get_from_[fd/file]()
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021519.N5QrYRTq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021519.N5QrYRTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021519.N5QrYRTq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:6217: warning: Function parameter or member 'f' not described in 'cgroup_get_from_file'
   kernel/cgroup/cgroup.c:6369: warning: Function parameter or member 'kargs' not described in 'cgroup_can_fork'
   kernel/cgroup/cgroup.c:6430: warning: Function parameter or member 'kargs' not described in 'cgroup_post_fork'
>> kernel/cgroup/cgroup.c:6716: warning: Function parameter or member 'fd' not described in 'cgroup_get_from_fd'


vim +6217 kernel/cgroup/cgroup.c

  6211	
  6212	/**
  6213	 * cgroup_get_from_file - same as cgroup_v1v2_get_from_file, but only supports
  6214	 * cgroup2.
  6215	 */
  6216	static struct cgroup *cgroup_get_from_file(struct file *f)
> 6217	{
  6218		struct cgroup *cgrp = cgroup_v1v2_get_from_file(f);
  6219	
  6220		if (IS_ERR(cgrp))
  6221			return ERR_CAST(cgrp);
  6222	
  6223		if (!cgroup_on_dfl(cgrp)) {
  6224			cgroup_put(cgrp);
  6225			return ERR_PTR(-EBADF);
  6226		}
  6227	
  6228		return cgrp;
  6229	}
  6230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
