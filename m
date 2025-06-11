Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33D53EA98
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658028; cv=none; b=Q72v0sm2V15ej5RZRq+bvaYsU4yT4Esit/3FvYDpAtlv/UPYe/HeZnbdwwH+ENfsNbtX90ePHu/Xt3MIuNDUPVo9It0LPqwPESxN9HTjGsAVssLda2xwDxSE+N/Jsz4snjqREpYVcPmH7fFU29/tp5wY1WveYoP9Mop1yfu5h2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658028; c=relaxed/simple;
	bh=e8NjzLJa1+wCciEsihuCMgwS2EDJK4xHJ/xBXb9GpiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvpKxLEzbPowIISR8luVitrYCkzv7T/uC08eXCn9MKv3iagqXXgXtpGG0jjxuCM17cwJB+BhdZAjZQJUso1V2kZFw4wlJ4Vj2IGU5BgU1k78dSYP3JmSLEP8e+zG2xialDu4HWZuyf9uGwpGi4jjmamC8MjmzxmLztIr4bOPSNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQdBoEuq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQdBoEuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749658027; x=1781194027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8NjzLJa1+wCciEsihuCMgwS2EDJK4xHJ/xBXb9GpiM=;
  b=SQdBoEuq74vpp9TDU1/BsvzsidHUT1fR8iNd24pP7tDT3sjbFbXhDWnV
   qqoTtQI30P1qLqkRZOsETpIwXa0zXwnk5QeQZxiC7CazuR9KHz88eujG7
   Xm8Bv+mCeUK69uPuIx8xODw7Xma25en9uulemLoV2torts/+Er7ZYIU/R
   IYFFE1OwqEpywPlurFZI1tYjXg8RYeonQIySQRP0CeSn5bTi3lrld3j9u
   KWy+Q7HdqihFK8fUSXpJ6oTAoNFnwQtbinpWWbe0Ty6ahmc4MzhFuiIa+
   Z2yQOpcRjAYnhHKmoNSfpeAodjQJXZ4KnQ9vG3jK1Hs1aK4nMHllh+dAY
   g==;
X-CSE-ConnectionGUID: +ZxNkpPCTXSHP2Hs0rtMHg==
X-CSE-MsgGUID: ESOcArecRvaym+GoQDntGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="50915921"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="50915921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 09:07:06 -0700
X-CSE-ConnectionGUID: 5d5HzYyfRbi1M40bgWMWhA==
X-CSE-MsgGUID: ZI0hapRFSxmWE8wiQTUDIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="151033559"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2025 09:07:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPNyh-000AgC-1H;
	Wed, 11 Jun 2025 16:07:03 +0000
Date: Thu, 12 Jun 2025 00:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [linux-next:master 1448/1841]
 drivers/gpu/drm/panel/panel-visionox-rm69299.c:241:42: sparse: sparse:
 symbol 'visionox_rm69299_1080p_display_desc' was not declared. Should it be
 static?
Message-ID: <202506120036.oCLAYYbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   19a60293b9925080d97f22f122aca3fc46dadaf9
commit: 01a2c6756bcae987472228c41319fc6ab2cc89c8 [1448/1841] drm/panel: visionox-rm69299: add plumbing to support panel variants
config: i386-randconfig-063-20250611 (https://download.01.org/0day-ci/archive/20250612/202506120036.oCLAYYbS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120036.oCLAYYbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120036.oCLAYYbS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-visionox-rm69299.c:241:42: sparse: sparse: symbol 'visionox_rm69299_1080p_display_desc' was not declared. Should it be static?

vim +/visionox_rm69299_1080p_display_desc +241 drivers/gpu/drm/panel/panel-visionox-rm69299.c

   240	
 > 241	const struct visionox_rm69299_panel_desc visionox_rm69299_1080p_display_desc = {
   242		.mode = &visionox_rm69299_1080x2248_60hz,
   243		.init_seq = (const u8 *)visionox_rm69299_1080x2248_60hz_init_seq,
   244		.init_seq_len = ARRAY_SIZE(visionox_rm69299_1080x2248_60hz_init_seq),
   245	};
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
