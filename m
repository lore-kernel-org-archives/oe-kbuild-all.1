Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C0E7EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 01:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710119256; cv=none; b=S+ZaLE6dsPj2Ln4BY6asRDiF91vAV8U0d03/YgJ3mFCDgdtNdBPGyZla2OVqDWjkhwsMLwnVYnhVFSUelRxQrnnIhURiD1woTo8K+LVQxuvNBXRRVqOLsV9cOjRsq1biCFL/gYaZAxcmRc55bb0ikIfbgO8dWT74B7CdPj+rsFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710119256; c=relaxed/simple;
	bh=lPbWcCoj0lX8lC/f4WzvCng+jcUCwC1a4cj3miMjnPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cD5qi/jCC1lYnUX1TW52w0sk/0BXW/DgTldynAKoQ5Oo2XdRkxJRY8iuWUszBQxXW5+o0CH2w+RDpvJbhPKX5I+RrNxB/MqhRn2nNpEe4vBv/TdiQJ64FlW7k307GaleS3niqdQzBKtHb/f6Ggst3x/VASX0l9ok/pI+yWGRK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esgg1Yj0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esgg1Yj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710119254; x=1741655254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lPbWcCoj0lX8lC/f4WzvCng+jcUCwC1a4cj3miMjnPU=;
  b=esgg1Yj0OXODO1apqUnu0cjV96XRnORiMjbH2UaqN1Rdo40uPIGAEKwZ
   13c2iAEEUXubwN0H78Rll/akbU8IwBXzm9z3UuIdD+xJAjLIu65PWVlf5
   cFNECqaSb7mk1fm7yIcTf5yIG8fVOOv2lvCqF4nrTvB4AIe7ynz6geZuc
   fA0gZ/h3TXdM1lBlVm1uJx6Y4YqKStBSXYeNOhhXn49uWIsJifAsPNPav
   OpxVxnnf5FHB7dJIEHqPqIBIVMX3A1bg7FTYfoD0E6tk81zmkcMkJphak
   KZ+N0VtVW4wWyHcnwFxlWPBXOqspHAAKu6rHvpgKRVNY+eYiBbGtAal0X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22223611"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="22223611"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 18:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15598683"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Mar 2024 18:07:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjU8R-0008m3-2y;
	Mon, 11 Mar 2024 01:07:23 +0000
Date: Mon, 11 Mar 2024 09:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 65/98] cpuset.c:undefined reference to
 `get_idle_time'
Message-ID: <202403110903.ljBPRDMO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   7a0a83db002d240aaf4d8944c41aff4a2c2cb992
commit: f02c35d2e66fb42ca03914d72b8e25ed8bf6e688 [65/98] cpuset: add cpuinfo and stat show
config: arm64-randconfig-001-20240311 (https://download.01.org/0day-ci/archive/20240311/202403110903.ljBPRDMO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110903.ljBPRDMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110903.ljBPRDMO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: kernel/cgroup/cpuset.o: in function `cpuset_cgroup_stat_show':
>> cpuset.c:(.text+0xff8): undefined reference to `get_idle_time'
>> aarch64-linux-ld: cpuset.c:(.text+0x12f0): undefined reference to `get_idle_time'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
