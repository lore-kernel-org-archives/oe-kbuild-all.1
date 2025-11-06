Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6123EA94
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 18:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762455277; cv=none; b=pgUkpsdU90mjlDzOlYY7WvFsblyZ2Z342vVk3yLHaKbeQeLwjod61OxgVHOhEX5VCawXYD6g1xz3BvYdYXoFmKQwGTYuDX1LFn2H5IXKLM3bjORLtQwixhb5d0iSArWVBcQo4NFMHcnhkRwX/ygu8heIXmHzkjZ3L9v9X/WDIpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762455277; c=relaxed/simple;
	bh=gKFJhqMZvSjPma9UeQ7DPSyHVNDD6dvvgEjGmw6az4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kv5FyGpQLsB5QzS0vnfReMBuUABPVhPX2dh3mA/D4cKXCxjaLa6f14oL0hoCGQKSZM0969vRrs0qGI9AUYo3dMezWSx0iS8a6KLqmIZ8asL27F5TKXapmmPQsz/tbFHYilkLvHoRRcxJi52qVMgkq6E8A9MCn/xrnbqd2f840Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdswIx4z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdswIx4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762455275; x=1793991275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKFJhqMZvSjPma9UeQ7DPSyHVNDD6dvvgEjGmw6az4s=;
  b=YdswIx4zh8W0PbRlxvN1zNECzJF3Y9OmtCKzxUz2Uu3iFQFH6nEDt0dz
   gvVKHzvFMiSq6RnV5KrN/Tg+SQ7OHBJ2v7GDO9F7qe4XDMxUpWB2K/+sf
   BYSFj0mgOWLP1DlqjiaCN23cKbkCdD5vV4/y12lELEZnzrgBsL522WeK3
   Iy3H5iNaeGjnZU5TgKcnZJ7Mrf3lcQF4sY4pM2FP5UCEUP+PtZ+s7wkma
   hUGGMtmvCY/FulU6Hsxk31a5Ghb7ycTGB/7Iqv5ce9d/B6EwcyG/t0ZsN
   B5EvWUaW8A+OOkMgqT+waOmYDDDDh77DyD1uLSrfA/7HPFcw5+hTppe5L
   A==;
X-CSE-ConnectionGUID: ZpFUxgwORray+ItqYCq1vA==
X-CSE-MsgGUID: t3WuxoAmSCiS27oo2R6x1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75213416"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75213416"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 10:54:35 -0800
X-CSE-ConnectionGUID: 94ibA8iSR86ep69/t2Vudw==
X-CSE-MsgGUID: EGXlv7EbQj6AXauaqOLbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187994827"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2025 10:54:34 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH57v-000UGl-2Y;
	Thu, 06 Nov 2025 18:54:31 +0000
Date: Fri, 7 Nov 2025 02:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075]
 drivers/irqchip/irq-gic-v3-its-ub-msi.c:149:12: warning: no previous
 prototype for function 'its_ub_msi_init'
Message-ID: <202511070221.5BlpE2PF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5fbff312766cccbe69b33ef625e720c49e8cc866
commit: 81962d0ecc6e3e039f4df445d38650dd6109bc78 [3075/3075] ub:ubus: Support UBUS Interrupt framework
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251107/202511070221.5BlpE2PF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070221.5BlpE2PF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070221.5BlpE2PF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3-its-ub-msi.c:149:12: warning: no previous prototype for function 'its_ub_msi_init' [-Wmissing-prototypes]
     149 | int __init its_ub_msi_init(void)
         |            ^
   drivers/irqchip/irq-gic-v3-its-ub-msi.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     149 | int __init its_ub_msi_init(void)
         | ^
         | static 
   1 warning generated.


vim +/its_ub_msi_init +149 drivers/irqchip/irq-gic-v3-its-ub-msi.c

   148	
 > 149	int __init its_ub_msi_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
