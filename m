Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B75231C9A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728089570; cv=none; b=RzFiMYHKFM8OVK1ifr+N6Adj+SKq9fVH8seob56Vuact2BKzVFYRZfn7U/YcBkV6DsDtmpearmw0WqhcF84eUuB7fTp+CKbIwhGzd5GDF7DwbQTDyKWeUMdqUk67zpNdk1HClXcNCV735ZjUPXeOF8SOYV3VVxvGBFZspmmUOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728089570; c=relaxed/simple;
	bh=NamHSNHe6GUgPG1tRKM28H4Ro8IpVL0fo11UIDFX6MY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyq0RNnG+pyIGbvJNp/4fOymHgp1ALofJuE7BmRZg6QiEilByAz+LEsnHfaA8kId80mHLdXsJ4+tnSVGQexuozW2Q6ZB+H87kmMKP/w9CdVn0eNt+PnMYkrsQuMkOwzfvGHZ/dMk9sedHWm3cJEoN+9LAksSimhciAIwr1/t0RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CC0OjSiL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CC0OjSiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728089569; x=1759625569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NamHSNHe6GUgPG1tRKM28H4Ro8IpVL0fo11UIDFX6MY=;
  b=CC0OjSiL0DzjJgel76DX477ZqLmwhKfdoBOV9k2u2nYvBFMa6NnujHQm
   YBlaap3BAy+DyfHHDyObcjvUeBFiT39Nc5Th+fDU8zmo2vHKbj+qYnewx
   Fu2YEteHlYOjNxHRR/7D8VhS1JGOvYBUKLW0TWEoIsNA0DfDioXydolxA
   M9RLxuc6OQiemPHDljbh1oOugJ4++IBtCFWR5bHd6XAOcVFuSkv9OQfdg
   /yahO8qiZ8JoDM5wWClMw6Qh69K2VpucUH2jwVmEUAbiUuBiUemFliB6N
   t+5FxZiPY/GPFSNhC+WeSrT/Z2QUSngx3uGuoqm0qxgycvasp04Lk2ytN
   A==;
X-CSE-ConnectionGUID: MZlDiuNxRy67ExyUqu3NFA==
X-CSE-MsgGUID: or/kqK/2QpGPQYj8DHzPCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26827856"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="26827856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:52:48 -0700
X-CSE-ConnectionGUID: TsNAuO6hR/qO/Kjc9vrgcA==
X-CSE-MsgGUID: 31kMDKw9SI+wW4T7XH6TyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="75205823"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Oct 2024 17:52:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swt2L-0002ON-0w;
	Sat, 05 Oct 2024 00:52:45 +0000
Date: Sat, 5 Oct 2024 08:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3613/16788]
 drivers/mfd/max17135-core.c:35:10: fatal error: asm/mach-types.h: No such
 file or directory
Message-ID: <202410050831.CNH55EZt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 853944c5181946f7b7d04330e610316b49aee2d6 [3613/16788] MLK-11556-1 pmic: max17135: add hwmon, mfd and regulator drivers for this pmic
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410050831.CNH55EZt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050831.CNH55EZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050831.CNH55EZt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/max17135-core.c:35:10: fatal error: asm/mach-types.h: No such file or directory
      35 | #include <asm/mach-types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +35 drivers/mfd/max17135-core.c

  > 35	#include <asm/mach-types.h>
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
