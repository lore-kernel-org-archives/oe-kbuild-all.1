Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D021EE7C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 07:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798300; cv=none; b=RPNGfu9B75QXfox20Ih9rdbGnBeINqtJPlyNEEQM9ox4jwEraxg2mT7crZJCJ2dj0zUo6HU7HFLcAxmwYyacMYN4JATu4wrdkqgJx/B8+R40xeweO36CTqG4spu0S9oaMAe9ng0qJkPh9kqvQKGn67vtHBqTfkaL19iFDJUCLYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798300; c=relaxed/simple;
	bh=RnD4RXYZ1OabAK5F7+0tdUL8PgTqBaO1wI8/PcHVGkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPA7UhxhWyP6g/OTHmF+rAezf20pFv3APsaeBPHekRfy8KJuxSEhSlEeeYP71wWpoPAgt+6R+6Zc04u8oFDE4dJ3dpLdohlLxmnJmdpf2qDzhN+1x/m1lL/lvcV8O+oVbjeMiEhY+FLQF68kpMF6/C+dMnpqSnbkgE+0Y5S4rYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Asm+fM/o; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Asm+fM/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749798299; x=1781334299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RnD4RXYZ1OabAK5F7+0tdUL8PgTqBaO1wI8/PcHVGkM=;
  b=Asm+fM/oLAO15DHLBAZemG0MsCJ6Dc6R4LeobBl85yFc8tYUjrzJDxCL
   pu01bfy6F2b36T/O1ffXsR05LE3spSi2oHA7pKepN+6GwD7vSVlYhqP8c
   93LJARdrKSy73qeBmv3xj7s1z7jZPafImH3Xe1UVsfnlrds9DCuoq1dZ/
   wx5+8Yg+ypIpnVEQrPOz5Pk1kk3KlzESWxCgBVXtiQdFhWrUcinYeFkCp
   PNL38uPd4SkdjK1uw4rWRA3iqo+p8fYg4vytx0zDy35LcfIsdop8bJowt
   tzl2BaPalnbJiIcJlVA53xPxGdgjE7hyb4XukALgWg3PSCnxvYg1vDiAd
   Q==;
X-CSE-ConnectionGUID: bBUAm8MkSx2/Utub6QTJ5w==
X-CSE-MsgGUID: lBKV8/abQZW/lOdrjv2mfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52143403"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="52143403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 00:04:58 -0700
X-CSE-ConnectionGUID: zOKh1O1fSo6T+TbG1cK2MQ==
X-CSE-MsgGUID: YLGaVpnVSR2gP2U6A4DmRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147656377"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2025 00:04:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPyT2-000CJ6-0a;
	Fri, 13 Jun 2025 07:04:48 +0000
Date: Fri, 13 Jun 2025 15:04:03 +0800
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
Subject: Re: [PATCH v6 8/8] fs/resctrl: Introduce interface to modify
 io_alloc Capacity Bit Masks
Message-ID: <202506131403.MWHHLsxB-lkp@intel.com>
References: <6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger@amd.com>

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
patch link:    https://lore.kernel.org/r/6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger%40amd.com
patch subject: [PATCH v6 8/8] fs/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks
config: x86_64-randconfig-r071-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131403.MWHHLsxB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131403.MWHHLsxB-lkp@intel.com/

New smatch warnings:
fs/resctrl/rdtgroup.c:2105 resctrl_io_alloc_cbm_write() warn: unsigned 'io_alloc_closid' is never less than zero.
fs/resctrl/rdtgroup.c:2105 resctrl_io_alloc_cbm_write() warn: error code type promoted to positive: 'io_alloc_closid'

Old smatch warnings:
fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: unsigned 'io_alloc_closid' is never less than zero.
fs/resctrl/rdtgroup.c:1961 resctrl_io_alloc_write() warn: error code type promoted to positive: 'io_alloc_closid'
fs/resctrl/rdtgroup.c:2026 resctrl_io_alloc_cbm_show() warn: unsigned 'io_alloc_closid' is never less than zero.
fs/resctrl/rdtgroup.c:2026 resctrl_io_alloc_cbm_show() warn: error code type promoted to positive: 'io_alloc_closid'

vim +/io_alloc_closid +2105 fs/resctrl/rdtgroup.c

  2072	
  2073	static ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of,
  2074						  char *buf, size_t nbytes, loff_t off)
  2075	{
  2076		struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
  2077		struct rdt_resource *r = s->res;
  2078		u32 io_alloc_closid;
  2079		int ret = 0;
  2080	
  2081		/* Valid input requires a trailing newline */
  2082		if (nbytes == 0 || buf[nbytes - 1] != '\n')
  2083			return -EINVAL;
  2084	
  2085		buf[nbytes - 1] = '\0';
  2086	
  2087		if (!r->cache.io_alloc_capable) {
  2088			rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
  2089			return -EINVAL;
  2090		}
  2091	
  2092		cpus_read_lock();
  2093		mutex_lock(&rdtgroup_mutex);
  2094	
  2095		rdt_last_cmd_clear();
  2096		rdt_staged_configs_clear();
  2097	
  2098		if (!resctrl_arch_get_io_alloc_enabled(r)) {
  2099			rdt_last_cmd_puts("io_alloc feature is not enabled\n");
  2100			ret = -EINVAL;
  2101			goto cbm_write_out;
  2102		}
  2103	
  2104		io_alloc_closid = resctrl_io_alloc_closid_get(r);
> 2105		if (io_alloc_closid < 0) {
  2106			rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
  2107			ret = -EINVAL;
  2108			goto cbm_write_out;
  2109		}
  2110	
  2111		ret = resctrl_io_alloc_parse_line(buf, r, resctrl_schema_io_alloc(s),
  2112						  io_alloc_closid);
  2113		if (ret)
  2114			goto cbm_write_out;
  2115	
  2116		ret = resctrl_arch_update_domains(r, io_alloc_closid);
  2117	
  2118	cbm_write_out:
  2119		rdt_staged_configs_clear();
  2120		mutex_unlock(&rdtgroup_mutex);
  2121		cpus_read_unlock();
  2122	
  2123		return ret ?: nbytes;
  2124	}
  2125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
