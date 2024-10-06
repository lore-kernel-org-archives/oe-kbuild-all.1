Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28FDEAD8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728222443; cv=none; b=LaAaBb1A2Bp1fSyVBn2I+OKlozg/RpodmOsQYr4qvRz47oJyJ4X0zzdcucuAm1lBkmwSqIuPAAMjuEXG6Ov6sFnSBcHaLZNPP65N5l8u1pWZ1b29I9LxXL/9O6Sv3zVzpXUYGuhAf2+LbjlPCT4Q/EDXzNUl4J4WxHVICGSRhNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728222443; c=relaxed/simple;
	bh=61cpP7Bn7HqrjdW2UKf3s0G7UsaaDrspGRT6Y1QwQS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKaPOXxlDJ947cMPK/j3JUjGlQGnjlFljoQWfxe2ks0hNf6kT8A1JxSMIlK95mY9c22ZgTvVEbp9JDYBeIDZ9AdUlmJaQYu5zjJMmQ3Z97QspJTlP981VVyaspM6X9k86igqsH6jca5WeJ3+OWjXn3GCRDvmSGNd0zEPuNr/f/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyyQdrQw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyyQdrQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728222441; x=1759758441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61cpP7Bn7HqrjdW2UKf3s0G7UsaaDrspGRT6Y1QwQS0=;
  b=QyyQdrQwVusVEPfcUVJJmHMZAz618x/m+Gik1whT9ObLvvk9NUq5Tb9e
   BUlYUGqL/5iltPizENzuhj8MRsr2hHZK6/OzyBq4o84yxnrD4tr8jIVno
   g/TDa+xJT7G7jkYyUB1YMJL9HOvQ6tvzu2GaZJ/zof3IjdeUpron7rwCV
   7XkyvcxvLbgOUaS1T8zC00ZJG2en4O+2D6Wzzp2OSiJUsINaJrd9mEhc8
   qOprkqdMTWzB33fxUhfioV28Jp/WxfB25d9xhvcuu4FHJKKaZXhw9ZX6R
   w5v8/Eecu3gKc4IcbJVdRrszJKEKRYQlLpgdN48aTXUB4rdoKl9B8/qp2
   w==;
X-CSE-ConnectionGUID: zl/TjGVYTxayI1N15adOyw==
X-CSE-MsgGUID: SD2om5FwR1ep1h9+kpS8eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38744892"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="38744892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 06:47:20 -0700
X-CSE-ConnectionGUID: 4NxQGcmsTAyA2dnq54kVfQ==
X-CSE-MsgGUID: B1xbPDj0SiOgvWk0mGHGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75179609"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Oct 2024 06:47:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxRbQ-0003uj-13;
	Sun, 06 Oct 2024 13:47:16 +0000
Date: Sun, 6 Oct 2024 21:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 6661/23811] kernel/signal.o: warning:
 objtool: missing symbol for section .text.unlikely
Message-ID: <202410062155.gpahLOpk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: f1bfcb97c436ae547c2889f3a25d74d85867e09f [6661/23811] kernel/signal.c: trace_signal_deliver when signal_group_exit
config: x86_64-buildonly-randconfig-003-20240925 (https://download.01.org/0day-ci/archive/20241006/202410062155.gpahLOpk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410062155.gpahLOpk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410062155.gpahLOpk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/signal.h:128:9: note: here
     128 |         case 2:                                                         \
         |         ^~~~
   include/linux/signal.h:141:1: note: in expansion of macro '_SIG_SET_BINOP'
     141 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:130:27: warning: this statement may fall through [-Wimplicit-fallthrough=]
     130 |                 r->sig[1] = op(a1, b1);                                 \
         |                           ^
   include/linux/signal.h:141:1: note: in expansion of macro '_SIG_SET_BINOP'
     141 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:131:9: note: here
     131 |         case 1:                                                         \
         |         ^~~~
   include/linux/signal.h:141:1: note: in expansion of macro '_SIG_SET_BINOP'
     141 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h: In function 'sigandsets':
   include/linux/signal.h:127:27: warning: this statement may fall through [-Wimplicit-fallthrough=]
     127 |                 r->sig[2] = op(a2, b2);                                 \
         |                           ^
   include/linux/signal.h:144:1: note: in expansion of macro '_SIG_SET_BINOP'
     144 | _SIG_SET_BINOP(sigandsets, _sig_and)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:128:9: note: here
     128 |         case 2:                                                         \
         |         ^~~~
   include/linux/signal.h:144:1: note: in expansion of macro '_SIG_SET_BINOP'
     144 | _SIG_SET_BINOP(sigandsets, _sig_and)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:130:27: warning: this statement may fall through [-Wimplicit-fallthrough=]
     130 |                 r->sig[1] = op(a1, b1);                                 \
         |                           ^
   include/linux/signal.h:144:1: note: in expansion of macro '_SIG_SET_BINOP'
     144 | _SIG_SET_BINOP(sigandsets, _sig_and)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:131:9: note: here
     131 |         case 1:                                                         \
         |         ^~~~
   include/linux/signal.h:144:1: note: in expansion of macro '_SIG_SET_BINOP'
     144 | _SIG_SET_BINOP(sigandsets, _sig_and)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h: In function 'sigandnsets':
   include/linux/signal.h:127:27: warning: this statement may fall through [-Wimplicit-fallthrough=]
     127 |                 r->sig[2] = op(a2, b2);                                 \
         |                           ^
   include/linux/signal.h:147:1: note: in expansion of macro '_SIG_SET_BINOP'
     147 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:128:9: note: here
     128 |         case 2:                                                         \
         |         ^~~~
   include/linux/signal.h:147:1: note: in expansion of macro '_SIG_SET_BINOP'
     147 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:130:27: warning: this statement may fall through [-Wimplicit-fallthrough=]
     130 |                 r->sig[1] = op(a1, b1);                                 \
         |                           ^
   include/linux/signal.h:147:1: note: in expansion of macro '_SIG_SET_BINOP'
     147 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~
   include/linux/signal.h:131:9: note: here
     131 |         case 1:                                                         \
         |         ^~~~
   include/linux/signal.h:147:1: note: in expansion of macro '_SIG_SET_BINOP'
     147 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~
   kernel/signal.c: In function 'check_kill_permission':
   kernel/signal.c:830:34: warning: this statement may fall through [-Wimplicit-fallthrough=]
     830 |                         if (!sid || sid == task_session(current))
         |                             ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/signal.c:832:17: note: here
     832 |                 default:
         |                 ^~~~~~~
   include/linux/signal.h: In function 'signotset':
   include/linux/signal.h:159:29: warning: this statement may fall through [-Wimplicit-fallthrough=]
     159 |                 set->sig[2] = op(set->sig[2]);                          \
         |                             ^
   include/linux/signal.h:169:1: note: in expansion of macro '_SIG_SET_OP'
     169 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~
   include/linux/signal.h:160:9: note: here
     160 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |         ^~~~
   include/linux/signal.h:169:1: note: in expansion of macro '_SIG_SET_OP'
     169 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~
   include/linux/signal.h:160:29: warning: this statement may fall through [-Wimplicit-fallthrough=]
     160 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                             ^
   include/linux/signal.h:169:1: note: in expansion of macro '_SIG_SET_OP'
     169 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~
   include/linux/signal.h:161:9: note: here
     161 |         case 1: set->sig[0] = op(set->sig[0]);                          \
         |         ^~~~
   include/linux/signal.h:169:1: note: in expansion of macro '_SIG_SET_OP'
     169 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~
>> kernel/signal.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
