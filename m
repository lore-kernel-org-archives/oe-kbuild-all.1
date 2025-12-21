Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34C2472BA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766312891; cv=none; b=tggVzhSf2LcU+qwbiF4qjfMbzWVsf5geRlDxqeDVO3pLLA5L5iAU9MFRShCZTBIUsobaxJ1gJqqJ/kYE9iLXvKrft4CbMzidDKMMWcMTDaOULH5K3uPXbz3LnoFjcoKGCkFiXXrWGKHWttlI44MLNolFUi8BeLHcI4rqj/mL/74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766312891; c=relaxed/simple;
	bh=208hz/6NXDREmSqooo/OxbunGL4WBMHTHihot3ITYPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ka2MZ0YSmGfuG3c7gFZP+a1EMbHuc4Rmdd0L/avfW0u8Z889S+B/32rRW9hyOpw9Nejb0e2YwoNjIJSWD5VtOB1MX+sHqy0svEbWxLcZvFu2I6G/kEQvYjmDRnZQZYbRo4+FbkwGuzztTduc0ZquXAw6JALT49nygNNg+geW60Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhIthjLR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhIthjLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766312889; x=1797848889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=208hz/6NXDREmSqooo/OxbunGL4WBMHTHihot3ITYPA=;
  b=fhIthjLR/EGaNpHm1qt5RUsjjMsgaGXeQVy5h5dtMZiqNEggGHQgMNzs
   CbRR/oFYip5XTBnKxcBeJOvWH5rI9huUn0r2BTHDi1Vwq7pM8H/PrbcHG
   Jfvtj7bqzIL3biq5uRYjgTfail/4+kMu6KiUZqvF5dy30bB28qvVFLXjJ
   9ilkd++OGi4ROeuvrAagZRoRie/6Iakpajjt70/UEeRJEQGyc46T+g7mC
   RKS06h6zBtAuUFS6HsKajhlwanZm1SDizsk4gawq41hYxIaLdRgW5a9sM
   ghxb7SVQuoZC90Mum8Gg6gf1r/JZvFEtA1ZuQ1v9+S2HUuQx8+21nyMqJ
   Q==;
X-CSE-ConnectionGUID: CU5bpHWkTA2/F/oAZV1mSA==
X-CSE-MsgGUID: 58tuAslNQfGcEVZLuXcwOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72049770"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72049770"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 02:28:09 -0800
X-CSE-ConnectionGUID: cQCzTkfFQKKxf3RmXBYxdA==
X-CSE-MsgGUID: HkiJXxakQXin3pV0gg8pbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198428888"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 02:28:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXGfV-000000005Xt-0r7k;
	Sun, 21 Dec 2025 10:28:05 +0000
Date: Sun, 21 Dec 2025 18:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202512211859.amJfn4AI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   250657e3e4fa0189d0ebf710093551ba4a1ea9c1
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [1/1] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: arm64-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20251221/202512211859.amJfn4AI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211859.amJfn4AI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211859.amJfn4AI-lkp@intel.com/

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
