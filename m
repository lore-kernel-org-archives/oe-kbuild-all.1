Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D38184540
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 05:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741413573; cv=none; b=byU2NIWGKKWH2tR5hNm+CXMK78AFyXKJckndvrbIVVev3NIBPSvZt6yL1UQ01AUoBrwKnsHKKj8TyaCybWRUSgnO1vAfyuNlsVFhrI7hMlfeJE+HHVO63TI3rYcsiqnwUSvpLaZcydoHuTmSt4Un54+jznI/cwonXgAvtjFpPRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741413573; c=relaxed/simple;
	bh=HkE6UmxHK6Hw4BhLkHu28vu6FbNayCExPlPqSzO7h+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fnfZatzuutZFBjMOtKLLf/cpwGjOx+9VtRIsdZ/EEvdrkmhVG/KuhlDxrkf5fTOoyPDWNmJdiUPVoCsWCdk5o+k4ZEL/BAubHtuxsttHQQ0eQYDcZom1WIOtRGaAhXM+N7MSpyBM++H38I0OuI/VtSWQgagcYHwFwX+vAHGMUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qc90TPrq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qc90TPrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741413571; x=1772949571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkE6UmxHK6Hw4BhLkHu28vu6FbNayCExPlPqSzO7h+0=;
  b=Qc90TPrqFu5Oei9NJdWb2s73Kfo00L0C/iBUJtY7LhSJIpaTITARA4c9
   pID3H+FeuzZ2DflIRKhAv9sx7vpm4kkNZ72MIMcTLxeuIw0H1Q4xgUZQH
   0RJqyF4cTZinvh5XAX3pbk9jzfHuMc3MPw/hCgGCK/PmscGoz7Wr0j6i2
   2A9C3ly41XLqVoqoTXpYQGe+WplPKwFdOrsOVjgq/7KF+m5Weg+r/SNs/
   Qu+y4xcEeH/cnjypRDRR8Dr7YaudMjn2M0JEbcnI+NfI05DNDXgj/kQnw
   6FuA+d3fdXn0SPhI/FMX62CYaFbwBU0W8liI3WCYZ/pjX0fe4ugt3rGVS
   w==;
X-CSE-ConnectionGUID: 57XptIgXRQaOW2YR2J0Vbg==
X-CSE-MsgGUID: XZVl74nXRhyG8BjHJTQswQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42346837"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42346837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 21:59:28 -0800
X-CSE-ConnectionGUID: nvTYI4JSSlS7eJcXVXl9/g==
X-CSE-MsgGUID: u62VEPmjTw22x4gC3KMeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119489807"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Mar 2025 21:59:28 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqnDZ-0001YO-2F;
	Sat, 08 Mar 2025 05:59:25 +0000
Date: Sat, 8 Mar 2025 13:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 222/411]
 drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:8:1: sparse: sparse: symbol
 'vgpu_mgr_attach_lock' was not declared. Should it be static?
Message-ID: <202503081335.WQ1O5Z90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 407a6f7688cc03a8e53bfab2f3298b73e1956d79 [222/411] vfio/vgpu_mgr: introdcue vGPU lifecycle management prelude
config: powerpc-randconfig-r112-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081335.WQ1O5Z90-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503081335.WQ1O5Z90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081335.WQ1O5Z90-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:8:1: sparse: sparse: symbol 'vgpu_mgr_attach_lock' was not declared. Should it be static?

vim +/vgpu_mgr_attach_lock +8 drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c

     7	
   > 8	DEFINE_MUTEX(vgpu_mgr_attach_lock);
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
