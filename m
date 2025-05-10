Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B61754B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 01:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746841584; cv=none; b=o0vHHOuoVMBb2vT7qNSpKwbnex+JL6rWPQqzhlXt73xQXkpHqlK1e6xtmtUjsMY/zRQRty/LSCo6Cr9+rUGoVa0JiQuKhXDsn9sXGbX0t4twS6YHew2k/62mgqnS7MRbCd6Kg/uX3o/Q1UsZkYtzd8uzR22WClJdp3vO/8A1ViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746841584; c=relaxed/simple;
	bh=c1BBEIGxtQxEnaaNv7/XTWoAXye+J7l9yPS+Cf+5KG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKTyzeFT9itd3Aw/2g0OYno63veIM5JkfVFZKrZnM8NLJdiZwYmAq3Wnw/qzw6Jjr6+W7HJIAiWyfnuldH63skiGqu1QSPxfW2R34CLLONBOi21eaqFPiIno0diudN85XlPC4zGctHKeA/hreQEqtjZLYySuFdEVyE0BTM5Kj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2AQut0l; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2AQut0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746841581; x=1778377581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c1BBEIGxtQxEnaaNv7/XTWoAXye+J7l9yPS+Cf+5KG4=;
  b=T2AQut0lB4FsKcLArL561f2amU2Nyiv8Nq0kedp1/oimDGQM8RGjUdz6
   9uliDgntMBlDxE5Xs6QIJ5J0w8v/caKgL/eIQjLOk7lSVpVBA5h/a9Cru
   NiaLYU+MrLEKXPKxmICd9nFBZHYjRg5/pKsMtp9a1XGSAXwG9Jvh4fjdn
   Y0MyqIZzYcuCYX+KPmaj3prNrn1j5FeSmTM/hIemq3iCCK+5dUDCWM22I
   aV4DPN0bguApBMoflZowes5N3e4MouKpXcgsNo5rX1mKxfDeejTPTrvWd
   t3b15nOatGNcwQzLGAmEiSDzb8+99dK1yfcyM6F9tEn4bEF1FJPf4hL6m
   w==;
X-CSE-ConnectionGUID: UPq6EyvPTC++H623wjqK3A==
X-CSE-MsgGUID: m7c11rcjSPCKJDxL8u88Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48377566"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48377566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 18:46:21 -0700
X-CSE-ConnectionGUID: I4pWMDaUScu06u6SQXHqsA==
X-CSE-MsgGUID: 6e4lyytlS2ikorHzqQ/GJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="141551125"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 18:46:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDZI9-000CeX-34;
	Sat, 10 May 2025 01:46:17 +0000
Date: Sat, 10 May 2025 09:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] vivid-osd.c:undefined
 reference to `fb_alloc_cmap'
Message-ID: <202505100936.JorFRl7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   54fe54966861b5352dfb0a9559b9afcda7d0c52d
commit: ce5631988c89b3e9b662f50612a87526ea3d093c [1/1] UPSTREAM: media: vivid: Introduce VIDEO_VIVID_OSD
config: arm-randconfig-r063-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100936.JorFRl7r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100936.JorFRl7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100936.JorFRl7r-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_init':
>> vivid-osd.c:(.text+0x466): undefined reference to `fb_alloc_cmap'
>> arm-linux-gnueabi-ld: vivid-osd.c:(.text+0x4d4): undefined reference to `register_framebuffer'
   arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_release_buffers':
>> vivid-osd.c:(.text.unlikely+0x1a): undefined reference to `fb_dealloc_cmap'
   arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o: in function `vivid_fb_deinit':
>> vivid-osd.c:(.text.unlikely+0x52): undefined reference to `unregister_framebuffer'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x4c): undefined reference to `fb_io_read'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x50): undefined reference to `fb_io_write'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x6c): undefined reference to `cfb_fillrect'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x70): undefined reference to `cfb_copyarea'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x74): undefined reference to `cfb_imageblit'
>> arm-linux-gnueabi-ld: drivers/media/test-drivers/vivid/vivid-osd.o:(.rodata+0x88): undefined reference to `fb_io_mmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
