Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98D79C2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 01:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710121633; cv=none; b=XtDrW5JBl2zxXnYuSVAdRGq9suOb+gWhjgaHmlnscSvyfPgMwK/wfApimuqk7e/c3Gyw0TVPchJgB4Q+ZCILKIDaIy2MSGZQerBim2Nrc9vLpJad0S5+2jOI71BHUwzElrGK8u3Clt1U7Gdakl07Gg/d3bWd2kwPyB2f+A2ZCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710121633; c=relaxed/simple;
	bh=ciEnGxbSSve6mJFUhpz7zbC8iGAPgFjGszrG+gOVSJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtomkO/7JSHUKeHlwknrNMqX/dz5NvrYdbj/ZcXRUnV7ddKbyP1Bg6BfP0z4oRGlcQMXP9pQcXigeVqqGOnmZA55ptATLxtzSN0Rpwe1ghKpwP7e7fKH+BA9yjfbEo+XpCbZi6EDijGl9U3VqXZAvAD7hKjV9fVYkLyKWHeToO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFwuZ3ya; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFwuZ3ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710121631; x=1741657631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ciEnGxbSSve6mJFUhpz7zbC8iGAPgFjGszrG+gOVSJ8=;
  b=eFwuZ3yanxIgXHI1t/jVwNm5QoRHJj+5ZOFKSEHpJ3yOx5jujyjeET0J
   Za72rDaIWm7w+JDMBfigws4hZPwU+sbIPGJivVAZgRFRCyUA3YLaI74Dm
   yt7gIh1slx3xYqxJPqAJ01QLcQJ1/2+oe6QVl2KZ6fqsNeeettPkCAPni
   H50RqCW3x5cUGZUvVbAk2xQnYz0uae7kyXYURRVdOQ4qhE56tnxvvo8FD
   1OjynWm2gNbTbOTdkWLR/GImo33Cqp1jYEIv/tNhL1ej0FazNoYfnvWEI
   zbLWrt70N7De00t64J+R4BQyZLJ01WYi6w/j153gvuwM6rEeVE4rcj2Lf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15410282"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15410282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 18:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15506186"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2024 18:47:08 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjUkr-0008nH-2U;
	Mon, 11 Mar 2024 01:47:05 +0000
Date: Mon, 11 Mar 2024 09:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24632/27506] acpi_processor.c:undefined
 reference to `acpi_processor_ffh_cstate_probe'
Message-ID: <202403110919.MSAZtUn9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: 6121fcbfad79e7088ffef0d4abb48fc33b26aada [24632/27506] Intel: ACPI: processor: Export acpi_processor_evaluate_cst()
config: x86_64-buildonly-randconfig-003-20240310 (https://download.01.org/0day-ci/archive/20240311/202403110919.MSAZtUn9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110919.MSAZtUn9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110919.MSAZtUn9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_evaluate_cst':
>> acpi_processor.c:(.text+0x348): undefined reference to `acpi_processor_ffh_cstate_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
