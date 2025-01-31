Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88C1B6D09
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367865; cv=none; b=ciLFxmpMpChKOaZjkCh2XieuyBlZMFuJzhwQgBLPYSN4gQFk4uaWDe+54kQMk/lVMYU/C5RLwMqC9mwG77KTpet9mXRaw0pUXBjVAw/cdOucoSkXC6J33mxGL02mmSNC4BAIA2j2NpWoxywvshxeXSLtXDy+pOGOcNPqGRCoexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367865; c=relaxed/simple;
	bh=/C/Us4Bb7gM7YOEe2hB3FVHoTpsrDJCiLhiVl059ozE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+6mdmX8ahBRLsKE+A1xRYvxVja56p4IY9bD7O1HWYbHEXbFpb7vd3XB3Qf7rO2LJ/Q4f7nAyB/hEyH+lJyDQy19a03mwfnNiNw1rn9r5tBEcwQzuCAeIDUUd/sgqhtFMcco7GHxULclHXwBY3C0T3L0kE7oq9NM43XHW3uDuuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC2IwgMO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC2IwgMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738367863; x=1769903863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/C/Us4Bb7gM7YOEe2hB3FVHoTpsrDJCiLhiVl059ozE=;
  b=PC2IwgMOpH1MJi5+1ylbucteSj/fE6M4nRewSzE5Lsgt/f/K3LRp+Ri2
   vjYnf1JSqaM+VZVCd3aQfwZqsvari684IN3mbdl30hKJ/Twk67GLv93/5
   xqmFI0P8iuWNETvxfM+A28YG1F8e8MvIdPWeTqcLpCa+B3oqobVfJqP+h
   jbAPeNE7tChphwWFk5ka1/RxR7rWBK2LOL8ImC8wVZXONDji+cf3lpVtg
   3oxLLdCuqtGEyCrJCPhnkTXDhHJaay6PxaYFTzu0TnEiubFsegiKVpwWH
   w1DzmSMAmuTsc4uSzvESWQugEg95tvb7poh3XYpa5Uzm4pNwFiehNvsZk
   g==;
X-CSE-ConnectionGUID: br9/C4n3Ru2Qylu+13x8Qw==
X-CSE-MsgGUID: EZerXWZBQKyTyTpCUW1mpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="26550636"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="26550636"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 15:57:40 -0800
X-CSE-ConnectionGUID: iC0QZVa7Qwy6hO/V/OB0kw==
X-CSE-MsgGUID: 0i3VHdeEQIWXTHH9apRCpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140647305"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2025 15:57:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te0tE-000nRa-2c;
	Fri, 31 Jan 2025 23:57:36 +0000
Date: Sat, 1 Feb 2025 07:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] fs/proc/task_mmu.c:1858:8:
 warning: no previous prototype for '__pagemap_lseek'
Message-ID: <202502010745.0huoatrw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   807ce3b4f02f37ed863053f05604ba866e8847a9
commit: 0715c0e2078d5e9bf1b2da50fae4a738cd346016 [3/3] ANDROID: 16K: Emulate /proc/pid/pagemap
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250201/202502010745.0huoatrw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010745.0huoatrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010745.0huoatrw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:1858:8: warning: no previous prototype for '__pagemap_lseek' [-Wmissing-prototypes]
    1858 | loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
         |        ^~~~~~~~~~~~~~~


vim +/__pagemap_lseek +1858 fs/proc/task_mmu.c

  1857	
> 1858	loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
  1859	{
  1860		unsigned long nr_subpages = __PAGE_SIZE / PAGE_SIZE;
  1861		loff_t ret;
  1862	
  1863		/*
  1864		 * Userspace thinks the pages are larger than they actually are, so adjust the
  1865		 * offset to compensate.
  1866		 */
  1867		offset *= nr_subpages;
  1868	
  1869		ret = mem_lseek(file, offset, orig);  /* borrow this */
  1870		if (ret < 0)
  1871			return offset;
  1872	
  1873		/* Re-adjust the offset to reflect the larger userspace page size. */
  1874		return ret / nr_subpages;
  1875	}
  1876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
