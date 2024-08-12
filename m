Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE756167DA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723453910; cv=none; b=Kcbl7gp3TwA+rY2ZHtSemqypIKw9QnhrJvMvFwFK6WaM1UsYRDsFFMD2MLdNGPAJavGUIMOOpliet7tmKKtqOOSVcW18jCEOZ3KWQZN036T990M3sCbQhk3a73CCjqciaYXCi+PSC6a5jpxjP7kNHjuWKdT5jqj3fMzzdXv+RIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723453910; c=relaxed/simple;
	bh=rsiEr9vBM73yxt/y2gsI1pSLxqZae3tHB1G88cKgiIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIWz5Y3QzchvSY3PML8erMXt1/G3WTHV2GKBiY8iPevUoCRtREf78dz/wFW2k/jYzSqER8T3Gcq/AHm7VILiKvCqyR1w5EUxAWNbtrEdXiEqsHWFbkqgvfX7/1xYtnO282VLL4MKnqXvkhLK3+gAxi/YTatM8iBhNpaNh/YWT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ay9o+VO3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ay9o+VO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723453909; x=1754989909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsiEr9vBM73yxt/y2gsI1pSLxqZae3tHB1G88cKgiIc=;
  b=ay9o+VO3jCvQ5rs/oYtdA71TBtjSf6kPYXFMC2USJqaKb4foIIEvaAw1
   MVM+WzJ0Bv3uARyayesLMh71rrQ0/6axtjvxmaR+kYqxzXKJu3M/qZmLw
   5VjKzKuyKiGIdeYcurzATOpJ0fFVMB9JCsQSsBPq8ws6QxYR1atAjiezW
   MjDR0Wv5IJZsIDEOjLjQHAMYolyH7I5B21JNDXvS7XpD8uOr/vlrfhk8S
   nB2Z+Aoeu7PMQa/KZYoLggHAUlfHwl0YKRx5lkr1DiOJI9h/7iw1yesDU
   xmJtz5KC67VjrUJNErGCANHeKQNgl1iVzMHvdl4oYIKfllAX7JjzrrcuO
   w==;
X-CSE-ConnectionGUID: gDqQaGxVSTG/6oAvAuAjNA==
X-CSE-MsgGUID: 3AEJae/vRsifUiYpQQ/X/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21112344"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21112344"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 02:11:48 -0700
X-CSE-ConnectionGUID: iDQeGCM4QnyR2ZOwT7XbtQ==
X-CSE-MsgGUID: k/UWCIbkSGm+poAZ8yPHUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58136008"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Aug 2024 02:11:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdR5W-000BZ5-19;
	Mon, 12 Aug 2024 09:11:40 +0000
Date: Mon, 12 Aug 2024 17:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joseph Strauss <jstrauss@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 1867/4072] leds-blinkm.c:undefined reference to
 `led_classdev_multicolor_register_ext'
Message-ID: <202408121759.CgpXclIo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e6869691724b12e1f43655eeedc35fade38120c
commit: 56e8c56c9af0df8b6de7bc4b6d9a2f4570b055db [1867/4072] leds: Add multicolor support to BlinkM LED driver
config: s390-randconfig-r061-20240812 (https://download.01.org/0day-ci/archive/20240812/202408121759.CgpXclIo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408121759.CgpXclIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408121759.CgpXclIo-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/leds/leds-blinkm.o: in function `blinkm_probe':
>> leds-blinkm.c:(.text+0x2d6): undefined reference to `led_classdev_multicolor_register_ext'
   s390x-linux-ld: drivers/leds/leds-blinkm.o: in function `blinkm_set_mc_brightness':
>> leds-blinkm.c:(.text+0x2b92): undefined reference to `led_mc_calc_color_components'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
