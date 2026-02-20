Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614232DB799
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 23:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771629579; cv=none; b=BipQQcCfP+7K0qztyYNyT4f8DVvbqtbv/bTXDvMdBdKQXD6CDcuoYJoGnTF4AfFKvdFAl4dnZQR/U45Oh4WKeEdO1XdvvQ3itYc9Yom9Nz9nU+MOp5knOZ39/RF8clJnvGugzJXGw+dISyMWGRlToNGEZS70sgboixXvgoX7Zg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771629579; c=relaxed/simple;
	bh=TS6G1r26Kx86w8dFEkEeUrH0muu9kBdkf+iYlgVCfdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ayH46Te1YxLTffQ4DIciFO42v84e/sI2ikAngGtRWrUWVMUJh6UVNKwXcaMWGDm7VleDi852CkN9CV+KdKXpvNl+i/QnHIfjblExyNk6l5V+XyK0zVkygwe5t2x4m3CYA9DnGQZYWGYYBSYCLYadmLGfSiFca5f90WBo2/qpDk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7WwErdE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7WwErdE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771629576; x=1803165576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TS6G1r26Kx86w8dFEkEeUrH0muu9kBdkf+iYlgVCfdM=;
  b=E7WwErdEpqKr+MrV7VF9SdUYrGeRGHcj7/T8zRgl/i5JMBd6JhPNj5X/
   hsGacv8hwf6tfxDn9G7UnyowGm49CfSZ3Bsj8YSqgV6Lxq0tsq8n3DFs8
   3WPtueDl7PkhL9A4lT+kXJUccyJTsg+fUCsDsJYSlL8U/Py1uXvK9a50P
   01UfZjca62lPCYHIxrXDUcsDop17qjpXZHfbCO5DMDyQzu8pzpO+py7Q0
   RAsCTH+0NREj9jFFr4omaK2OsVVuCtUhjF0xvdGa7bqQoL7npEpxCZTkh
   UdNaoioykQhJSuZ4waRI0IMaPkqfI+dc5MofRvqTo2NM+KnAlnAAVD1OT
   Q==;
X-CSE-ConnectionGUID: 1KANUexHRr6/yq/t84HRhw==
X-CSE-MsgGUID: xRvrafhZQNGBJTOOquAcrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83442515"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83442515"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 15:19:35 -0800
X-CSE-ConnectionGUID: tirAp0ScS/yFnm8q/us9QQ==
X-CSE-MsgGUID: sRMogVcJRnSGjsDOwHMtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219125351"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Feb 2026 15:19:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtZmV-000000014Xm-1Vh7;
	Fri, 20 Feb 2026 23:19:31 +0000
Date: Sat, 21 Feb 2026 07:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 "Piotr =?utf-8?Q?Pi=C3=B3rkowski"?= <piotr.piorkowski@intel.com>
Subject: [drm-xe:drm-xe-next 7/11]
 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: warning:
 conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned
 int'} changes value from '14940110848' to '2055208960'
Message-ID: <202602210749.v7sCkR0a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   dfeef98e55d0e5f622886d0a9980c235ff08fd97
commit: cbe29da6f7c0d0541ec135e7292b35b97f8ca402 [7/11] drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260221/202602210749.v7sCkR0a-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210749.v7sCkR0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210749.v7sCkR0a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:3271:
   drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c: In function 'pf_gt_config_test_init':
>> drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '14940110848' to '2055208960' [-Woverflow]
      14 | #define TEST_VRAM       0x37a800000ull
         |                         ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:29: note: in expansion of macro 'TEST_VRAM'
      71 |         vram->usable_size = TEST_VRAM;
         |                             ^~~~~~~~~


vim +14 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c

    12	
    13	#define TEST_MAX_VFS	63
  > 14	#define TEST_VRAM	0x37a800000ull
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
