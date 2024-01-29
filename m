Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB558153BC1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 21:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706565439; cv=none; b=Tg7Z9xPcVHxKYWl+XV+6ZxAEA8GQBV2YxzHeAHYepQWWM6jC9biicm6VvoMSluBemm+BOc9+ZhElR4BuhlL2s8ANmU1YJUjHJ1IuCreDp6wPNoQPqzAZpYsPTNs/I64Lj4PH4F7Dkt7nsjKCSZcTjpKNQLZOM+2sXoaEm1rBkiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706565439; c=relaxed/simple;
	bh=swmsGpHQkirNDx2q1FEaAg3vSeJvSdpvoQh3W+wMNCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSXRtrkxAJ8tB7fEgmGBW2BBLdv1vgPqa1n2PLjay41FGfrMHfmmFdFQKHYofMBVBl7zWW9+Gb7nFnJlyEPLDNRKZ1VRN71obcTnDabJr1J0cbTaaFk0lME7DLNwxerbhcloVSSU8UA5NvwE4aXbZpoHypidsJULLj5UEdnv8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEn/JoIw; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEn/JoIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706565437; x=1738101437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swmsGpHQkirNDx2q1FEaAg3vSeJvSdpvoQh3W+wMNCY=;
  b=FEn/JoIwZEek6m66FCkpq5NnPjuIAZhkk/7KyCD7b4PAkbwrQ5eGs0w3
   e6giFbz4j6saKRYvK7KU3WdJZaodVUX9NZsbjH626I1mL+r9ekBAs6Mej
   Y36fzuYRWYHhux+esv+u02jbGSJN+Q5dzLwyuXA3ChDOBRiGhZGai+SRU
   i3b8WORV6pHKDGiZbnM17sjQQCA9HU4C+f5W1zjvBSgvZr8sIq7JsH80V
   +G/vfNf0FzGxqKI1HhnGlY6YLk73c68rxu5vmZwlrEpcmtXS5sbdS7baI
   fse2pB7tQ+igY45vIKfKuNa5TtW4782fb5TCBGKs2nzmF/ETujfbq8iRs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402730662"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="402730662"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 13:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3537984"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jan 2024 13:57:17 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUZcv-0004fM-30;
	Mon, 29 Jan 2024 21:57:13 +0000
Date: Tue, 30 Jan 2024 05:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 2420/26476]
 drivers/gpu/drm/lima/lima_device.c:291:6: warning: no previous prototype for
 function 'mtk_set_power'
Message-ID: <202401300510.QEjiDbvY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: d87e1a23e51158f9c2923f6213a42d5e942a4091 [2420/26476] lima: power on/off via register (function)
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401300510.QEjiDbvY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300510.QEjiDbvY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300510.QEjiDbvY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/lima/lima_device.c:291:6: warning: no previous prototype for function 'mtk_set_power' [-Wmissing-prototypes]
     291 | void mtk_set_power(bool on)
         |      ^
   drivers/gpu/drm/lima/lima_device.c:291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     291 | void mtk_set_power(bool on)
         | ^
         | static 
   1 warning generated.


vim +/mtk_set_power +291 drivers/gpu/drm/lima/lima_device.c

   290	
 > 291	void mtk_set_power(bool on)
   292	{
   293		if (on) {
   294			void __iomem *wakeup_register;
   295			wakeup_register = ioremap(0x10003014 , 0x04);
   296			writel(0x00000001,wakeup_register); // this may be wrong, may need bitbang 0th bit to 1
   297			iounmap(wakeup_register);
   298		}else {
   299			void __iomem *powerdown_register;
   300			powerdown_register = ioremap(0x1000300C , 0x04); // powerdown register
   301			writel(0x00000001,powerdown_register); // this may be wrong, may need bitbang 0th bit to 1
   302			iounmap(powerdown_register);
   303		}
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
