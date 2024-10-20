Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03324BA33
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729443479; cv=none; b=FExn5D/3nS12+ttbg7GMVDlm6ziT91jO9C6aMBaDom4znuRazSWy8o8i02PUwniaOu+Vt3WPj7U5uY5y2SiOjScR2nJrAfgDia6c1Oiu8SUnbjX+QC1ibDSPYNrV8rgwT3EZLcCEbkWyV3aXKIFIET6qU7Vske3dArYC4b1S4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729443479; c=relaxed/simple;
	bh=txNa7mEDNCAzoTRmkfMFscoqjnUha8mY19ba2p63l/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWBpqMeLKVAmLHCo76I2NKX68/xKraqbkhuCpqPHy+jo1EnconWWtsCj3jUwgNMPZ9eSUGtxXpmx5SrrmcwOutclh86flqTWYHzgqqxz1nrM7t1DPTk2yAn4b8nRHYX6cOKBegqqAIbtox/MOYheLIkSB62IW9+25qBCuQBIObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hv7t2VZT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hv7t2VZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729443477; x=1760979477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txNa7mEDNCAzoTRmkfMFscoqjnUha8mY19ba2p63l/Y=;
  b=Hv7t2VZTnK3lMDWalf43WzvrZbLd8FQ6ntHkUYnGt73BqF41mYiTiFIz
   kbYIBGSSR62+HEPj6n49Yy0P90dmF0AqCpNo8hf4NAepjDs3AixeGokaw
   RO9FfcOOdzfEBiVZJadnICHGHoZ8J37JW2Z7GadCg73l4nJrD8nG+ILQn
   Kn4UWj1cwbmUhtsAiTQdPfGTS9kQGn5FDBuX8daqfgEhhuHuFmtAQ9HFl
   AeO98Mw7eieH4dJCOyHHoi7B8wJbAZ9A0hfv1ZLX5G9WAOQHLj9YHiA2U
   TTo8BL7fpjD/mbDaF7x8dvInJ7aQgOUf0ZxKyuA0iLL6TLT4KPqHmt19Q
   g==;
X-CSE-ConnectionGUID: jP3yqU7ZQpexdYKk9GWWQw==
X-CSE-MsgGUID: O/1NlZlWR5+TMvl6gD/LWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="46423117"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="46423117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 09:57:56 -0700
X-CSE-ConnectionGUID: aEtawAziRy2A5O4Be9kmfg==
X-CSE-MsgGUID: 925dD2lcRFafgc9oUzv/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="84370504"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2024 09:57:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2ZFY-000QVt-2Y;
	Sun, 20 Oct 2024 16:57:52 +0000
Date: Mon, 21 Oct 2024 00:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 40/78]
 arch/powerpc/include/asm/vdso/gettimeofday.h:158:37: error: redefinition of
 '__ppc_get_timens_vdso_data'
Message-ID: <202410210045.5Fjv5uY8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   e37bcda138dd0654f12f9e8586304d21df8bb85b
commit: 0d9201c42f8528ca9e8e55300ea00f9fcc8e9b60 [40/78] powerpc/vdso: Switch to generic storage implementation
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20241021/202410210045.5Fjv5uY8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210045.5Fjv5uY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210045.5Fjv5uY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/datapage.h:247,
                    from lib/vdso/gettimeofday.c:5,
                    from <command-line>:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:158:37: error: redefinition of '__ppc_get_timens_vdso_data'
     158 | #define __arch_get_timens_vdso_data __ppc_get_timens_vdso_data
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vdso/gettimeofday.c:118:25: note: in expansion of macro '__arch_get_timens_vdso_data'
     118 | const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/vdso/gettimeofday.h:145:48: note: previous definition of '__ppc_get_timens_vdso_data' with type 'const struct vdso_data *(const struct vdso_data *)'
     145 | static __always_inline const struct vdso_data *__ppc_get_timens_vdso_data(const struct vdso_data *vd)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__ppc_get_timens_vdso_data +158 arch/powerpc/include/asm/vdso/gettimeofday.h

   125	
   126	#ifdef __powerpc64__
   127	int __c_kernel_clock_gettime(clockid_t clock, struct __kernel_timespec *ts,
   128				     const struct vdso_data *vd);
   129	int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
   130				    const struct vdso_data *vd);
   131	#else
   132	int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
   133				     const struct vdso_data *vd);
   134	int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
   135				       const struct vdso_data *vd);
   136	int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
   137				    const struct vdso_data *vd);
   138	#endif
   139	int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
   140				    const struct vdso_data *vd);
   141	__kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time,
   142					    const struct vdso_data *vd);
   143	
   144	#ifndef __powerpc64__
   145	static __always_inline const struct vdso_data *__ppc_get_timens_vdso_data(const struct vdso_data *vd)
   146	{
   147		struct vdso_data *data;
   148	
   149		asm(
   150			"	bcl	20, 31, .+4\n"
   151			"0:	mflr	%0\n"
   152			"	addis	%0, %0, (_timens_data - 0b)@ha\n"
   153			"	addi	%0, %0, (_timens_data - 0b)@l\n"
   154		: "=r" (data) :: "lr");
   155	
   156		return data;
   157	}
 > 158	#define __arch_get_timens_vdso_data __ppc_get_timens_vdso_data
   159	#endif
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
