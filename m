Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED513635E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761946293; cv=none; b=p7jGsRqqbeslAF68ZEFltqSZGiaR74duHknuzM93sZ0qQXDURIsiezTePt8rF1mLhLPKT70WetdE8Nw2rFJKQtW0Q1Rn74FVC7sOXJvaYTcqn6CbvjRCku3iM39VseRosHFo0EVhtU/ycz+bj8+Mxu/airaqtN9VkCi36RRNKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761946293; c=relaxed/simple;
	bh=baJwuqyD37mxY8v8yjU3D4GYST66dcXVTE82gKm+6/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xo8Qc2qOKHrTqLIcEk4G00XSajcWmQMlBGzc+H8sY4pZrxCjFqItvGD7UkBqSRGqrd1bslZxXc+OV34/XKqfIPp49R+MHmM8BGjmQbMSMNhWLkt6AC8J17/4h0qMzwVZ6YJBX4E4wj4bqm9zYdhPldBhJDgIQVCHfmtu8s6I7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dM+YjpyU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dM+YjpyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761946291; x=1793482291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=baJwuqyD37mxY8v8yjU3D4GYST66dcXVTE82gKm+6/U=;
  b=dM+YjpyUVwTg2ZiEVV9+knBE/OqtkfSsbj0esu8grYG3ZbhfFlZPh38g
   uCi0UcwoeaXK//UaTvv/+41pvDUpYP0f74/0vJEi6PQ6zBxQkt2WiR+Ct
   SjqQl+sRL/gEK0p4Uw/4+xEIcqrmx7f6M3oF/a1xA93DaEv9Naj1dKdDC
   rlHnVPDkN8WY6iE0Ah322JvDGuYHayJT4HdVeAX/7Bmt4XyY4hEEq84eB
   KGulyN3l5YGixiALHO9CW9/q0v7b5D10G7EKKbTwahDtcOuVb+21k2o+H
   sx/gmLjdkgaI7+KK10DCzjqgQsmUiomL+MnGCjEYEdkovkttEaZp8eTpS
   w==;
X-CSE-ConnectionGUID: ZfJkdjvKSK6xw0N9bICOaA==
X-CSE-MsgGUID: 1QUVNvsRR0OL0u4IKrq0DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64264497"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="64264497"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 14:31:31 -0700
X-CSE-ConnectionGUID: jPpg+ccOQYmdhmecyJ/HVQ==
X-CSE-MsgGUID: ZwC2zL1nQPWyDQ0Vmb9qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="185555519"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 31 Oct 2025 14:31:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEwiW-000Nf2-0n;
	Fri, 31 Oct 2025 21:31:28 +0000
Date: Sat, 1 Nov 2025 05:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [linux-next:master 1137/5383] ld.lld: error: undefined symbol:
 xe_configfs_primary_gt_allowed
Message-ID: <202511010521.iuMNWZiy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: 7abd69278bb53ab6b43f9650daba550cc7624858 [1137/5383] drm/xe/configfs: Add attribute to disable GT types
config: i386-randconfig-061-20251024 (https://download.01.org/0day-ci/archive/20251101/202511010521.iuMNWZiy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010521.iuMNWZiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010521.iuMNWZiy-lkp@intel.com/

Note: the linux-next/master HEAD 98bd8b16ae57e8f25c95d496fcde3dfdd8223d41 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_primary_gt_allowed
   >>> referenced by xe_pci.c:700 (drivers/gpu/drm/xe/xe_pci.c:700)
   >>>               drivers/gpu/drm/xe/xe_pci.o:(xe_info_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: xe_configfs_media_gt_allowed
   >>> referenced by xe_pci.c:730 (drivers/gpu/drm/xe/xe_pci.c:730)
   >>>               drivers/gpu/drm/xe/xe_pci.o:(xe_info_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
