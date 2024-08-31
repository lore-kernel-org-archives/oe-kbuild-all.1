Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D31CD0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725130700; cv=none; b=WyRH7wC63eGxqxILaatKhRcU7RLSRI9T9mNtrKShX6QxxZg5bKj9+2haYdD7+E25T2gFzyWGk8a7BZJdFHnEv4oKI0dTOWE2bZ/hv0vSXSYYelRNYG+0zoA89b6xLTeuBKhayvm4l0nnhNZ7GgQNp41G8A3thDXmk7L/qSTgKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725130700; c=relaxed/simple;
	bh=CQIFWT1d15E3Jc5ASMqHE8N764mzTSdJfXSBdc0kECI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMQtF2t2MSU3e6yrBoe+Ld4zDJ/nMU/yHAq29qBCz4WBGbCPShlmjqdm6iNKXuTTrpAcygk9Jsawy4dnuOgEEjf5lNwO3ypYj9vRkuW4GYthKLvWdTagQDvM2aJLjtd2+mGeQwoKIUHP9UOJJ6MGcKdvz/rAwAQpB6xvtsZBxZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6zfFY9L; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6zfFY9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725130698; x=1756666698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQIFWT1d15E3Jc5ASMqHE8N764mzTSdJfXSBdc0kECI=;
  b=e6zfFY9L4AB1uHUOFfokPaBpfI/WrPdVzBO+ZLXhsX0A7thEXyZ4j+K9
   WW061kqQYnRe6XkaW140PR0ZHYOCe0rlsx8YCfxy/sf6QsfIszhuSGi6T
   8X/Ly/aTCs8y3WgtP8H8Rf9onWTN4fKvQovwPBSmZt2pVfQcga312+YtQ
   uuXqg2ie6yyRhnUrQxXBMTwriJOQqRP4bgpaBoAx6rpR9e5c+05yARTmg
   HOeg2p6GEGu6LLCEuDagleOqC/NZIFGfPKgEwHYEJaCvTt4KzK8FezbTY
   dhrFx0CTGL9d2kiGKYshziiz+QfFMtrksGBo4AJxr1fn5vZS3eC1OKNWO
   w==;
X-CSE-ConnectionGUID: 1lDDFhyPSrmsvLLO2C66EA==
X-CSE-MsgGUID: 4UgGYLldTOq1jj+1gVxeYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="46260669"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="46260669"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 11:58:17 -0700
X-CSE-ConnectionGUID: Q2x2BusCQMGLeXls2TBDkQ==
X-CSE-MsgGUID: crDUVURCS66kf2wr48RzIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="63895763"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2024 11:58:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skTIb-00031K-2M;
	Sat, 31 Aug 2024 18:58:13 +0000
Date: Sun, 1 Sep 2024 02:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, wu.zheng@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 23108/23944] mm/oom_kill.c:318:14: warning:
 no previous prototype for 'bpf_oom_evaluate_task'
Message-ID: <202409010219.c8uliMm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   114077d3641f55e0727e810a4f1277a658f703b7
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [23108/23944] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: x86_64-bytedance-5.15-velinux (https://download.01.org/0day-ci/archive/20240901/202409010219.c8uliMm7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010219.c8uliMm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010219.c8uliMm7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:318:14: warning: no previous prototype for 'bpf_oom_evaluate_task' [-Wmissing-prototypes]
     318 | noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
         |              ^~~~~~~~~~~~~~~~~~~~~


vim +/bpf_oom_evaluate_task +318 mm/oom_kill.c

   317	
 > 318	noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
   319	{
   320		return NO_BPF_POLICY;
   321	}
   322	ALLOW_ERROR_INJECTION(bpf_oom_evaluate_task, ERRNO);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
