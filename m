Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8233C1B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644455; cv=none; b=eTQtzcRKnqblTFScsXmcXZ5dUEN/CWfGpUHBScPkp1iEP1ZpZ+Mf93OKoqAbzrOdz3HP8QPwMFfIk+pGd9zsJAsf9/IU/NnDuROijDEmGwbjn0btfqAoFeFQUO+t3DC5OQAuFnv0N9T57HBXc30ty8pTjX+OI3G//OpBf6ezWXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644455; c=relaxed/simple;
	bh=IgI8rAX/PoHhVbq26UtIkjyDJUN9/o2OCmriSg83yYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEd2fmhsh0XkjX7Q1LyOqu+jOERIhxCmpZwgEB5b8T3ZI9BYqEESCNTp1rtU4682NCI5jacYL2GIEeJNiamLkpEx7s7M79U54ppnJ6I1jgaabkDdBI5mKlIozKkqjzGjhP3W72iYsXwelw6IKI7WHV/Jmk4ad3BpVZi3rMzym3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZfuec/I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZfuec/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763644454; x=1795180454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IgI8rAX/PoHhVbq26UtIkjyDJUN9/o2OCmriSg83yYI=;
  b=KZfuec/IGtPho/BKlnYKzwaje+VBbv3hviqRi0MSM2zObBKgcRI/TodH
   aRoaYQ0vZp5v8gSvGn/I+KzFJjo+91FeEOFZEvyjE5LW7fxA1cEiwkgFb
   fKNVqBetKM8+TCPdLohX5Fqz43aodFcqwcO+6OnZbjCOcMAhvvLD4f6Up
   muVqExamRMnxnQoS07lWWvgKfqGjGCECfoVIT0/poLbCrpodoWxqrMPQr
   jgEhs2XnePOEE6Y6ZfB4vA517D1aBPmk3VE3h036gviDoqwCfaYUk2vQl
   /tMAZp/ngHwAJZe+c3Rl+fiw2GXtjoduJy6uHEufQUHDfewE21+iQuWex
   A==;
X-CSE-ConnectionGUID: vD8bPhh8RGGXbXtvI6Gqug==
X-CSE-MsgGUID: iQZ2gjP+SDCvv6b3+6HmPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69580005"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69580005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:14:13 -0800
X-CSE-ConnectionGUID: Vq2WcmZjQQyYTY96jepf2Q==
X-CSE-MsgGUID: JbQLi1dmQ0SjC9sIph/9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222011460"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 05:14:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM4UD-000429-29;
	Thu, 20 Nov 2025 13:14:09 +0000
Date: Thu, 20 Nov 2025 21:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 6449/10599]
 drivers/cpufreq/qcom-cpufreq-nvmem.c:259:34: warning:
 'qcom_cpufreq_ipq806x_match_list' defined but not used
Message-ID: <202511202119.6zvvFMup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: 58f5d39d5ed8f2e43f230389ea0d59791afdcd55 [6449/10599] cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM
config: sh-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251120/202511202119.6zvvFMup-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202119.6zvvFMup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202119.6zvvFMup-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/qcom-cpufreq-nvmem.c:259:34: warning: 'qcom_cpufreq_ipq806x_match_list' defined but not used [-Wunused-const-variable=]
     259 | static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/qcom_cpufreq_ipq806x_match_list +259 drivers/cpufreq/qcom-cpufreq-nvmem.c

   258	
 > 259	static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] = {
   260		{ .compatible = "qcom,ipq8062", .data = (const void *)QCOM_ID_IPQ8062 },
   261		{ .compatible = "qcom,ipq8064", .data = (const void *)QCOM_ID_IPQ8064 },
   262		{ .compatible = "qcom,ipq8065", .data = (const void *)QCOM_ID_IPQ8065 },
   263		{ .compatible = "qcom,ipq8066", .data = (const void *)QCOM_ID_IPQ8066 },
   264		{ .compatible = "qcom,ipq8068", .data = (const void *)QCOM_ID_IPQ8068 },
   265		{ .compatible = "qcom,ipq8069", .data = (const void *)QCOM_ID_IPQ8069 },
   266	};
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
