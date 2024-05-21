Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38910134A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 02:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716257982; cv=none; b=Q8oFgh5KtTdu3rdCvdN/rgWx0UcESOIQfpaOvDwdCIXj2w10kDPL74I68j2cJxV5SEqpAV87pGNmYjAEwR4MLe0TF4Ecwd6GrW+G/flFSt5T5H1ZnQCuUle7lvLFiuWdQp0M+vkmQFYa4bXtyhd4APVEKjnnuR4o3JQBZyDesYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716257982; c=relaxed/simple;
	bh=499eJIVAyuygbe5ElhQvv4IujEBvO5sUZX7Aknf/slw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1IVjxxP5FVCHpb/6dxQILvKHE0sIGHVKxxHmFF2nFUXC1NQJQXDWOGkrSXSlZ3nRD5amQuNVMaQku15u06u8wGpGh8j3focs7q2SmJ4GVa7/2q9WH2klDhi3zyZyfbM9ZlsZbvqwpx9XPXQWh1vfgUuqSAYuzUzglGkE2x8cDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqLjCHhb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqLjCHhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716257980; x=1747793980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=499eJIVAyuygbe5ElhQvv4IujEBvO5sUZX7Aknf/slw=;
  b=NqLjCHhbXbtLEgxv1mXhq9nxAMITAZdgq80F9RbHp4ypPRtYAApxg8kR
   uKViZK+Vp9Xj9nVUiGsCLPdRL28DKIAH0EDN7VVLKotp1WKyFgRc78Dgn
   CxVi9d2Z2ElamMrMN6PKVFLMg2SOVzIkjYcaaTcCfk4koIf4FllRlKS9v
   YlXXkyuDXg2uc/Xw8jaZqD8HOt0BCCt/3sj6POGh0CnfyEw/KmlHqiuTm
   /ZmNmYLZG2A9c0zQugxw33mMw+E/S+k6MMzm3NKzxLKJUX0c261Ap5yaQ
   34uGUVjgXqm5JgvybnhAibSqRsNIqLOF7DHePvd7er80vYpjmTA4awb/H
   g==;
X-CSE-ConnectionGUID: rUlBavTGQXq40RHfsZS6JA==
X-CSE-MsgGUID: 4OriOLzrQfCtBrQxcug4OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12265367"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12265367"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 19:19:39 -0700
X-CSE-ConnectionGUID: ev7vmRDlQV6NyRrmQLnmkA==
X-CSE-MsgGUID: g6X4q6HhSB2WkdVc9vQWBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37580396"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2024 19:19:38 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9F69-0005QC-1x;
	Tue, 21 May 2024 02:19:30 +0000
Date: Tue, 21 May 2024 10:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
Message-ID: <202405211049.BNpDlNlU-lkp@intel.com>
References: <20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e@cyphar.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 584bbf439d0fa83d728ec49f3a38c581bdc828b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/fhandle-expose-u64-mount-id-to-name_to_handle_at-2/20240521-053815
base:   584bbf439d0fa83d728ec49f3a38c581bdc828b4
patch link:    https://lore.kernel.org/r/20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e%40cyphar.com
patch subject: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240521/202405211049.BNpDlNlU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211049.BNpDlNlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211049.BNpDlNlU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fhandle.c:2:
>> include/linux/syscalls.h:248:25: error: conflicting types for 'sys_name_to_handle_at'; have 'long int(int,  const char *, struct file_handle *, void *, int)'
     248 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:234:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     227 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/fhandle.c:102:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     102 | SYSCALL_DEFINE5(name_to_handle_at, int, dfd, const char __user *, name,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:864:17: note: previous declaration of 'sys_name_to_handle_at' with type 'long int(int,  const char *, struct file_handle *, int *, int)'
     864 | asmlinkage long sys_name_to_handle_at(int dfd, const char __user *name,
         |                 ^~~~~~~~~~~~~~~~~~~~~


vim +248 include/linux/syscalls.h

1bd21c6c21e848 Dominik Brodowski   2018-04-05  237  
e145242ea0df6b Dominik Brodowski   2018-04-09  238  /*
e145242ea0df6b Dominik Brodowski   2018-04-09  239   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b Dominik Brodowski   2018-04-09  240   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b Dominik Brodowski   2018-04-09  241   * done within __do_sys_*().
e145242ea0df6b Dominik Brodowski   2018-04-09  242   */
1bd21c6c21e848 Dominik Brodowski   2018-04-05  243  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc8 Frederic Weisbecker 2009-03-13  244  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3 Arnd Bergmann       2018-06-19  245  	__diag_push();							\
bee20031772af3 Arnd Bergmann       2018-06-19  246  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3 Arnd Bergmann       2018-06-19  247  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac14 Andi Kleen          2013-11-12 @248  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b Dominik Brodowski   2018-04-09  249  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79 Howard McLauchlan   2018-03-21  250  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b Dominik Brodowski   2018-04-09  251  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b Dominik Brodowski   2018-04-09  252  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b Dominik Brodowski   2018-04-09  253  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e46 Heiko Carstens      2009-01-14  254  	{								\
e145242ea0df6b Dominik Brodowski   2018-04-09  255  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6 Al Viro             2013-01-21  256  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b Al Viro             2013-01-21  257  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b Al Viro             2013-01-21  258  		return ret;						\
1a94bc34768e46 Heiko Carstens      2009-01-14  259  	}								\
bee20031772af3 Arnd Bergmann       2018-06-19  260  	__diag_pop();							\
e145242ea0df6b Dominik Brodowski   2018-04-09  261  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e848 Dominik Brodowski   2018-04-05  262  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e46 Heiko Carstens      2009-01-14  263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
