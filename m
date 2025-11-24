Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D662E2DFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763968433; cv=none; b=UwsAFS3/MKxhxf7Jghwvv6bWyrMoAOmc7mf3DP/DagDhVjG79ZWoDQKxNfQUuCzSuCSAucXdDDJ5OhSEKRNyHWRWLle1o1zm+X9JoAo09PPBBZlE13VWHi1Di3AiNUZIv8HRPzQL9HHn/XfhPophACkGltiZuee+VykCb2ANIQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763968433; c=relaxed/simple;
	bh=2BnHgAi8oEc7wU09JyJRrF4MTEDWocqSsjuXLZtCngY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VqlVtKdYCJPWWimF4/71WyPNRyeo87pqWVruMvnJA0dsKjwnrJNMnRo18uuXx311lNA+pbmek9+ggKYe5l6qyo4luL1NMa2V5BfphDhNey7JBIMcdFnxaBZ69gp2px4naR0AWVW5WhVoMhvpf4wbE5mAsFqgFcYfZRULKV4eHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkKR1SzS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkKR1SzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763968431; x=1795504431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2BnHgAi8oEc7wU09JyJRrF4MTEDWocqSsjuXLZtCngY=;
  b=UkKR1SzSZcMDwB81N8M2FxmXlhb0wz9kUNCaZVeGPSNvO2lmX82Oh7p6
   4XtHNX1AKdXGlgmJHckZ8AOs3/W+R/fFOslzoF1clsDp3MGlCWc/oVasT
   bMF5/aHOhTHcGoJ7yB5sRECF4mOMMarOjIzQ+fV9uLbvWamnHn9iDXq2/
   dpqltjrF3VnLkISWooLSIIuRhrUFdvWh/edE98cjbZoPq0rAIHqEw9KH7
   7HyTJnCsCEOYmg4WhHIoUNQLZQEvM8wLT4mNjgdwl0Nza3MYll3EOqnki
   13kTkgWo6opMeWXHLq8IFTc5X3cEk8+umYwpkODkW4rCZNNxXb2+gqhXD
   Q==;
X-CSE-ConnectionGUID: erx5DpMiShyRo3+VbDhMfA==
X-CSE-MsgGUID: JHjasromSSib/3QGJgSWnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65842082"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65842082"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:13:51 -0800
X-CSE-ConnectionGUID: k5/snNFbTWqNB/CjIvCW/Q==
X-CSE-MsgGUID: +gzIwZMLRdGwUEhNOnPNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191918402"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Nov 2025 23:13:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNQlf-000000000Sz-2HAq;
	Mon, 24 Nov 2025 07:13:47 +0000
Date: Mon, 24 Nov 2025 15:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [linux-next:master 10423/11041] WARNING: modpost: vmlinux: section
 mismatch in reference: .qcom_cpufreq_ipq8064_name_version+0x102 (section:
 .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)
Message-ID: <202511241525.3TTa38eX-lkp@intel.com>
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
config: powerpc64-randconfig-001-20251124 (https://download.01.org/0day-ci/archive/20251124/202511241525.3TTa38eX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241525.3TTa38eX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241525.3TTa38eX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: .qcom_cpufreq_ipq8064_name_version+0x102 (section: .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: .qcom_cpufreq_ipq8064_name_version+0x10a (section: .text) -> qcom_cpufreq_ipq806x_match_list (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
