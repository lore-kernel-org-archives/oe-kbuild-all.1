Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D24151991
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739631659; cv=none; b=B8RPt8e1fVfFc0nzWyk2QDXTPWDAIGO4/iB3bWVuGU+mvW61MqmRmH0fEeWDO0LuRtS1qMJp/EtOLJWS6Lk0tO/XBbSgyDliJGrOZPx5C26uzXyIGscih/JplZQegVPy5mgVQMt3KPxIMNgVJSZT2a7zXiyvYxGAEVxrFIy7Aj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739631659; c=relaxed/simple;
	bh=CZn/Dui71xp835kokRZb7ZHqFT4f3LfXkuIX6jF2Jac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LCywX3ahymiAe78Q6ffGezA0fdqEOnA/iZoCW7EzyLPTH3kqvCJM3H/Au2KObAyG3/f8J8c48H0gxLmMOjfBA0x1m5qvxr/lxQZ+9t45mD9jZ3hGJeHwDPMyxOhUBJ77lDKdXvMvqduKXEGvELG/kUdesZrmyTE8cUFQz0vMwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BU/9WojX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BU/9WojX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739631656; x=1771167656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CZn/Dui71xp835kokRZb7ZHqFT4f3LfXkuIX6jF2Jac=;
  b=BU/9WojXPvtzvyjjqtC53SGciDxlcXdgFMH/Gal4fb8FUc+9PtZ3tJqk
   YyKua9hUsI2zr4UE4P57RDOpD8qvjnTetO2HTo1BinmikHh+Or3l16055
   nOz6QTfYS7woSKF3iqQAlEwuc7P5wBXiWzvK5JaBP3FTUuVDkMNfpHVDy
   we14zZgszbCjx2H5OiWuwlcuS6HzHEhZpl8df4Icc4qBVY0fepYORvAM5
   y0MjoWN1aMuHnEgnORDBTEh4zRFJwNvLzsdplOBdL+4sMheoBTnDpYutf
   cxArQ01YWWvxW9SsFsAOmbQeAh2VJvB2Wj86ntQMFIaAMgVQgg29sOpou
   g==;
X-CSE-ConnectionGUID: tH/rCdX4QYS2t89J8Y47vg==
X-CSE-MsgGUID: 9V1FUXM1QKSlmYA5pqGUVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="27964032"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="27964032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 07:00:55 -0800
X-CSE-ConnectionGUID: jZdybZ0KQWeCPMDR8sqPPQ==
X-CSE-MsgGUID: Y9wlmZ7ATYW0YJ6RvqGpnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="113898825"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2025 07:00:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjJf1-001Aur-2U;
	Sat, 15 Feb 2025 15:00:51 +0000
Date: Sat, 15 Feb 2025 23:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 2/2]
 block/blk-sysfs.c:277:31: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202502152200.qCRzMG1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   182695db82766c74af984ea5529f14abc4ccb882
commit: 110234da18ab482f6f583d28eff26b9569bf5622 [2/2] block: enable passthrough command statistics
config: arm64-randconfig-r122-20250215 (https://download.01.org/0day-ci/archive/20250215/202502152200.qCRzMG1x-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250215/202502152200.qCRzMG1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502152200.qCRzMG1x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-sysfs.c:277:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long var @@     got restricted blk_flags_t @@
   block/blk-sysfs.c:277:31: sparse:     expected unsigned long var
   block/blk-sysfs.c:277:31: sparse:     got restricted blk_flags_t

vim +277 block/blk-sysfs.c

   274	
   275	static ssize_t queue_iostats_passthrough_show(struct gendisk *disk, char *page)
   276	{
 > 277		return queue_var_show(blk_queue_passthrough_stat(disk->queue), page);
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
