Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72259199B9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 03:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727924515; cv=none; b=eklL4/q1UZMSUWb88Li6ep1auChlXDc5AveyCtanwWqWjFdbFzFy1yiq7YrgYkvPaOqoZaTFyanqe+cZwNU3uStuI4IBJdPc+xye5tDdOYUvAsPzmwmp5ca/vF6FUvzNYjmGrXLui8nQX/v/OEV5wm4E5fgKs4VbNYj4WoWvGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727924515; c=relaxed/simple;
	bh=fkcT4/IqEnPyRLYn0PCsmjTCVLAFNa1N3UX3ZA9VPyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eAJHVMvNWgKOVsHN9jgD6QUlC5XSlU9gYRonGX39eN8+GjjSyudBmCs4nmiEmAiKmavw9Ej+V9ulO1JrckZLJ3UlS4WKIGlal1JcUh7q+n9MHSi4TNAVSmwh3tzOAb/J0HLUV+yJbwe764+3rlaBY13aHMt9mmfPKSQHnIQbrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwjMM1UB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwjMM1UB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727924513; x=1759460513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fkcT4/IqEnPyRLYn0PCsmjTCVLAFNa1N3UX3ZA9VPyc=;
  b=QwjMM1UBouv496bSZOO80ibWNet8Sz0EyjlCYO02ZtsXQ/wqhTUbeO3Q
   hBCvoMZtqwX36Id699U0wP72LwqYid/uVvTLM9lQCEd//7YJshu4kzBXs
   rTXoGY0uwlR9B+a/Ys4cwQWEAwRmZjMBHS9eG0QV+EMI6wy4SQkEApYnX
   rjh/+alm44IdhxGiM5Ttc3Y1NE84o/2qVhu0nqAoRM5d++CWRDZOH7Zbt
   ZJHfDE/LESuirsHWbrD6QubiiJKqiooZjcZmJRac8eGa9R4OEsiKd+ivO
   xpAt5gajwVaMRkbTB0pYDcvhjTJTXTqL5mmF0RfgQdFpEj1/NU+GMLz7S
   w==;
X-CSE-ConnectionGUID: 29LYi4vjQSuTRckZ2I0tpA==
X-CSE-MsgGUID: DoQI2HkPSVC2XQV3Z+CJig==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38467512"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="38467512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 20:01:52 -0700
X-CSE-ConnectionGUID: sv/zdwcQTGa0FsaUJHCYAg==
X-CSE-MsgGUID: zbOhnypITQiCg0nYsvd1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74210504"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2024 20:01:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swC69-000UsJ-1m;
	Thu, 03 Oct 2024 03:01:49 +0000
Date: Thu, 3 Oct 2024 11:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st56-rt51 169/395] kernel/workqueue.c:336:30: warning:
 'pendingb_lock' defined but not used
