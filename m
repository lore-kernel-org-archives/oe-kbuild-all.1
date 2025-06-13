Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00162155725
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779012; cv=none; b=c3DExYn3jd94E46n5NepR7EXtLbgd3eYVs0lC67QbtOHvfcnW8QiCR4puuaz3MzdeCtYeofpE43C1JPQHu3qBx7TRoJ6TWuoT/ugnqosfxlNyCiZL9Yg7F496ad26g7w8PufsLBxaLMX+9HVtQ85doRHiO5FwsvseawNV/5Q3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779012; c=relaxed/simple;
	bh=jRleahobEjtpTHgiqWQ/bAUpWinBR3bS8t/s2k7w5sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jcpe9flIVihsBcqzdzFklrIQkK6RnSDOvGF4PhccfYAi/xpBeLmXE4Y0gbvsQvtg2lx27ZY/VfpTRCf/usAS9rCRtv7FCZuT0NO9tEtWGkTsXy3yDa+KxD8DqrTzEDO8z0oPd7d5UWf1myeqPKSovyqruM0YsbxzX/UMU45MseE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGznOKUT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGznOKUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749779011; x=1781315011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jRleahobEjtpTHgiqWQ/bAUpWinBR3bS8t/s2k7w5sI=;
  b=JGznOKUTEoxFdlNx6G7zGpmUbvfCwyNuKfw1NHxuGGt8z3Q8eI9zWB1N
   7+buHr2VgBpQsYI+VYPRB5Dou1NKCXTx5xY81/+XAovyQtpzgQ7bLoLPQ
   cHGZvRWOT/wiSZp0JSNgxBq3sjEtB32PXRH1a9vCoMx6Pe1erZRsUinZg
   lVxzarnWciPaXFp8M19CI2Z/StCxqmwWOkZVEf49LXfjz4L6BU9YttKVP
   Ks3VfwP1QhUgCV/yfDVPl9I+eFNLujqP88JrN3tZdmyKn8clVN4wRj4Gq
   4CQgrifeaKfhw8ccnxfet8vslw4LimPFzDMq6IKt1C35Fc1A/OsHPG5OE
   g==;
X-CSE-ConnectionGUID: z4lbaJsPSlKk+uucgc2RDA==
X-CSE-MsgGUID: SFOieRV/Q1OFatXFb0HsAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69554469"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="69554469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 18:43:31 -0700
X-CSE-ConnectionGUID: 1eiHC0GuQhCD5icsHpysbg==
X-CSE-MsgGUID: r/riJJqSQwymtMUjZOANug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="148238640"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2025 18:43:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPtRx-000C7y-0e;
	Fri, 13 Jun 2025 01:43:21 +0000
Date: Fri, 13 Jun 2025 09:42:46 +0800
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
Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable
 io_alloc feature
Message-ID: <202506130912.Uwt49HTq-lkp@intel.com>
References: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>

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
patch link:    https://lore.kernel.org/r/b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger%40amd.com
patch subject: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable io_alloc feature
config: x86_64-randconfig-r071-20250612 (https://download.01.org/0day-ci/archive/20250613/202506130912.Uwt49HTq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130912.Uwt49HTq-lkp@intel.com/

smatch warnings:
fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: unsigned 'io_alloc_closid' is never less than zero.
fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: error code type promoted to positive: 'io_alloc_closid'

vim +/io_alloc_closid +1961 fs/resctrl/rdtgroup.c

  1934	
  1935	static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
  1936					      size_t nbytes, loff_t off)
  1937	{
  1938		struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
  1939		struct rdt_resource *r = s->res;
  1940		char const *grp_name;
  1941		u32 io_alloc_closid;
  1942		bool enable;
  1943		int ret;
  1944	
  1945		ret = kstrtobool(buf, &enable);
  1946		if (ret)
  1947			return ret;
  1948	
  1949		cpus_read_lock();
  1950		mutex_lock(&rdtgroup_mutex);
  1951	
  1952		rdt_last_cmd_clear();
  1953	
  1954		if (!r->cache.io_alloc_capable) {
  1955			rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
  1956			ret = -ENODEV;
  1957			goto out_io_alloc;
  1958		}
  1959	
  1960		io_alloc_closid = resctrl_io_alloc_closid_get(r);
> 1961		if (io_alloc_closid < 0) {
  1962			rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
  1963			ret = -EINVAL;
  1964			goto out_io_alloc;
  1965		}
  1966	
  1967		if (resctrl_arch_get_io_alloc_enabled(r) != enable) {
  1968			if (enable) {
  1969				ret = resctrl_io_alloc_closid_alloc(io_alloc_closid);
  1970				if (ret < 0) {
  1971					grp_name = rdtgroup_name_by_closid(io_alloc_closid);
  1972					rdt_last_cmd_printf("CLOSID for io_alloc is used by %s group\n",
  1973							    grp_name ? grp_name : "another");
  1974					ret = -EINVAL;
  1975					goto out_io_alloc;
  1976				}
  1977	
  1978				ret = resctrl_io_alloc_init_cat(r, resctrl_schema_io_alloc(s),
  1979								io_alloc_closid);
  1980				if (ret) {
  1981					rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
  1982					resctrl_io_alloc_closid_free(io_alloc_closid);
  1983					goto out_io_alloc;
  1984				}
  1985	
  1986			} else {
  1987				resctrl_io_alloc_closid_free(io_alloc_closid);
  1988			}
  1989	
  1990			ret = resctrl_arch_io_alloc_enable(r, enable);
  1991		}
  1992	
  1993	out_io_alloc:
  1994		mutex_unlock(&rdtgroup_mutex);
  1995		cpus_read_unlock();
  1996	
  1997		return ret ?: nbytes;
  1998	}
  1999	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
