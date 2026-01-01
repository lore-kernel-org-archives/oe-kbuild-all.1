Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4C312CDBE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767286787; cv=none; b=AzHcAe6OGdx1oB1Qh0Ih+oXv7zQK58+0d3U2l1o1Q3l2KxOOMudC8dk4J1WZENhjBn4+5jweHsTCc9FsZ2OqD16focDmYgxop0cWuOLSWwz3+lPvzYzN2oUDCNstQoONHljhsyQx2RRovfCKLFXcyhSjZmBwIWnrhjPOsBhZqt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767286787; c=relaxed/simple;
	bh=JfE1iJFeGo4s5cV8PWFDuj6nlKmy3XSRSg2XeqV8sRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gV8FDONatQ85FgB6526YHUhig7OP/3tu9O299SwZudkcYaD3+z3Zfrg1i+G9k4fKGuFRvUQJM7IiivxpMv2MHNiE/aqBtoLWxamiJoQmfJMf7z/VWfycAJG750zfq5++gM057IBprLDCyrAjTC8lci8fXzPiH0mpS3iP6nX6Brg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixKTNomq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixKTNomq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767286785; x=1798822785;
  h=date:from:to:cc:subject:message-id;
  bh=JfE1iJFeGo4s5cV8PWFDuj6nlKmy3XSRSg2XeqV8sRc=;
  b=ixKTNomqyowZeHUUNP8BaWOzjENQrc0neWeJ4+AMzG8MlA+tEVhuSnBn
   MKqtKtLUrltEnT7ceQ6xu7UWr7COZ6XMsz8qV/qME6ib15DWSJjNmKjxP
   ym1dDEcmP1mRTUwqoNZtr3J5VI41A7Czbo9l782elYL1JLpKG9O+78163
   E2gHGtt0d0qfheOsfv7dBCVNAgPE/YZFWGXV5llABf2bl5tzpxpvqRKwT
   uujq5vcJD2MNj6QzeqTx/dMJjoI/y9EjMq5nigtqtJyKdSOjH5Xk3yfvH
   RpAsf1H4MGFnBCgWk+MOtl5Be8sxahuM4COcW5eTIfKpTSAsKDfSgrk6F
   Q==;
X-CSE-ConnectionGUID: NJnbzBmLSGOKcxQFiBjuLw==
X-CSE-MsgGUID: yX9iJxpXSkiA9lsPB3L+7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79537155"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="79537155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 08:59:45 -0800
X-CSE-ConnectionGUID: gcotyASFSSexraD0jBgDtA==
X-CSE-MsgGUID: myGWjkOdQpak52HRs56K3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201666896"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jan 2026 08:59:43 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbM1U-000000001xB-329i;
	Thu, 01 Jan 2026 16:59:40 +0000
Date: Fri, 02 Jan 2026 00:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/ntfs3/file.c:109:6: error: unexpected token, expected
 comma
Message-ID: <202601020020.lMLg3t16-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: ae91dfe38966fa30d713e705a69bf6c5c7f4c2aa fs/ntfs3: implement NTFS3_IOC_SHUTDOWN ioctl
date:   6 weeks ago
config: mips-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601020020.lMLg3t16-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601020020.lMLg3t16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601020020.lMLg3t16-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ntfs3/file.c:109:6: error: unexpected token, expected comma
     109 |         if (get_user(flags, (__u32 __user *)arg))
         |             ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   fs/ntfs3/file.c:109:6: error: instruction requires a CPU feature not currently enabled
     109 |         if (get_user(flags, (__u32 __user *)arg))
         |             ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         lwe $2, 0($16)
         |         ^
   2 errors generated.


vim +109 fs/ntfs3/file.c

   101	
   102	static int ntfs_ioctl_shutdown(struct super_block *sb, unsigned long arg)
   103	{
   104		u32 flags;
   105	
   106		if (!capable(CAP_SYS_ADMIN))
   107			return -EPERM;
   108	
 > 109		if (get_user(flags, (__u32 __user *)arg))
   110			return -EFAULT;
   111	
   112		return ntfs_force_shutdown(sb, flags);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