Message-ID: <202410031053.lLrW8AQd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st56-rt51
head:   83b6d202216c6d5a6a328dc895dd1b7005dedd92
commit: 8eec371b05a6c70df656c495d3bc2a6d6f7645ce [169/395] workqueue: Use local irq lock instead of irq disable regions
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410031053.lLrW8AQd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031053.lLrW8AQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031053.lLrW8AQd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/linkage.h:4:0,
                    from include/linux/kernel.h:6,
                    from kernel/workqueue.c:28:
   arch/parisc/include/asm/uaccess.h: In function 'copy_from_user':
   arch/parisc/include/asm/uaccess.h:251:63: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
            if (likely(sz == -1 || !__builtin_constant_p(n) || sz >= n))
                                                                  ^
   include/linux/compiler.h:181:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   In file included from include/linux/mempolicy.h:14:0,
                    from kernel/workqueue.c:39:
   include/linux/pagemap.h: In function 'fault_in_multipages_readable':
   include/linux/pagemap.h:632:16: warning: variable 'c' set but not used [-Wunused-but-set-variable]
     volatile char c;
                   ^
   In file included from kernel/workqueue.c:46:0:
   kernel/workqueue.c: In function 'show_pwq':
   include/linux/hashtable.h:122:51: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for ((bkt) = 0, obj = NULL; obj == NULL && (bkt) < HASH_SIZE(name);\
                                                      ^
   kernel/workqueue.c:4317:2: note: in expansion of macro 'hash_for_each'
     hash_for_each(pool->busy_hash, bkt, worker, hentry) {
     ^~~~~~~~~~~~~
   include/linux/hashtable.h:122:51: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for ((bkt) = 0, obj = NULL; obj == NULL && (bkt) < HASH_SIZE(name);\
                                                      ^
   kernel/workqueue.c:4327:3: note: in expansion of macro 'hash_for_each'
      hash_for_each(pool->busy_hash, bkt, worker, hentry) {
      ^~~~~~~~~~~~~
   In file included from kernel/workqueue.c:45:0:
   include/linux/jhash.h: In function 'jhash':
   include/linux/jhash.h:90:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 12: c += (u32)k[11]<<24;
              ~~^~~~~~~~~~~~~~~~~
   include/linux/jhash.h:91:2: note: here
     case 11: c += (u32)k[10]<<16;
     ^~~~
   include/linux/jhash.h:91:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 11: c += (u32)k[10]<<16;
              ~~^~~~~~~~~~~~~~~~~
   include/linux/jhash.h:92:2: note: here
     case 10: c += (u32)k[9]<<8;
     ^~~~
   include/linux/jhash.h:92:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 10: c += (u32)k[9]<<8;
              ~~^~~~~~~~~~~~~~~
   include/linux/jhash.h:93:2: note: here
     case 9:  c += k[8];
     ^~~~
   include/linux/jhash.h:93:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 9:  c += k[8];
              ~~^~~~~~~
   include/linux/jhash.h:94:2: note: here
     case 8:  b += (u32)k[7]<<24;
     ^~~~
   include/linux/jhash.h:94:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 8:  b += (u32)k[7]<<24;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:95:2: note: here
     case 7:  b += (u32)k[6]<<16;
     ^~~~
   include/linux/jhash.h:95:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 7:  b += (u32)k[6]<<16;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:96:2: note: here
     case 6:  b += (u32)k[5]<<8;
     ^~~~
   include/linux/jhash.h:96:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 6:  b += (u32)k[5]<<8;
              ~~^~~~~~~~~~~~~~~
   include/linux/jhash.h:97:2: note: here
     case 5:  b += k[4];
     ^~~~
   include/linux/jhash.h:97:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 5:  b += k[4];
              ~~^~~~~~~
   include/linux/jhash.h:98:2: note: here
     case 4:  a += (u32)k[3]<<24;
     ^~~~
   include/linux/jhash.h:98:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 4:  a += (u32)k[3]<<24;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:99:2: note: here
     case 3:  a += (u32)k[2]<<16;
     ^~~~
   include/linux/jhash.h:99:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 3:  a += (u32)k[2]<<16;
              ~~^~~~~~~~~~~~~~~~
   include/linux/jhash.h:100:2: note: here
     case 2:  a += (u32)k[1]<<8;
     ^~~~
   include/linux/jhash.h:100:13: warning: this statement may fall through [-Wimplicit-fallthrough=]
     case 2:  a += (u32)k[1]<<8;
              ~~^~~~~~~~~~~~~~~
   include/linux/jhash.h:101:2: note: here
     case 1:  a += k[0];
     ^~~~
   In file included from kernel/workqueue.c:51:0:
   At top level:
>> kernel/workqueue.c:336:30: warning: 'pendingb_lock' defined but not used [-Wunused-const-variable=]
    static DEFINE_LOCAL_IRQ_LOCK(pendingb_lock);
                                 ^
   include/linux/locallock.h:242:60: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
    #define DEFINE_LOCAL_IRQ_LOCK(lvar)  __typeof__(const int) lvar
                                                               ^~~~


vim +/pendingb_lock +336 kernel/workqueue.c

   335	
 > 336	static DEFINE_LOCAL_IRQ_LOCK(pendingb_lock);
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
