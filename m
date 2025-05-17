Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A95F76026
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 02:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747448997; cv=none; b=tlqHgN8ommL9pPSeTzcwa50ufdXkJkib0oPovLYU8+3CO2vXDR9DIfWq3h2bs424/m+W5r7UVE/u8wh/O8lxW+X1D2sXANWvTB4tkvqWcUn45HK6DA5IYNgGjbsuvTFOd6sK0ezV1Q/cG9+7UPjGiLdY+PuPnBkiG1tZgryXn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747448997; c=relaxed/simple;
	bh=yEwswkgXAuwvtquI4uBlr+Qk88HoRv+hayRrjSNWQvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OE2LgsEDB1gVwt8UjlPSO9cXxIaNP3aMpw6ZffftC/i6cVzryImirF4abydyg3J+E/pZCXLjcVt0ytAR2+nIsGS+OG8XqNQDCuPmLjsqpWYi7f/3kpqZqaOiL46t3ohCFUHaCxQNrYDMfsy7s32XnbPhm33wElvs6J1BX3eVY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnPFYoG3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnPFYoG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747448995; x=1778984995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEwswkgXAuwvtquI4uBlr+Qk88HoRv+hayRrjSNWQvg=;
  b=VnPFYoG3qZwtskYcMlQ2z3/0J97oqZuOyej2MECIHG3u3py6hgozuP82
   CSAqK27CLCd+I2Z4zy5Er4ZCH0E1sQ7xs2wDmUw/qqwAD1SmhwxtGRnqY
   5GiSwN/drNdIPr56GOdzhE64Dfh2IIglfZPGESEw1KwA6Z1klUMJDlzCV
   SBI948znU6ylKQok/MqCQSNuJ1BE5q3Gi5+oSgmYCgCCYXzrFDpJ2Mo6w
   uhA/LHjIfpQXlxZYpBNo9Yy9NB0XF1RblR+cuQJ8nutJVliBUf39kBD7X
   JuMryNbOI7CIUji3H0CxrN/3Dn9He8bCQ690egeu6aQX5Gcx6uXaQ+SiH
   Q==;
X-CSE-ConnectionGUID: PCxxt6iRRoe/CcH0jAIQCA==
X-CSE-MsgGUID: Uhied8wHQqeYsuJUfCNN4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49586454"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49586454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 19:29:54 -0700
X-CSE-ConnectionGUID: tyf19wX5TC2jy9Dp67UCxw==
X-CSE-MsgGUID: yxSeIohLS+OG954HMh1Scw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="139747374"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 May 2025 19:29:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG7J8-000Jsl-2F;
	Sat, 17 May 2025 02:29:50 +0000
Date: Sat, 17 May 2025 10:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/linux/compiler.h:57:31:
 warning: 'tick_cpu' is used uninitialized in this function
Message-ID: <202505171022.CLxjNz1n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1d830abe1014090224fb5d92afa8a80a5cdbd221
commit: a94ba5ab288780f141d741107751b4866bc24be3 [1/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: arm64-randconfig-004-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171022.CLxjNz1n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171022.CLxjNz1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171022.CLxjNz1n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/tick-sched.c:11:
   kernel/time/tick-sched.c: In function 'tick_sched_do_timer':
>> include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized in this function [-Wuninitialized]
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                  ^~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:188:6: note: 'tick_cpu' was declared here
     int tick_cpu, cpu = smp_processor_id();
         ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]


vim +/tick_cpu +57 include/linux/compiler.h

a15fd609ad53a6 Linus Torvalds 2019-03-20  56  
a15fd609ad53a6 Linus Torvalds 2019-03-20 @57  #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
a15fd609ad53a6 Linus Torvalds 2019-03-20  58  

:::::: The code at line 57 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
