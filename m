Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF822475FE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739024950; cv=none; b=PpNpyGYh5pR5TqYBKkKIiF0lZAtdauYG0W4i8fK2G8SsEKr+CqfnNWq7oyUuWKTLybY/ZHCE93ijC/WMFsxAR+1EUT9EwblYzAnSWkef9t03f6yOnIYDMKLACowm7PLgsKebeFlPRcla1KqhYn7QTsV6Ca+aOmUF7+noRtUlk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739024950; c=relaxed/simple;
	bh=O+y8ebAv80RyAOaqOvzVg+Mbilbk7MihGvzpf163gQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbRkNg2ZqE1yF/XVfSnsZlu44+hmvxmq6ym41w2pLoWfOblR5vOcsT3/CIy6oByCLfVcl+yEUxc77c2rkw8+N0Ot1FayxPLQCseEaTWbpgVumKLLGKRJaL57Xj8ASJsNv859fIU/fSkMGxyeuO1mStoj2XsZ8jDKSlJl4jQG40U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kh25ELHE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kh25ELHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739024948; x=1770560948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+y8ebAv80RyAOaqOvzVg+Mbilbk7MihGvzpf163gQY=;
  b=Kh25ELHE6HgtrqHIBtgyO5QtRqA76U40hsjNZACy4/4wVJy21jCHZzh+
   LBL3aRjCzlBfBDa/yIOETJ3ePRl4DdltPfYlBAPJOEaX+yQFLZ/OJxD8i
   OJOp7swUi4svhg3tHIGKd/bO7oEQmLiiqXeJpw+9ytV1/wmX0g9TtDrfc
   RGMJpnIuW7cRVwayWTCDFuCfWImASjkYkOjirBqoz89mpPfkAome0r/Ot
   A7rP9OQMu9EQW4w3Rur1f3cCAcy9q4sfg991fkqQ/VGkhuro7I0NfuUpO
   DdFHLyVKfBBfI2q+sr1Uxt2yWvU9Mkwk0GfYE1M+7NkCWdVL1KSoYJCea
   Q==;
X-CSE-ConnectionGUID: 9ntXJIaOSfqr3qID2e5bKw==
X-CSE-MsgGUID: tCOCRp8tQ+G1unAZebdDlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43419547"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43419547"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 06:29:05 -0800
X-CSE-ConnectionGUID: zfu9mKNOTRS4I8B5t1xNbg==
X-CSE-MsgGUID: EZae7n0ATgKWlKIDUZnSpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148979925"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Feb 2025 06:29:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tglpN-00104T-2w;
	Sat, 08 Feb 2025 14:29:01 +0000
Date: Sat, 8 Feb 2025 22:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1899/1899] mm/memcontrol.c:4428:12: warning:
 'mem_cgroup_check_swap_for_v1' defined but not used
Message-ID: <202502082247.kdBxrDeT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   96ebabc25b2677a2a225de204946e424cf3887c1
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [1899/1899] memcg: add restrict to swap to cgroup1
config: x86_64-buildonly-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082247.kdBxrDeT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082247.kdBxrDeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082247.kdBxrDeT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4428:12: warning: 'mem_cgroup_check_swap_for_v1' defined but not used [-Wunused-function]
    4428 | static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_check_swap_for_v1 +4428 mm/memcontrol.c

  4427	
> 4428	static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
  4429	{
  4430		return 0;
  4431	}
  4432	#endif
  4433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
