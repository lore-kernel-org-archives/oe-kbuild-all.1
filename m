Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D1E2367D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637933; cv=none; b=jR7JdtssU7sy4QdoOwRZRWkt4amJlMFhFm8N4gDvwHdpbaf/seWqmbiEroDeNcqJXwuYbOZQyXb8vh1jJCV99/Pb/Uqm8+3zXWA/Dsz4xH1ANFF3FHHS0LtiC7wt5bB1JRc9BWJggF5b7H/8hbf1BCAEPNWNCazBT3uRL+4qTvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637933; c=relaxed/simple;
	bh=F0r4+wgZHshBYRjNA5wP+8hqQ28pdtJtESVLXuHxums=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/e4+meRmLK0xBlfrnZztcGY83Yoe4qKoe5zULWeg66lJsYHX6Cw4Oaj2ZYNazFYjCXcF4twwfIlFvoNQvWAiBC7tJyxwECSA6bcRDI0tpzw7QEUsN/w9SZI+0gABl1zLxwXRM4jSm4yF//+ZL3zOHKLl3trpiTelhfw0oxMuqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJi3C4u+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJi3C4u+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758637931; x=1790173931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0r4+wgZHshBYRjNA5wP+8hqQ28pdtJtESVLXuHxums=;
  b=dJi3C4u+US/asiVGTFf3sM8vZbCPiDq5iLMBFQFaqD/8qxnQpCNaY5Ho
   KA+I5T4AKg92itlgtwU3F34w0iWBdmrSXy7D/2EZc0bVeM/S0XGdzY426
   xys7OOiIjRvnR/j6hTeZojx/QHPak2H/hhKYMst6zWxVUnb6bwLf2S9Md
   RHUoJWZ2aVw7pns5Jtog+BkE/UPsC8MjSaQlv/II31261KZqP2hrAG71M
   Q60q5kiiBjA/cHqZ9/ezEcEhqaeuMcQ53BwqSSOYZ6jgjgTvPtF3zEKOk
   hCwS/3UOkLajBCIFDddkq7uzsZfkT+RmflMRwHCCMKFGptumi9juQOwik
   g==;
X-CSE-ConnectionGUID: M0qS4iaaSw23IeL6B2DNiw==
X-CSE-MsgGUID: QFhEeNuNS7+Ov54n8zJbfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64745104"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="64745104"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 07:32:11 -0700
X-CSE-ConnectionGUID: Y1eV1J06S+yBIFnK6ecPMw==
X-CSE-MsgGUID: afkjzBdQSq2cD0wjkq9nGg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2025 07:32:10 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v143s-000000004D9-06qn;
	Tue, 23 Sep 2025 14:32:08 +0000
Date: Tue, 23 Sep 2025 16:31:38 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/146] htmldocs:
 Documentation/scheduler/sched-bwc.rst:243: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202509231624.CLWfOQoM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: 501a66aa4637fdcce20ee686f3c13ebbb2e41849 [0/146] sched/fair: Add document for burstable CFS bandwidth
reproduce: (https://download.01.org/0day-ci/archive/20250923/202509231624.CLWfOQoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231624.CLWfOQoM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/networking/kapi:147: ./drivers/net/phy/phylink.c:1343: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/sfp.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/dim.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/energy_model.h' failed with return code 2
   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
>> Documentation/scheduler/sched-bwc.rst:243: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/lsm_hooks.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/tty/device_drivers/oxsemi-tornado.rst:41: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
   Documentation/tty/device_drivers/oxsemi-tornado.rst:86: WARNING: Inline interpreted text or phrase reference start-string without end-string. [docutils]
   Documentation/tty/device_drivers/oxsemi-tornado.rst:96: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]


vim +243 Documentation/scheduler/sched-bwc.rst

   228	
   229	   With 50ms period, 10ms quota will be equivalent to 20% of 1 CPU::
   230	
   231		# echo 10000 > cpu.cfs_quota_us /* quota = 10ms */
   232		# echo 50000 > cpu.cfs_period_us /* period = 50ms */
   233	
   234	   By using a small period here we are ensuring a consistent latency
   235	   response at the expense of burst capacity.
   236	
   237	4. Limit a group to 40% of 1 CPU, and allow accumulate up to 20% of 1 CPU
   238	   additionally, in case accumulation has been done.
   239	
   240	   With 50ms period, 20ms quota will be equivalent to 40% of 1 CPU.
   241	   And 10ms burst will be equivalent to 20% of 1 CPU.
   242	
 > 243		# echo 20000 > cpu.cfs_quota_us /* quota = 20ms */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
