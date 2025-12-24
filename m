Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAF6329C4B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598425; cv=none; b=Tuf91v+BOFw5k2cIqtg0+GfaM76ZQu91J2UzwCtIPqSIi1glH+89oBetfxd9bKEgW2ptAX4lkNQULeG8MqO8aaqEhObS82do+dc3ywzInrs9HmGqbuOk8a4SYIFrzbTN8PfqSYhHPEHjL5Gi1USh/A/i10brllJABBqROkAU72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598425; c=relaxed/simple;
	bh=uevTN1rOrDntPWzDeQBSmiLI9hdLU7rJDCboUhWv2ac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UFeArRsi1xDI6O87kKKFs8D7BCiXoMuE5JSnExhlqf8KDPRUbWvqOlG7HCpwB+rkHOLgqpVT0X5nhPwJKjqUXSJXOYzomGss/1LkIf7uV+UsYFappnem4QKLhyuG5bf6IPe3ILdmcZqSjBl31vqVWPCnUKJ1CTJ8Z3InbhNor1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D14GppVI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D14GppVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766598421; x=1798134421;
  h=date:from:to:cc:subject:message-id;
  bh=uevTN1rOrDntPWzDeQBSmiLI9hdLU7rJDCboUhWv2ac=;
  b=D14GppVIPwH6zmZdbLfhz11XdKeoFdZqQZyuDN+OM9aV5C0+g55lm9nI
   0rVPYwcuqVBjcaWZFIKxGgOo8aIQKdOyXhiCfbgaTAcG8bCpl11EQTUjF
   FUGRhNiW84H+2gMTJHRGyXjtgMchvSDDgLOQP21LKR7N3/RPg6d71M8dX
   J6z/Re+Cu6NaETi+821Klw6DATOAB4vFkeF++f4Tg/gaG6MlU4BxsS1ck
   zj0mihli4uZC/DnGdVyMJetiQx6NtFC8GtY+fByjLqtxWTKNVrV6SkYys
   6qXH6lOiCVgpzQt1w9oidutUNLXSDaESfAuhIb5Z1e+2fz3buHQSgPjkq
   g==;
X-CSE-ConnectionGUID: mMXpBorySJWtkskv8w2Mjg==
X-CSE-MsgGUID: Vzy/uYi8RZOi3peHzP+SmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68591078"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68591078"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 09:46:59 -0800
X-CSE-ConnectionGUID: IRPcV0zJREKQbsI05fROsg==
X-CSE-MsgGUID: BNI+ABQ1Q/qqbSxudkhBEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="204606071"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Dec 2025 09:46:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYSwp-000000003KV-3jfM;
	Wed, 24 Dec 2025 17:46:55 +0000
Date: Thu, 25 Dec 2025 01:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] kernel/cgroup/cgroup.c:6734:
 warning: Function parameter or member 'fd' not described in
 'cgroup_get_from_fd_v2'
Message-ID: <202512250139.hi51ZBjo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 56fee14453059f894b018d08071826d47e634800 [3406/3406] cgroup: make cgroup_bpf_prog_attach work when cgroup2 is not mounted
config: arm64-randconfig-003-20251211 (https://download.01.org/0day-ci/archive/20251225/202512250139.hi51ZBjo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250139.hi51ZBjo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250139.hi51ZBjo-lkp@intel.com/

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
