Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CCA2FB0BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760110979; cv=none; b=PwgpSUDXMvPgpqxgfGpl/sJhYZ7G1p0ZUmsmu4k3hpeKJDJ+NoJ+ZZMIQQiOLh3pwbxwwzM0PWcdsShRXLrNWIUePqz2yv0YqJxDC3CCs7MWIA9fXQxCCIq2cmJXbumL+KxGDnshvK98WzqScrdNOHLwjggHGf9Cw03Hdlaa20I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760110979; c=relaxed/simple;
	bh=Hv3TfVnKHIu7LdTwfSqN+KKHB7aDFxFsgk3qMrG4ddE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hWR8GR/tfECPr+XWxdOmh6H+okY0Uvr6XQ+JjPIv3OAHBZz7SKnEPNYlT/0epkwxpNV8aBPrvJXD5FM8WnNjjm7OGORl5/uIHUBIoCRlML9Xngvza+rb/kdXxEcnIHZRJuSFLBDyFBeAiPJjUs+MfOYmJsXpx5Q9pDG2L6ZxI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2Sy2pkB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2Sy2pkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760110977; x=1791646977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hv3TfVnKHIu7LdTwfSqN+KKHB7aDFxFsgk3qMrG4ddE=;
  b=g2Sy2pkBuKpJrarbVOXtVwXzyw9ZrcoSkhfBVJ4LLXMQOBRNgp7tSrbc
   qfwlQ3HZ0RL7CyjMr5SkAg7lJgnTW6M1VPG+v2iSydo0V2JhiJdrQMC68
   +Wu7i/SHaKTdwmUJUOuZ7m3IfPIRkXGXKLwUGh8QUMDkiCNwqiVxZzNOt
   4mC5buVFlpNDga9KZJyWq199ysgf4iPKw9ShlIh4jHxIqH+Nr8p+p1Syb
   UnFCozrK5x8FuYWHyy/BTcS3s4ZsYxLv4mWABCuUIJgrp2AdaQHXNYks6
   CfxvswU2UJVIjUrIJHOTTagsXYzAvhDbIyQC7uzKO9TLdYeUcFKW3EqKd
   w==;
X-CSE-ConnectionGUID: LHSb5mFRRmmqdeHmvIaXdA==
X-CSE-MsgGUID: PvZULr9JRqSpldRLhrhATw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72588474"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="72588474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 08:42:57 -0700
X-CSE-ConnectionGUID: o3tY7xwxRUiDWNT0Dd8q3w==
X-CSE-MsgGUID: x4Bw7hlZTMWJPhoDR9Eq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180124184"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 08:42:55 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7FGe-0002ug-2A;
	Fri, 10 Oct 2025 15:42:52 +0000
Date: Fri, 10 Oct 2025 23:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:126:5:
 sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it
 be static?
Message-ID: <202510102344.gEz84vGP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0e7e343932646d9a28d9b5f8b025d781051fa52a
commit: 1845e7add95773a24019fb72bbea24a0a568663b [1740/1740] mm: Add reliable memory use limit for user tasks
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20251010/202510102344.gEz84vGP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510102344.gEz84vGP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510102344.gEz84vGP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:126:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:126:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     126 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_limit_handler +126 mm/mem_reliable.c

   124	
   125	#ifdef CONFIG_SYSCTL
 > 126	int reliable_limit_handler(struct ctl_table *table, int write,
   127		void __user *buffer, size_t *length, loff_t *ppos)
   128	{
   129		unsigned long old = task_reliable_limit;
   130		int ret;
   131	
   132		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   133		if (ret == 0 && write) {
   134			if (task_reliable_limit > total_reliable_mem_sz()) {
   135				task_reliable_limit = old;
   136				return -EINVAL;
   137			}
   138		}
   139	
   140		return ret;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
