Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137C817BA7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726425000; cv=none; b=UQsgC8YScQD6TUTUE87DIS9PZhwnJq7O7ZvV8Wh400IYv7NbrBXq1TWyXZcuqWH40pYdKb6Pj5xVgnt1tPHvLAwi3G0fR1L5+X7ipxXjz05ZPEEoe7ZDkxeR+yNfhi6LO4F2Lk8CmLOXNHTXwgRwNVEtHIjbgM6cM5Aa2bnJzaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726425000; c=relaxed/simple;
	bh=ecEPTrO+4QKfdYKr/MN5RyC4DV4WNZlhWZ1IPIElyLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JF/AGsdDmrSpdEkv1kUXZZQBN1Gbmn3CmrBdB+vM/6/tuWjSD1DWv6Wtld35YxPWUff2oJiR/mSnha8eordlymm2HEQSR3W7R7RaetfKnTW1az3cz0XDTnKZdIhlSifTXtb+cFPnsG96IiD32vkYo89ubikj328w7GA8xn5ttfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDCVjmA+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDCVjmA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726424998; x=1757960998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ecEPTrO+4QKfdYKr/MN5RyC4DV4WNZlhWZ1IPIElyLQ=;
  b=iDCVjmA++rfXibIpZ7L5LGoRfT9Ufml4wyY0gjRmFiMLt0L+GZl0Gs8i
   YVn7O4pVGa7dwVs7VGND+Mh3+xxaUNvEjRg40jZKjGsC1C8gdi3B6EFK6
   9B00iOJHSZSzXK5zpeGiJfHMmpz30HxRv40KhM8ie7ZtodY/RU0k9Hbxa
   RytU7d/b4TAj8jA6utLBJNljRAaqNzQbLC9xUdLKGkCmQhnZT0JBFtcef
   I90gesp/jL3Z0cYBQkh+475iiXmKb5eQQFgaeiNIPDKgmGM6WoxvoxW/R
   1nOWibHUYmQYK25q0zUkn/GldPqL5q2td9jKTs3RlP0x6/xJPUo+BzkEb
   w==;
X-CSE-ConnectionGUID: lSHgobBmQ2aWomOJtGvhcg==
X-CSE-MsgGUID: Rw8mjhenRxCrDpsRetNksA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25390095"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25390095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 11:29:57 -0700
X-CSE-ConnectionGUID: 4vtHt5cjSZuEUFcaqqpvQg==
X-CSE-MsgGUID: d64+bVeQRGez8w2U8kekzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="69175956"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2024 11:29:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spu0Q-0008uy-0p;
	Sun, 15 Sep 2024 18:29:54 +0000
Date: Mon, 16 Sep 2024 02:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5041/23714]
 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.o: warning: objtool: missing symbol
 for section .text
Message-ID: <202409160207.ASe7kPkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 211070f39ed4ec7390dca8351c9fee934b8179e7 [5041/23714] HID: i2c-hid: override HID descriptors for certain devices
config: x86_64-buildonly-randconfig-001-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160207.ASe7kPkG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160207.ASe7kPkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160207.ASe7kPkG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/i2c-hid/i2c-hid-dmi-quirks.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
