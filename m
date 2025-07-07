Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA2B2951A8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885436; cv=none; b=s18oksAuNNg0wd9RsCJvVZwJWpo0ojYYB4PfDKZYU/2LTINukpkwTWImgUulPbWONoOWnnVpMiIad2emtjwZqzzzi8offWZSScze+vjD9mX0LIa/WCAS7a9Dr5nQGDkD95fTrpomNqFDub1Kf7QkYh8cAYPyShEjbWIvYS1Zhgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885436; c=relaxed/simple;
	bh=jF1NBrAMp+FHQhzd+RdD93cZVm0lurqaIOc2k90vMMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7QtqdhY1LbxOczk5V21tFIFvidunx2eUbtqBwecTyCruoYy1ySY+xwbu230l6HB9qnphNCDh4T+u+Tum12mBiW7VG6ApTWP1IHDyO35BvyNmU9S5vFgKmAOQwi8lW+Tkocw9jGfIBi0yfajEghIyTIhKFhe3eDWwPQ91WsOw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cuVeX04S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cuVeX04S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751885433; x=1783421433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jF1NBrAMp+FHQhzd+RdD93cZVm0lurqaIOc2k90vMMs=;
  b=cuVeX04SSWFhJMKYRXdtCR2F9e8tSQvXbGoJ6nnSg/Uu8AKJkC5o3aGn
   Ilh1iJw7Dx7Xglebr65olg2lM1dlCzy+wQDalyXf63sI0CCoaZeHueN1X
   iP03HwwxPLkwlht2wi0fpQoQUHmfkWbRaEuwvRXd0FxBvLhaitlPicnbD
   utyfha8DmbWO8HA61C5gLHk1AdfLz4Dk3DuPYsfvzhCU/ALbEGiYz70QZ
   VuEayWsuBhMM9wG7OYLtoYNxDJEDMG0fanq1GOjyUhHuhrLjZ0xaDc5IN
   7DlbWdc/aY5FObjkdUG4nECURhiaAh5oZCP5EGTBmadcbZ2xk1VGXELHH
   Q==;
X-CSE-ConnectionGUID: bl6N306gQ8mbC9CUrtvrsA==
X-CSE-MsgGUID: lQgYDb+bRsiLp/saSU6LsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65166828"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="65166828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 03:50:33 -0700
X-CSE-ConnectionGUID: 9sLdkscaSLiyvKZP3B+6cQ==
X-CSE-MsgGUID: KWe7TrBSQ5KKIXIXhOXumg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="155767300"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jul 2025 03:50:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYjQc-0000Lf-0C;
	Mon, 07 Jul 2025 10:50:30 +0000
Date: Mon, 7 Jul 2025 18:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-SST-ANBZ22492 1/1]
 drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c:669:60: error:
 'snprintf' output may be truncated before the last format character
Message-ID: <202507071850.vAxy5nSs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-SST-ANBZ22492
head:   59a574672172bad443e381c848719ec7b0deafa7
commit: 5f4d21c3cd962f1973561e270d18147fd284468a [1/1] anolis: scsi: support linkdata HBA/RAID controllers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250707/202507071850.vAxy5nSs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507071850.vAxy5nSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507071850.vAxy5nSs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c: In function 'ps3_host_info_get':
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c:669:60: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
     669 |         snprintf(g_ps3_host_info.release, SYS_INFO_LEN, "%s",
         |                                                            ^
   drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c:669:9: note: 'snprintf' output between 1 and 65 bytes into a destination of size 64
     669 |         snprintf(g_ps3_host_info.release, SYS_INFO_LEN, "%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     670 |                  utsname()->release);
         |                  ~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/snprintf +669 drivers/scsi/linkdata/ps3stor/ps3_instance_manager.c

   667	
   668		memset(g_ps3_host_info.release, 0, SYS_INFO_LEN + 1);
 > 669		snprintf(g_ps3_host_info.release, SYS_INFO_LEN, "%s",
   670			 utsname()->release);
   671	
   672		LOG_DEBUG(
   673			"host info: machine=%u,vendor=%u,processor_cnt=%u release=%s\n",
   674			g_ps3_host_info.machine, g_ps3_host_info.vendor,
   675			g_ps3_host_info.processor_cnt, g_ps3_host_info.release);
   676	}
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
