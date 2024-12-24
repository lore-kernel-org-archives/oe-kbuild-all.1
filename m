Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B21440C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735059141; cv=none; b=vFFHqtieUSGeo18+Pk4ln7yjcIPgzJvldiG6/hLfAUFw/FAS00dAv+PMkBaRDXO5BRd2b8OnzW7epC8Y/uLEjmBB82Ppb+paDoYJn3UWNkBL1jvbfjy5xvWyAPLjvdrlpJ0WcyvdCHdUww4aS580pSxZ41lkHGy/v+Lqf+eMy08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735059141; c=relaxed/simple;
	bh=USvuC6E9/ga4ABrD7dDCU0+Zf/xGBqX/lPEMNGx9hoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSMiOpm4kNgBP0B7mu257PKuCQ+0lOZZtzLF4ET7QpcC+X0CV4R7C4234nkjPPHJU3SKHYjGOfhIhpKsyD3MPio8c2mznujW3wFrGl0ngxG7JRTwMNEyWgQ4qdQb3pdnY3D1H+Zt7G6ZXXcfJuxndMurMmZIdscnoeow+LT94xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eur8gNs1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eur8gNs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735059139; x=1766595139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=USvuC6E9/ga4ABrD7dDCU0+Zf/xGBqX/lPEMNGx9hoU=;
  b=eur8gNs1yo9kO3RD56m5oL+UDUrJuAmL7aiKFahJpn0bfXJD89n8BKty
   lQPiBBBNnMvt/Homq4usK33gMbrWg7YkpOE19c7MWKC7N39KfPnFTT39v
   PvnY1ysswAw3Vxd22xDM2t5hm1uYSo7JsbOQv2xMhnv5LG+SWbuqs6Ix0
   GcJiX5LHENr5NGSMwgUiZM7T8mzw0Ol7XZHdLa1ABukwK0u95yd0+pJRs
   0zMSvV+MxzHQF4VbVyDrmx32YL18ST6VCYGxU0Tn5bFUBlY1pynygfAPu
   Knh6SKGB2q1mbml5efyh7D/ceOa06JHrugG9eV4HtzV/9IRuVN/bIOWh/
   w==;
X-CSE-ConnectionGUID: Q+c0rD+GTKyb+NF2zEaOFw==
X-CSE-MsgGUID: oLyrmFzfTMGZnJaARLkGtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="34837851"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="34837851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 08:52:18 -0800
X-CSE-ConnectionGUID: /013Kx65QdOxBABKXA/O8w==
X-CSE-MsgGUID: agrTtCgSTL682v68T77Vgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="99380741"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Dec 2024 08:52:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ88l-0001Iv-1Z;
	Tue, 24 Dec 2024 16:52:15 +0000
Date: Wed, 25 Dec 2024 00:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1345/1345] drivers/misc/uacce/uacce.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202412250049.8vKhen0x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33267d4a7f512d371a3ea853568832174be4caba
commit: 451823febcb610969f048556cedc41b5e08fafb1 [1345/1345] UACCE backport from mainline
config: x86_64-buildonly-randconfig-005-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250049.8vKhen0x-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250049.8vKhen0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250049.8vKhen0x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/uacce/uacce.c: In function 'numa_distance_show':
   drivers/misc/uacce/uacce.c:1032:23: warning: unused variable 'uacce' [-Wunused-variable]
    1032 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/misc/uacce/uacce.c: In function 'node_id_show':
   drivers/misc/uacce/uacce.c:1046:23: warning: unused variable 'uacce' [-Wunused-variable]
    1046 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/misc/uacce/uacce.c:60: warning: Function parameter or member 'dev' not described in 'dev_to_uacce'
   drivers/misc/uacce/uacce.c:81: warning: Function parameter or member 'uacce' not described in 'uacce_hw_err_isolate'
   drivers/misc/uacce/uacce.c:140: warning: Function parameter or member 'q' not described in 'uacce_wake_up'
>> drivers/misc/uacce/uacce.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
