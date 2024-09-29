Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503623CF6A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727603066; cv=none; b=O5td74pFCxCge0h9xHuWZtl+0ZrptvO3JnJMHBncZl/cEerGVMGTzf++uzFG4Lg12iCRXI8u/t/QgBfp9gyuaE6BKIWofOesP2WCIMuXxp/mGigPwAVL2LIsC7U9V+HzHrRA4q40UyAiB7CMyVaEDZMN+bUeHIsUSMa0C6hr8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727603066; c=relaxed/simple;
	bh=N/yb7M+c+kcuGb9mN7kf2njTeA4joMOQeHO9uGOzDV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3dWwxYydGvM7tLFuC2QZrnSvPbWTj9alDWNxTo/Njz+EU8V1yE5HFQOQwVC6o8NHGd1BySycmZmQyOyZ7WIySzG1rE02aG+JdJNEiG3uYBLp+On6jLuoos+vTogFOSmfTRt/3wS68RaWyuzs7SwU0vBEYhtaS88PvzDTMmfXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoSiHXwa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoSiHXwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727603064; x=1759139064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N/yb7M+c+kcuGb9mN7kf2njTeA4joMOQeHO9uGOzDV0=;
  b=FoSiHXwabxXFkdxiUaZq600ueHSXkfYEpL2SioEhAR2WMfa7INOJ+76M
   Gz10mceuheYTaUFuMIgoj13/yO0+dWeX9qOuKPEs8osMtu3ZKnP5g6vhk
   EP3QBJQz+FiemOBT3pZxkYJzQCcFp2n6sfCFYP4BN0IDLbNoAD157yUwN
   XVs611YSC3vVxy7bWchyQskcG+OUguQQ/IPGbfP9mEji6bEA49oxFtj1O
   ws/l/CUbWC1ysj21tShHpb1EvYRJhrCH1OkpHEdHeluk9Zl2sIjx/r5YG
   0bw+Am2B/N80Vpcz8a2UCBhL6xqPpXr/GBysfdBRYD1KLbm7hZx3XU1k9
   A==;
X-CSE-ConnectionGUID: 0gWSCwbkR0ew+dkykCPduw==
X-CSE-MsgGUID: 6bChQfCnT0uCbGbcbf1E7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26576001"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26576001"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 02:44:23 -0700
X-CSE-ConnectionGUID: lgnPBfD0TP2KisPBvhJTZA==
X-CSE-MsgGUID: b0G9hRheQE+/8KV9RnS9Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73402907"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Sep 2024 02:44:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suqTU-000OAh-0K;
	Sun, 29 Sep 2024 09:44:20 +0000
Date: Sun, 29 Sep 2024 17:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24628/30000] fs/proc/base.c:1454:6: warning: no
 previous prototype for 'pbha_bit0_hide_file'
Message-ID: <202409291756.R89OCM5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0988d5e5eb47d35a2babb4c0d6b6b81aa0fccbd3
commit: bea38841945a52bd03004240eb0da6a5115bae21 [24628/30000] arm64: mm: Hide pbha_bit0 in procfs if pbha is not enabled
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291756.R89OCM5f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291756.R89OCM5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291756.R89OCM5f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/base.c:1454:6: warning: no previous prototype for 'pbha_bit0_hide_file' [-Wmissing-prototypes]
    1454 | bool pbha_bit0_hide_file(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/pbha_bit0_hide_file +1454 fs/proc/base.c

  1453	
> 1454	bool pbha_bit0_hide_file(const char *name)
  1455	{
  1456		if (!system_support_pbha_bit0() && !strncmp("pbha_bit0", name, 9))
  1457			return true;
  1458	
  1459		return false;
  1460	}
  1461	#else
  1462	static bool pbha_bit0_hide_file(const char *name) { return false; }
  1463	#endif
  1464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
