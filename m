Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C93383993
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351009; cv=none; b=GpIrMHF7Wly8CoqXD2iW6Wmdrz/Obt+QruDTVaK3NkL6E7uOlH89J87/7m0dMi4nlsTsdFw7GdVfTUCx9eRDazBuKpiM2UtdqkhXiZ8WWvEeM6l9hrmMSVZIITXBHRKb1niUWetlqM8XXAYf4seAkqCP8z3nPzWmyiTWTKQkpBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351009; c=relaxed/simple;
	bh=15lCNW03MxHVqnjCtrJHkA5LjaLbDwL3p0n9gpMf2+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iM7swsM5BWFB8uaSBQV2OrjCSK/eGNHdXRc/JJsvAOaWxh/IGOjliiKqOo+qO07dOjQrn/qezoiZbhyeyUHjAgBZyA+71BOeUJDHFmJR5R6L/zW7MawumSne9B0prpPcT1PbxPmacUnx/WNh/P+WbE3aJDEjhzDNeAAt+oqG688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnZdS9lE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnZdS9lE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779351008; x=1810887008;
  h=date:from:to:cc:subject:message-id;
  bh=15lCNW03MxHVqnjCtrJHkA5LjaLbDwL3p0n9gpMf2+E=;
  b=QnZdS9lElXLfDan6haSN1JUClTah6cruPT0MuwlxaI5vnuf1VeW7+BoJ
   RzjSx9IhDtgwFdoeKanDamVSaU7DVP4zguZcRF8zjvsH3TwajngunNELU
   KvOIuh6kXc5vq+Ex4Pp060F6+GKdTleHnnLK7vdGv4KgNzknw22PpQI3n
   UVOVhOie8dBuMSFZw7+hX+C1zjqC3hhIjp7k0GUkuB7JMfrNnTYYP22aD
   Q7yHamKN3Y1mPfAUX5JzFcp9VPzR7D5RqPmHoa/RzYhXmpAIHWggtM+ER
   I4qWDO7WT/fC64DEjpGN5kBh2ffJL6eAqk04GiD0HQMFPhFwDspV6FF9o
   w==;
X-CSE-ConnectionGUID: iqQR47x6RguHkRMKJYRtIg==
X-CSE-MsgGUID: KP/v2MieTbSv3D9L1WyTcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80230921"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80230921"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:10:08 -0700
X-CSE-ConnectionGUID: /MKAE59kRUypa7yWv4AyNQ==
X-CSE-MsgGUID: A4Xv4kmEQYOdh9wNBWOnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263980669"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2026 01:10:06 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPyTD-000000004dr-0eql;
	Thu, 21 May 2026 08:09:36 +0000
Date: Thu, 21 May 2026 16:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 797/1130]
 Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:74 function parameter
 '__pe' not described in 'amdgpu_vm_cpu_update'
Message-ID: <202605211559.6DHF3wjt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: faf7b3e474721f098d0155d6233af0e3650f3834 [797/1130] cheri: Fix compile in drivers/gpu/
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260521/202605211559.6DHF3wjt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211559.6DHF3wjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211559.6DHF3wjt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c:74 function parameter '__pe' not described in 'amdgpu_vm_cpu_update'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
