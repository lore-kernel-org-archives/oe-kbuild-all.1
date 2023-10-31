Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709222320
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g41TDNhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698793461; x=1730329461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/u2oKAZ1mmHGePXERbqCG23E8eGVQMV6pMr/k8fFQp4=;
  b=g41TDNhdAm/gAoqAJC5vG25+YvBm1bP5HJUSWtAqPFWAMQfOAO4YpzNW
   2C6J2GoQWEAOT2WWTGZZkPy73tD9fwIL7wvs9qCsPwiC/mGWCLqp7WV8s
   dcrroCl9G+L09kGU6B3r/k++TK3m2+C6ZtRrgp1BLJfGy++M4dmKiPRjI
   yMlGpHtfAVZMUd7tdwXelUr2p6z3jyfJwlu+3iswzyOEajIcnCmloypv6
   p5dp99Ox6Fyk1US2A4qYRgWSiD47SmgyyiIN0y3INVhmHx6RjJ9ekqnUb
   WdwchCwbScxAW1PjT56YUFoYs1yKsHZI56SND9J3MKqs9lGwctb4XqNpG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387276537"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="387276537"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 16:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="8855376"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2023 16:03:57 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxxm6-0000Rr-2w;
	Tue, 31 Oct 2023 23:03:54 +0000
Date: Wed, 1 Nov 2023 07:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael =?iso-8859-1?Q?Wei=DF?= <michael.weiss@aisec.fraunhofer.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v2 09/14] lsm: Add
 security_inode_mknod_nscap() hook
Message-ID: <202311010659.KqmNyXqq-lkp@intel.com>
References: <20231025094224.72858-10-michael.weiss@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025094224.72858-10-michael.weiss@aisec.fraunhofer.de>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 58720809f52779dc0f08e53e54b014209d13eebb]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wei/device_cgroup-Implement-devcgroup-hooks-as-lsm-security-hooks/20231025-174946
base:   58720809f52779dc0f08e53e54b014209d13eebb
patch link:    https://lore.kernel.org/r/20231025094224.72858-10-michael.weiss%40aisec.fraunhofer.de
patch subject: [RESEND RFC PATCH v2 09/14] lsm: Add security_inode_mknod_nscap() hook
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20231101/202311010659.KqmNyXqq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311010659.KqmNyXqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010659.KqmNyXqq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from arch/sparc/kernel/setup_32.c:24:
   include/linux/security.h:1408:1: error: expected identifier or '(' before '{' token
    1408 | {
         | ^
>> include/linux/security.h:1405:19: error: 'security_inode_mknod_nscap' declared 'static' but never defined [-Werror=unused-function]
    1405 | static inline int security_inode_mknod_nscap(struct inode *dir,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1405 include/linux/security.h

  1384	
  1385	static inline int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen)
  1386	{
  1387		return -EOPNOTSUPP;
  1388	}
  1389	static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
  1390	{
  1391		return -EOPNOTSUPP;
  1392	}
  1393	static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
  1394	{
  1395		return -EOPNOTSUPP;
  1396	}
  1397	static inline int security_locked_down(enum lockdown_reason what)
  1398	{
  1399		return 0;
  1400	}
  1401	static inline int security_dev_permission(umode_t mode, dev_t dev, int mask)
  1402	{
  1403		return 0;
  1404	}
> 1405	static inline int security_inode_mknod_nscap(struct inode *dir,
  1406						     struct dentry *dentry,
  1407						     umode_t mode, dev_t dev);
  1408	{
  1409		return -EPERM;
  1410	}
  1411	#endif	/* CONFIG_SECURITY */
  1412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
