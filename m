Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507BA1B7E8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707042390; cv=none; b=E6vC3W1/5Ido9z5eG0e9aLoCoyI7V9m+hFJVnCy9jy70VJOhb+UVQ9Pt1PjoYswmYqpeGWPmoXwQpOm+mfIOYow8DlFkIQmIIyMykx4Q+Mkrb8tHiABdIR4CSSUJibK2GMRuYb3W4ETU/5UeAGMGRNCKcXu0jGnuxkRu+qqtVYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707042390; c=relaxed/simple;
	bh=nU1XjE9yWtZFx2f2kzzNCOyZ1kStBXcpF7QJiSTLn24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXnYzMMOCuRPK0CZutIx8nYZsmp4UxcTJrnyi1+oa8J3rRhl27C2ZckeVSXouX6+PGnYNU+kCuj2JcUuT9ggtj9kdH4xnsPNKuTl1MQPPA9fru1Itlo+elZtMOZ4sTx81vca/PXgP1rTcL8uPYpVw74uuT+HB0VZ1UkZcaPTO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khy0od7Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khy0od7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707042388; x=1738578388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nU1XjE9yWtZFx2f2kzzNCOyZ1kStBXcpF7QJiSTLn24=;
  b=khy0od7Y/PrKWSv14KXKa13iD0bx/l1mxRgB6PARKhCrwkb/zD2+Y8gW
   sCjVhMoV7l/ys5ZF/rBkvkRGAqa+YNXsJRQE3Q321HIBWyw15xEfksRdW
   +51/cGIBn2cxydSf7nf8/LJw8mAkJRqSAQkGQokEqz1vPz6zfbLRhJdyI
   MXwGT6f1yZjkB6dP21PjiCOFemF68npWem8l+0z0SKntY56wAMrGXbzk8
   WxB+qRK2TAEYCT5bSunqwQwhguyRKf+m4IuFLqssG6RhDm7viYbt+8wlL
   A8DRwnj+Hx+AmS10BUZdTcQ4Eo1R57rnGfU4ndedE3RUXfLvXduQbf8DE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11120629"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11120629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 02:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="475315"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Feb 2024 02:26:26 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWZhe-0006FC-1m;
	Sun, 04 Feb 2024 10:26:22 +0000
Date: Sun, 4 Feb 2024 18:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:pr/339 15/16] drivers/video/fbdev/core/fb_chrdev.c:190:8:
 error: redefinition of 'fb_cmap32'
Message-ID: <202402041809.3sJAqRg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel pr/339
head:   c178ea136b21f7814d3ee52d508d4acd2e3cf93f
commit: aa0cc72c4b46aee70fdf09a8ad9c79bc12e69664 [15/16] Update fb.h
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240204/202402041809.3sJAqRg0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041809.3sJAqRg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041809.3sJAqRg0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fb_chrdev.c:190:8: error: redefinition of 'fb_cmap32'
     190 | struct fb_cmap32 {
         |        ^
   include/uapi/linux/fb.h:320:8: note: previous definition is here
     320 | struct fb_cmap32 {
         |        ^
   1 error generated.


vim +/fb_cmap32 +190 drivers/video/fbdev/core/fb_chrdev.c

588b35634a5aab Thomas Zimmermann 2023-06-13  189  
588b35634a5aab Thomas Zimmermann 2023-06-13 @190  struct fb_cmap32 {
588b35634a5aab Thomas Zimmermann 2023-06-13  191  	u32			start;
588b35634a5aab Thomas Zimmermann 2023-06-13  192  	u32			len;
588b35634a5aab Thomas Zimmermann 2023-06-13  193  	compat_caddr_t	red;
588b35634a5aab Thomas Zimmermann 2023-06-13  194  	compat_caddr_t	green;
588b35634a5aab Thomas Zimmermann 2023-06-13  195  	compat_caddr_t	blue;
588b35634a5aab Thomas Zimmermann 2023-06-13  196  	compat_caddr_t	transp;
588b35634a5aab Thomas Zimmermann 2023-06-13  197  };
588b35634a5aab Thomas Zimmermann 2023-06-13  198  

:::::: The code at line 190 was first introduced by commit
:::::: 588b35634a5aabce1aef3297a048e42279f62dec fbdev/core: Move file-I/O code into separate file

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
