Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947CC2500C6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029458; cv=none; b=AF/ggnnZdrLQU6SFJYTLtDniW5mqtuVhP0HmqBc9egxSQ7sdLUzv9LftYhhD56iiqbgHDH3v+/+JxdJdi4GFjBXy1S8gzWPguViByX5JzF9LeKI7oGl9hgJFXVwXhhPSChNrQNl8hGOtY9PuinLiTeSbt77mvQyW9ihTf3ihE2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029458; c=relaxed/simple;
	bh=40ZJsuaEXQkiGaEGE6q/2WS4JiSaf+W7yUGjBdvMCn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+Ix4MW6nOXJWi351jFAPkg+qQcpkq3wjQtHSyCJf3DCBJqTDFY8sQ4a2eVeTaSnFX4ylTkn/KX7iPKkq3dtELcWIKmAZak+yNs6U8zrsadB3LvfCBsBpfCkwAgtXToZJgzkgmbDnZurZhzViTjwS9Rgfg++NAISFkXkT2yjofQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ph6EGkY1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ph6EGkY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029457; x=1770565457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40ZJsuaEXQkiGaEGE6q/2WS4JiSaf+W7yUGjBdvMCn8=;
  b=Ph6EGkY1MbsefbdDGfawAeXf8MvfoGatXPDJKvrJJN43y+0U4shKP1hI
   hBP3bt65j35jBFnIz41RqkHugPd7Yp8AyOHKOhzdYZvCVVqUAbg5RVLE0
   FZ3OO80OTYKb/ycEZNmMP79gkNioeuNs9qt38/vEeME/J/Xd8n2JtuhIr
   Iedj42mztE7ZbBLqs8jiwoGNDfNFoqOnOE6NkjEWwFH4NOFbyYNjk7EY8
   Jlp/rVVFZri2naYfFmtprJb3X0vP2KT8BnElanbN7cWnXpIVQmt/TaSOd
   bLEHtMDVRrbrLPC6WkG4WRYv9he9engqN5HGQaSvt/uE7+peTzAP2jr6s
   A==;
X-CSE-ConnectionGUID: UsR2TcHwQ+O9x1Y9GPdZow==
X-CSE-MsgGUID: AntiSHxxR8mZMJB/sxAS/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39565688"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39565688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:16 -0800
X-CSE-ConnectionGUID: DqXP1n6nT221TOwtbOPSwQ==
X-CSE-MsgGUID: LVD8+p6rQDCd9nYkpucZ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111619574"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010E8-2N;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1421/1421]
 include/linux/thread_info.h:59:17: warning: 'ctl' may be used uninitialized
Message-ID: <202502082355.jrzYRRaD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: c6e864fee7c3dd416048d129997c7def53cb9ed8 [1421/1421] net: separate out the msghdr copy from ___sys_{send,recv}msg()
config: x86_64-buildonly-randconfig-002-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082355.jrzYRRaD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082355.jrzYRRaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082355.jrzYRRaD-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In function '__sock_release',
       inlined from 'sock_close' at net/socket.c:1140:2:
   net/socket.c:579:21: warning: array subscript -1 is outside array bounds of 'struct inode[9078122083518480]' [-Warray-bounds]
     579 |                 sock->ops->release(sock);
         |                 ~~~~^~~~~
   net/socket.c:580:26: warning: array subscript -1 is outside array bounds of 'struct inode[9078122083518480]' [-Warray-bounds]
     580 |                 sock->sk = NULL;
   In file included from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:81,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:9,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:11,
                    from net/socket.c:61:
   In function 'check_object_size',
       inlined from 'check_copy_size' at include/linux/thread_info.h:90:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:143:6,
       inlined from '____sys_sendmsg' at net/socket.c:2110:7:
>> include/linux/thread_info.h:59:17: warning: 'ctl' may be used uninitialized [-Wmaybe-uninitialized]
      59 |                 __check_object_size(ptr, n, to_user);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function '____sys_sendmsg':
   include/linux/thread_info.h:52:13: note: by argument 1 of type 'const void *' to '__check_object_size' declared here
      52 | extern void __check_object_size(const void *ptr, unsigned long n,
         |             ^~~~~~~~~~~~~~~~~~~
   net/socket.c:2075:23: note: 'ctl' declared here
    2075 |         unsigned char ctl[sizeof(struct cmsghdr) + 20]
         |                       ^~~
   In function 'check_object_size',
       inlined from 'check_copy_size' at include/linux/thread_info.h:90:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:143:6,
       inlined from '__do_sys_socketcall' at net/socket.c:2618:6,
       inlined from '__se_sys_socketcall' at net/socket.c:2602:1:
   include/linux/thread_info.h:59:17: warning: 'a' may be used uninitialized [-Wmaybe-uninitialized]
      59 |                 __check_object_size(ptr, n, to_user);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function '__se_sys_socketcall':
   include/linux/thread_info.h:52:13: note: by argument 1 of type 'const void *' to '__check_object_size' declared here
      52 | extern void __check_object_size(const void *ptr, unsigned long n,
         |             ^~~~~~~~~~~~~~~~~~~
   net/socket.c:2604:23: note: 'a' declared here
    2604 |         unsigned long a[AUDITSC_ARGS];
         |                       ^
   net/socket.c:573: warning: Function parameter or member 'inode' not described in '__sock_release'


vim +/ctl +59 include/linux/thread_info.h

0f60a8efe4005a Kees Cook 2016-07-12  50  
f5509cc18daa7f Kees Cook 2016-06-07  51  #ifdef CONFIG_HARDENED_USERCOPY
f5509cc18daa7f Kees Cook 2016-06-07  52  extern void __check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f Kees Cook 2016-06-07  53  					bool to_user);
f5509cc18daa7f Kees Cook 2016-06-07  54  
a85d6b8242dc78 Kees Cook 2016-09-07  55  static __always_inline void check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f Kees Cook 2016-06-07  56  					      bool to_user)
f5509cc18daa7f Kees Cook 2016-06-07  57  {
81409e9e280588 Kees Cook 2016-08-31  58  	if (!__builtin_constant_p(n))
f5509cc18daa7f Kees Cook 2016-06-07 @59  		__check_object_size(ptr, n, to_user);
f5509cc18daa7f Kees Cook 2016-06-07  60  }
f5509cc18daa7f Kees Cook 2016-06-07  61  #else
f5509cc18daa7f Kees Cook 2016-06-07  62  static inline void check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f Kees Cook 2016-06-07  63  				     bool to_user)
f5509cc18daa7f Kees Cook 2016-06-07  64  { }
f5509cc18daa7f Kees Cook 2016-06-07  65  #endif /* CONFIG_HARDENED_USERCOPY */
f5509cc18daa7f Kees Cook 2016-06-07  66  

:::::: The code at line 59 was first introduced by commit
:::::: f5509cc18daa7f82bcc553be70df2117c8eedc16 mm: Hardened usercopy

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
