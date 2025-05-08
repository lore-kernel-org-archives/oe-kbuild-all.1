Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1094283C93
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723206; cv=none; b=g8go6IVk6gLuo5O8nD6jL7EsuY2OBJ0Mx/LI9hdlbLTvn3oyLjxSMJpCWhoDqcCIdh/yq59n+gq2M7zQEyyY1ZTj+fqDbSIMD7vu8b/p7eHTbodbT8PLUa24zZuIb0cYIlFZp4f+raYSTY76jScpPP80M0CUWrMZt5uOs3ZdPzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723206; c=relaxed/simple;
	bh=pgLOvv7wql1RKAbHHCPWwuBTh520nWHrzZn7ZgfuXpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1vUAyKhA/mAXQl8SsvgAS+MK1fFhN3HwGkB2LY8vP1gFqIGDRSEDt1gvKkpOMaVHsZkTJ7CAYJxAF7ya5QIvEYc3ZWDAzuADsMVc+HLGTmFsP4q4Cuf1uvWd52oB1Yr/xFm4aTf73Gmq5gW4WGZmlrgdQgEOpe5zln3/rHGzR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3QQiZNT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3QQiZNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746723204; x=1778259204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pgLOvv7wql1RKAbHHCPWwuBTh520nWHrzZn7ZgfuXpI=;
  b=X3QQiZNT9oCSEKSHxKKntfyltiEhTCjFm3uC92muvxtfv2+0hD5BgFio
   +J/SEa3YUdm28ZEkm1ymJyN0o82l+iy/lgkTJjTy3Bff/N5FtgkyoKf33
   Ba8JXu2mUuBvPcvU1ZaCgts+ZQlymIdfy6PYJLu41E7c1sWGu7jzOEOQN
   P88YfG1XvfRyKL8YjVMraXLkj4c/JrU0R0B9xI2LjTtiWXWTJ8NMpc/aN
   cqOoQikPNWeujkkO0b/c5wU4zr/plaT0+yZ0IDTHSUedxQgR1WKVIsvaG
   eOOv53dxLtDsibUYdshd7fCpTOGZoHBf1SQQCpcLbP1IbB5uztxcc4kIy
   g==;
X-CSE-ConnectionGUID: TXFiLztTR+uN2fj7cPoFSw==
X-CSE-MsgGUID: bLFjwoYqTKK5pCt3qAz/5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58734007"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58734007"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:53:23 -0700
X-CSE-ConnectionGUID: 6QiCuKOfQjayuV/UNLvNpw==
X-CSE-MsgGUID: rKonsLTlSzWi2C35wV6FRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136286825"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 09:53:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD4Uq-000BBT-08;
	Thu, 08 May 2025 16:53:20 +0000
Date: Fri, 9 May 2025 00:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/350] include/linux/dma-buf.h:672:13:
 warning: 'is_dma_buf_pages_file' defined but not used
Message-ID: <202505090048.cSn1uXTz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mina,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 515f6947829b1645b8bb22dae8555631f0c708e1 [0/350] dma-buf: create struct pages backing a dma-buf
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250509/202505090048.cSn1uXTz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090048.cSn1uXTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090048.cSn1uXTz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/swap.c:40:
>> include/linux/dma-buf.h:672:13: warning: 'is_dma_buf_pages_file' defined but not used [-Wunused-function]
     672 | static bool is_dma_buf_pages_file(struct file *file)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/is_dma_buf_pages_file +672 include/linux/dma-buf.h

   671	
 > 672	static bool is_dma_buf_pages_file(struct file *file)
   673	{
   674		return false;
   675	}
   676	#endif
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
