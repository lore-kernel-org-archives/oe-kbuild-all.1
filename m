Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7E17B506
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733390163; cv=none; b=jFxK2IlggUE/EOvNdgjp+KXvIMNOkn91X7gAEpYVk3Dl24CD/X2ga8E0edW4tcU85vFtlDlAkO7uw2jqzEW9keZxOKhiknMH5UcQIhL2ylzx/SN7TxrcJM5mqtJQfnQDJs7SwLxE1pHQppd3sVlmeHYJwNN81MX5gMT5DJwwWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733390163; c=relaxed/simple;
	bh=4CEqEtvsMB75wa6Fw6NJycUWWxlqd4pztrsNyvf6Qjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dj7VrcozOAI1g0vnp2wuFtGP5UC7CTCqR0pyRs5g8nDD2KIkqvcWQfiA37Al5dfjyS8EEbfFtaySsqIs2D+8HBRAnbfCM3wlU0kRM/+CCDH7ovk0jm9Mq9eQhUZDkfMoyxunp0lWGC7hKfReOP4BP8HhqxDflOJ3kJsCJFvTBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUYs5wDe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUYs5wDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733390161; x=1764926161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CEqEtvsMB75wa6Fw6NJycUWWxlqd4pztrsNyvf6Qjc=;
  b=EUYs5wDehaC9FET+/wgnj573l0JiE0nM93K1LKvdm0o1ooNZ7iF8w+pl
   IpgBaOk6TTjXedO7AGDh+rOZSCR3y0Qrw3DCg6ouCrvyq9CfjejuN9s64
   OC0WNpx4ByBtAxVm1rh2DAGqTAEcEzLpMaYflrXimg8Ioiej7aBeHOKxA
   rhcuEOqAZ+0yYORdMWFKwuFS8WxfsJ2KFBmXrapojGIi9WMhY1vOPtsAc
   S0u6+rqjjMJSHeNGrglqo6o7c1cpplmOmMwbyy2fmzDdJ4RZ2ZSCSEcnD
   JBOQzz+DsXVNsi3CzRx4McEMZaSpeJvw/qyeuCsbl8HBJ1TfL50oq8vzp
   w==;
X-CSE-ConnectionGUID: V6bLJXNQStOpcsBUPKk0gg==
X-CSE-MsgGUID: RZ5ycG+DSCGnEEY7H2TndA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33609123"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33609123"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:16:01 -0800
X-CSE-ConnectionGUID: wHCDGO3OQnS8mADgaUslVg==
X-CSE-MsgGUID: X0Tr+TgwRciTqBvOkZIH8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99075845"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2024 01:16:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ7xl-00041D-1X;
	Thu, 05 Dec 2024 09:15:57 +0000
Date: Thu, 5 Dec 2024 17:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1321/1321] sas_expander.c:undefined
 reference to `ata_dev_same_device'
Message-ID: <202412051729.ejnzHbRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d05ffd830132e58bd394d5e8123765b9037141b2
commit: d856ec500c97835c591ffacc005f514509f1a931 [1321/1321] scsi: libsas: check if the same sata device when flutter
config: x86_64-buildonly-randconfig-005-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051729.ejnzHbRm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051729.ejnzHbRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051729.ejnzHbRm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/scsi/libsas/sas_expander.o: in function `sas_rediscover_dev':
>> sas_expander.c:(.text.unlikely+0x3f4): undefined reference to `ata_dev_same_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
