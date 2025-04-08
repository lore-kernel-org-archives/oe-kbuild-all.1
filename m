Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D529123ED7A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 03:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744083321; cv=none; b=O5tmPlIbaCSKJBdFgAOsPAB8pdwtUtnUXCzPh8wTHvPMgvYZwktrxE21dhwpuMnrTY6r81TitS01quSSVWqm9el1olRgJzzRekWSmWwZD3a0m4jrynqsHNMKJyubpOtJdksMoZca3yXXoCNKuqLEu0yxL4qT8QtCnZczM0TusWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744083321; c=relaxed/simple;
	bh=1q9YLZEMkwakA4fpBDAxMbZXcOB1Fv5DyWmTQt178W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JU4nJ1raCVEcK6YP47Gl1vRU/3cdMWlJJp6PpAnhv3h5pbFEtC/EnKWiV/OEQ7xm8ub2MZbF8ceZJ4yE++r4my/c4JldPSo4yJSaCQzf3VUKCtupDatF1hlhfC16ElAu5jusJPLnlZv8lg2C03J4kEgs0hbcZGLlGiB/en/8wRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoXHEopk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoXHEopk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744083319; x=1775619319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1q9YLZEMkwakA4fpBDAxMbZXcOB1Fv5DyWmTQt178W4=;
  b=JoXHEopk1mqk5xFEPjnR7eyhJDLgOjcSt7UIukw4drZ5PanwHxsWE+Z2
   kka5HqVgc2/Kev9kX781/m3bkQJWwRiBw71VPiSIWkbXI/LdsaIG1gCNf
   HLfIrOlzl3BLd2hMzhTJJAYPcAwQGaEpeopZXb5wD3I5gjcnh0qlvjCiG
   sOoWuY86hjsvuFBmVaXm6gLG98ptR4XAF38xyQppPysNHQVA8b2Wusefc
   V8rCOKwoP3u5i1vxn74KqUYGbx6COxSnQlPDlthO37N+kt3idR+WWmMh4
   1Tiln3hCAKWt+CgplP4pO51Uy7NQLGKiSFh9wBcBGrNUN9lc5eQTViA13
   Q==;
X-CSE-ConnectionGUID: oMRyrgrOS2+shjaFJswgjw==
X-CSE-MsgGUID: hFayxWpOSKSBGAulQdTYqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45395897"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="45395897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:35:18 -0700
X-CSE-ConnectionGUID: 9my4kmTCSjOnTXsWHotkdg==
X-CSE-MsgGUID: 1INESRTrQjufacLPVSse0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="151324268"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 20:35:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1zk3-000453-2M;
	Tue, 08 Apr 2025 03:35:15 +0000
Date: Tue, 8 Apr 2025 11:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1568/1568] kernel/uid16.o: warning:
 objtool: __x64_sys_getuid16.cold()+0x0: unreachable instruction
Message-ID: <202504081156.eLZp36Hb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3191c9e4e7c581bfe0a40ee198ffcbd5c3dea53e
commit: 56bc1719652e7a937bc9856f76f0c0fbf8ce1b23 [1568/1568] objtool: Support GCC 9 cold subfunction naming scheme
config: x86_64-randconfig-103-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081156.eLZp36Hb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081156.eLZp36Hb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081156.eLZp36Hb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/uid16.o: warning: objtool: __x64_sys_getuid16.cold()+0x0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
