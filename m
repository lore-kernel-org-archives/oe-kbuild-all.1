Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B13232
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732813265; cv=none; b=UgNuqq3bD/bE+9n6WMFdmwUpi2pMwAGU9dXGkxx+R9kduoqX8KE2DPKaLnUeZmOEbOUke7FUb2ur3zmxAQ7Vgw87sMmPYF3s4zQ/RzcDdYcpcHm3JMtSSFVagURK6X9rOMcDruwjDN+42a8TM/lSenGCIG2alcJh2M4yZun0FRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732813265; c=relaxed/simple;
	bh=LflQVrkceJuvJB191NcV6fAhN7F9ZGao34L4hU1l+tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbCt5O6JE9JigDIw6hZ6YCah+yUoHf71z529hWQcQpPuoF2XZxP2fL9AlPbhinLB67GYwbrO44bTBYzkIvhySoG7laKhuBvwqCxXsCyjhKxuL2oHf5J3rircigZCKEtMrLKiZsjnzNFg176Ut7IyxIGz7CoLFb3vwRu0iCT1eYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaQUL7mw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaQUL7mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732813263; x=1764349263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LflQVrkceJuvJB191NcV6fAhN7F9ZGao34L4hU1l+tI=;
  b=LaQUL7mwaxeQkmHOfViIOZ3FgMpsJ2SuQ+wH9q3swvIPA3TxHUG+P9md
   CA7aTMlCf9ArQCJmi631JTi185FSpP0sHbtDBBwBD+JRBbaUgP40ldNT9
   FrI6uSc8EhWeBKXRiClOrzrbwmU0VFTNCVLyjq+a8imf3E/QEoHxCtCTX
   wdlt8IVcJeukxQIM1ZWGiIS2aTeW548+AioE5bISJZCOp+haLT6R9aavM
   scthQTq5LX6JjQELmlgdNFTlmOyFEV1eV8g3zzy75fCPgeZZ+HTNUb2XA
   FZGfTja2drl1T3+SqQYeWJQH2QeSDSE2ce4MxCoa8ukOaSmMRpxTc8FV8
   Q==;
X-CSE-ConnectionGUID: 7x2TDrj/Tg6He0CQ9wpZtA==
X-CSE-MsgGUID: H+nvUQmwRFelwxf723BkFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32915702"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32915702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:00:57 -0800
X-CSE-ConnectionGUID: eeVvYRWNQy25oB6CpmC8pg==
X-CSE-MsgGUID: ACjevvM9RW+8yRSn9tfO6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92666173"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Nov 2024 09:00:55 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGhsr-0009q3-0N;
	Thu, 28 Nov 2024 17:00:53 +0000
Date: Fri, 29 Nov 2024 01:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fs: don't block write during exec on pre-content watched
 files
Message-ID: <202411290014.xXHzzXEi-lkp@intel.com>
References: <20241128142532.465176-1-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128142532.465176-1-amir73il@gmail.com>

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on next-20241128]
[cannot apply to kees/for-next/execve brauner-vfs/vfs.all jack-fs/for_next v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fs-don-t-block-write-during-exec-on-pre-content-watched-files/20241128-222743
base:   linus/master
patch link:    https://lore.kernel.org/r/20241128142532.465176-1-amir73il%40gmail.com
patch subject: [PATCH] fs: don't block write during exec on pre-content watched files
config: sh-lboxre2_defconfig (https://download.01.org/0day-ci/archive/20241129/202411290014.xXHzzXEi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290014.xXHzzXEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290014.xXHzzXEi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/sh/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/sh/kernel/asm-offsets.c:14:
   include/linux/fs.h: In function 'exe_file_deny_write_access':
>> include/linux/fs.h:3068:22: error: implicit declaration of function 'FMODE_FSNOTIFY_HSM'; did you mean 'FMODE_NONOTIFY'? [-Wimplicit-function-declaration]
    3068 |         if (unlikely(FMODE_FSNOTIFY_HSM(exe_file->f_mode)))
         |                      ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1211: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +3068 include/linux/fs.h

  3062	
  3063	/*
  3064	 * Do not prevent write to executable file when watched by pre-content events.
  3065	 */
  3066	static inline int exe_file_deny_write_access(struct file *exe_file)
  3067	{
> 3068		if (unlikely(FMODE_FSNOTIFY_HSM(exe_file->f_mode)))
  3069			return 0;
  3070		return deny_write_access(exe_file);
  3071	}
  3072	static inline void exe_file_allow_write_access(struct file *exe_file)
  3073	{
  3074		if (unlikely(FMODE_FSNOTIFY_HSM(exe_file->f_mode)))
  3075			return;
  3076		allow_write_access(exe_file);
  3077	}
  3078	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
