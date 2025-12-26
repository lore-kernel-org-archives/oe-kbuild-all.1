Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF122083
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 03:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720128; cv=none; b=gDtEocy3RX6DV+TlQE3o38//uPD8QEAlApzcIAvjIc4ib2tb0imY9yZU7DvTGLu5P60bCtundayP3KnU7hf7rqJa2VDoB1WDF4ftBoQx/Ve3yTp7doM9+dRXy4yADbcvZgJBO0RjO1GClJrTT35G/oWsj6iJbCDSr15pmoIj/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720128; c=relaxed/simple;
	bh=zl6ycWvb8DnaaP8UMMgrWTSCHTmIqiIwiExjxwkfOS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M3n4HEU4DetHzWqQWDkJnezXoxvfRC7PaRjAo3jmyDQ94xy1joHAD5zBy7pioNkPvJypLZB93pd+Qo1F5CrnAwOfoNekkvRysbWJccD5PXgab3Hio3Eg/gzGAUV7o1U+C/FtJgiAa2IPacnQ4X+wLYoxAYrvxss96h/hjGxiSag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hftLeaPS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hftLeaPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766720126; x=1798256126;
  h=date:from:to:cc:subject:message-id;
  bh=zl6ycWvb8DnaaP8UMMgrWTSCHTmIqiIwiExjxwkfOS0=;
  b=hftLeaPS61uxv3iwbqBVL7tQhlxsaCxn04t3i4ihMgcfhWF87k4JML9t
   zhC1cVI3WdHkvWCAprN9tQRpOXu4NYka+bzbDahyOXeA7MQnCq+A3Ut8w
   UQsaXq8abRpjLB3qzV5dWEUjKKsoSWs203wf9cGwBg4L1Q0E8ciiNwdgc
   +R3KDuDJYO5r0j1UnJOwH6PJX6tkwFsqNaijqNpa56Wi478UurxZLIZHP
   tpOpcB5gQFXOjfvs3mt68qjndRtjqPicT9D6VSNxg1wESIrvZ5vfBsoaG
   pxZvQiv7d8HwxksNwP5/QumGVTFNM33fzvlLpV7tZHfaWK7tsTdo8wVpV
   w==;
X-CSE-ConnectionGUID: 4wqxJVNPSvSvJ2INSyTjOA==
X-CSE-MsgGUID: HP5QzmViThu4EUHF+htYqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78799217"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="78799217"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 19:35:26 -0800
X-CSE-ConnectionGUID: tk812J/BREy1AP5UutH+Lw==
X-CSE-MsgGUID: BkZocAjsSIeTLeO5tV2mOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200226470"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2025 19:35:24 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYybp-000000004fD-3sIE;
	Fri, 26 Dec 2025 03:35:21 +0000
Date: Fri, 26 Dec 2025 11:34:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized
Message-ID: <202512261159.Y86jw4A2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   30a5c216991a5dd3eed018653101c71e1e657af8
commit: a94ba5ab288780f141d741107751b4866bc24be3 [0/2] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: x86_64-buildonly-randconfig-006-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261159.Y86jw4A2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261159.Y86jw4A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261159.Y86jw4A2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/tick-sched.c:11:
   include/linux/compiler.h: In function 'tick_sched_do_timer':
>> include/linux/compiler.h:57:31: warning: 'tick_cpu' is used uninitialized [-Wuninitialized]
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                               ^~~~~~~~~~~~~~~~~~~~
   kernel/time/tick-sched.c:188:13: note: 'tick_cpu' was declared here
     188 |         int tick_cpu, cpu = smp_processor_id();
         |             ^~~~~~~~


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
