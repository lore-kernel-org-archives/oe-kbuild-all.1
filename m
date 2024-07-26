Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51222184F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721957496; cv=none; b=TynDFu9gJaWyv3oFVwYj63WjEn7Be9EWTUnaSlbtGJza+MZQm4PLEjPKkA2yDLmxKCny7LrEdGY6hJ+MKVd+telof76JcdSuONB0i4Ve1AMTdS0DNnyOp/hnKaAXGTA4UspHchxoyhWUgqp/TvbW2A7QeQmpdffsWCIOpBKLJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721957496; c=relaxed/simple;
	bh=cKzf8LQ3V3LfYKs2vlrGK/H2VtOIVZt9ELqY9eZyUCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tp8vkLmbMqPw8YpbYWxUoRF6jpXRExRwZBlITeCVKkTntTPf6VwS7i4N8qIeQQuUzWmw8X9sR+SJmJXdAPkDWtp4j+5DkHcM9iJSBbTsgJYrGi5PbeuDoWeaKw1CBeTtvUTK8kcws2+i/hVRRqXmXdmfpamtsGzIPmpiIJ5itCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgdBQDDg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgdBQDDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721957494; x=1753493494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKzf8LQ3V3LfYKs2vlrGK/H2VtOIVZt9ELqY9eZyUCQ=;
  b=ZgdBQDDgRNfaB6T+p7bDp0zKYZEFvBVab/743nVhfbpuSsTNCnOESQWP
   yv0TQnnZKUU1ykkGB1eYI1F/G5rEFPC8H6EKlGFd72hGqf1jbGMaeBG1e
   gWY3ofX1mZ8yZSaUfb6O9eqPUu67lTka7GOaIrcYuxuXNZPRduIfk532K
   IYaKbxhrKfereXXmAoUorzLdiEXTT17ufuCUTKONdlHBjDpc4VxiTrq5l
   oAzh7voZURQenIUFrdfzqaEuDUIv77xgisLLktxWn1+OccPwIa9qvGnLi
   rD+n/edUK2OdxyfSCYFORIRIjTZ9V/YBzdWujj50AKWyxEn8E47U9bbuU
   A==;
X-CSE-ConnectionGUID: lqyt6v0ESNyGWGtnHA5+SA==
X-CSE-MsgGUID: vbVFguGZT/my+wPYXTMLaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23491363"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="23491363"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 18:31:34 -0700
X-CSE-ConnectionGUID: FXY91RaZS3KHYdSmmgthiw==
X-CSE-MsgGUID: 8jDzFoj+RpqZ+Hz20mCHyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="52785173"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jul 2024 18:31:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX9nu-000ojI-33;
	Fri, 26 Jul 2024 01:31:30 +0000
Date: Fri, 26 Jul 2024 09:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:rust/panthor-6.10 9/10]
 drivers/gpu/drm/panthor/panthor_drv.c:778:5: sparse: sparse: symbol
 'panthor_ioctl_dev_query' was not declared. Should it be static?
Message-ID: <202407260953.uLZGWAlf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git rust/panthor-6.10
head:   8d146622f07c7965de15d20b04e0d92bcaa50d87
commit: 1bd8126e54589ff493836d6dc93b829ba99211f4 [9/10] drm/panthor: Add rust driver stub
config: alpha-randconfig-r121-20240726 (https://download.01.org/0day-ci/archive/20240726/202407260953.uLZGWAlf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240726/202407260953.uLZGWAlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260953.uLZGWAlf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/panthor/panthor_drv.c:1272:1: sparse: sparse: symbol '_panthor_open' was not declared. Should it be static?
   drivers/gpu/drm/panthor/panthor_drv.c: note: in included file:
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/panthor_ioctl_dev_query +778 drivers/gpu/drm/panthor/panthor_drv.c

   777	
 > 778	int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
   779	{
   780		struct panthor_file *pfile = file->driver_priv;
   781	
   782		return _panthor_ioctl_dev_query(pfile->ptdev, data);
   783	}
   784	
   785	#define PANTHOR_VM_CREATE_FLAGS			0
   786	
   787	int _panthor_ioctl_vm_create(struct panthor_device *ptdev, struct drm_panthor_vm_create *args,
   788				    const struct drm_file *file)
   789	{
   790		struct panthor_file *pfile = file->driver_priv;
   791		int cookie, ret;
   792	
   793		if (!drm_dev_enter(ptdev->base, &cookie))
   794			return -ENODEV;
   795	
   796		ret = panthor_vm_pool_create_vm(ptdev, pfile->vms,  args);
   797		if (ret >= 0) {
   798			args->id = ret;
   799			ret = 0;
   800		}
   801	
   802		drm_dev_exit(cookie);
   803		return ret;
   804	}
   805	
 > 806	int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
   807				    struct drm_file *file)
   808	{
   809		struct panthor_file *pfile = file->driver_priv;
   810	
   811		return _panthor_ioctl_vm_create(pfile->ptdev, data, file);
   812	}
   813	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
