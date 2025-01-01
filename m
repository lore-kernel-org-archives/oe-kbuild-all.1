Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712233A1CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735732933; cv=none; b=cBRn8ehvYukHyEBOhpGzyg6Ktxag8kuxgsVHUERZtgAuDGRN6kUupRmZmuzDBhRQDCgVG52WfHT3sFDqtozhTImZH4/9zs5vznschPAOtHSZJVVqebxZXkNvi3+7rjf0+5GE9BlNPNDv34/6rO0koI2DvIT0Uc9XmS/Imtgjjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735732933; c=relaxed/simple;
	bh=hVdpU9VngujbGpPUh4kPTy8lwJfvk/9Wry0VXbHaEcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ky3FxBx0elnWs/OMb+Jyg6qXiaCyD5C+NupjOfZZyWExS16CaQvqxojFDKdZqjHl6DMJQPPm9/sAFDlydYLT2w45KzBK99oztx4IyCHdEaNkAi7VjybF/vFIRP00RvhQgC+QKmRmjOoRX+N21RY1lM12ANogqCqOD7a3X1fvpnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMkTLni9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMkTLni9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735732931; x=1767268931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hVdpU9VngujbGpPUh4kPTy8lwJfvk/9Wry0VXbHaEcA=;
  b=CMkTLni9mboepl+KajyXof8ixCdYNJkh33FlPlGNrQYSBtiDCVtp+kBW
   juoM2z6dgzOoK5ASfv+26ZNqZgtm4DTHbTGmgls7vJQory2QWCFVAxN4R
   B+bJlbf86jI+mluzRRbHh6I0vz2zRMVAYRZ1eES88lUzaoh5g618oH5G5
   mDaYcN0bx4+HGwIrY+BCnFIzYUpmABoUET1MEWLMbhhcJsfZGfQz23PSK
   Wm6uLyZ7WDC89WDUXFV3OyfBkKcfO/66q00GUmSRaYKnMZyjKSWSAlJSd
   sSl3H7LV1sIzqkKs9Driznh0h81UwljpecYfWWUJPUEx9LqHBnW8zpxsB
   A==;
X-CSE-ConnectionGUID: ODJISb9JQd+DtEJLEkmoyw==
X-CSE-MsgGUID: HZRW1BixS/yX4LsJ8UlUkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61362155"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="61362155"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 04:02:11 -0800
X-CSE-ConnectionGUID: Z8fwpAtaQ0WJdItnJSB5wQ==
X-CSE-MsgGUID: oK+YtE/XRre20x55m1e5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="101019363"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jan 2025 04:02:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSxQN-0007nB-3A;
	Wed, 01 Jan 2025 12:02:07 +0000
Date: Wed, 1 Jan 2025 20:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: <command-line>: warning: '_ttyVK' directive output may be truncated
 writing 6 bytes into a region of size between 3 and 12
Message-ID: <202501011951.6nEbRUVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Scott,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 91ca10d6fa0720e35596c720e494d9c18624418a misc: bcm-vk: add ttyVK support
date:   3 years, 11 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250101/202501011951.6nEbRUVn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011951.6nEbRUVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011951.6nEbRUVn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/bcm-vk/bcm_vk_dev.c: In function 'bcm_vk_probe':
>> <command-line>: warning: '_ttyVK' directive output may be truncated writing 6 bytes into a region of size between 3 and 12 [-Wformat-truncation=]
   drivers/misc/bcm-vk/bcm_vk_dev.c:1454:38: note: in expansion of macro 'KBUILD_MODNAME'
    1454 |         snprintf(name, sizeof(name), KBUILD_MODNAME ".%d_ttyVK", id);
         |                                      ^~~~~~~~~~~~~~
   drivers/misc/bcm-vk/bcm_vk_dev.c:1454:9: note: 'snprintf' output between 15 and 24 bytes into a destination of size 20
    1454 |         snprintf(name, sizeof(name), KBUILD_MODNAME ".%d_ttyVK", id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
