Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA81078F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588873; cv=none; b=hfCSf8GIThaLeFk5a+Ecjt2Y+mxYcsoYSl6FFv/1o5xmkx11HRaQMMov9FVYC/6iDv1fOMM00Cl3jdLQjRl9Zt+k7X32UWy8U+aVJLEqCvkhRdjxv583i46nTqmNhcZ87REZNChvfuMkJyDQlprz3BtUTJ2HFLBMxKIf3FtEjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588873; c=relaxed/simple;
	bh=VyembnBotM04Ug8Lahll5QDca4jj7Ran8Uf8iPjo0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u68KuT/y/P6/GmaOrFCgOSoXxKFrSVS5LEzgEirXusw0AJqjwhmsHyDHBpZCBz3GvD/HY+MKI9L/oOYZQtfdfvfkfOyV5k52GT+nhaJR3tFgfJY7Wqs6bZ2+WwJ3EclcmCNMPfkviNQerQsjAn+KqsZr/3pX14i9cK61HD9uoBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwAW4i0/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwAW4i0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743588871; x=1775124871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyembnBotM04Ug8Lahll5QDca4jj7Ran8Uf8iPjo0Ps=;
  b=RwAW4i0/wJeWuZb8+ZzwQ7bPr4xAck0ImB28V3XYxufs9lIFELjZkILN
   HvSPYv43urStf4vBm33x9qWzkWXOYh9eqTkULy/TOD26rPSXHl7dp+d9z
   0SMlk0MpJ47PCra17+sGwV6OCZupiARHCUNgyuEqZI3BwkiQCG78bb0Lo
   EeEvMKU86RBwKbMVdbPGW4r5vs0Zgd8mYW7JtaUagISxReWeyF+b/9tK0
   dHhCm0SiLftkVKCn4jGKAt71a95GxeTqV2QHcPd6e21jOpnhwf1uCTwPl
   fsJxLXF/UkepLEAIM90PcIptL7SbBBhMg2JS6jPnlMO9jkq38wsDMgBqn
   Q==;
X-CSE-ConnectionGUID: wdV9kLlmQOGkmFVaxZkfkQ==
X-CSE-MsgGUID: ms1KbG7cQ428kIjd9lNdZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="32547257"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="32547257"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 03:14:30 -0700
X-CSE-ConnectionGUID: /Rr5M2xdR1KQ65I5EvKksA==
X-CSE-MsgGUID: wkNDy2RaQpSKfW+HfR+fHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; 
   d="scan'208";a="149842399"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Apr 2025 03:14:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzv74-000Aby-2j;
	Wed, 02 Apr 2025 10:14:26 +0000
Date: Wed, 2 Apr 2025 18:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1546/1546]
 include/linux/uaccess.h:115:17: warning: 'stats' may be used uninitialized
Message-ID: <202504021807.twewxnJE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guillaume,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7951fd324625a8af5097e1476cdc8c33c6009b48
commit: 528534f0deda05c668756313a22974429a9df05a [1546/1546] l2tp: remove pppol2tp_tunnel_ioctl()
config: arm64-randconfig-002-20250401 (https://download.01.org/0day-ci/archive/20250402/202504021807.twewxnJE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021807.twewxnJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021807.twewxnJE-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   net/l2tp/l2tp_ppp.c: In function 'pppol2tp_ioctl':
   net/l2tp/l2tp_ppp.c:1122:13: warning: variable 'val' set but not used [-Wunused-but-set-variable]
    1122 |         int val;
         |             ^~~
   In file included from net/l2tp/l2tp_ppp.c:62:
   net/l2tp/l2tp_ppp.c: At top level:
   include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'pppol2tp_init': 'cold' [-Wmissing-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   net/l2tp/l2tp_ppp.c:1802:1: note: in expansion of macro 'module_init'
    1802 | module_init(pppol2tp_init);
         | ^~~~~~~~~~~
   net/l2tp/l2tp_ppp.c:1754:19: note: 'init_module' target declared here
    1754 | static int __init pppol2tp_init(void)
         |                   ^~~~~~~~~~~~~
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'pppol2tp_exit': 'cold' [-Wmissing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   net/l2tp/l2tp_ppp.c:1803:1: note: in expansion of macro 'module_exit'
    1803 | module_exit(pppol2tp_exit);
         | ^~~~~~~~~~~
   net/l2tp/l2tp_ppp.c:1792:20: note: 'cleanup_module' target declared here
    1792 | static void __exit pppol2tp_exit(void)
         |                    ^~~~~~~~~~~~~
   In file included from net/l2tp/l2tp_ppp.c:65:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:147:7,
       inlined from 'pppol2tp_ioctl' at net/l2tp/l2tp_ppp.c:1163:8:
>> include/linux/uaccess.h:115:17: warning: 'stats' may be used uninitialized [-Wmaybe-uninitialized]
     115 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:246,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9:
   include/linux/kasan-checks.h: In function 'pppol2tp_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/l2tp/l2tp_ppp.c:1120:35: note: 'stats' declared here
    1120 |         struct pppol2tp_ioc_stats stats;
         |                                   ^~~~~


vim +/stats +115 include/linux/uaccess.h

d597580d373774 Al Viro 2017-03-20  107  
d597580d373774 Al Viro 2017-03-20  108  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro 2017-03-20  109  static inline unsigned long
d597580d373774 Al Viro 2017-03-20  110  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro 2017-03-20  111  {
d597580d373774 Al Viro 2017-03-20  112  	unsigned long res = n;
9c5f6908de03a4 Al Viro 2017-06-29  113  	might_fault();
9c5f6908de03a4 Al Viro 2017-06-29  114  	if (likely(access_ok(VERIFY_READ, from, n))) {
9c5f6908de03a4 Al Viro 2017-06-29 @115  		kasan_check_write(to, n);
d597580d373774 Al Viro 2017-03-20  116  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro 2017-06-29  117  	}
d597580d373774 Al Viro 2017-03-20  118  	if (unlikely(res))
d597580d373774 Al Viro 2017-03-20  119  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro 2017-03-20  120  	return res;
d597580d373774 Al Viro 2017-03-20  121  }
d597580d373774 Al Viro 2017-03-20  122  #else
d597580d373774 Al Viro 2017-03-20  123  extern unsigned long
d597580d373774 Al Viro 2017-03-20  124  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro 2017-03-20  125  #endif
d597580d373774 Al Viro 2017-03-20  126  

:::::: The code at line 115 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
