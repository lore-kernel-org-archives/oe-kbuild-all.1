Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725B42A82
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765611136; cv=none; b=ERVhxQcOYp0ZCeH1RVRRwLfzBTgU1N3bUqSY0zfTaLSLhTBVLZngSi/mC897bzYOjeeGgvo9qDH6Y9o+EGcBHYdhdPE2OR2jyel9Cbgn3v7uAdLaYepURRcZsScU/wz0NiGV0N1ayzpqdvmHFUiwKZM9inIwmLhpIKwJjFvIzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765611136; c=relaxed/simple;
	bh=jhvyiUKPmcz3S5acmxZjrumj25MGXQJEDaz2/lx0K18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcCR3Dn7NHk1mUB5y6aLsm+l2fON1lLYt6vHsYmUuWzBTh9bWS09+eAAi9pVDTtxcWHAOQ97c1sZ5P+q37TuTMAk5GYLSKxHkLk7+5jB4CCLcRK62VlrlN4Z7PsLi42DLE05HNwLps++FsZ3ewnLTswzWpRwrXD9Gnu9B7mxm0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i35BcXbL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i35BcXbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765611134; x=1797147134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jhvyiUKPmcz3S5acmxZjrumj25MGXQJEDaz2/lx0K18=;
  b=i35BcXbL66yYn7RgXgewrqSc1el0rXb+CEUhsYvUVy0B0BrkHzWINrtJ
   EHZ69hPi/V2Eez1fgA+uCWkYboF7QY7rgsQXGnMIGaOrmPoUJ/zSnjxnZ
   xAzkZRQEZvw8IvAzlPjr7NPrOm7Q+FuuRLcqRHBvoQNj5WLilT4Mt3pyY
   V4IGZF2WpIZYcJn+HV+2LKUiXWtrFcDukYL8+Bfa5dxm2sFoAnHhqOow0
   SQrbCEDkacfRrkspBfg0JJaXx116Ug3LTr5KZ6aP8pLyMdEundeDxMmZ1
   IYy8F/Wy32SVka8IwYiS01hn1yT6mwZMnf7xL0u9Q7lk7ZlJ9roYn0LAx
   Q==;
X-CSE-ConnectionGUID: Kv6Vpur0QDKfTQjIReG/9g==
X-CSE-MsgGUID: fbONrcFLT6iYEpRo4Z5OCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85197481"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85197481"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:32:14 -0800
X-CSE-ConnectionGUID: TwFxfwPNSZCoy0gAd6INEA==
X-CSE-MsgGUID: mMMXnEz1QgKJMqTDEMN+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197171716"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 23:32:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUK6s-000000007EU-2kI9;
	Sat, 13 Dec 2025 07:32:10 +0000
Date: Sat, 13 Dec 2025 15:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:3: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512131538.JaPFWqNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 6d3faafa89dee569bd8376840a2f60114538f2a8 [50/50] anolis: net: supports linkdata ethernet controllers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131538.JaPFWqNP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131538.JaPFWqNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131538.JaPFWqNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ring.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_hdc.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_monitor.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxevf/base/trace/sxe_trace.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_irq.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_msg.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.


vim +3 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c

   > 3	 * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
     4	 *
     5	 * @file: sxe_debug.c
     6	 * @author: Linkdata
     7	 * @date: 2025.02.16
     8	 * @brief:
     9	 * @note:
    10	 */
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
