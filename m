Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1422170F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913285; cv=none; b=YIPcj2IKzMKwZmDQHU2zVqgKlwnVUMtuyQku/uRUzHCUH2Z4jbnFlMxfaXKEu0nHP5BEqb0EwtvYYRaPKX9JVjczxdutxY3O/P955PHt8iM4IDFo2fqLGRdk/UM8ovGVeTEGT54NpmoAXt6JNP+XFgYRcMe8lGiljqvsM7wsbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913285; c=relaxed/simple;
	bh=v2RybWJRGfO6f1KTYPnGZjBCp2ScGY5TggKLoSP5ysk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+mvEAqFQx0omCWccsfSFA6VuHwxml5QTiVS3G08E7aPPIRGYgcHBs19gtKgg0vIa2RuxJi0+cqrE0IA3JZV+6yGRGP8/l4J9PCdsN4hW7N2rMZEaIlAX44z2RIBFpKmX0dFnwWA2Cs60lJWZUcnHiPn6gv3YtEk0FeiRgXqPo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkgdHuzn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkgdHuzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745913284; x=1777449284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2RybWJRGfO6f1KTYPnGZjBCp2ScGY5TggKLoSP5ysk=;
  b=hkgdHuznRgVGgaQWGgDeN/z0LUXJPbypkPIJ5xnMhzRGz6s5lZa9uM3A
   fRTQGjLBQwd+L2gbv38YAEYFPVPxWPkjReqZFMDwslxzyOA2OjLKYMuJ0
   6JlCi2FLdav5LDuPU1rAJl+gIv+GzUfAv9DrSMKzysogLXjiG+jyXXRVk
   GtCg5KdbsVqKsJcjgkrvX7ER5oghCj7++dJ/ndVolhJskwq652i0VFDqE
   7UKA3pgQCfraCwrKKTYkyDXZ+nc5EebfelvPt0MDqtNfxd/EV2CoWmnEj
   +iJLNDSD+ZbjukwbXaHmGpzpTqu+yIEOaijoZRTn8XlqVWnlRWBMDNjkq
   w==;
X-CSE-ConnectionGUID: va1ovzmdQESZmEfYZHMP8A==
X-CSE-MsgGUID: xR0FAn9fTWW48klXlCgdeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="35135999"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="35135999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:54:43 -0700
X-CSE-ConnectionGUID: Rrim7gCoSs2eXQ6m+MTzVg==
X-CSE-MsgGUID: n4E93bZ7Q5WBShaWAbx2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138564581"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 00:54:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fnc-0000Z1-2Q;
	Tue, 29 Apr 2025 07:54:40 +0000
Date: Tue, 29 Apr 2025 15:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 include/linux/fs.h:3280:20: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202504291510.Tjo4OjGw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   320b5ee4628267b1a1129c7c5fd4fba2b9fe9841
commit: dbfe42f1aecfe9a8588d3277305df7c7e7feaa2e [1/1] FROMLIST: fs: Generic function to convert iocb to rw flags
config: arm-randconfig-r111-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291510.Tjo4OjGw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250429/202504291510.Tjo4OjGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291510.Tjo4OjGw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/overlayfs/file.c:47:37: sparse: sparse: restricted fmode_t degrades to integer
   fs/overlayfs/file.c:128:13: sparse: sparse: restricted fmode_t degrades to integer
   fs/overlayfs/file.c: note: in included file (through include/linux/huge_mm.h, include/linux/mm.h, include/linux/xattr.h):
>> include/linux/fs.h:3280:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3280:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3280:20: sparse:     got int
>> include/linux/fs.h:3280:20: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __kernel_rwf_t @@     got int @@
   include/linux/fs.h:3280:20: sparse:     expected restricted __kernel_rwf_t
   include/linux/fs.h:3280:20: sparse:     got int

vim +3280 include/linux/fs.h

  3277	
  3278	static inline rwf_t iocb_to_rw_flags(int ifl, int iocb_mask)
  3279	{
> 3280		return ifl & iocb_mask;
  3281	}
  3282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
