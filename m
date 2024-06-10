Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2B1CF9B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718054285; cv=none; b=d/7elEcE3OCwFXer9SQgv9o/Bm5DtkSD0/UP2gcq1lQeV8c7ZqG9s+epXd4k6pusi6pWzhYKNx26ViwFQgu1su4Al7jcrd1UaaB7ahgxGeck2MRLKrrfnzygXNqNQVNHbb1KIEIQiYp3TWAxqTbZO0qXcp85NUGtg0qQLTuAq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718054285; c=relaxed/simple;
	bh=d3eQCFZk9IOOpz8KrRleyaNEmpZT1AVbjFgFbyJBqbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8bpiYF0YLbrsPczZLjhpJr+r9YbP0k8RE8s9GGPlgStfd40+AXMU/lTHJ8BaYTd5Jn6RmQEgMLUvGenItd84NxAzgHnFOMbAt6We2FennNZaohAoVAVG1fkKBBOs+empmMrOdYvTp02WjdH+9r+sSWX9wvg5akd3CYYQkdIQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZwgI7Aj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZwgI7Aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718054283; x=1749590283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d3eQCFZk9IOOpz8KrRleyaNEmpZT1AVbjFgFbyJBqbA=;
  b=iZwgI7AjMCg7yVcguwaxPsOddqS8RpKkNHo5FwyFL5MPRTsAbBY3jZks
   EAjLSA+gBq3GWCggQtPeYNctmenjyCeuWXcr8SnaP1JLgXISIdOfheDYp
   VQccqIw0onesjkzCwoZJtf7FNyiOrg8AseBI2PsHZ3lyqtIcVSdOqHP6V
   T5FjHiL0mGEFCxaYWBiQH3/LUSzHH2++AB3HW57I1l63EpSAlJlnuSq4b
   SV0jdbSy0BfTljyh09YIV/fJJYdRJvHPrhqwXv8FGjWfQVLHrBIPFr79A
   UMCVYVnm4SO3vyQ4JDAahvYm7Akwbu7IMMjpQFHwd5lNVLr3EA+7b+oj7
   Q==;
X-CSE-ConnectionGUID: H9ownHfKRmKaf+ZyIHaQKQ==
X-CSE-MsgGUID: VyZBRIv4TdigYC5vGfJ4LQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="12006847"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="12006847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 14:18:02 -0700
X-CSE-ConnectionGUID: 4lXSAJiuTfWewVq8TJqmzQ==
X-CSE-MsgGUID: 2Cq37o8/R/Cw+1BZhUcVAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39032488"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2024 14:18:02 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGmOt-0002U4-30;
	Mon, 10 Jun 2024 21:17:59 +0000
Date: Tue, 11 Jun 2024 05:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 22/22] drivers/ptp/ptp_vmclock.c:18:10: fatal error:
 uapi/linux/vmclock.h: No such file or directory
Message-ID: <202406110511.vU6eIqsk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   05710da2c87231fc47e4599060371792a31edea2
commit: 05710da2c87231fc47e4599060371792a31edea2 [22/22] ptp: Add vDSO-style vmclock support
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240611/202406110511.vU6eIqsk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110511.vU6eIqsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110511.vU6eIqsk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ptp/ptp_vmclock.c:18:10: fatal error: uapi/linux/vmclock.h: No such file or directory
      18 | #include <uapi/linux/vmclock.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/ptp/ptp_vmclock.c

  > 18	#include <uapi/linux/vmclock.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
