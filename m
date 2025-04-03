Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872F32505B4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Apr 2025 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693147; cv=none; b=KYQTsJdondeXkKpbxUDCwNTHn4utws9mXZ1yWfMrzPIeeqljNNcV0P0usWoGkLqeiPKTv8TaOaZVogoLm/2EnKLyoYEQuQMyS/nwj6nW8fVLYA9kuvdYCvKJQQMt4/bRvWo5i25au1e9y3CKT8ECg0AFJY4tUvpk4tS3cNlr7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693147; c=relaxed/simple;
	bh=3gjydt2TC4vMJfz4qHVICOd8+FIPjb6F+uyQT8/1luw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9DvW+22Tx8hRLlQ/ThehZZdHRNDYKWtRW85U5HJ4eGQaaR28JIuC6Eh4N4anDhu7K8Cqo5lixQHzANnvXmtqByHv8vPH5etONffCIC7j+3fTMi9jY8Pf/ncFpf/uF/cxTNx1sSpUhv97qhPD6OekNZ7y1+M7kAYn5tO/ESOKrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7q8Owq/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7q8Owq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743693145; x=1775229145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3gjydt2TC4vMJfz4qHVICOd8+FIPjb6F+uyQT8/1luw=;
  b=D7q8Owq/id5NZvJjWDZS5Mg4UW/34/iq0t0VwYSznBHCROI8yfz0T88X
   Ya2wDYNlHRDAZhuXYVKpqHjDA+jndvbCmD/7IJVCKcXwNBI3vkD9uUQpX
   ZLIL+NQ6rw/mDEkr7OeiU0Rs80DozQUVk/6k+4gPkGKXRIXDe+d5Xwck1
   ZNMtiqrPixw8FxVnqIVY4ajeSQzKubHogjcB9uEi7r39+QrIyLETrFwpE
   nlofjhhRJxLBbPU+AmgBWXwjaK7kfmZAVklpEj5x42kNi/LUEhBYv1vJ9
   eM8bL4yc+DRtKS0VdWVV9tvHiL1PlbCTvJWT+Z706+yDHyiUORp7UxsjE
   Q==;
X-CSE-ConnectionGUID: c/v2zehWTh2bGEgv+ZU+cA==
X-CSE-MsgGUID: Z6DTG7h6R6mYdudJjo3exg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62511361"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62511361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 08:12:25 -0700
X-CSE-ConnectionGUID: O4KOqqr8RlyiyBfrdQnwlw==
X-CSE-MsgGUID: ZVAHIrC1TxO248fxWBM8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127561670"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2025 08:12:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0MEs-0000VD-3C;
	Thu, 03 Apr 2025 15:12:18 +0000
Date: Thu, 3 Apr 2025 23:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v1] mfd: core: Support auxiliary device
Message-ID: <202504032243.j5qqE6VB-lkp@intel.com>
References: <20250403110053.1274521-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403110053.1274521-1-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus lee-mfd/for-mfd-next lee-leds/for-leds-next linus/master v6.14 next-20250403]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/mfd-core-Support-auxiliary-device/20250403-190322
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20250403110053.1274521-1-raag.jadav%40intel.com
patch subject: [PATCH v1] mfd: core: Support auxiliary device
config: csky-randconfig-001-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032243.j5qqE6VB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032243.j5qqE6VB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032243.j5qqE6VB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/base/auxiliary_sysfs.c:6:
   include/linux/auxiliary_bus.h: In function 'auxiliary_device_uninit':
>> include/linux/auxiliary_bus.h:246:17: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     246 |                 kfree(auxdev->resource);
         |                 ^~~~~
   In file included from drivers/base/auxiliary_sysfs.c:7:
   include/linux/slab.h: At top level:
>> include/linux/slab.h:472:6: warning: conflicting types for 'kfree'; have 'void(const void *)'
     472 | void kfree(const void *objp);
         |      ^~~~~
   include/linux/auxiliary_bus.h:246:17: note: previous implicit declaration of 'kfree' with type 'void(const void *)'
     246 |                 kfree(auxdev->resource);
         |                 ^~~~~


vim +/kfree +246 include/linux/auxiliary_bus.h

   242	
   243	static inline void auxiliary_device_uninit(struct auxiliary_device *auxdev)
   244	{
   245		if (auxdev->resource)
 > 246			kfree(auxdev->resource);
   247	
   248		mutex_destroy(&auxdev->sysfs.lock);
   249		put_device(&auxdev->dev);
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
