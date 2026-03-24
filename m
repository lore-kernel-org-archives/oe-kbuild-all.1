Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE402C326F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 01:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315177; cv=none; b=fiHCKoLqPGsHs8ajD8SCHWswouBdhlsDGhOgrcWRbVoe6No7Lg3Fn9/VflHCrUma7hG9H1UEzv5lOs+9mrMOhFDxUW+ZDYwNArjWGIUl0fx58ssPc8njVjFa78uu1JaJkcz3GA6SXwffdfEspepENDCZcOfW4u22e4ld1RPICBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315177; c=relaxed/simple;
	bh=pmwKrxB0ve2DDuzRu/l6pf5UHxqgrUnVNzf4jTTJt1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OnWmYhPJn7q1YHCOj6DSsw6EyZf8mAriCQroG7lQCqFl0Dg2EcA2Lkl12VtpL+Zvim+Xk3DLil3AuZl02EwEzKvG4JxGa2YXK/DlCs7glsakcZtKOWJ/RvnixESr74FbylXi6aB3XmZqHmbSvaYXdSd2/pf4z8RNznyVoaRrN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9lSQl46; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9lSQl46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774315176; x=1805851176;
  h=date:from:to:cc:subject:message-id;
  bh=pmwKrxB0ve2DDuzRu/l6pf5UHxqgrUnVNzf4jTTJt1U=;
  b=i9lSQl46yPVNbACAfS5qL9OMaHcFzq92ySJh4dm2WvbwgL/EEnEOSX/V
   /QK4xIb8fAuBGSip9sclxOMAyBY7ncsz4Rdd0AGytWZywfE1QqUu6sos1
   xAOYeFWVXKjBEurfnKJXTzq8Lo94faZC2J4av1OujumEzbfHQSfXDE5Z7
   23Ksc03hccadxrsff9beIiVR7dtkzntnqiTOUQ5OPD4/ZJ0rlFrFO+gSR
   365G0AF6BoJT/NDyd6PRI1DqDWySIDgQBQGZ1z69X766tH037kFFYoYAZ
   EolLBuAXpn/6b+QhdcJVPMzYZfzuA8jSf/2/HiBHm+KJQ6WYUHaq8vSQQ
   A==;
X-CSE-ConnectionGUID: oj2T5O8jQvKkwnF1oi/psw==
X-CSE-MsgGUID: /OU6M7tbS5qHkJ99UGXBwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86796933"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86796933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:19:32 -0700
X-CSE-ConnectionGUID: W5FoZvaGRsaVrdnyE6n/Kw==
X-CSE-MsgGUID: LRVC2fZDTXmLLjRtQz+QWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224209261"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 18:19:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qQa-000000003V5-0FnD;
	Tue, 24 Mar 2026 01:19:28 +0000
Date: Tue, 24 Mar 2026 09:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: undefined reference to
 `xe_configfs_clear_survivability_mode'
Message-ID: <202603240902.xF8d7xsN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: bc417e54e24bc9c96d3c6eba2c8c60f7919e5afe drm/xe: Enable configfs support for survivability mode
date:   12 months ago
config: parisc-randconfig-r051-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240902.xF8d7xsN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240902.xF8d7xsN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240902.xF8d7xsN-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x8): undefined reference to `xe_configfs_init'
   hppa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0xc): undefined reference to `xe_configfs_exit'
   hppa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
>> (.text+0x1cc): undefined reference to `xe_configfs_clear_survivability_mode'
   hppa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
>> (.text+0x32c): undefined reference to `xe_configfs_get_survivability_mode'
   hppa-linux-ld: (.text+0x394): undefined reference to `xe_configfs_clear_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
