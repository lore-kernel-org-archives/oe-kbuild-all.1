Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734F34676F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735034; cv=none; b=ebLCFbQPn63ViXBFx6ImvF+v2Ck6nSXqKhTyFjmye7O714oWU4kbwBrX8x/qw1v0eUzcivzcHOl9oztfjcse1dfujj6he/JxMCmJROzkfLZOidAPbWwmOWnsNZRdiW+7g7Eq4ZLBaUWHB4KVINUZEUXRZSzmplg+mujLhoohdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735034; c=relaxed/simple;
	bh=OtTNHKjnTPKL5rUifnD+f9vNoMlILHnpJhbvjBsX9ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJOGsl1uU3blJXjasxiOp51ZrG/+W10M7WInf+IUGlPcMq4tUWzaOp/8ZwKH9q1/z6KmM+YCImlnzHomBLw1gi1VpddrYcnS3V50bVfMlk/HFtX2gzsxPUXM4Q/zAe6k5b5zUt2tNmHhrZRGsKqWq3/cYZTPxsJXgm9bSOYQ0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbJdnN9X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbJdnN9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763735033; x=1795271033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OtTNHKjnTPKL5rUifnD+f9vNoMlILHnpJhbvjBsX9ow=;
  b=QbJdnN9XhoTyWmDQWciHd4jXIk3XBeSllQTp29zKyPwGoB4OoOpkXT0H
   SVa2lTUAaiM8Vc7gcpcxPfRslkXNv17UOTiagPdQkA2mfaoauES8E39dv
   QxFCDKBX+WfHIRacXi/hKL25wBT9v3T0U6PICcYgTTJorA6kw+/UjNq6a
   oFJQIAr20rv1NjPffRX6tWC3QYQaCCDuzjksHdhEqNP+BRBQSrioKYKfC
   2MscE4xxcCM4p0iA2SyUad6t1ctsUzcoRZgFOKlk2vbjjrmvs2tMVkYGI
   jAVaLU/LDElEDibT5g5Mb6NPamX4FnCSXehLlfQV6wIMzlrfhyQ1Mh/RL
   g==;
X-CSE-ConnectionGUID: sdyt2enXTiWMm5GL58PirQ==
X-CSE-MsgGUID: KvBob0HcT061I7X3lKP+iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="64831522"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="64831522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:23:52 -0800
X-CSE-ConnectionGUID: wuf5rzhFRD60VmdxdDZKEw==
X-CSE-MsgGUID: 8xmyKrJZSjKg9smrE2cSRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="195869671"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2025 06:23:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMS3A-0006Rp-0W;
	Fri, 21 Nov 2025 14:23:48 +0000
Date: Fri, 21 Nov 2025 22:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [linux-next:master 10423/11041] WARNING: modpost: vmlinux: section
 mismatch in reference: qcom_cpufreq_ipq8064_name_version+0x1fa (section:
 .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)
Message-ID: <202511212208.JsHl71jh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 0194066ac1caf1b17216d72eb5842804675c2ae2 [10423/11041] cpufreq: qcom-nvmem: fix compilation warning for qcom_cpufreq_ipq806x_match_list
config: powerpc64-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511212208.JsHl71jh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212208.JsHl71jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511212208.JsHl71jh-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: qcom_cpufreq_ipq8064_name_version+0x1fa (section: .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: qcom_cpufreq_ipq8064_name_version+0x206 (section: .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
