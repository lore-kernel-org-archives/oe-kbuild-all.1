Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEBD18EB0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763193398; cv=none; b=bB2ZQOa1W7TZw+ujyg3t0/tVVSIb/slmCubGk7myMbR2Y02ZliZsiIyb1nVu2QhL1AGdVNNJ2uvSYYDdfS2V+7flw7WI2BIZLshPD0Id2JjkcrViNhRTmm/TlOAW184LrF3qszs81Vk8EqDmHmeHP3qAM9GrPQ3L28XL/Cqjy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763193398; c=relaxed/simple;
	bh=u7hKesHHXx7a1ZXJcQfEOLnqNr3KyWd2jl1OM+yTnNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZulCj3EpLdr8Y73sJ7D3lqYDzyqJTcMJH8FVeDZUHnfWSfY8PjA9ITRlMBp+eYNLtqinRyjf2SeL1HACXCLoQpd2DixYLo4iRPw60yI4gYP5LYry/Nk1Ief/mMk2/VIicdc8qK2O5bd6/uYfuSzH1iJuiTfZnCRkbqSzMx1O4Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foXcII9g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foXcII9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763193397; x=1794729397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u7hKesHHXx7a1ZXJcQfEOLnqNr3KyWd2jl1OM+yTnNo=;
  b=foXcII9gb+zHyX8KVzP9BAqNk3jhDhiYVqN1z2xuRCrD3cxWx54Fv07t
   6vj7aj+ISCc1+GrDcYRhZploII316uiVOY5WJvzWmYqwuJF8DoDbSqyLy
   Tht2SorcCP6XhM8jZriIyjt5r2+LetDuZEUV9nF4nVAVR0+Cr259vcLUw
   DuK7vk3qeh6PwSWIBXjv2bkP3tjZNPGw7KRUIZPqZYMxob/vSavAaCjsX
   21Cp5Taq7vr4vpkgUnb4t2fGhSfSUMBfnQEEKf7sWkZqLC1UPqj9SoKDN
   aoJDk7YzjPkDgJ1Iyxk2BC6eydw11cgTHAjKc2V7X/OK7XpixJmY6o+47
   g==;
X-CSE-ConnectionGUID: qqSjIkIBQvaqIxVbOn8tAg==
X-CSE-MsgGUID: CBqQ145uSXime+ya8QvGZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="69125386"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="69125386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 23:56:36 -0800
X-CSE-ConnectionGUID: j/jfW/7pQMOWhke/nam3sQ==
X-CSE-MsgGUID: Ab9MPtSISfGMlJsw2cEfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190437270"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Nov 2025 23:56:35 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKB97-0007nf-0b;
	Sat, 15 Nov 2025 07:56:33 +0000
Date: Sat, 15 Nov 2025 15:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] drivers/block/loop.c:1989:6:
 warning: no previous prototype for 'loop_process_cmd_list'
Message-ID: <202511151506.DjEXyEcE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3af14d2057f2f3df97472cef6b293113b020d1e6
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [1/1] ANDROID: loop: export loop_process_cmd_list
config: arm64-randconfig-003-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151506.DjEXyEcE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151506.DjEXyEcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151506.DjEXyEcE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^~~~~~~~~~~~~~~~~~~~~


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
