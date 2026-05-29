Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F953370AFD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 04:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780027721; cv=none; b=eC/5felpmabz22gGUmtQ5TV2Y6cJ+GcbyxmhFbHbg61l6/1TRT83DOIevFLbQrFj2oclp7nXK5gYJSsXbAJjURelRxAQcEK0fO5kvjCB/ZabJJV3MTe6uztqe/hqPyfIcXueiIH4wyg+3rxGDOfc/n8BxcTfyy+7wUHKcK5i1Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780027721; c=relaxed/simple;
	bh=clnK1bUEQA71V+U02Q61BMqqOgoylm5A42KdMz/i0Ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YSR1Xm1L8RY3wlcde7ZO6+kf32ClhkYkpEgCtn+hxKsQf90C4GVvFmogBKduWrnedT8P0fo09poBAR5QwC4uELHkQ5+d6ZeNgsMnHBKCs0Q5KpKP1WP3aonYqVIFfGKzJSUVmlL9vFy0crr/ynlIYY4dTYcHJCZSTrJwdU+IBIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QY/Pr3n/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QY/Pr3n/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780027719; x=1811563719;
  h=date:from:to:cc:subject:message-id;
  bh=clnK1bUEQA71V+U02Q61BMqqOgoylm5A42KdMz/i0Ok=;
  b=QY/Pr3n/M4U1moxVx2p4APCaoLBP+UBuWJlAK5cIWJdDgTL0WtZ3UVak
   tq9fl1qTt3bawiukgTyzXwT1SI6Ach5Ic5xAxLhflxeGWyRrfwWfK8OYz
   yemeOMdTl2bIAX8k3ov4vzb22IC8V/dZeVFYQsjoNaGoNhLjB2cufmJMt
   w/ZsTOllGWQziOPnJJ8ZUDz3hAERFFkdqD6mUK8TFT4/5dckcBcfzPSsN
   osIYOyk42uzjtJ3PYz2Xm1JOflAQ8Y7UYU//QLIKHrEVnitE4dY2cDB5B
   3v4TlIzyj1cExtmqcRtTCVdIIjUHe9RbjKvW8szgzueDT+kRJp/q8tdvk
   w==;
X-CSE-ConnectionGUID: eK+PMFbJREm9OZzVkJn6qg==
X-CSE-MsgGUID: 8gHrnyIvTjqJEezZVlZJlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80870219"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80870219"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 21:08:38 -0700
X-CSE-ConnectionGUID: bLEP1Uo2QGSl89yeT8efHg==
X-CSE-MsgGUID: Tq5sYcYNQ6ijU8MQkUM3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247024837"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2026 21:08:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSoWQ-000000006kQ-01eB;
	Fri, 29 May 2026 04:08:34 +0000
Date: Fri, 29 May 2026 12:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Subject: [jic23-iio:testing 242/251]
 apds9999.c:(.text.apds9999_read_raw+0x548): undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202605291105.CBDnsmM6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   6f15decff24dac42895c0f01f0c2143f9b8961a6
commit: 0467fb7ad204eeb42ed04db475ad05e6311a5c2d [242/251] iio: light: add support for APDS9999 sensor
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260529/202605291105.CBDnsmM6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291105.CBDnsmM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291105.CBDnsmM6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/iio/light/apds9999.o: in function `apds9999_read_raw':
>> apds9999.c:(.text.apds9999_read_raw+0x548): undefined reference to `__aeabi_uldivmod'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
