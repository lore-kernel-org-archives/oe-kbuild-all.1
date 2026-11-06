Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933270;
	b=iGkmi8xNHSUxW6um/cyrhnAuFFrkcXvNZlcRKeZSpRixU6FYy61jVoUCsHetP+5JuLQx
	 M2vEjpNgna+Wll/ueE1Ywt04x/VXZm/D2Rd8dtJi2aubAuba5jaIh6A2aBDUyVNSN+7aY
	 D+da6Ej1NjU3N9TpGz0XDvTBztWO2bmmsGNczkA6aAkV2IAWPFD/kgTmVlpKXw+hNpNJe
	 PekQYoLhvHCpll7R30fzrCJKy818OVhry4g6FdjtAUNaMHyVghtf2DFS6L0NLrRBNLGjU
	 v4v+gt34L7mvCP54OHgBXd4i9YHLmiyAzj/zvqigEMGtj9LS2gBPAL6EorBjvXjNm8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933270;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Dvt0Ms4u4Rit+HHhJF4UsmfHe+UU51GOVnLhsF6C2CM=;
	b=V24MJXn0OLY/FnXgBCkCLIju77qV3zGbO1t0gsV3ZW8uNQf8REFhb+sUWfjvXrcgdQK4
	 o8wnTxcB+cdLF72G5pfJwC2QdbHEJsDR1ySx46h2VJy8PMBaejjn49KAtCAKMAqumUBru
	 R3onxqNHrlkGlXphRBEYGn7zE6E5rn/9brcr7By1iSHaFnGGB/KMezX7fj4PXS6IKJ5N9
	 NXNipmMrqVgO32jISKczgwACN+B3GQgrsSOQsEnH/ZR9gL3gp5P0PdmJYIW2c4R6jD+vp
	 iv8fHv9COJ7B7LELwTAoom0M3tw+oiSGZJmRoXEr75bi6SA+kKUU+08eAPVhPgQvVgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jgIM13Y+;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB7606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 02:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EAB7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jgIM13Y+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793933268; x=1825469268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YDzmo+vSWCUlmoNop/kCltmiJyla4McvxTxWCtKZG1E=;
  b=jgIM13Y+4i5OsbqvbnwBGdLCxFRgTOSN7sToLsLq18eutQVRVNIfW17F
   DsLh+pl4RBRtO9pqWUlOMbQ92MHbPZG+mM905hFjddqfBp+VPPPWRUhx0
   34E/6xFxIL+QpCCJNOCEEheA7uqMZLiodjo/v19thMiv0zLb7hyTm7vfG
   PGu5xftttG5bHhqGBXI/7x01Wzdf6bwATR4Yn2KNvRXdAtbCCQdQB3KZo
   Jskawm4sXVFr7Os+kvdqECMR2n0CPBtNTNF0BDs3hEclayTBrhQh2s/sk
   aAOHQKLDvJGdX1soaAU0fOMFHXBvbzPXX4Qv2IN0hImkb7ch8tuqGqVoL
   Q==;
X-CSE-ConnectionGUID: uxxahmhFRWKrwgyjy+fHbw==
X-CSE-MsgGUID: 3O8ZSjgjTqibDdIfEzZReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2748503"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2748503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 18:47:48 -0800
X-CSE-ConnectionGUID: u0RLeqwaSEmI96B+8VnFTg==
X-CSE-MsgGUID: pjn0krYUSRGe2QdMYXQATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7505284"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2026 18:47:46 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP9zS-000000009zB-2KFS;
	Fri, 06 Nov 2026 02:47:42 +0000
Date: Fri, 06 Nov 2026 03:46:44 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Cl=C3=A9ment?= =?utf-8?Q?_L=C3=A9ger"?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [avpatel:riscv_sbi_sse_v12 43/46]
 drivers/perf/riscv_pmu_sbi.c:972:13: warning: 'pmu_sbi_stop_all_cpu' defined
 but not used
Message-ID: <202611060359.cJxPlDrc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v12
head:   6edb42266d180e7a96cbf7c0f790f5170e1c5c5a
commit: ffc76bd2e8e0e892fc25df1d5c7aeab43dc54fbd [43/46] perf: RISC-V: add support for SSE event
config: riscv-randconfig-2000-20261106 (https://download.01.org/0day-ci/archive/20261106/202611060359.cJxPlDrc-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060359.cJxPlDrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060359.cJxPlDrc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:972:13: warning: 'pmu_sbi_stop_all_cpu' defined but not used [-Wunused-function]
     972 | static void pmu_sbi_stop_all_cpu(void *info)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/pmu_sbi_stop_all_cpu +972 drivers/perf/riscv_pmu_sbi.c

   971	
 > 972	static void pmu_sbi_stop_all_cpu(void *info)
   973	{
   974		pmu_sbi_stop_all(info);
   975	}
   976	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
