Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DD9170A1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727622519; cv=none; b=nz+nUyT/VouIYNouyak7suEeZmExOrkEAB55r1oQ1zYUjUMJ0edkCWNhBMsniw8oiJ2urKN3EYDH2t4WB4E1CLVfpA4UV5u97eE7LUyrjvdrEx9G97xaQV4iTO139HCx1ZLxjCeAW12dtTJlg0acXprXsw0z/+IJk/1Jo67Ygtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727622519; c=relaxed/simple;
	bh=8PGI8/6i9WXMtRWU9XKq+wM6fh8EkDNMoCb+/9rVXlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqRR2s8xe+HH66BqtsfrNVMJBZSlAUvzkMM2ctd6Dolam6x7/yX0uCcFNsJnuknMrJyTsuYIq5eFWcxj7Du9EclvIxI0DOfELXWRjGmqf5YetHoq94rluEsT5WALteQH24hIIHNC4Vywg/jtAbKJVUuZUm2IKStuGgt+flXy/wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ad3lbu9n; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ad3lbu9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727622517; x=1759158517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PGI8/6i9WXMtRWU9XKq+wM6fh8EkDNMoCb+/9rVXlU=;
  b=Ad3lbu9nFTH/3LNT566nKlEQQSz2lygLVBQqWwetGXtmxgMRXR8u35ob
   9BCGgVugvo35A2euHB9sfqXL5gMvP0/T6sOnCZvWMA05xB0YKtXwA2kpr
   Z3dzwIWpcFoggT2WLkwD2wP+oH7y8e7NcwZxIAJk62RbUszV8hd6sxzpX
   ZblDMLC6Yg5gJOJ/Ntmjvb9rbsurJmzSxfYzHQeH3y5tAjtfu7XI6Q7vV
   eXS4eUGSyT9dfT+pZWIJfEDRqtMrUy+Ry8zmG8YtVdupY6I0lgnkB1R61
   OLuhvDtGHjTZYJWuFPupJcdNGIVFaEghD7EpZNn09E/YbPROp1rj1azyI
   g==;
X-CSE-ConnectionGUID: uW3kCNOiR02pMq0ZfQcCrw==
X-CSE-MsgGUID: g/1T/gbORLCFcIbyja3Vlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="44175522"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="44175522"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 08:08:35 -0700
X-CSE-ConnectionGUID: KjYKQDNTQzygLzEw731lrg==
X-CSE-MsgGUID: hgYlMPJ7Qvev8Tt33XC6tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="73191342"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Sep 2024 08:08:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suvXD-000ONr-01;
	Sun, 29 Sep 2024 15:08:31 +0000
Date: Sun, 29 Sep 2024 23:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 5563/30000] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202409292311.VyBYcTcu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   1cca65ac6abc0751e6bd0dfdd9564925e2a7ff07
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [5563/30000] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: i386-randconfig-061-20240929 (https://download.01.org/0day-ci/archive/20240929/202409292311.VyBYcTcu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292311.VyBYcTcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292311.VyBYcTcu-lkp@intel.com/

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
