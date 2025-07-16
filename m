Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0C126F0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646598; cv=none; b=u+XWiGQRBI6lrGB8NLcKGtfTEPzGQtn+34oFROH/A89KDsq+nT26HfqBwOOhjfTJUirBQCDbH+ZTzf0ecah5xJjxLXH7NqwVn3armTlPvXwq4oxuwYqizSGUQ+kqKNHgmxkp8K/VL2LgNTpdfQOLVeURlvx+Jsimr/DM+UhQRCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646598; c=relaxed/simple;
	bh=ilD+WF3+krsqHZxIpm73N9VOMRw7jCrXEEza2qCRt4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rR1dTsognsNaI8VFHgeLPOJ0qC3/ViSD0EbIGSzcizcuqrr1cEQcIl/axfW9SbRwIxSJ+vXMH2GU4DXfRubxB52FQsh17gLHodOOsxl1wUk+gXiWKXmlgGWZverk1NQDi1Ib7XUXAL7G6D6kf4WnIihh1Ah+jbuoqoBy33mhmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkfiPaAZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkfiPaAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752646597; x=1784182597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ilD+WF3+krsqHZxIpm73N9VOMRw7jCrXEEza2qCRt4M=;
  b=kkfiPaAZaOdK0uM6jRcsLPvfOZBn09wuLWjtYPxQwI+DlAGK6AokUxu4
   juWgV5MMMyLNt0V4x9AvsLjKwb5pLtPMC48jr4rzbwzkq10ZzQRAil8+i
   y7D4AN2dwow5Ix/XIkIDKb4xuM/W2U69dLQmHgYnED7bv7WVNUzXJ/18M
   20flAgFRulGtjHJwQtWhdCOM7njLMMWNlrxFwmQkxERN2LxNJNyEcxt/a
   Y1sc1XYXTTSRH6uInsWDo6cqSYXXuqggrdhWOw1oV7zaQ1e8Zg+qQbacw
   rxw7h+Qe+Qfh14BWu2JdX5K7DX5CF+Of8lxSJgk0HwMBKav1S1AuRYn1T
   g==;
X-CSE-ConnectionGUID: p0UWqYxKTxSGMM2XytH4rQ==
X-CSE-MsgGUID: bNPXHnpuQmaT3EWq5TpLzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55030083"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="55030083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 23:16:35 -0700
X-CSE-ConnectionGUID: s1j5iUknR8yPYtJ8Jrt0mQ==
X-CSE-MsgGUID: FJOEmQ+dR52rZ4vJJZ2gtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157767215"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2025 23:16:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubvRP-000Bzh-2z;
	Wed, 16 Jul 2025 06:16:31 +0000
Date: Wed, 16 Jul 2025 14:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-07 32/32]
 include/linux/thread_info.h:228:4: error: call to '__bad_copy_from' declared
 with 'error' attribute: copy source size is too small
Message-ID: <202507161443.UFMoHVJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-07
head:   d946208fed9433cf6740ca00d267ad6074d94312
commit: 75cf0290271bf6dae9dee982aef15242dadf97e4 [32/32] instrumented.h: add KMSAN support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250716/202507161443.UFMoHVJT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161443.UFMoHVJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161443.UFMoHVJT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/bluetooth/l2cap_sock.c:30:
   In file included from include/linux/module.h:14:
   In file included from include/linux/buildid.h:5:
   In file included from include/linux/mm_types.h:8:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:55:
   In file included from include/linux/preempt.h:78:
   In file included from arch/x86/include/asm/preempt.h:7:
>> include/linux/thread_info.h:228:4: error: call to '__bad_copy_from' declared with 'error' attribute: copy source size is too small
     228 |                         __bad_copy_from();
         |                         ^
   1 error generated.


vim +228 include/linux/thread_info.h

b0377fedb65280 Al Viro   2017-06-29  219  
9dd819a15162f8 Kees Cook 2019-09-25  220  static __always_inline __must_check bool
b0377fedb65280 Al Viro   2017-06-29  221  check_copy_size(const void *addr, size_t bytes, bool is_source)
b0377fedb65280 Al Viro   2017-06-29  222  {
c80d92fbb67b2c Kees Cook 2021-06-17  223  	int sz = __builtin_object_size(addr, 0);
b0377fedb65280 Al Viro   2017-06-29  224  	if (unlikely(sz >= 0 && sz < bytes)) {
b0377fedb65280 Al Viro   2017-06-29  225  		if (!__builtin_constant_p(bytes))
b0377fedb65280 Al Viro   2017-06-29  226  			copy_overflow(sz, bytes);
b0377fedb65280 Al Viro   2017-06-29  227  		else if (is_source)
b0377fedb65280 Al Viro   2017-06-29 @228  			__bad_copy_from();
b0377fedb65280 Al Viro   2017-06-29  229  		else
b0377fedb65280 Al Viro   2017-06-29  230  			__bad_copy_to();
b0377fedb65280 Al Viro   2017-06-29  231  		return false;
b0377fedb65280 Al Viro   2017-06-29  232  	}
6d13de1489b6bf Kees Cook 2019-12-04  233  	if (WARN_ON_ONCE(bytes > INT_MAX))
6d13de1489b6bf Kees Cook 2019-12-04  234  		return false;
b0377fedb65280 Al Viro   2017-06-29  235  	check_object_size(addr, bytes, is_source);
b0377fedb65280 Al Viro   2017-06-29  236  	return true;
b0377fedb65280 Al Viro   2017-06-29  237  }
b0377fedb65280 Al Viro   2017-06-29  238  

:::::: The code at line 228 was first introduced by commit
:::::: b0377fedb6528087ed319b0d054d6ed82240372c copy_{to,from}_user(): consolidate object size checks

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
