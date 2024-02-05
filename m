Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4054134A0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 10:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707127404; cv=none; b=EWpKQzJuoD8GRX9mzepTVdlzBUIupjtbntucL9EjbZLbW2LQ1p55FwKxvqBAX8i3gY+Hk1n6j4YxHG0NSZxSnCRNPBwQ+COegGbfwyYbg3vlIatUj0xTkPCsiZAle6Z2fnbWysFE3S+bzfo8XE8aKfnM/laCoPKj92jnmt1x9L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707127404; c=relaxed/simple;
	bh=mVb+d0HUpJJfzVin6OUQWoa7zF6jh3TEbYWOJf79hV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tW7pDZPoZ3JAc618arM1ugC8u1Mf4u78+cHNArC4HRwEaof8XFo/aKA6qgrX7r3lLRW3iv4jpQcG9BVRnBXlvUQH28J603+JCdmW6X3lwFpEw4BMXW36KpYCgrv83ZGft9oNW2LKLI5Y7NiGpWr4Iab8B6Lo6AQ6AR84U9lBJDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nICIpyGb; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nICIpyGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707127401; x=1738663401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVb+d0HUpJJfzVin6OUQWoa7zF6jh3TEbYWOJf79hV0=;
  b=nICIpyGb/KMmR4It3H/yhWVjuP4G38sCtf8MLNrdD5OO0Memvqx8Q+XF
   SFpbPP/H8U+XD4GfnZ032d/Ym3vYadcdZ7zKIOx2Knd/hpzcdCvmkYonQ
   xehQ2IxZu7g0DSE6oj99RRju3hR1VCIVq0Llfv2PhDFWZdgG576Ru7mb8
   DKeUJq0RlqVFLbSX1HrocVl2ttdGZZCRf+r4xcou1kChlU/8RtrP8XdQT
   aFlRWDvunthLb2wnXkrBeiRzBOQRi/m6uKrenf2xRL1xDoz661mDIYwuA
   MpFAaXWYG4xy69vz9qracV23jpK+hZDxulPooOl2KBfzEZqTCptyQFkzg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="394913438"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="394913438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 02:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1001481"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2024 02:03:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWvor-0000LA-2V;
	Mon, 05 Feb 2024 10:03:17 +0000
Date: Mon, 5 Feb 2024 18:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:pr/339 15/16] drivers/video/fbdev/core/fb_chrdev.c:190:8:
 error: redefinition of 'struct fb_cmap32'
Message-ID: <202402051714.7Nf0rS1K-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240205/202402051714.7Nf0rS1K-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051714.7Nf0rS1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051714.7Nf0rS1K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fb_chrdev.c:190:8: error: redefinition of 'struct fb_cmap32'
     190 | struct fb_cmap32 {
         |        ^~~~~~~~~
   In file included from include/linux/fb.h:7,
                    from drivers/video/fbdev/core/fb_chrdev.c:5:
   include/uapi/linux/fb.h:320:8: note: originally defined here
     320 | struct fb_cmap32 {
         |        ^~~~~~~~~


vim +190 drivers/video/fbdev/core/fb_chrdev.c

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
