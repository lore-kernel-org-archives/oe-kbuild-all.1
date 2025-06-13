Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B4F24EAAF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 04:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749788986; cv=none; b=K5L0bQV0qGS44YqJ6+5fvRBj2RxEVExZNWRLS+xSvRg7pVhc5lpyAPhosE5vSJ81fhe37vF79jo8w3+6GIgRFtW2wDQdM2v3H4QvZB90AV28RwSf266z1vLX7GXLF/2RvHyw/XcQK0uzDGtgA4dqS0F38BnSFKd4N6Xk8xbh3rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749788986; c=relaxed/simple;
	bh=+VWV3/BAJ4l3ULmQD/u+9EkUcQrnjVMHFgBf7Rhkjik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnYDe0AGKRMoEyfBstiTTogJR6CA1qk2CosvZB10l5IuUwExC9ZYedRBqyLQtvIXPWTMM6AqsImKe3jKeeD+wpx2U8Sx4Z6tG3bT3vVcJxrDgQ9x0/of+llmSTZXeH+uni24wLzpXYyNTd0t2BT4b2a49BioIbUuTugIj2gGvto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LigIFzcw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LigIFzcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749788985; x=1781324985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VWV3/BAJ4l3ULmQD/u+9EkUcQrnjVMHFgBf7Rhkjik=;
  b=LigIFzcwxyBXPcPiKx7OZcsfXt+3aSWmF6eM+rrBN3OKOs3cIIBvzNO/
   u/bznEGWs10wF16G9hCz2Jq80YBg0yYfRWi/3EHTu2rAePwpG6lG8GU3e
   D0fAn9ZLcEgGL8ih9eALV84E8pXpbt827JsuuwSOC+UwNykYX7h8qt6Vr
   duqt91Lg6K8wlQW5Sx6EJ9jkMDchDWk3oU0Uf7Y1hqbkM1dhJU/Zv9kw3
   sbggAAcahgQiBZyF4XXPbQD7d6BvJGKBqyxw1jxngxpRi3ieXLvW+g1nn
   fdvzK5P3W8DcyMTcfmDvHnJ9WL0iSD8csQllMJ5yTkoNEXJ/HcnsvN2n/
   w==;
X-CSE-ConnectionGUID: WH3CXpAXSaK5KnYSTFurCg==
X-CSE-MsgGUID: h+ofS8mQQVaKWac8Ph5zZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55796259"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="55796259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 21:29:44 -0700
X-CSE-ConnectionGUID: Vcx7agF5Q0+M6jiKgy4ClA==
X-CSE-MsgGUID: MlyEjWLMSYGYiaHV73ar5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="151546181"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2025 21:29:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPw2p-000CEY-35;
	Fri, 13 Jun 2025 04:29:35 +0000
Date: Fri, 13 Jun 2025 12:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
	reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, paulmck@kernel.org, rostedt@goodmis.org,
	thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org,
	seanjc@google.com, thomas.lendacky@amd.com,
	pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
	yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
	peterz@infradead.org, kan.liang@linux.intel.com,
	mario.limonciello@amd.com, xin3.li@intel.com, sohil.mehta@intel.com
Subject: Re: [PATCH v6 6/8] fs/resctrl: Introduce interface to display
 io_alloc CBMs
Message-ID: <202506131254.KDDf1FdT-lkp@intel.com>
References: <16cebf7069e11e07c0d9e343aa72363325befafd.1749677012.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16cebf7069e11e07c0d9e343aa72363325befafd.1749677012.git.babu.moger@amd.com>

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc1 next-20250612]
[cannot apply to tip/x86/core aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250612-053050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/16cebf7069e11e07c0d9e343aa72363325befafd.1749677012.git.babu.moger%40amd.com
patch subject: [PATCH v6 6/8] fs/resctrl: Introduce interface to display io_alloc CBMs
config: x86_64-randconfig-r071-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131254.KDDf1FdT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131254.KDDf1FdT-lkp@intel.com/

New smatch warnings:
fs/resctrl/rdtgroup.c:2026 resctrl_io_alloc_cbm_show() warn: unsigned 'io_alloc_closid' is never less than zero.
fs/resctrl/rdtgroup.c:2026 resctrl_io_alloc_cbm_show() warn: error code type promoted to positive: 'io_alloc_closid'

Old smatch warnings:
fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: unsigned 'io_alloc_closid' is never less than zero.
fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: error code type promoted to positive: 'io_alloc_closid'

vim +/io_alloc_closid +2026 fs/resctrl/rdtgroup.c

  1999	
  2000	static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
  2001					     struct seq_file *seq, void *v)
  2002	{
  2003		struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
  2004		struct rdt_resource *r = s->res;
  2005		u32 io_alloc_closid;
  2006		int ret = 0;
  2007	
  2008		cpus_read_lock();
  2009		mutex_lock(&rdtgroup_mutex);
  2010	
  2011		rdt_last_cmd_clear();
  2012	
  2013		if (!r->cache.io_alloc_capable) {
  2014			rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
  2015			ret = -ENODEV;
  2016			goto cbm_show_out;
  2017		}
  2018	
  2019		if (!resctrl_arch_get_io_alloc_enabled(r)) {
  2020			rdt_last_cmd_puts("io_alloc feature is not enabled\n");
  2021			ret = -EINVAL;
  2022			goto cbm_show_out;
  2023		}
  2024	
  2025		io_alloc_closid = resctrl_io_alloc_closid_get(r);
> 2026		if (io_alloc_closid < 0) {
  2027			rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
  2028			ret = -EINVAL;
  2029			goto cbm_show_out;
  2030		}
  2031	
  2032		show_doms(seq, resctrl_schema_io_alloc(s), NULL, io_alloc_closid);
  2033	
  2034	cbm_show_out:
  2035		mutex_unlock(&rdtgroup_mutex);
  2036		cpus_read_unlock();
  2037		return ret;
  2038	}
  2039	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
