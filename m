Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D31E4A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739018579; cv=none; b=V9UfAjVUMJzJImZXrK0o+JVtby6rMf2CuntUHHL6EXhW09danzd8T+PJmY/k7GT/HMtOMjIAVNiJlfx7leqHI/ycx8Mo0+K4ry3Eb8f7EM04ZD12nVPDG2ATEBLg2JU5NG5JshYSt1x9+wDZDneYtRxe9iSv4AvvVppGBC03lMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739018579; c=relaxed/simple;
	bh=wGTzBXghaA7IPpHJPlLq6ckgQurwSJaZL4tqg/VvJrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ve8x5QkqoOYQKxmoZaqViGBn/07PLpBdheWsn/FaIfzaI4AF0meMyyW38F7zfMhXyjWyF/LaHEsanDWtwTWAQo86O7ct1nN5eX0GadLx/sjHFzv6ggow2PYCxoWXQrX2higVgM1AVLcaHuWOuyrgDKz17Hyst8Eb22DTLTcIEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sea/mToB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sea/mToB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739018578; x=1770554578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGTzBXghaA7IPpHJPlLq6ckgQurwSJaZL4tqg/VvJrc=;
  b=Sea/mToBAzHEujvnmtAWGa8V3V6sFH8qI/5W6A54qAXvS7b/VV4MGH0C
   F18rO7vTl9A7AMud544R/YgYeEyISo87u3z/ZEJc5eQdE+ezA58ZJOJ8x
   J3a/G2pHcqY3xPzHMxiG3BJ1aYsSP+b75VKyEbr8He3KSJSyzs/06pLOm
   luGCYMY9i+IBz+gAG4Ujpm69SnSHHQ1xfx3OowLjfJG8H/AM2WblxezxP
   D9vrTkR37wyJ9+lewT5Ccsmkq9fOqCqWj648W0j2JVM1vtJCp+5RTojku
   5VUfmakanRYrRMPnUKVZAVyJLCTqbaeq8kpBDJFSuW870IRLgEVNnJkhT
   A==;
X-CSE-ConnectionGUID: vPw8O2CrTP+t2YP5fefDfg==
X-CSE-MsgGUID: 8gGbVGTNQaKcSG2dPABCjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="62128321"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="62128321"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:42:55 -0800
X-CSE-ConnectionGUID: Zyxk0YX3SgCHhq3v0MNKWw==
X-CSE-MsgGUID: ABdxYaeUQDyjsQD4jrOoFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116368380"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 04:42:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgkAd-000zyR-17;
	Sat, 08 Feb 2025 12:42:51 +0000
Date: Sat, 8 Feb 2025 20:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 2/2] include/linux/security.h:2379:12:
 warning: no previous prototype for 'security_uring_allowed'
Message-ID: <202502082035.BzdH69pj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   c6ad9fdbd44b78f51fa50138247694774ab99e97
commit: c6ad9fdbd44b78f51fa50138247694774ab99e97 [2/2] io_uring,lsm,selinux: add LSM hooks for io_uring_setup()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250208/202502082035.BzdH69pj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082035.BzdH69pj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082035.BzdH69pj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from lib/kobject_uevent.c:24:
>> include/linux/security.h:2379:12: warning: no previous prototype for 'security_uring_allowed' [-Wmissing-prototypes]
    2379 | extern int security_uring_allowed(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:102,
                    from include/net/addrconf.h:65,
                    from lib/vsprintf.c:41:
>> include/linux/security.h:2379:12: warning: no previous prototype for 'security_uring_allowed' [-Wmissing-prototypes]
    2379 | extern int security_uring_allowed(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1704:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1704 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~


vim +/security_uring_allowed +2379 include/linux/security.h

  2359	
  2360	#ifdef CONFIG_IO_URING
  2361	#ifdef CONFIG_SECURITY
  2362	extern int security_uring_override_creds(const struct cred *new);
  2363	extern int security_uring_sqpoll(void);
  2364	extern int security_uring_cmd(struct io_uring_cmd *ioucmd);
  2365	extern int security_uring_allowed(void);
  2366	#else
  2367	static inline int security_uring_override_creds(const struct cred *new)
  2368	{
  2369		return 0;
  2370	}
  2371	static inline int security_uring_sqpoll(void)
  2372	{
  2373		return 0;
  2374	}
  2375	static inline int security_uring_cmd(struct io_uring_cmd *ioucmd)
  2376	{
  2377		return 0;
  2378	}
> 2379	extern int security_uring_allowed(void)
  2380	{
  2381		return 0;
  2382	}
  2383	#endif /* CONFIG_SECURITY */
  2384	#endif /* CONFIG_IO_URING */
  2385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
