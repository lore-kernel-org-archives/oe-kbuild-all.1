Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1128B4EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 15:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471780; cv=none; b=AO9q0rNCgjqwwnPjYsx5cr/1Qijj0Lz2+JsLgTiUwQutZfcE2pqmpHoYqQczbozBeqlPArdbVT5ERG23h21ScJDSnN18j56RpakG8Q4gB49jzDTCJf25SSIpIsAhD7K9pf5uptvnTAVeA8GbOq4SlGuYR0IORDBxUJZ5MT+kNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471780; c=relaxed/simple;
	bh=33y2dE+SZNoEK1SG+l/zBG+w5k5JKSbR9kvSYWuMtYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYAnrjrG0LthFaMCro7PHrM/0Ed0hD437oA+x3n1PIdZWBfClKAj/EoYVtBhSe2Lll7gd20vojw0e5DI53G619BRsZEXB5dpF7C3r/KWX3+U739rWWCswh3cBXX4GERI+3Yui6xnwfUISP21li7yFUm8fbJ+6kBcfu++4su9ars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6ifvlAx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6ifvlAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751471778; x=1783007778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33y2dE+SZNoEK1SG+l/zBG+w5k5JKSbR9kvSYWuMtYY=;
  b=C6ifvlAxs3NE4Y/D7N0m6Wky0lLSoJ4s3XaBlj6vzAOUuD+/+2sFozOo
   e0quxxT5bPr++qFSkqNpGY7u605RmGmPTpaq6SAwYL+OewvsqPWiCpbuu
   nNBF0YYCr57TZLboiKE9EywoL8OY3UZauZ8QUXsREMKyZzdZ+62daKLi6
   Jgxxuq8YNMgHQ6XnWflHGygzRw3t1ZdPcN+9ynoanxZG2uqCkhpUoR3dF
   Q1Eex9+BRzq5eXBWlfbje5wyVPQRkPcDbcadsvOnf3VZB3Yp/t16IckF9
   N2fjrLNT43BJ0ficfkgH52gTUek/V1GkVXvMv3jDbP64pLWHJ+whZlAAX
   w==;
X-CSE-ConnectionGUID: YymNET8tS2y/mzZCKceWOQ==
X-CSE-MsgGUID: QqsflLLJS2+gf8JkoGl1EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64019336"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64019336"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:56:17 -0700
X-CSE-ConnectionGUID: V3ee3CeiQJ6fBvPRnVaaoQ==
X-CSE-MsgGUID: /1TGKdWlR8yC1QtP/Ky/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="177791737"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jul 2025 08:56:15 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWzoj-0000JN-33;
	Wed, 02 Jul 2025 15:56:13 +0000
Date: Wed, 2 Jul 2025 17:56:06 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] kernel/cgroup/cgroup.c:6734: warning:
 Function parameter or member 'fd' not described in 'cgroup_get_from_fd_v2'
Message-ID: <202507021750.a3TifDd5-lkp@intel.com>
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
commit: 56fee14453059f894b018d08071826d47e634800 [2882/2882] cgroup: make cgroup_bpf_prog_attach work when cgroup2 is not mounted
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507021750.a3TifDd5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021750.a3TifDd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021750.a3TifDd5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/cgroup.c:6217: warning: Function parameter or member 'f' not described in 'cgroup_get_from_file'
   kernel/cgroup/cgroup.c:6369: warning: Function parameter or member 'kargs' not described in 'cgroup_can_fork'
   kernel/cgroup/cgroup.c:6430: warning: Function parameter or member 'kargs' not described in 'cgroup_post_fork'
   kernel/cgroup/cgroup.c:6716: warning: Function parameter or member 'fd' not described in 'cgroup_get_from_fd'
>> kernel/cgroup/cgroup.c:6734: warning: Function parameter or member 'fd' not described in 'cgroup_get_from_fd_v2'


vim +6734 kernel/cgroup/cgroup.c

  6729	
  6730	/**
  6731	 * same with cgroup_get_from_fd, only add cgrp_dfl_visible check
  6732	 */
  6733	struct cgroup *cgroup_get_from_fd_v2(int fd)
> 6734	{
  6735		struct cgroup *cgrp = cgroup_v1v2_get_from_fd(fd);
  6736	
  6737		if (IS_ERR(cgrp))
  6738			return ERR_CAST(cgrp);
  6739	
  6740		if (!cgroup_on_dfl(cgrp)) {
  6741			cgroup_put(cgrp);
  6742			if (cgrp_dfl_visible)
  6743				return ERR_PTR(-EBADF);
  6744	
  6745			cgrp = &cgrp_dfl_root.cgrp;
  6746			cgroup_get(cgrp);
  6747		}
  6748		return cgrp;
  6749	}
  6750	EXPORT_SYMBOL_GPL(cgroup_get_from_fd_v2);
  6751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
