Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B1825777
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 02:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714184004; cv=none; b=Wd/WKGzUn7kwoBkuI4P03ZohmGcsSRRrFT5NwCnP/uIo6JJoK0Ax9fYEa6OBpGKkw2ppXINSLXGPPDfrZ13hn/0viE8gWqQoMjkcCcupqZY3EYydP09Oe5s+nmf6LfPITs3Eo938aC+dK72PRnK5d2VdH1930d10Klf118hOzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714184004; c=relaxed/simple;
	bh=RFS0F396YDoiRDyqJs7dMPKlFmlEu3FDAwV9yUxtHu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fA5DdgIBD+o6iyj+VgObhJ/woyubCrSvY6aUoNHjotyZElGKM9T8IOa+vK50Emcy28VEx7IXTpzBbfTzaryznumW9dyO5IJzwz6cX3h6tbUYckJqhI5K4w8ny5XikdW/J/YS36mXj5ihYPRnPexCCGkIQERfbUSusuNu5mjk5g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGdGhc08; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGdGhc08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714184003; x=1745720003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RFS0F396YDoiRDyqJs7dMPKlFmlEu3FDAwV9yUxtHu8=;
  b=oGdGhc08hsmLddVsFX9dtgjJKBuwwbkwLjkgYzieHVsc6D64EuVq99sh
   qnAra9bTA0CXhcQDdz+PXXjdW6YzqghPEDQho4mPUL2TL3+o3TDuOu83g
   NcNjrLUrErL5WLsqjbzX1obsAviZLlW1RwkLiUdQtHdAr5OcNf9JWcGFN
   KKzvGAxfokQThhzkVMLJAUoBlzNepauRD496cfQF65jUBfWUhNul+RNfs
   dYyB5v1OjjbnACwQfiTg3848Bb57PipqZa2gVM+UDArwfQ52GDWARtX/c
   zD54Vm6Y8nXJSSN3uaHT++pGFoJjY24e9KHuQI/lA7nwIKgNZXIoQqjrs
   w==;
X-CSE-ConnectionGUID: NTXCyYUJSDemIeZfVwE9WQ==
X-CSE-MsgGUID: 4HHMtFcfTviTmaWOawh84A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10096223"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="10096223"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 19:13:22 -0700
X-CSE-ConnectionGUID: ZhFcM/p0RO224vY5AFZmXA==
X-CSE-MsgGUID: QAT9cIihT3+qj2nN9x2+Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30241308"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Apr 2024 19:13:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0XZ0-0004ZG-1G;
	Sat, 27 Apr 2024 02:13:18 +0000
Date: Sat, 27 Apr 2024 10:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_2 12/15]
 include/uapi/asm-generic/unistd.h:849:11: error: '__NR_uprobe' undeclared
 here (not in a function)
Message-ID: <202404271057.mvMigZp4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_2
head:   554d1563d6bebe03a19f9500907d0b71df555713
commit: 644d6511fa626aad8f835307c2ce93bb1d1db871 [12/15] uprobe: Add uprobe syscall to speed up uprobe
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240427/202404271057.mvMigZp4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271057.mvMigZp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271057.mvMigZp4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/openrisc/include/uapi/asm/unistd.h:30,
                    from <stdin>:2:
>> include/uapi/asm-generic/unistd.h:848: warning: "__NR_uretprobe" redefined
     848 | #define __NR_uretprobe 463
         | 
   include/uapi/asm-generic/unistd.h:845: note: this is the location of the previous definition
     845 | #define __NR_uretprobe 462
         | 
--
   In file included from arch/openrisc/include/uapi/asm/unistd.h:30,
                    from include/uapi/linux/unistd.h:8,
                    from include/uapi/linux/lsm.h:14,
                    from include/linux/security.h:36,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:45,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:101,
                    from include/net/addrconf.h:61,
                    from lib/vsprintf.c:41:
>> include/uapi/asm-generic/unistd.h:848: warning: "__NR_uretprobe" redefined
     848 | #define __NR_uretprobe 463
         | 
   include/uapi/asm-generic/unistd.h:845: note: this is the location of the previous definition
     845 | #define __NR_uretprobe 462
         | 
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from arch/openrisc/include/uapi/asm/unistd.h:30,
                    from include/uapi/linux/unistd.h:8,
                    from include/linux/syscalls.h:89,
                    from arch/openrisc/kernel/sys_call_table.c:13:
>> include/uapi/asm-generic/unistd.h:848: warning: "__NR_uretprobe" redefined
     848 | #define __NR_uretprobe 463
         | 
   include/uapi/asm-generic/unistd.h:845: note: this is the location of the previous definition
     845 | #define __NR_uretprobe 462
         | 
   In file included from arch/openrisc/include/uapi/asm/unistd.h:30,
                    from arch/openrisc/kernel/sys_call_table.c:23:
   include/uapi/asm-generic/unistd.h:845: warning: "__NR_uretprobe" redefined
     845 | #define __NR_uretprobe 462
         | 
   include/uapi/asm-generic/unistd.h:848: note: this is the location of the previous definition
     848 | #define __NR_uretprobe 463
         | 
>> include/uapi/asm-generic/unistd.h:848: warning: "__NR_uretprobe" redefined
     848 | #define __NR_uretprobe 463
         | 
   include/uapi/asm-generic/unistd.h:845: note: this is the location of the previous definition
     845 | #define __NR_uretprobe 462
         | 
>> include/uapi/asm-generic/unistd.h:849:11: error: '__NR_uprobe' undeclared here (not in a function)
     849 | __SYSCALL(__NR_uprobe, sys_uprobe)
         |           ^~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:20:30: note: in definition of macro '__SYSCALL'
      20 | #define __SYSCALL(nr, call) [nr] = (call),
         |                              ^~
>> include/uapi/asm-generic/unistd.h:849:11: error: array index in initializer not of integer type
     849 | __SYSCALL(__NR_uprobe, sys_uprobe)
         |           ^~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:20:30: note: in definition of macro '__SYSCALL'
      20 | #define __SYSCALL(nr, call) [nr] = (call),
         |                              ^~
   include/uapi/asm-generic/unistd.h:849:11: note: (near initialization for 'sys_call_table')
     849 | __SYSCALL(__NR_uprobe, sys_uprobe)
         |           ^~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:20:30: note: in definition of macro '__SYSCALL'
      20 | #define __SYSCALL(nr, call) [nr] = (call),
         |                              ^~
--
   In file included from arch/openrisc/include/uapi/asm/unistd.h:30,
                    from <stdin>:2:
>> include/uapi/asm-generic/unistd.h:848: warning: "__NR_uretprobe" redefined
     848 | #define __NR_uretprobe 463
         | 
   include/uapi/asm-generic/unistd.h:845: note: this is the location of the previous definition
     845 | #define __NR_uretprobe 462
         | 


vim +/__NR_uprobe +849 include/uapi/asm-generic/unistd.h

   847	
 > 848	#define __NR_uretprobe 463
 > 849	__SYSCALL(__NR_uprobe, sys_uprobe)
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
