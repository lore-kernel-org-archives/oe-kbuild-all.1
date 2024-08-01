Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACA13B7B3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722525681; cv=none; b=ev9Nky7KyDlMo4IBPjkl2Z7VAP0tiMGy9spn9r5A0EUoZZ03zLUYmTQcv0iMmxcAD8GvrfJpemakeHeUsTeKJXq58tbV0lJhFLf57iSTaiNBO2bh8Wa2NpdjMgFzA21GoOxtHaUygyWwT3Eov/qqK2m8CIbNgNg5wPir6/ZO4gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722525681; c=relaxed/simple;
	bh=iiG9+QbntPzGjMzfX/++/1BKtptX583PyGUHJZVDOiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ke8Xaj9VnLfY2a913Bt53ZeKU/S6a5LTI9mJa/+KaUmN5Iidsj8bf2+MMgEF4pOp1fdnTznMb+jh52ow/1fdoKFHPjNigBPexnT2aJImwUlJrLRNtvjTtw+crxCsvuL+2bu+pgvg1TM7y4YdlbnHrbZrCqW6/G1Dx5rAJ/qjsZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAzNfT8z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAzNfT8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722525680; x=1754061680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iiG9+QbntPzGjMzfX/++/1BKtptX583PyGUHJZVDOiU=;
  b=dAzNfT8zCHT1wTn8RctrzRcIzZzEhtpIr+jXBSBvkjPjPQWhgok72WmG
   Z9gEoN+DgZBHYyBDoTKLNjkEJ26VNZLAK3rMLnLS3RU9eaOrCFcCrImgT
   vywDZN4TesNipXE602Zshu5TC77q422Ups9DEDXv5bUppODjCdJsuI+0M
   xDHtLCqipzUdGtMwhWH0cklPZS6i43PgQtFTyvgKzU0oiU+sJhLfE/jby
   nNsh7cwtYyVMrCCHBpsDqH2ICTyyK3iQGFncjKHHmfq5m86zklBrx5jnM
   zf3rJX9LTWlbFvklR1wEXpuaoSTNO9N3QgpbDha5rjrudD0hkGQ3I9LdC
   w==;
X-CSE-ConnectionGUID: PzhiSBVrTm6GFxN0JeppvQ==
X-CSE-MsgGUID: DjQK/07yTRiomPlYe8qqAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38000587"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="38000587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 08:20:35 -0700
X-CSE-ConnectionGUID: FkhyCFyAR2yKXsu7UwA2zw==
X-CSE-MsgGUID: AYCfDdF4TR6tJdv7vGqMbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; 
   d="scan'208";a="54733147"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Aug 2024 08:20:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZXbT-000vgy-21;
	Thu, 01 Aug 2024 15:20:31 +0000
Date: Thu, 1 Aug 2024 23:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16810/23403]
 drivers/misc/uacce/uacce.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202408012317.Ocvc77l4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   39e859c5836c18cb021d3435101c4066536caa81
commit: 451823febcb610969f048556cedc41b5e08fafb1 [16810/23403] UACCE backport from mainline
config: x86_64-buildonly-randconfig-002-20240731 (https://download.01.org/0day-ci/archive/20240801/202408012317.Ocvc77l4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408012317.Ocvc77l4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408012317.Ocvc77l4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/uacce/uacce.c: In function 'numa_distance_show':
   drivers/misc/uacce/uacce.c:1032:23: warning: unused variable 'uacce' [-Wunused-variable]
    1032 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/misc/uacce/uacce.c: In function 'node_id_show':
   drivers/misc/uacce/uacce.c:1046:23: warning: unused variable 'uacce' [-Wunused-variable]
    1046 |         struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                       ^~~~~
   drivers/misc/uacce/uacce.c:60: warning: Function parameter or member 'dev' not described in 'dev_to_uacce'
   drivers/misc/uacce/uacce.c:81: warning: Function parameter or member 'uacce' not described in 'uacce_hw_err_isolate'
   drivers/misc/uacce/uacce.c:140: warning: Function parameter or member 'q' not described in 'uacce_wake_up'
>> drivers/misc/uacce/uacce.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
