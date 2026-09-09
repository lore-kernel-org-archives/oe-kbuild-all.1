Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E8485CFB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947084; cv=none; b=etxnCjcz04G7CuW+MPk7jIBQBkcLFyPtBtsS0D/ROCRRxAFHFxeb9IADlB0tol74PUZHazTEN4VnJFX49jxEEC9iCbdnzOoIVPgEvWrK9UOfnBVNdqnpn1pxv2d7XXiKkeYzlOoiJ+7ffIFVIKVv7L7DwDnVem8oQSuyhXGOkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947084; c=relaxed/simple;
	bh=JrzdzbJNedolASv+kEv5MHHKXFOCooUfCQgtpZsoQ9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oV57D/7clqYKP1jd3RrA3h10F0k53DpROxcMM7mLPE+I96s31eqrE/PZQPEXAkZS1+6cHBzZEJdctm9J5JIXPLOCnM5VU9ZGcmgxwkD0FADBOM/4/QQLIgPdG8RY8lbH0ZcRfs4Vhzlomc47SBk2OtQWCI8bUKRlM9WA4d6uexY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YAQWNtra; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YAQWNtra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788947082; x=1820483082;
  h=date:from:to:cc:subject:message-id;
  bh=JrzdzbJNedolASv+kEv5MHHKXFOCooUfCQgtpZsoQ9s=;
  b=YAQWNtraPqGAbkG2VFhJw74C5VA26lUqBaX5NhldqtZJ8yxs6oJ5KPlK
   /vK4TAW7IaEYrIazukBYRhI+TkkP3lEjcJk4O6lIgYp9HcjBSjE5fgI/L
   JaJVw9fuOuB4q4uRIJz02s3oHYRNv4u13Xp4sYXp4Ay2zs3QNUxUQa4Si
   kN1NNGuiNEpXbSE2vVqpxvTKyPTox9j4L0o/VZhnX16uEss0+DFOIO90e
   Ken9gF74odkr4O/jFOcYj/LR3wg4P8ZFJa5HkhjQjpHwf8/8ikOFINSQt
   YxjfKHqe08btBPrr+4g6h0KoYttO/3Tv+kDQF/erF99vxaCVvboSNCLlg
   g==;
X-CSE-ConnectionGUID: uN/0jOqXRQ+sA6if+X8l+w==
X-CSE-MsgGUID: sCF4oRw2QLOxJNfOhSu5NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91880081"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="91880081"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:44:41 -0700
X-CSE-ConnectionGUID: fcDMpZ3KR+eAzdqpNj8dyg==
X-CSE-MsgGUID: BDy0xi8wRTyv4+oHQYPmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="309536061"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Sep 2026 02:44:40 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4Er8-0000000003K-0s8v;
	Wed, 09 Sep 2026 09:44:38 +0000
Date: Wed, 09 Sep 2026 17:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12]
 drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c:156:26: warning:
 diagnostic behavior may be improved by adding the 'format(printf, 1, 2)'
 attribute to the declaration of 'adlak_os_printf'
Message-ID: <202609091724.MSVLRBVv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   3729dea89f4ad77930792d1afd34a3bac456c7a1
commit: 3729dea89f4ad77930792d1afd34a3bac456c7a1 [12/12] Temporary use Adla Legacy driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260909/202609091724.MSVLRBVv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 803252a70e326051a340e1a80b79cd10ed633e7f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091724.MSVLRBVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609091724.MSVLRBVv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option]
   In file included from drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_platform_device.c:76:
>> drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_fops.c:252:33: warning: variable 'net_reg_desc' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
     252 |                 cp_ret = copy_to_user(udata, &net_reg_desc,
         |                                               ^~~~~~~~~~~~
   1 warning and 1 error generated.
--
   error: unknown warning option '-Wno-suggest-attribute=format'; did you mean '-Wno-property-attribute-mismatch'? [-Werror,-Wunknown-warning-option]
>> drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c:156:26: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 2)' attribute to the declaration of 'adlak_os_printf' [-Wmissing-format-attribute]
     156 |         r = vprintk(format, args);
         |                                 ^
   drivers/accel/adla_legacy/kmd/drv/port/adlak_os.h:56:7: note: 'adlak_os_printf' declared here
      56 | int   adlak_os_printf(const char *format, ...);
         |       ^
>> drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c:171:43: warning: diagnostic behavior may be improved by adding the 'format(printf, 3, 4)' attribute to the declaration of 'adlak_os_snprintf' [-Wmissing-format-attribute]
     171 |         cnt = vsnprintf(buffer, size, format, arg);
         |                                                  ^
   drivers/accel/adla_legacy/kmd/drv/port/adlak_os.h:57:7: note: 'adlak_os_snprintf' declared here
      57 | int   adlak_os_snprintf(char *buffer, ssize_t buf_size, const char *format, ...);
         |       ^
>> drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c:193:34: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'adlak_os_vasprintf' [-Wmissing-format-attribute]
     186 | static char *adlak_os_vasprintf(gfp_t gfp, const char *fmt, va_list ap)
         | __attribute__((format(printf, 2, 0))) 
     187 | {
     188 |         unsigned int len;
     189 |         char *p;
     190 |         va_list aq;
     191 | 
     192 |         va_copy(aq, ap);
     193 |         len = vsnprintf(NULL, 0, fmt, aq);
         |                                         ^
   drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c:186:14: note: 'adlak_os_vasprintf' declared here
     186 | static char *adlak_os_vasprintf(gfp_t gfp, const char *fmt, va_list ap)
         |              ^
>> drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c:221:37: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'adlak_os_asprintf' [-Wmissing-format-attribute]
     221 |         p = adlak_os_vasprintf(gfp, fmt, ap);
         |                                            ^
   drivers/accel/adla_legacy/kmd/drv/port/adlak_os.h:58:7: note: 'adlak_os_asprintf' declared here
      58 | char *adlak_os_asprintf(gfp_t gfp, const char *fmt, ...);
         |       ^
   4 warnings and 1 error generated.


vim +156 drivers/accel/adla_legacy/kmd/drv/port/os/linux/adlak_os.c

   149	
   150	int adlak_os_printf(const char *format, ...)
   151	{
   152		va_list args;
   153		int r;
   154	
   155		va_start(args, format);
 > 156		r = vprintk(format, args);
   157		//r = pr_info(format, args);
   158		va_end(args);
   159		return r;
   160	}
   161	
   162	int adlak_os_snprintf(char *buffer, ssize_t size, const char *format, ...)
   163	{
   164		int cnt;
   165		va_list arg;
   166	
   167		if (size <= 0)
   168			return 0;
   169	
   170		va_start(arg, format);
 > 171		cnt = vsnprintf(buffer, size, format, arg);
   172		va_end(arg);
   173		return cnt;
   174	}
   175	
   176	/**
   177	 * adlak_os_vasprintf - Allocate resource managed space and format a string
   178	 *		     into that.
   179	 * @gfp: the GFP mask used in the devm_kmalloc() call when
   180	 *       allocating memory
   181	 * @fmt: The printf()-style format string
   182	 * @ap: Arguments for the format string
   183	 * RETURNS:
   184	 * Pointer to allocated string on success, NULL on failure.
   185	 */
   186	static char *adlak_os_vasprintf(gfp_t gfp, const char *fmt, va_list ap)
   187	{
   188		unsigned int len;
   189		char *p;
   190		va_list aq;
   191	
   192		va_copy(aq, ap);
 > 193		len = vsnprintf(NULL, 0, fmt, aq);
   194		va_end(aq);
   195	
   196		p = kmalloc(len + 1, gfp);
   197		if (!p)
   198			return NULL;
   199	
   200		vsnprintf(p, len + 1, fmt, ap);
   201	
   202		return p;
   203	}
   204	
   205	/*
   206	 * @brief Allocate resource managed space and format a string
   207	 *		    into that.
   208	 *
   209	 * @param gfp the GFP mask used in the devm_kmalloc() call when
   210	 *       allocating memory
   211	 * @param fmt: The printf()-style format string
   212	 * @param ... Arguments for the format string
   213	 * @return char* Pointer to allocated string on success, NULL on failure.
   214	 */
   215	char *adlak_os_asprintf(gfp_t gfp, const char *fmt, ...)
   216	{
   217		va_list ap;
   218		char *p;
   219	
   220		va_start(ap, fmt);
 > 221		p = adlak_os_vasprintf(gfp, fmt, ap);
   222		va_end(ap);
   223	
   224		return p;
   225	}
   226	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
