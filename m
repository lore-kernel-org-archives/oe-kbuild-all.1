Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7687353A82
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 19:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624749; cv=none; b=Qoi7/SYgDV+tUlpbhmWF8MN1cgPKrI5u3cC7PjPLmTO6VTrSgCxFpRE5HirPi3wz4iofcjhqh9xDaNd5k5snWz+oRR1jjPaK+uadpNxFxLG24821XUei6AQjh+M9a5dP5AZ60Tfmq0mRbCPWrYguYKz+1R9R4xHes+vdjvj/PGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624749; c=relaxed/simple;
	bh=1lUZT6NKPDRGn8DIp+ogJqiVcA1nKb3jy6/ZPJufNR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S+/v6ZVar3XQiXrS/I+fbh5pKNWFTAY2UuVBpDXiQeORhjf+85oesJn1A7tX3uvJ94Er/AWuOnIz2aPeuFQgQCGApwGhZJ2Pmt5sXNTVq6j1iO754nzvOtzz17f0Gq1J+MiNnexA/nG8xqQzTai8aDj33ZlfzPyI13lhkKGR13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OE6C4OPR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OE6C4OPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790624748; x=1822160748;
  h=date:from:to:cc:subject:message-id;
  bh=1lUZT6NKPDRGn8DIp+ogJqiVcA1nKb3jy6/ZPJufNR8=;
  b=OE6C4OPR5YTd8V96DUCA1YfjRCXfSb+uMXHg3sYG/zKGIoVb+KwCFOm7
   n2hA9kCLrdzwEqVTR6Ar43V/73xdZscwFOPnUXSH7rRGz3gcs0pPyk9W6
   10GOT+OyNXMLYk0Uz7ymi7AFAKDrDZIawMS+pfxXYHKNLYgZ4gCiwriEM
   npiGIXUd0PRVd0LO3aoVKR88efFzCa3GR/2A5Px8oUdtHdv8qPkdmQKcE
   63Gh/n5HF5MQbagYRr5JtAn5fbUOv+6T4ttODmuaPVVXO7+NGaXK8/Ph/
   pmVwyrB7WpSh7LjI18Rn1R8DVfa4NzLARKj5L2/zamsu8Uet25vnHjV+K
   A==;
X-CSE-ConnectionGUID: j5fg7D6BSJiIYIgAFASzZw==
X-CSE-MsgGUID: 2A7B29mFQcyjhoi4XqskpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="95147225"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="95147225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:45:47 -0700
X-CSE-ConnectionGUID: SC+9oOwISKq9ovwymV9dMw==
X-CSE-MsgGUID: bAyj3utSS52ZsSQurDinqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="274255351"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Sep 2026 12:45:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBHID-00000000OPP-0BAB;
	Mon, 28 Sep 2026 19:45:41 +0000
Date: Tue, 29 Sep 2026 03:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Francis <David.Francis@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-unified-interface 3454/3470]
 drivers/gpu/drm/amd/amdgpu/amdgpu_events.c:59:41: warning: '%s' directive
 output may be truncated writing up to 63 bytes into a region of size 17
Message-ID: <202609290351.u6vBHVmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-unified-interface
head:   a0fe30c73b88075faca1735b8a65e045521d4651
commit: 2de6d4e4baaaab06e3dd9764b2125508c71f6a91 [3454/3470] drm/amdgpu: udev events for thermal throttle and gpu reset
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260929/202609290351.u6vBHVmV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290351.u6vBHVmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290351.u6vBHVmV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_events.c: In function 'amdgpu_event_gpu_reset':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_events.c:59:41: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 17 [-Wformat-truncation=]
      59 |                 "AMDGPU_GPU_RESET_CAUSE=%s", reset_cause);
         |                                         ^~   ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_events.c:58:9: note: 'snprintf' output between 24 and 87 bytes into a destination of size 40
      58 |         snprintf(str2, sizeof(str2),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |                 "AMDGPU_GPU_RESET_CAUSE=%s", reset_cause);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +59 drivers/gpu/drm/amd/amdgpu/amdgpu_events.c

    43	
    44	void amdgpu_event_gpu_reset(struct amdgpu_device *dev, struct amdgpu_reset_context *reset_context)
    45	{
    46		char str1[40], str2[40];
    47		char *envp[] = {str1, str2, NULL};
    48		char reset_cause[64];
    49	
    50		memset(reset_cause, 0, sizeof(reset_cause));
    51	
    52		if (reset_context)
    53			amdgpu_reset_get_desc(reset_context, reset_cause,
    54					      sizeof(reset_cause));
    55	
    56		snprintf(str1, sizeof(str1),
    57			"AMDGPU_GPU_RESET=1");
    58		snprintf(str2, sizeof(str2),
  > 59			"AMDGPU_GPU_RESET_CAUSE=%s", reset_cause);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
