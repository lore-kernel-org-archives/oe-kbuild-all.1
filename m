Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928F1D12F1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731050817; cv=none; b=TyXB4F+1h9IBkyIrF5WMbss5VbX0fSQs4W1OoxXPw3szRl0ZlR+P2qSS8UxXs4jOVV4+7zEkeamZElRoO4VXmGn+4yVgLX1R5GOeOpV5ODenX7LdkW+63PlYDK35nPHoEe0YuNdXEIc7i4+qCzXrUfzsJrmG3DpPFcRp5NWHDHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731050817; c=relaxed/simple;
	bh=QblrtU9laTd9tf6pf3h7PZQQKnr408pXF/8DtN0UqiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBVUz0mA+tbmnayaxczkwZjwoTcvIB1FNNsOK1j/kGsPkWbjDyNgr2bA5XkZqJUaqlA5694dItvS1ZUs/zQl2+AWlh1qKZ0awdquGNbYcmX4iXfCP5ysh1yTlT3BwiMaAPDl3FDpIpq5MLMgoJIVcEQz/JTT1Vr5iSjMmuGLDRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEAPSQ3R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEAPSQ3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731050816; x=1762586816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QblrtU9laTd9tf6pf3h7PZQQKnr408pXF/8DtN0UqiE=;
  b=LEAPSQ3RKjxvoCy0iLOSLkmh0lvojJCoUzOA0c2gXgIMu8fZHMHPAcFM
   VC6d7rRshKZpnF4dAeYk6HSoq5sBbF3DM+QSlH8Azgo700ka1nM4xsnH2
   KCGfzia+8EOhJyZJlvv90dj4uavDRnFiB7lrPwS0DjeDUiBdqbMlPRrp7
   ifK8htEB/lp2YrAKe0neIpyvyBR2DPKPlpiemM1+8y9sK3PQQETgG9a+E
   1B/JEe77TDfNlF1Envt9JhDjbFbz70MBHjtSjq6yUXRJkGG6iHOU9izLB
   0WYlgq+m2jcQVGlquLsLOyZt4bSoxcdFSeZ+BiOSKA0iRj9BAiTj7adq7
   Q==;
X-CSE-ConnectionGUID: bA1DbokuTseuac5e0xx37g==
X-CSE-MsgGUID: oK+zG+v1QmGM1xtxHdDwow==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56319157"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="56319157"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 23:26:55 -0800
X-CSE-ConnectionGUID: YQuqnKZpST6Mh7I72lryyw==
X-CSE-MsgGUID: ij42355XQFeKgfZDzrt5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85535263"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Nov 2024 23:26:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9JON-000r8v-0m;
	Fri, 08 Nov 2024 07:26:51 +0000
Date: Fri, 8 Nov 2024 15:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1219/1219] drivers/misc/uacce/uacce.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202411081751.ofDiZRvj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu'an,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bafa65a8c91fb9c99706d2d22210690199f95779
commit: 451823febcb610969f048556cedc41b5e08fafb1 [1219/1219] UACCE backport from mainline
config: x86_64-buildonly-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241108/202411081751.ofDiZRvj-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081751.ofDiZRvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081751.ofDiZRvj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/uacce/uacce.c:1032:16: warning: unused variable 'uacce' [-Wunused-variable]
    1032 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/misc/uacce/uacce.c:1046:16: warning: unused variable 'uacce' [-Wunused-variable]
    1046 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   2 warnings generated.
   drivers/misc/uacce/uacce.c:60: warning: Function parameter or member 'dev' not described in 'dev_to_uacce'
   drivers/misc/uacce/uacce.c:81: warning: Function parameter or member 'uacce' not described in 'uacce_hw_err_isolate'
   drivers/misc/uacce/uacce.c:140: warning: Function parameter or member 'q' not described in 'uacce_wake_up'
>> drivers/misc/uacce/uacce.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
