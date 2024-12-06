Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5D11758B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733449650; cv=none; b=sAO9gb0pOtqCVAwSa/aKs2CFEtFrT4YafXA5bqIXMBsEym/YLLdHwe8BP53poLzPqoMpzdooB3ksdTCTvgZyglSGJn0ml+fzkXvIsW1dZUh8fdZQgQK6h5pREd6iHkbjSJZrhIV0ZqFNgIewLe0uAaoNjRUJDLQSWDdUX7K2uqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733449650; c=relaxed/simple;
	bh=r4kOkwJ/B2+oeHBI68H6Ym2HhUH6ZUwDHBn+8l9Llno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKn7GeaFVY3KcnYVKYcQhN1vtSc6YRLfHhEZ1f7rJQR3jUjE6+YDZ3ABBC3jHYg29jI8pCYkJdY4us3ecbglLWsBkjZ4kOeCrzI8q+4MyUxhlKEVk1Y9nelJqlkeP8GYZ4+wZre5+uv47vqgm2Dz0eDK2yVePu88xGdsoBmPw9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ti/34P0W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ti/34P0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733449648; x=1764985648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r4kOkwJ/B2+oeHBI68H6Ym2HhUH6ZUwDHBn+8l9Llno=;
  b=Ti/34P0Wrvi2iCAUiNKe66icWjE5N9zG0NN9Z7Yy4IsXI8du6oyeSB1O
   D69dPrnWPbmCBKNMjGm8gPiuCTN4/eGjh6hg8nnKw7vsDvqcBPM5am/N9
   q+EXhpioMTk3WbYIqMJr6aAZgewiSddG5DxNo6eBVh4Xv+w6R4MS9cytC
   3k2D3+RELsWkwxgbPtRi7qw3jf66omqVK54KQYQ4uvbHx8ZW4z6CNPJMO
   8NXXBa+qn+LgDb48fNawKT9VrxgbFjAbwnQDRP4I0Kz+LGBNF6+l1wZGM
   ovbksLmgH4quMCHl7ospcN9PWFpbG4U9n7PvteZrUwVtJQqgeYYzw+eVQ
   Q==;
X-CSE-ConnectionGUID: CKeBwG8wR6K8IihVhzTHiw==
X-CSE-MsgGUID: zKFGC9MvQPmNihafetvGvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37725928"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="37725928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 17:47:28 -0800
X-CSE-ConnectionGUID: NdhZ++85Tg25VhR3ZF9Oiw==
X-CSE-MsgGUID: gr+kvCgqQhyaHKUVRBPzPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="95087578"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2024 17:47:26 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJNRD-0000al-1H;
	Fri, 06 Dec 2024 01:47:23 +0000
Date: Fri, 6 Dec 2024 09:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 4884/30000] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202412060927.0lWFtuSx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   0c0e4e7af1d88f89746df9473da789f2cee2a15e
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [4884/30000] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: x86_64-randconfig-123 (https://download.01.org/0day-ci/archive/20241206/202412060927.0lWFtuSx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060927.0lWFtuSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060927.0lWFtuSx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   172	
   173	static const char *argv_init[MAX_INIT_ARGS+2] = { "init", NULL, };
 > 174	const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
   175	static const char *panic_later, *panic_param;
   176	
   177	extern const struct obs_kernel_param __setup_start[], __setup_end[];
   178	
   179	static bool __init obsolete_checksetup(char *line)
   180	{
   181		const struct obs_kernel_param *p;
   182		bool had_early_param = false;
   183	
   184		p = __setup_start;
   185		do {
   186			int n = strlen(p->str);
   187			if (parameqn(line, p->str, n)) {
   188				if (p->early) {
   189					/* Already done in parse_early_param?
   190					 * (Needs exact match on param part).
   191					 * Keep iterating, as we can have early
   192					 * params and __setups of same names 8( */
   193					if (line[n] == '\0' || line[n] == '=')
   194						had_early_param = true;
   195				} else if (!p->setup_func) {
   196					pr_warn("Parameter %s is obsolete, ignored\n",
   197						p->str);
   198					return true;
   199				} else if (p->setup_func(line + n))
   200					return true;
   201			}
   202			p++;
   203		} while (p < __setup_end);
   204	
   205		return had_early_param;
   206	}
   207	
   208	/*
   209	 * This should be approx 2 Bo*oMips to start (note initial shift), and will
   210	 * still work even if initially too large, it will just take slightly longer
   211	 */
   212	unsigned long loops_per_jiffy = (1<<12);
   213	EXPORT_SYMBOL(loops_per_jiffy);
   214	
   215	static int __init debug_kernel(char *str)
   216	{
   217		console_loglevel = CONSOLE_LOGLEVEL_DEBUG;
   218		return 0;
   219	}
   220	
   221	static int __init quiet_kernel(char *str)
   222	{
   223		console_loglevel = CONSOLE_LOGLEVEL_QUIET;
   224		return 0;
   225	}
   226	
   227	early_param("debug", debug_kernel);
   228	early_param("quiet", quiet_kernel);
   229	
   230	static int __init loglevel(char *str)
   231	{
   232		int newlevel;
   233	
   234		/*
   235		 * Only update loglevel value when a correct setting was passed,
   236		 * to prevent blind crashes (when loglevel being set to 0) that
   237		 * are quite hard to debug
   238		 */
   239		if (get_option(&str, &newlevel)) {
   240			console_loglevel = newlevel;
   241			return 0;
   242		}
   243	
   244		return -EINVAL;
   245	}
   246	
   247	early_param("loglevel", loglevel);
   248	
   249	#ifdef CONFIG_BOOT_CONFIG
   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
