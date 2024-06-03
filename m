Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9B125D6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 08:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402606; cv=none; b=j+9eU/XxDJ2jjDHclXHmJOFA7qLZji+ZZP8XqAykRXXWHxNCFYmBffeLD4+HjvfIVxdGiTDBAm4lQdj7QoXTU6D+IuLN5zdh2p4fsmJs65c0rGdAj0W6w/flUfj4tA/frkn0mmvCfyKe0pa012tex7s5LZcqVv7Eed4a2V2yGU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402606; c=relaxed/simple;
	bh=M9DqGxvY4AyPrEwV18fIrJDpS87SG4vANRXQrlzPKnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqMWwVohgQ2DIFVzl7A3XkggDcUmsBl206ZqI2+h5cLkfPLQrKN3R69+tJrotb5Q/i0Frm/5RidERjYHco6uHtLe2MwZF+F+eALa9Ayo3uQM3a1kt8nQaFI1ReC1cMqBPIc+EVApRd9g2ZSt+UmLR3f3xmzx9mc+0GM90UZ3Adw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9Df00Ta; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9Df00Ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717402604; x=1748938604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9DqGxvY4AyPrEwV18fIrJDpS87SG4vANRXQrlzPKnI=;
  b=M9Df00Ta0Z3gQvx6izbpLAeen4rb9v1K8oLhlBSpajDWVvT0AqzgWIpU
   SByIpHzQwPEknDMcrtlhBwY6jqmcnFkuJuSXOp4J5+kR4P31+53qI3qXV
   ibhMLXB0imOOtei6mEKIec7liIzGw9I6shU2U76bR4K4EtnofxZSFRUVL
   s1T5081g56PvnttOx6ZoKI9TEKuAdMQl9KE2LvgQp9soob/fb+95KMVgJ
   tMUN7Mp/gpylBo2PXbhssrLnv8aOoNXegEfj7etPuXFtJAXb0pS6oxa4a
   eXYtsHenL1bHpErRLXeZNL+e7iP71l8Rw0h0LoajSlMcdCGwfxyPuJ4ob
   g==;
X-CSE-ConnectionGUID: 7tJ/YUGxRnaYsuSf+166lg==
X-CSE-MsgGUID: oFppeuXqTyqD2XBwYOCF+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="36407860"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36407860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:16:42 -0700
X-CSE-ConnectionGUID: tErUiiYHQFOl1oeXPNF9Ug==
X-CSE-MsgGUID: 5VlEeUgTTPutUOsBmtyZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36797287"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2024 01:16:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE2r6-000LCB-1F;
	Mon, 03 Jun 2024 08:15:55 +0000
Date: Mon, 3 Jun 2024 16:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16810/22640]
 drivers/misc/uacce/.tmp_uacce.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202406031659.4McCaYnA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   432ff1555c2d2bd585c63b2f2c797ddcc05efbb1
commit: 451823febcb610969f048556cedc41b5e08fafb1 [16810/22640] UACCE backport from mainline
config: x86_64-buildonly-randconfig-001-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031659.4McCaYnA-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031659.4McCaYnA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031659.4McCaYnA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/uacce/uacce.c: In function 'numa_distance_show':
   drivers/misc/uacce/uacce.c:1032:16: warning: unused variable 'uacce' [-Wunused-variable]
    1032 |  struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                ^~~~~
   drivers/misc/uacce/uacce.c: In function 'node_id_show':
   drivers/misc/uacce/uacce.c:1046:16: warning: unused variable 'uacce' [-Wunused-variable]
    1046 |  struct uacce *uacce = UACCE_FROM_CDEV_ATTR(dev);
         |                ^~~~~
   drivers/misc/uacce/uacce.c:60: warning: Function parameter or member 'dev' not described in 'dev_to_uacce'
   drivers/misc/uacce/uacce.c:81: warning: Function parameter or member 'uacce' not described in 'uacce_hw_err_isolate'
   drivers/misc/uacce/uacce.c:140: warning: Function parameter or member 'q' not described in 'uacce_wake_up'
>> drivers/misc/uacce/.tmp_uacce.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
