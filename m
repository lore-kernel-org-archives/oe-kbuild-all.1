Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A6D7ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 01:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SA2YfnPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702519049; x=1734055049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KnNzaC2ojfVJ8U1gLd4OUGFaDkTd6JTDIdgOiXxaZJE=;
  b=SA2YfnPdE814zIcbMnR/LorKLsH+fl1cqxtHHbqOPqhhwvF+AtrcKcuF
   RMDywafKrMxVb/nCiGKJIdigFwK0kVTxIfqZ7QIQxWXWb48w6spFAkRAS
   Smbb2R0TGCzIhwlOFNCnmBpxWRFnIniegwowJkM3eCD0/13ZqkrCUjCUR
   prAhJuSOPxh14oOozM9tAiR+jXE49wUs7rgxacuA1HkBxHv1ty3aYfItK
   67CA1LhVa47tknBhwOiz9y3uuq5fUrCFfgtiTn43Gkej07EjIQf/1iSaD
   7YJUFuYcISfso+8Sy/xYo8k2Ufj9FD6jwvm6ct+GrS18JgMyKflHhMK8E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="13750800"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="13750800"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 17:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="840103024"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="840103024"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2023 17:57:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDayV-000LPT-2A;
	Thu, 14 Dec 2023 01:57:19 +0000
Date: Thu, 14 Dec 2023 09:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 for-6.8/block 04/18] mtd: block2mtd: use bdev apis
Message-ID: <202312140901.zqOCbm5h-lkp@intel.com>
References: <20231211140552.973290-5-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211140552.973290-5-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on axboe-block/for-next kdave/for-next linus/master v6.7-rc5]
[cannot apply to next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/block-add-some-bdev-apis/20231211-221732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20231211140552.973290-5-yukuai1%40huaweicloud.com
patch subject: [PATCH RFC v2 for-6.8/block 04/18] mtd: block2mtd: use bdev apis
config: i386-buildonly-randconfig-001-20231214 (https://download.01.org/0day-ci/archive/20231214/202312140901.zqOCbm5h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140901.zqOCbm5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140901.zqOCbm5h-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/mtd/devices/block2mtd.o: in function `add_device.constprop.0.isra.0':
>> block2mtd.c:(.text+0xa3): undefined reference to `__moddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
