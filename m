Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF513CA97
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608438; cv=none; b=sI0tjngEazRt+9qiN7Nz2zPHHv3J2itBSTGvxONCWqGKvAxXB6BDCQi87r6DH5uWtBz7ZFnd6vMZA2XGe1z9zliLIq6cQosGGR8xb807ojYNyDaGr3iYmGp90k+qMshWQEUgwxQrc99emnM75WKDC5DQlEfKUyeRmxsj+w3Qojw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608438; c=relaxed/simple;
	bh=Cs8v/r7SglmVUAAz1NVCr9/Oue6GszHn62LBctvgqV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLgwCGOYYGD9VaywP4n1eKi+gN7lqqjFC0Az1Hl/FLLHpFXJU9P5vLYHt/NFOB++X+ELAdJgYmrL96yTzd90NVqwMCgLPy7jGZJFKN+ieYxYRisa/tqrOtcnCU8sN8l4wStMtogUF5Vmhh7LZD8Wxma+rx1GokqQ0aSKdJ09xjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJAbxa9I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJAbxa9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749608436; x=1781144436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cs8v/r7SglmVUAAz1NVCr9/Oue6GszHn62LBctvgqV4=;
  b=cJAbxa9I5ZFF9NyPqzh0TAaCjgCKjN/oMt4ekab/muXjU3DdS2twZ38G
   z5J6GfhiT97mKqaYTzau+ybjEcwOIBBwZMDafcmFkmw4vYxcxs7ihwhVm
   TFPQeTu/e3F60HfUDyUdnmodb4QGyEclS4zUN0DTbAE8gEy4Kgqe0fqBF
   E9vJU+Hu7ulHKa4cpaoA2TY4mPBWI6HspoSBCtMywcE4MMRqqYpFOEp3b
   3qJav6kQumjTy1zxz7vFZGfAoYr0CQ/QXwGZTr/wXvYRhZgZs56+VqecA
   DKA61x8e56na8qbKz8eIzOX9rr7ZhycggoPLkMZ0yn2jtRu6PtO7zZyAl
   Q==;
X-CSE-ConnectionGUID: Ld1qEBdFSBan6mgSajOagA==
X-CSE-MsgGUID: 3Jx9butdSsuUh/G+Lg7TXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51652525"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51652525"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 19:20:35 -0700
X-CSE-ConnectionGUID: 1Dz/gZyISAyLQYT+YJUV8Q==
X-CSE-MsgGUID: BbY2wlpFTJeN/sddygMAJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="152007606"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jun 2025 19:20:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPB4p-0009py-2c;
	Wed, 11 Jun 2025 02:20:31 +0000
Date: Wed, 11 Jun 2025 10:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Liang <wangliang74@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954] include/trace/trace_events.h:27:23:
 warning: 'str__oenetcls__trace_system_name' defined but not used
Message-ID: <202506111017.uCAP8oQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   90ff3e07cc268a8e40bd578dcc4907a3db419c52
commit: d60758b0ffcd28339b899dcd5dc7416019a69b53 [2954/2954] net/oenetcls: introduce oenetcls for network optimization
config: x86_64-randconfig-r112-20250610 (https://download.01.org/0day-ci/archive/20250611/202506111017.uCAP8oQv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111017.uCAP8oQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111017.uCAP8oQv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/oenetcls.h:41,
                    from drivers/hooks/vendor_hooks.c:12:
>> include/trace/trace_events.h:27:23: warning: 'str__oenetcls__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/str__oenetcls__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
