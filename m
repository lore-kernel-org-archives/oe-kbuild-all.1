Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F483EA83
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232156; cv=none; b=kTDjSV3319Q1s3yBatauwYRscGwF2wLRbC1Nvifh6rDk8BX7/sJLT2dQflWUY73YOoNtiXVQhuRmP2Fr9/rmtrZGLL7xK0VbQLgdE/pDdoEq9zQPUiHZGB72tywVJFWDG8woBQBXJgrf+8uMFUJC+DoK6Xn92QDKxh8p5lnvnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232156; c=relaxed/simple;
	bh=i0yKT05ZBs+L4axH59ES9oLw6ROltKB6PQuWdpkzgGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSu3a1DaVRfUZItcq1Hy7TqQDvY5pXni5o5+WjaVAX1+gjFZznhcJpF81DRF05xmkyciMmcO495723HWEnyEhFCx2iwLo0i0B7ddiknMNkuzJhgCsQSpuZMpdI+GfGu//HT7ZyGWMoVHGb25tFFcXhhmLQwIpbnCYYyvoMjISPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9u+Alfm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9u+Alfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735232154; x=1766768154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0yKT05ZBs+L4axH59ES9oLw6ROltKB6PQuWdpkzgGo=;
  b=G9u+Alfm1dlquJMvk3/6dHYT9mqGF4UP9l7lSvnbQpHkB2WCEwdyLtJK
   zshNxdjfI0LvTTklq8mo6y7P89ckFzjHapN/iuyXJ1JjD6/Pkk2MGDUTe
   XgjzBdWH7S1tLUMKpsk/rqnX8hG92ks3ahldKut1Db2odjqiEvjWvN3Hj
   2Mp3uq5yh7/YTKJ95Hbgq+rMVp60riR/p6xY0ahAcFZDg8UcJoDqWfW3C
   pLxNX7Fk3VGDvamPTDo4NrBKOX4Cb0+L02lV9lrPnEFejjlTpW4y9uB9e
   TUQ/IvYcCLZD/d0M7eJJzjxNkSF8MMlyPKanUqurCgLfbWxMeLKgLDfPA
   g==;
X-CSE-ConnectionGUID: 0i0RDixWQqOj0I8pWm8ujg==
X-CSE-MsgGUID: pDwom7hES0+tHccybaD/Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35680008"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="35680008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 08:55:53 -0800
X-CSE-ConnectionGUID: B9xQv+QtS5O/XRX68hI6bA==
X-CSE-MsgGUID: lrBgh5M2RwazP+cuHwpFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130949987"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Dec 2024 08:55:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQr9J-0002hd-0P;
	Thu, 26 Dec 2024 16:55:49 +0000
Date: Fri, 27 Dec 2024 00:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, liwei <liwei728@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1665/1665] include/linux/entry-common.h:285:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202412270028.2z6SRiIf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: d9ed39df777afd38fcbd4f4ca670cceb2f168124 [1665/1665] entry: Move exit to usermode functions to header file
config: loongarch-randconfig-r132-20241226 (https://download.01.org/0day-ci/archive/20241227/202412270028.2z6SRiIf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412270028.2z6SRiIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270028.2z6SRiIf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:380:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:380:9: sparse:     expected void *ptr
   kernel/entry/common.c:380:9: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c:423:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/entry/common.c:423:29: sparse:     expected void *ptr
   kernel/entry/common.c:423:29: sparse:     got int [noderef] __percpu *
   kernel/entry/common.c: note: in included file:
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got unsigned int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
>> include/linux/entry-common.h:285:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:285:9: sparse:     expected void *ptr
   include/linux/entry-common.h:285:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *
   include/linux/entry-common.h:298:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/entry-common.h:298:9: sparse:     expected void *ptr
   include/linux/entry-common.h:298:9: sparse:     got int [noderef] __percpu *

vim +285 include/linux/entry-common.h

   264	
   265	/**
   266	 * exit_to_user_mode_loop - do any pending work before leaving to user space
   267	 */
   268	unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
   269					     unsigned long ti_work);
   270	
   271	/**
   272	 * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
   273	 * @regs:	Pointer to pt_regs on entry stack
   274	 *
   275	 * 1) check that interrupts are disabled
   276	 * 2) call tick_nohz_user_enter_prepare()
   277	 * 3) call exit_to_user_mode_loop() if any flags from
   278	 *    EXIT_TO_USER_MODE_WORK are set
   279	 * 4) check that interrupts are still disabled
   280	 */
   281	static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
   282	{
   283		unsigned long ti_work;
   284	
 > 285		lockdep_assert_irqs_disabled();
   286	
   287		/* Flush pending rcuog wakeup before the last need_resched() check */
   288		tick_nohz_user_enter_prepare();
   289	
   290		ti_work = read_thread_flags();
   291		if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
   292			ti_work = exit_to_user_mode_loop(regs, ti_work);
   293	
   294		arch_exit_to_user_mode_prepare(regs, ti_work);
   295	
   296		/* Ensure that kernel state is sane for a return to userspace */
   297		kmap_assert_nomap();
   298		lockdep_assert_irqs_disabled();
   299		lockdep_sys_exit();
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
