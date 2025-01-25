Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AECA13C67E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737805196; cv=none; b=KJ807AtRY+ptUAHc5k/E7XBRNwCSM1eDdz7VUmyKScsKGMGH6eidsOfVpszN5YK5sjGXpKAz4luAC0oA575oMXwBEP+EKvNiLItaZywKVGqmnZKLWi4in4/iFPTX6ARrWpHflfNHLoLBeniPHJ/2E+GmCPmb2itDmtTiII1U+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737805196; c=relaxed/simple;
	bh=y3RkPbj5OdswBLSGUSnfQ7r12h9+4/X1mqHa1GUza9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vp7xC+cRbfqbTLrRZA3OKzUl3ZogpuP8aQTdsLigCpj+EKHhtjClJuTCzEwuhNMRtTNVdJlHxm5gfKvJx/T5xDj4ibhvq0MpX5N6Jwv8u82frCcCLWlf17eekTA2Id7ahll1bkzHh9nPgYPsEqRY0Zxyzn5v4D19+R5Dcib9rXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZmUhve6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZmUhve6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737805193; x=1769341193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y3RkPbj5OdswBLSGUSnfQ7r12h9+4/X1mqHa1GUza9M=;
  b=mZmUhve6gB6UlHXatSuu9JOcfkpl5fObhJ3kkdy+iNOLCqlHtZ2hjzai
   YDeZ6Pw8nwWndbx4bwqQvJLkZRlfzTezVptm6d9ZlkH2EYAUQb6ZmWz8W
   EiQU0H5bcb/EwJIViDoWugTBmOtXn/7i/HrK/x/Ch1Z1OIGp+Y2QUM63j
   40v2jxUDQ0n+ZG2sritofmzoCyoeRTQMEZrrDlKru/KEb9j8gGMGgJgp6
   z2l/AnaerwjBncXCNf0d9cqucBk5HbQnXHb78eJJPeDkTIsiRbQWlzOmQ
   Eq3XErMEKRUtZS/Q10WXWKSSrYR0BERuwmsaksSH5NgcTmwG5FjZ8odOL
   Q==;
X-CSE-ConnectionGUID: 102Oism9R0OOk2GMwINxQw==
X-CSE-MsgGUID: jeOyqaL5QUOXcxWYa0Nj0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42092160"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42092160"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 03:39:53 -0800
X-CSE-ConnectionGUID: Xp7uab5SSWeZ1lYuwH0aTA==
X-CSE-MsgGUID: s15xfx64QtWRx7LC6YOtAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145241020"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2025 03:39:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbeVx-000dlh-0q;
	Sat, 25 Jan 2025 11:39:49 +0000
Date: Sat, 25 Jan 2025 19:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: drivers/cpufreq/airoha-cpufreq.c:109:34: warning:
 'airoha_cpufreq_match_list' defined but not used
Message-ID: <202501251941.0fXlcd1D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b46c89c08f4146e7987fc355941a93b12e2c03ef
commit: 84cf9e541cccb8cb698518a9897942e8c78f1d83 cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
date:   8 days ago
config: sh-randconfig-r071-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251941.0fXlcd1D-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251941.0fXlcd1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251941.0fXlcd1D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/airoha-cpufreq.c:109:34: warning: 'airoha_cpufreq_match_list' defined but not used [-Wunused-const-variable=]
     109 | static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/airoha_cpufreq_match_list +109 drivers/cpufreq/airoha-cpufreq.c

   108	
 > 109	static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
   110		{ .compatible = "airoha,en7581" },
   111		{},
   112	};
   113	MODULE_DEVICE_TABLE(of, airoha_cpufreq_match_list);
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
