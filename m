Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1628418FDD2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 22:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746743216; cv=none; b=q9kLlgIYFx4ryLW147x7Hc5kREEUCHZbNv4bWxgPtHiYqqIPzm3Xe6h6V5UnjvlGrDPm0hQIn9c0IlTvO8qb6tPR7WtI1uyPIr7CMFhnryZiWCBH6FDwSOTXdF/ShK01CkcYauVFmOCP1AyO0j8kvKfK6P+IBnRBit075CwB+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746743216; c=relaxed/simple;
	bh=5AkVfuhE98fYumpw7hwb9XjDcCpiJcYUBA69Ab+syAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ta4KcACEBHHEbjrC5HrzLrw8GdxAgdEFfK6dx2w+Y1YLqPIBtEfg3dbdqInf8xKyA6L5bxHMrkb22OwDjXUJWJe6r+ufoOCawGODzzGGAfMMo/r6DyE/deJkScsC/idLcLbpdrcizwgFlwRKZhtiingxlNCKAADFnxJxJLDivNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mANhI8cY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mANhI8cY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746743215; x=1778279215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5AkVfuhE98fYumpw7hwb9XjDcCpiJcYUBA69Ab+syAs=;
  b=mANhI8cYhOgCw0Vkxpom6iMOdu1PIHang5TZ+q4UdFZx+eMa4sPwv6uQ
   LWd65ZVmFbOgB8ePYpkVjdOjqQcvvtdmi4dV6UMgbsj7ayIs1AZ7eduna
   5sMR/7sAgw0kTc+oiUnKYswLQ7gkBHam1+0nBbfhtsFINhxmrXhEgXpR5
   TRMeX1UvCGmHQYmHqvHefO/g5F+Gm3tCEgylFar2iWZVDY4H4630liYzD
   Zz55xeZZMHbDlbLtbN5IELfUIb7eMcEgn+AwNF8BSf4E5PLfDmE1zC3tL
   SKZ+vlDZT5mqeAnlv88ztn+1Kze7UXW0MVRnT4J8HLV3vt2eCeKme8bUd
   w==;
X-CSE-ConnectionGUID: rwRJJEUBSh6SsO78c5unUA==
X-CSE-MsgGUID: B9EYgjSFQSyOfHgEEGID9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59896758"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59896758"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:26:54 -0700
X-CSE-ConnectionGUID: tWulkgrLQ+GFCvM1Xkkzeg==
X-CSE-MsgGUID: rrDEbynNSnqHrDQeGQ0ryw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="167367855"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2025 15:26:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9hb-000BQl-06;
	Thu, 08 May 2025 22:26:51 +0000
Date: Fri, 9 May 2025 06:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1]
 drivers/gpu/drm/../../accel/drm_accel.c:66:29: error: invalid use of
 undefined type 'struct drm_master'
Message-ID: <202505090646.5ob5VmaO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 43a99aec6db468c17dbaf10f804fa54275bd3047 [0/1] accel: add dedicated minor for accelerator devices
config: x86_64-buildonly-randconfig-006-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090646.5ob5VmaO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090646.5ob5VmaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090646.5ob5VmaO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/../../accel/drm_accel.c: In function 'accel_name_info':
>> drivers/gpu/drm/../../accel/drm_accel.c:66:29: error: invalid use of undefined type 'struct drm_master'
      66 |         if (master && master->unique)
         |                             ^~
   drivers/gpu/drm/../../accel/drm_accel.c:67:51: error: invalid use of undefined type 'struct drm_master'
      67 |                 seq_printf(m, " master=%s", master->unique);
         |                                                   ^~


vim +66 drivers/gpu/drm/../../accel/drm_accel.c

    53	
    54	static int accel_name_info(struct seq_file *m, void *data)
    55	{
    56		struct drm_info_node *node = (struct drm_info_node *) m->private;
    57		struct drm_minor *minor = node->minor;
    58		struct drm_device *dev = minor->dev;
    59		struct drm_master *master;
    60	
    61		mutex_lock(&dev->master_mutex);
    62		master = dev->master;
    63		seq_printf(m, "%s", dev->driver->name);
    64		if (dev->dev)
    65			seq_printf(m, " dev=%s", dev_name(dev->dev));
  > 66		if (master && master->unique)
    67			seq_printf(m, " master=%s", master->unique);
    68		if (dev->unique)
    69			seq_printf(m, " unique=%s", dev->unique);
    70		seq_puts(m, "\n");
    71		mutex_unlock(&dev->master_mutex);
    72	
    73		return 0;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
