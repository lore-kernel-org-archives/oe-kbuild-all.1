Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E223ABB6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492541; cv=none; b=coZv4ihZbMgVHJoNjtNfIxtU+Q1bmGdrsICvdUz5cCILfmooHHGcZn/96ruWVX2SZuz38WgY66vfTB/ndyIbyLU5yJxI3sgg4uJ+UDaNYQDCjRifgjLQhRolh03i58SBCk6XW7eUSHpqiFCLyOlwMVwrzPtWi7/6gISGVD3q5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492541; c=relaxed/simple;
	bh=8ry2P903RzSPNdUUFDIf8hP4tbIzXstKArEXfR7CfW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZ/d529KXzxK7xqRFKreM53dhB+zaIp5gQi0gatVnqRlrLChDtPsSSkHccy1oPlLrHYmQ1evT95kHrEvPI+lAGEz6CzkEcAIg5x++cPHpD81mGzaYArDimkeAsmkjUUUXL9QJEkBLgyOMMmuQAKcCRzuZDEFvyfCkAZOvk5rIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+Eb49F8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+Eb49F8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751492540; x=1783028540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ry2P903RzSPNdUUFDIf8hP4tbIzXstKArEXfR7CfW4=;
  b=D+Eb49F894hZfjD9WPq5oGZX8Y/GK9MS3zVkYOw62T12X8UYFzWpTMDQ
   6Xd57Xx4POpr1jiDCbdK+11PU77B8DOYAkuKJJDBHJBJeDS2dCTtLqaMY
   gUnz9S/XOV4C11fyahhZdY2yu2CW7inugalY5Yg2rUbmm4SwEC8LYePJw
   UTyg4N51GU6qJjCigS7UfNXZ49loyXGknjjGYW5D+UuPtXWEughcrMtl+
   vgIyuzgoOo0oqIxQKQOKp604BkVhBDti4ySPQP7H9v4TNf+YYggBcwmrI
   4PcVzg3d29OVOHxRNUiTfJLoQyAXL9nOKV8130KNHoupQNB212vjw8k8P
   A==;
X-CSE-ConnectionGUID: qPCy2leqSU+zdiEUCZcPHw==
X-CSE-MsgGUID: EhfYiFtnRGWGRJEhwHmAeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64503923"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="64503923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:42:18 -0700
X-CSE-ConnectionGUID: QSCJrwoYRxmfJcMNXAPS9g==
X-CSE-MsgGUID: tkDhZr99STqemdX3UdHCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="159877755"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2025 14:42:17 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX5Da-00016d-2G;
	Wed, 02 Jul 2025 21:42:14 +0000
Date: Thu, 3 Jul 2025 05:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 36/44]
 drivers/media/radio/radio-wl1273.c:12:10: fatal error:
 linux/mfd/wl1273-core.h: No such file or directory
Message-ID: <202507030506.PIX6iGnC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   2e8185c0f214d45cdbc20ee4e6796c561ba66c55
commit: 17f5c6fa85e53fd69d88c124e4569f71fe1ca80b [36/44] mfd: wl1273-core: Remove the header
config: csky-randconfig-002-20250703 (https://download.01.org/0day-ci/archive/20250703/202507030506.PIX6iGnC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030506.PIX6iGnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030506.PIX6iGnC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/radio/radio-wl1273.c:12:10: fatal error: linux/mfd/wl1273-core.h: No such file or directory
      12 | #include <linux/mfd/wl1273-core.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 drivers/media/radio/radio-wl1273.c

87d1a50ce45168c Matti Aaltonen 2010-12-10 @12  #include <linux/mfd/wl1273-core.h>
87d1a50ce45168c Matti Aaltonen 2010-12-10  13  #include <linux/slab.h>
7a707b89202f905 Paul Gortmaker 2011-07-03  14  #include <linux/module.h>
87d1a50ce45168c Matti Aaltonen 2010-12-10  15  #include <media/v4l2-common.h>
87d1a50ce45168c Matti Aaltonen 2010-12-10  16  #include <media/v4l2-ctrls.h>
87d1a50ce45168c Matti Aaltonen 2010-12-10  17  #include <media/v4l2-device.h>
87d1a50ce45168c Matti Aaltonen 2010-12-10  18  #include <media/v4l2-ioctl.h>
87d1a50ce45168c Matti Aaltonen 2010-12-10  19  

:::::: The code at line 12 was first introduced by commit
:::::: 87d1a50ce45168cbaec10397e876286a398052c1 [media] V4L2: WL1273 FM Radio: TI WL1273 FM radio driver

:::::: TO: Matti Aaltonen <matti.j.aaltonen@nokia.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
