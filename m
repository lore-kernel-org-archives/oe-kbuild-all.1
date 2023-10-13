Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E751923751
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPH88lMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697226693; x=1728762693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBWLHMW0lwUzzw07O9ZAcNjOSggKRPlllK5jgJoLWnI=;
  b=RPH88lMxAYK4VR4KR9P6cjxq59dL1FSSBSzjIgjzGRUk3DYvVfn8AqRj
   gssnCW35dhZ1ZJCtEu4KziSZylVd9ohPtFdP+GgXQ94ptcTefyxHaLUqU
   RC93MvlSLPie55AY006MdPEweN5urJe656vyi8tuxmkpuMUJMFHGpK5H1
   J3QFULVsoTqpGIQY8wrRzsxoLkHCyGe3za+WKyMzg8tytDfRAn2eQ6fnw
   FnYguruzxQA8Tu96TKk/cxjVNDz/2Sm1UsmqbCmg8ATF4+JmxQeKJJ1ZD
   ynq6RSkRKYMRxihbTQEOOYPjNZRCNxR0BKfSF/YUCKDih6f6fRbVB0l+J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375603987"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="375603987"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928540743"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="928540743"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 12:51:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrOC1-0005KR-26;
	Fri, 13 Oct 2023 19:51:29 +0000
Date: Sat, 14 Oct 2023 03:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:drm-next-6.7 26/644] checkpatch: WARNING: Missing a blank
 line after declarations
Message-ID: <202310140332.rwfvsjql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.7
head:   cd90511557fdfb394bb4ac4c3b539b007383914c
commit: 36b0f88988beecea6723d70fbde5b16939bf7543 [26/644] drm/amdgpu: Unset baco dummy mode on nbio v7.9
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140332.rwfvsjql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140332.rwfvsjql-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#30: FILE: drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c:443:
+		u32 baco_cntl;
+		for_each_inst(i, adev->aid_mask) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
