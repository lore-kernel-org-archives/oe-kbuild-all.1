Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561E023E325
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 00:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785544297; cv=none; b=ZU+EK+PFRyMl+FTyjcwd1xSJtOIfqhgJKqnorKdFqABRJxI1+M3fqlrhfHdCrZb5+SXeoPJG9k2A21UjOLts5djAbZAd1NOWZBdGANbmqZg3ooc1X9ou22CpYU2vDD9K6scU5AnRkJVwmk14G7I/cQKU4QlVo1el1ggEiAeEs78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785544297; c=relaxed/simple;
	bh=Taa4U/lzc2pqNRaG2QrYkBWmKjN0udP3ljruXc3/iYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUw4pPQm4o0m9ggwpgRc+GwrNUtOLXSZLUhHOUq5y5O8Tnr7xc6R+X91H0O8ayT1Zuc+m4eHTze94FY0neLYdmqYAdfaQhPDNKH+beTA/uv+pHq/0LGClQuBIN3ptZS2hM7pohIPdieYOaFyHlQduYEgcdXOPfgNoZaTEyeyi3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpaOr2SE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpaOr2SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785544295; x=1817080295;
  h=date:from:to:cc:subject:message-id;
  bh=Taa4U/lzc2pqNRaG2QrYkBWmKjN0udP3ljruXc3/iYA=;
  b=jpaOr2SEf94cYdFlYvdbEhAa23k7XJpm7l1plonB51qnALFZMiBkLtO6
   B7qt+F11UbuJ5LjYJIfJ5Nd7mHM7Ctf+/eflYPhN8ovxwtQgcYZgwrdrh
   SBExA6HM4TnkPZahy50yHSQ1IUTgKhCZspbKTKANts+PPBLJHy4NBILxb
   ZM7g9VNSrPPQ0x6si16+mI/cjkntgk+1iVZFfBDpO+sRi4seLbwXHNRGq
   IdJteS35UfSm5qCW1SJzcGtuxJJsEfwVvdlErvQOPNPm1Rq5FxT9OgQo3
   zsnoTGPx7cSKqacBHcunITd9ysf17xaZZn5PyBsvb0S5XSkU1oThWI9i2
   w==;
X-CSE-ConnectionGUID: Z1iFX3YST0yl4vgiD76W+w==
X-CSE-MsgGUID: xXJfh2t8SUio2K5h7u8fKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="97330267"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="97330267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 17:31:35 -0700
X-CSE-ConnectionGUID: N2Qi22rfTmySh/GiPe2WJw==
X-CSE-MsgGUID: 3ZUyWT6nRfS1D5UN+dZVmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="262664898"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2026 17:31:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpxdS-000000002UF-3oBh;
	Sat, 01 Aug 2026 00:31:30 +0000
Date: Sat, 01 Aug 2026 08:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 10281/11507] ubwc_config.c:undefined
 reference to `qcom_smem_is_available'
Message-ID: <202608010846.8FKDM5ec-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 1b445022d1d0ec7431b6f8fe0054ae8ccf33d60a [10281/11507] soc: qcom: ubwc: Get HBB from SMEM
config: sparc64-randconfig-002-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010846.8FKDM5ec-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010846.8FKDM5ec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010846.8FKDM5ec-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/soc/qcom/ubwc_config.o: in function `qcom_ubwc_config_get_data':
>> ubwc_config.c:(.text+0x30): undefined reference to `qcom_smem_is_available'
>> sparc64-linux-ld: ubwc_config.c:(.text+0x54): undefined reference to `qcom_smem_dram_get_hbb'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
