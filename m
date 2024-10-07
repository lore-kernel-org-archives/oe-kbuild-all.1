Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509856AAD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 01:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728264086; cv=none; b=GIcG9mcSE7OvMa6+4UbtOqW567Whg96IBnv3FL8ermZq0YJAbQIapNduw94y7XXcoeywzJJytA7DHCNhlT8L/IPyKdUZVzdj/FFqX6kvl16dnYQA9itEKR7ZGJSm2vrxrZeN2mRBzb0PkcSrRLu/TYVsT6z53mxif8HRrVl72ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728264086; c=relaxed/simple;
	bh=YEQ/loGDBDiGkrLAhvYp5WJLP7MFhdUoO2JNyvFfAS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kYPR63IAiZw81Bxr6pxAxNcL0oH3xmXneVrgqYs2J6Ip721lKewPZrvt2ibdXuKVmm9DkG2YUf04lxslLLmmtiqw0+OmFRAm1zqUp9HQ5Kvd0r5XLfMzTldpqnVz7sZZHawuP6RV9MCBgU5tv3DfliX4LHYOIflxje+5ci8A9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NceXvP+U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NceXvP+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728264084; x=1759800084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YEQ/loGDBDiGkrLAhvYp5WJLP7MFhdUoO2JNyvFfAS8=;
  b=NceXvP+UbfsPG13FtX+ttojV3zPmmJLksn2EYjLu//XtJOiSkh1tSaJc
   qbwVoIOH7SLyvO9Cxnl/GQQtTksxSi25q2m/3ATjHHRz1ldyAUBeR+gPu
   0K36MfO5dXxuTmstdl4KSXDDx0VN9NaHbfADibzd5xK3v+yqiSL+2VXma
   t2RtgIoYYznnV9ljDteASnv+tRMokJfcGSCrpBtgCD5Q96RPqvtZje9IT
   icQR+ZKEXW97fwvRwBkwiCHFQ4U8ZiTUIWXYP04utaJZ8IPAh5YTj+SvQ
   GAgwusrREJ7ppWoacH+jtWgAh9cEsVxWnKWOOcMsS5DRScoCfvom19Ydz
   A==;
X-CSE-ConnectionGUID: 3exJBS4hQt6HlN02ZpPMuA==
X-CSE-MsgGUID: SIbdmc9ATVaiMLukzFvJHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="26906594"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="26906594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 18:21:24 -0700
X-CSE-ConnectionGUID: UsW6Er0NQd+7JpPJK0jJ5Q==
X-CSE-MsgGUID: bzyR9Re/S7O9XSbkemrCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="79294443"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Oct 2024 18:21:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxcR6-0004UG-1B;
	Mon, 07 Oct 2024 01:21:20 +0000
Date: Mon, 7 Oct 2024 09:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.experiments 3/3]
 include/linux/rcuref_long.h:50:1: warning: control reaches end of non-void
 function
Message-ID: <202410070945.SH0uPjRo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.experiments
head:   007604382bae5e5955ef294a676bd3eb1c1bbac2
commit: 007604382bae5e5955ef294a676bd3eb1c1bbac2 [3/3] fs: port files to rcuref_long_t
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20241007/202410070945.SH0uPjRo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410070945.SH0uPjRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410070945.SH0uPjRo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/fs.h:48,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1120,
                    from fs/open.c:9:
   include/linux/rcuref_long.h: In function 'rcuref_long_read':
   include/linux/rcuref_long.h:23:33: error: 'RCUREF_RELEASED' undeclared (first use in this function); did you mean 'RCUREF_LONG_RELEASED'?
      23 | #define RCUREF_LONG_RELEASED    RCUREF_RELEASED
         |                                 ^~~~~~~~~~~~~~~
   include/linux/rcuref_long.h:49:21: note: in expansion of macro 'RCUREF_LONG_RELEASED'
      49 |         return c >= RCUREF_LONG_RELEASED ? 0 : c + 1;
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcuref_long.h:23:33: note: each undeclared identifier is reported only once for each function it appears in
      23 | #define RCUREF_LONG_RELEASED    RCUREF_RELEASED
         |                                 ^~~~~~~~~~~~~~~
   include/linux/rcuref_long.h:49:21: note: in expansion of macro 'RCUREF_LONG_RELEASED'
      49 |         return c >= RCUREF_LONG_RELEASED ? 0 : c + 1;
         |                     ^~~~~~~~~~~~~~~~~~~~
>> include/linux/rcuref_long.h:50:1: warning: control reaches end of non-void function [-Wreturn-type]
      50 | }
         | ^


vim +50 include/linux/rcuref_long.h

d72d156a1254d8 Christian Brauner 2024-09-18  37  
d72d156a1254d8 Christian Brauner 2024-09-18  38  /**
d72d156a1254d8 Christian Brauner 2024-09-18  39   * rcuref_long_read - Read the number of held reference counts of a rcuref
d72d156a1254d8 Christian Brauner 2024-09-18  40   * @ref:	Pointer to the reference count
d72d156a1254d8 Christian Brauner 2024-09-18  41   *
d72d156a1254d8 Christian Brauner 2024-09-18  42   * Return: The number of held references (0 ... N)
d72d156a1254d8 Christian Brauner 2024-09-18  43   */
d72d156a1254d8 Christian Brauner 2024-09-18  44  static inline unsigned long rcuref_long_read(rcuref_long_t *ref)
d72d156a1254d8 Christian Brauner 2024-09-18  45  {
d72d156a1254d8 Christian Brauner 2024-09-18  46  	unsigned long c = atomic_long_read(&ref->refcnt);
d72d156a1254d8 Christian Brauner 2024-09-18  47  
d72d156a1254d8 Christian Brauner 2024-09-18  48  	/* Return 0 if within the DEAD zone. */
d72d156a1254d8 Christian Brauner 2024-09-18  49  	return c >= RCUREF_LONG_RELEASED ? 0 : c + 1;
d72d156a1254d8 Christian Brauner 2024-09-18 @50  }
d72d156a1254d8 Christian Brauner 2024-09-18  51  

:::::: The code at line 50 was first introduced by commit
:::::: d72d156a1254d8298d22a59f13b5ed47126b6b5d rcurf: add rcuref_long_*() helpers

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
