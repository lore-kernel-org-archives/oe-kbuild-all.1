Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D8421ADA9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011824; cv=none; b=EM51wrv0MadSpX9BGDmcPMZZrT5qJiHzMTenGiQ1BKIBCG5SIIqEW1G79q8/YfKRdDFURFFY9fy0CgDXIG2OGtmQagf4+DOmshe6zUvbUVCyBLT6frtg1D4+YznPwBJb6J0joEWDtZ2oDqrcp0P5J5c5B53dihLtnxW5azP31R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011824; c=relaxed/simple;
	bh=MdLuYTrcyfubQBYyAsC7ztMboEFjDJ9wrCSPW9AN4i0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqIPGSMRAqSdJBXrNWozqKMNqPB3YwiBKE0dzO3ThyUn1ZKIXySqDg5wETdlK6RUatU1vmkJ0mG7VZ/cj32odmBqaGbzA4o3HmGJZ5RWxppQ+a4fjFypc40/SUX1OFa2UZLPNJH5VvbzqjNcA7UJ+e/4KJG0tbXiAvw5oPi2YfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHAsNY5T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHAsNY5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746011822; x=1777547822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdLuYTrcyfubQBYyAsC7ztMboEFjDJ9wrCSPW9AN4i0=;
  b=oHAsNY5TupDMJq3Gs7Zq8lg0wBglw62LDGR7nCST7UDhZf9EE7HvCNKh
   PxXHmm7IiydilOYeYRVyn6IHJXDtrkiMZqnnLHPLp6dNlz1cqVErhCKk+
   pgddu9NOpI2ZDOjy3rtQ5IqFkch8Oql8gcG52Tg4Ee1voLJtdtgI9pY82
   yibMSfbp44oMx2ZYsF0M56x0rdaZC7j9QYsdLgvhNPti67uviH16az94H
   gE6zInGocJ+SnkLQ2YmaYwWiCwwqA0UTKHCbtWImSZ4CYIYw/mhVWnvI7
   ybxFp9dKWjgI4x32W3yOFrPGBAIUgYundLDl4VvKvqx9b/WMB006xa+gr
   A==;
X-CSE-ConnectionGUID: FSdP5O3FTJmkpkAlSPtULg==
X-CSE-MsgGUID: Wolc4k2YSo21HKjhDdy4Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47814391"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47814391"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:17:01 -0700
X-CSE-ConnectionGUID: ZnxwRAgAQsGOnHlzu4Yd+A==
X-CSE-MsgGUID: 5xbuQ4dtTeCu4QJ3vfJjgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134035111"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2025 04:17:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA5Qw-0003P7-1X;
	Wed, 30 Apr 2025 11:16:58 +0000
Date: Wed, 30 Apr 2025 19:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 12/14] arch/x86/hyperv/ivm.c:395:60: warning:
 control reaches end of non-void function
Message-ID: <202504301906.aofQDfxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   a4f560f88ebe36d504463b63e648dbf3468f836c
commit: 34c83ece500350809581ca9365b38908a8973471 [12/14] x86,hyperv: Clean up hv_do_hypercall()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250430/202504301906.aofQDfxo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301906.aofQDfxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301906.aofQDfxo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/hyperv/ivm.c: In function 'hv_snp_hypercall':
>> arch/x86/hyperv/ivm.c:395:60: warning: control reaches end of non-void function [-Wreturn-type]
     395 | u64 hv_snp_hypercall(u64 control, u64 param1, u64 param2) {}
         |                                                            ^
   arch/x86/hyperv/ivm.c: In function 'hv_tdx_hypercall':
   arch/x86/hyperv/ivm.c:445:60: warning: control reaches end of non-void function [-Wreturn-type]
     445 | u64 hv_tdx_hypercall(u64 control, u64 param1, u64 param2) {}
         |                                                            ^


vim +395 arch/x86/hyperv/ivm.c

   391	
   392	#else
   393	static inline void hv_ghcb_msr_write(u64 msr, u64 value) {}
   394	static inline void hv_ghcb_msr_read(u64 msr, u64 *value) {}
 > 395	u64 hv_snp_hypercall(u64 control, u64 param1, u64 param2) {}
   396	#endif /* CONFIG_AMD_MEM_ENCRYPT */
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
