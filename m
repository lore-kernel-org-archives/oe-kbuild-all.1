Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C14C373BEE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 22:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776291652; cv=none; b=ecFvDlUOeRC8VN6xRJLyHbjnTNhsoaC/W3IMIJ9nu0F8TDJ9OiyIx3CD/SE7MKoitWnrJaf1yQqvRPqKztUAIhn4fgR+E1uMm7dWiH58JGKY+texpI+xsRqpizr6kGZUXE0CK6CC+EZc88/A1ND76QP5/3DM9ZGZTLuLzk5FwcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776291652; c=relaxed/simple;
	bh=g1bTFf25xcxdRbQ7tJpLoq8ypUJ+LZN8QtWvJN+5ofk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vxy2ycnqa0ui2hUVgRyYEdbl2mEAtcqAF+HWBS4BzzIRe3h2Ne9vifQvFU4t+92QBBu63mMRUDmipp5KMBE8NYpk2HqOnu3Viz5lAlNtRA2b6dxw/d4LxxLpE2tB1cv7HNG/r1nMM5aqI1F2dbu3+kc8dq040TITDfxCMnqEGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTXskd8B; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTXskd8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776291649; x=1807827649;
  h=date:from:to:cc:subject:message-id;
  bh=g1bTFf25xcxdRbQ7tJpLoq8ypUJ+LZN8QtWvJN+5ofk=;
  b=PTXskd8BiMAhBN7PG6T3MfUJKtIQ45r2EnLXBMxFpk7l0dZlrZCuguoW
   GiiVmsN89BkCMfxuWUKMc247yXeqGWGNM4265l0Lp+pQSKnWG8WoKXISr
   7bRqsFLclLjG8AqSPs9o1f9jRUjoDQrIkqAoTXzsOicRGf2lLuRZcMrEP
   C8Nhu3EvHIr5yJO+v2y4tfgFaQYpAuyCDLHcMJMd6Yg8qBMvVavtjmRMq
   BuNE16fRsGuiM9wkoa1/su173FdNOxmfpRS06UTLwxyqvPj39slDu9VKA
   jie/TYsO+miSc9YlqIsXdsthxiA+eaDermCjdX8yg0NDbAnEj4msG/90i
   Q==;
X-CSE-ConnectionGUID: EhLdOigbTzG0g+jnVkmvbg==
X-CSE-MsgGUID: VRmpjRD7SImYYjpUdpXEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76448660"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="76448660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 15:20:48 -0700
X-CSE-ConnectionGUID: J1DgExbVSJabQnGz9dfzrA==
X-CSE-MsgGUID: jLWRZntHSQu1HGnthFzOpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="224042584"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Apr 2026 15:20:47 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD8bF-000000000zW-06MW;
	Wed, 15 Apr 2026 22:20:45 +0000
Date: Thu, 16 Apr 2026 06:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 6/14]
 include/linux/kasan-checks.h:38:27: warning: 'args' may be used uninitialized
Message-ID: <202604160624.1oL6Vo1Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   ad449adfcbd590100be51254f72f3886b89f1275
commit: 3706f43b736c6f77d365ca42945c39a2d9684910 [6/14] btrfs: add BTRFS_IOC_GET_CSUMS ioctl
config: loongarch-randconfig-002-20260416 (https://download.01.org/0day-ci/archive/20260416/202604160624.1oL6Vo1Z-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160624.1oL6Vo1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160624.1oL6Vo1Z-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/rwonce.h:26,
                    from ./arch/loongarch/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from fs/btrfs/ioctl.c:6:
   In function 'instrument_copy_from_user_before',
       inlined from '_inline_copy_from_user' at include/linux/uaccess.h:184:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:221:9,
       inlined from 'btrfs_ioctl_get_csums.isra' at fs/btrfs/ioctl.c:5223:6:
>> include/linux/kasan-checks.h:38:27: warning: 'args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
   include/linux/instrumented.h:146:9: note: in expansion of macro 'kasan_check_write'
     146 |         kasan_check_write(to, n);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_get_csums.isra':
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/ioctl.c:5203:43: note: 'args' declared here
    5203 |         struct btrfs_ioctl_get_csums_args args;
         |                                           ^~~~
--
   In file included from include/asm-generic/rwonce.h:26,
                    from arch/loongarch/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from ioctl.c:6:
   In function 'instrument_copy_from_user_before',
       inlined from '_inline_copy_from_user' at include/linux/uaccess.h:184:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:221:9,
       inlined from 'btrfs_ioctl_get_csums.isra' at ioctl.c:5223:6:
>> include/linux/kasan-checks.h:38:27: warning: 'args' may be used uninitialized [-Wmaybe-uninitialized]
      38 | #define kasan_check_write __kasan_check_write
   include/linux/instrumented.h:146:9: note: in expansion of macro 'kasan_check_write'
     146 |         kasan_check_write(to, n);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'btrfs_ioctl_get_csums.isra':
   include/linux/kasan-checks.h:20:6: note: by argument 1 of type 'const volatile void *' to '__kasan_check_write' declared here
      20 | bool __kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~~~
   ioctl.c:5203:43: note: 'args' declared here
    5203 |         struct btrfs_ioctl_get_csums_args args;
         |                                           ^~~~


vim +/args +38 include/linux/kasan-checks.h

7d8ad890dad00f6 Marco Elver     2019-07-11  31  
7d8ad890dad00f6 Marco Elver     2019-07-11  32  /*
7d8ad890dad00f6 Marco Elver     2019-07-11  33   * kasan_check_*: Only available when the particular compilation unit has KASAN
7d8ad890dad00f6 Marco Elver     2019-07-11  34   * instrumentation enabled. May be used in header files.
7d8ad890dad00f6 Marco Elver     2019-07-11  35   */
7d8ad890dad00f6 Marco Elver     2019-07-11  36  #ifdef __SANITIZE_ADDRESS__
7d8ad890dad00f6 Marco Elver     2019-07-11  37  #define kasan_check_read __kasan_check_read
7d8ad890dad00f6 Marco Elver     2019-07-11 @38  #define kasan_check_write __kasan_check_write
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  39  #else
b5f6e0fc7d60e02 Marco Elver     2019-07-11  40  static inline bool kasan_check_read(const volatile void *p, unsigned int size)
b5f6e0fc7d60e02 Marco Elver     2019-07-11  41  {
b5f6e0fc7d60e02 Marco Elver     2019-07-11  42  	return true;
b5f6e0fc7d60e02 Marco Elver     2019-07-11  43  }
b5f6e0fc7d60e02 Marco Elver     2019-07-11  44  static inline bool kasan_check_write(const volatile void *p, unsigned int size)
b5f6e0fc7d60e02 Marco Elver     2019-07-11  45  {
b5f6e0fc7d60e02 Marco Elver     2019-07-11  46  	return true;
b5f6e0fc7d60e02 Marco Elver     2019-07-11  47  }
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  48  #endif
64f8ebaf115bcdd Andrey Ryabinin 2016-05-20  49  

:::::: The code at line 38 was first introduced by commit
:::::: 7d8ad890dad00f6cd64bfb44d9be4fceb10cf819 mm/kasan: introduce __kasan_check_{read,write}

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
