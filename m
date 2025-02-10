Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA05025E441
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 18:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213643; cv=none; b=MAYtbAzR0dNolqi6uwYRBFi+/swWK89IFBuGayaBTs+Wr2Wwo2REh2seh4wV+BlkCwTzUR/DJuHxwRZNCIewRUvZSWVkCd6apLMFv5Vl1cM4SFLUvCiSYx9gjOAS5FMGBl/NJQsGqUPy4vgm5/WDotdLLFUmTPemlSQNpqgeNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213643; c=relaxed/simple;
	bh=mFjdyd5t9wPwbJQ5i/VMABKs0hXeuFUINQVlIyRdDFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uaI9XLq3EDq4FcEH0fkXnfvLFxMZlLaNU+CRuwOsWjCx6nKcUowxAlnrAQ12AeDr58aQQa+A7TSgAnY//sG0lXxFrtXSEIVwRL8Vfbcx90vMFsqiCxPk+VoSJabAYgGDumdsmYrlFb+G7HOJW+QP9j03bJX5lBV/sV0ql328ZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+iUhPgv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+iUhPgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739213641; x=1770749641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mFjdyd5t9wPwbJQ5i/VMABKs0hXeuFUINQVlIyRdDFg=;
  b=X+iUhPgvmn4DkRpBVAqZO1qVTbXq1RaFOcIK8dlahAzPGymxwb4xkg8s
   83z9JonVlslvq0TjEHdfZWKp7DZNuHtwTg3/yuPFcZXE9E0oUhyJvE83V
   ODFFzxBwRRePsngigd5L9F1Fe5kKpH38Mp41vO/H+yzmOF7i1jfz7m0Hp
   wKhrofg/JGNjzMbs74gYfgfOOye1hQ47FJgSAPKDaXsABXRwa0Ip3CwaR
   NRBzO5pAadOdtcGJjinI/2C6WDUDFd7pY2E115rnNKWW8fpDWb/zbug0P
   dS0j3w0sCzSJmZBlrDKIrZRLGNlYcxToqv0fH1dgssRHnlUQL+BS88kfC
   w==;
X-CSE-ConnectionGUID: RUp5Ok0nQkWRXSvDpidHfg==
X-CSE-MsgGUID: AqtJ4/pDTlKS35lPEopj0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42647902"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="42647902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:54:01 -0800
X-CSE-ConnectionGUID: FXpeuVmlSGeEEVi/fLICYg==
X-CSE-MsgGUID: kw3bPyNfR2mEWGImyUSwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135537496"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2025 10:54:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thYus-0013EA-1E;
	Mon, 10 Feb 2025 18:53:58 +0000
Date: Tue, 11 Feb 2025 02:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 217/217] clang: warning: no such include
 directory: 'drivers/remoteproc/vcp'
Message-ID: <202502110212.b1xohlbs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b603fe68bcf1fd8aa46dd46190c53d641dce5cf0
commit: ea8227ece8dcae6cc6897798cac94b4aa2cf6a8c [217/217] CHROMIUM: soc: mediatek: add mtk-vdisp driver
config: arm64-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110212.b1xohlbs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110212.b1xohlbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110212.b1xohlbs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: no such include directory: 'drivers/remoteproc/vcp' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/remoteproc/vcp/include' [-Wmissing-include-dirs]
   In file included from drivers/soc/mediatek/mtk-regulator-coupler.c:14:
   In file included from include/linux/regulator/coupler.h:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
--
>> clang: warning: no such include directory: 'drivers/remoteproc/vcp' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/remoteproc/vcp/include' [-Wmissing-include-dirs]
--
>> clang: warning: no such include directory: 'drivers/remoteproc/vcp' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: 'drivers/remoteproc/vcp/include' [-Wmissing-include-dirs]
   drivers/soc/mediatek/mtk-mutex.c:1079:15: warning: variable 'sof_id' set but not used [-Wunused-but-set-variable]
    1079 |         unsigned int sof_id;
         |                      ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
