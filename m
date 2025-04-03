Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC66A5228
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 02:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743646877; cv=none; b=vBw+kioY1MUCMuMyz03GlEpn0sSZaid9N+STvHY++5erNPJVu1pjoTWRynqczd6OWsIiNOM5hawrTYbqZt4owV2UPBk8x67JVMdBJR7Ce+hAQ3NSHJHLNLbz/usyIZwdooMGtzjsnrBQyP19UJrIM5/hJmR7rhHDaVhL/cXTXGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743646877; c=relaxed/simple;
	bh=URBiP3kxJmGrDy5T+5BFJbMKfgGcfB7W80F/8gwXU6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OvUfxxHj5GLOK5t4NGdLqXeoJz6gw0tFnPHgverzZ6sBH5A2LwFUtWItAvKg7ycOKwe0/7MdFfoBvRzj0U0jI+80LYuUqvm3cfJ4/5I7p1zUOEgU3kXTz/boCPJ9hXukXTJYCesQ5GmMUJ3x+lzuz0l57ppaLB66EOPKg9s19rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIjF/cLV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIjF/cLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743646875; x=1775182875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URBiP3kxJmGrDy5T+5BFJbMKfgGcfB7W80F/8gwXU6Q=;
  b=IIjF/cLV6UBbOR6BPoG48YxsY3JjrP+2Pxlp8naru0C2HDoIPnAZwwUg
   WeuV9NMwEZCmp1KbrlAluKy3C+41fUQrtNaqOXHwpPBRaJn85glCSC4b1
   DoJbOEx7f4wtl0cMTrU4vElNtLV8zR9tm6f/QnrSmwePJEyhl+fEye0UQ
   3yRXQdooa73ofVZ+7ZA3RQEdyo6svO6mTXtgcYKWFdgB7pqQ7ep+/rYzu
   4wX3Nodb/JN1Yb3sIXXKbCZuaeD8RTaRLVBj7Ep7egMzNB8O4LOosii8o
   alMwYa5famjpXpsWovnH5owW24UGYWWZokE1x09dCPrr3QnAEpQanZ0P9
   Q==;
X-CSE-ConnectionGUID: aReng6j3Qx6MV0E96/oBiw==
X-CSE-MsgGUID: PUFb3Y75Qhu4i7+92DlzcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48700717"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="48700717"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:21:14 -0700
X-CSE-ConnectionGUID: 5S4cza6tQYqS8EGF+QhqMA==
X-CSE-MsgGUID: 6FTISeyFQ7+F1+OK3shDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="126858175"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Apr 2025 19:21:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0ACd-000BAU-1D;
	Thu, 03 Apr 2025 02:21:11 +0000
Date: Thu, 3 Apr 2025 10:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-01 4/4] fs/binfmt_elf.c:2162:19:
 error: 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202504031035.QcA9bOwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-01
head:   e105df0199f47354657fce04690f1f56c3080dae
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [4/4] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-053-20250402 (https://download.01.org/0day-ci/archive/20250403/202504031035.QcA9bOwf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031035.QcA9bOwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031035.QcA9bOwf-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
