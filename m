Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181830BB86
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114362; cv=none; b=gi06Z0dc0zZtsEoGJ8imh4Y+fyRCldv/JJQB3Df0x2J0x3+VhNn6UbNoPGswMS6rxEQdGRpAdA9NdIq1Lk4mE/D4aFbaqVbY0SveeuIORFqVwa8qVqVGerptBGGhMV3+Rd64FmPG4ijQKgb0a6zawQwh8g0tXvAW8zRAorpy8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114362; c=relaxed/simple;
	bh=iA2ER8RQgNLqLnZd8fr0DJPqzYZhhZwzp9mDXQBip1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PRuFjw67hIQx2bRrF+aNEdMUkFHqBtfdOsSn8J49rCMnN4dYGRcdBz0rl8+kV3OmoGu7sAQjebKrAzdNHKhve/mapwaLwSzHAMWo1ErmWv6k+BD83Mt23+7zbpZndGcmO5rRsq1tdysoC6BDV9uN4yoawP/U+BE7cx5dk5VLW9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgHEGJNa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgHEGJNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763114360; x=1794650360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iA2ER8RQgNLqLnZd8fr0DJPqzYZhhZwzp9mDXQBip1Q=;
  b=XgHEGJNaTgWS8ll/ELmswbnSwjr/+qowPCpowSCZPsn1o1LKOad/9uTm
   BXF6+QP2GVh4va0BxaAUNG/mzDmcbjiLfqVCVAn6ZsXpBFz1qhu7cZLRh
   shVA6RGys8Z3C2de+Pruf303RLabDdfWQ86iEx4q/IaRdCwB6QpI73kab
   AXTlYlXCutp8GntI+UBk18nwXxXZwBQiCLCG3evPC9K4BL8HADV3jfZBy
   3N1Nc6TRq9z8iVh7HUr/4Dkdz+mGQ2+MxN6BuBYlxLYO1yDqr6X/vPc9y
   RQXXm3qLkQ2CE2SgD394Q2rhbFOeDwnkFI0+ufpS5+4jK7wKr23B66BC7
   w==;
X-CSE-ConnectionGUID: or1XlIBmQACqL511xg/QIw==
X-CSE-MsgGUID: /tV3raVSRS6rU1e5/elRhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75889124"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="75889124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 01:59:19 -0800
X-CSE-ConnectionGUID: kHRereGtTeeH8C4am80H5A==
X-CSE-MsgGUID: itHg5ThuRwyiS/uH1VkRKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189592790"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Nov 2025 01:59:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJqaK-0006R9-2U;
	Fri, 14 Nov 2025 09:59:16 +0000
Date: Fri, 14 Nov 2025 17:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] drivers/block/loop.c:1989:6:
 warning: no previous prototype for function 'loop_process_cmd_list'
Message-ID: <202511141730.9T2stoRK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   afad75633071da864b3090ce176c75e57113fa54
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [3/3] ANDROID: loop: export loop_process_cmd_list
config: arm-randconfig-003-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141730.9T2stoRK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141730.9T2stoRK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141730.9T2stoRK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for function 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^
   drivers/block/loop.c:1989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         | ^
         | static 
   1 warning generated.


vim +/loop_process_cmd_list +1989 drivers/block/loop.c

  1988	
> 1989	void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
  1990	{
  1991		struct loop_device *lo = disk->private_data;
  1992		loop_process_work(NULL, cmd_list, lo);
  1993	}
  1994	EXPORT_SYMBOL_GPL(loop_process_cmd_list);
  1995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
