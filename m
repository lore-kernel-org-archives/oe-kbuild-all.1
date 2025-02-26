Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF22224894
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590094; cv=none; b=d0FWgM7vrGyVyVfC5pHXiAMhMXvdp15lAshT7bVj9u+bCTNUs6+kwe2NXLYuGpz7Ejs4k8PE/3blOVljvBRZdH675EjTD86BZpiO17NThqt9T7zoBesE5D1PCdW9Ui7/FSTaTPHMC6qQGu2aR0C3j35a8ohDhpkyQ0Jg9n4Q1rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590094; c=relaxed/simple;
	bh=+EdvxbtO31TB8HYPyWAfZwcC2IsOn/HHcoN2fCzng1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fr2gk9nfU3K5zQi6HIM0vGC5chLOW20HRa+G1VChNQb0LH3eca/LcwChc1R3aBEdeCXNXV+Lgz0bU+RsPD4L1Ujts1YI4nWcMb4GmIBacsKj1Q64YcaVm2Q/r/2IPmHR0MGVuQoQCSLj09U0Jq1yUdOLZa6X3+Syi4ZUNkErhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctfOMiL1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctfOMiL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740590093; x=1772126093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+EdvxbtO31TB8HYPyWAfZwcC2IsOn/HHcoN2fCzng1A=;
  b=ctfOMiL1gxaaLdw0jR49d9gB8apwqms+Irc1KSZOmcv8KRuG14RUQCEE
   Ult0fltVArijFqOXhxtuIyjnWlmd6FKwUxje6kliAY1g29KzyX2ss2pCV
   0idEkBcOvcogDNCa+ysBO9IV1xtpuVqSJd9XEkIbHEZyN9PzDxU2RDEIQ
   9NjHGvhuydJHQsb3GKb+x3UjMHTVeiS61POyoVHb16MhBEJRKW8syxWxA
   NL11hEc+22b/VUxeYetMnyT+zMYKfeTzooyudsDZhxuQdvl6mA4XlTR/M
   J/sWnusviQRTiPp+Ircap0Jx1rYYoNa/fH7vTQOT/ZDoy051k9FiUyDTp
   g==;
X-CSE-ConnectionGUID: Bfz24hUWTcK2d0+FQDndpA==
X-CSE-MsgGUID: z8nErDVsQxau6rFu2OitWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40628085"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="40628085"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 09:14:52 -0800
X-CSE-ConnectionGUID: 4izveWGRQaKbBL0npJX/UQ==
X-CSE-MsgGUID: I7JY5qf1QX6Kq1TclzCdmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121370027"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Feb 2025 09:14:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnKzh-000C8R-0V;
	Wed, 26 Feb 2025 17:14:49 +0000
Date: Thu, 27 Feb 2025 01:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Don Hiatt <don.hiatt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@intel.com>,
	Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>
Subject: [intel-lts:pr/59 1/1] drivers/infiniband/hw/hfi1/hfi.h:
 rdma/opa_addr.h is included more than once.
Message-ID: <202502270148.ShV21mgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: d98bb7f7e6fa29d45008370084d5cabac7ac69ed [1/1] IB/hfi1: Determine 9B/16B L2 header type based on Address handle
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270148.ShV21mgi-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/hfi1/hfi.h: rdma/opa_addr.h is included more than once.

vim +69 drivers/infiniband/hw/hfi1/hfi.h

  > 69	#include <rdma/opa_addr.h>
    70	#include <linux/rhashtable.h>
    71	#include <linux/netdevice.h>
    72	#include <rdma/rdma_vt.h>
  > 73	#include <rdma/opa_addr.h>
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
