Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B83A27442
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796290; cv=none; b=KxhVnsv2FLmu7E7yTTAWOeJ/rBImxLHuNIFXLDKiwTWlTZob4xcQvFRe4rk79b2dewwmHvpZdNxQzA64DSyEYf4kr5jzsRchduThMnAPqtUf/sx1DnrqjY9wkG0I3zdD4e02s5FM1VjD4r8VwUppFHKX0FdPtnvwXxWPyElMObE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796290; c=relaxed/simple;
	bh=pqrhdO73zk2pWvxDLUEKDIwm399psLv33ADZjcj2Px4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dW7BDSbJ/JnwHI9G7apG97U2buY6bX62osoqKtuB2uO7Guk87ZQ/tGbqYn8pjUtdNSNfjGjdnwrvQgHEJyyHDQfMTQxuZ+RXUhEM3+rG6NXTiMcrAM+VYwVCmMsb3kg7d/+F1M8lHwqDMksw5TmExQA6FgItS8/nviCLmmrcalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNUGg+Nk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNUGg+Nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786796288; x=1818332288;
  h=date:from:to:cc:subject:message-id;
  bh=pqrhdO73zk2pWvxDLUEKDIwm399psLv33ADZjcj2Px4=;
  b=BNUGg+Nkp4YU5qkc0VTBEofAUEN+GyisHULMgdDavU+f1NS8EZdMsMq8
   o/uORQcgWPmkLSoslf8yfN7SbnluzYfyWheGpJH0gi2zf5pvYZVBIbDLI
   z7mFQ/M90Q2+1Q+6gjKZh495JmeLv0DaNwxtKNkDEGKiiBXqgO77hp1wP
   s7jdAK9Z67423SfNqPfdBQDbUUTffHxpxzNgbQueNBgLafll/wa+GrIZk
   RR+DbcAW/Md9PjAlSCloDJpq1F5uAp2wmREoSNWm4vwSb9DX8iLrTKZFf
   OqrQuRcse5ThUyXe4kAnAMvVHD2bvAFQ5KtYWzKsExYhxdqp1bSwq3Q9e
   Q==;
X-CSE-ConnectionGUID: qufFe/AdSFm9R+5to3L8aA==
X-CSE-MsgGUID: 64RRzqdFS1mDwjyxIHispA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87478220"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87478220"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 05:18:07 -0700
X-CSE-ConnectionGUID: qhYdpBihQ2u4NLpRU9G9HA==
X-CSE-MsgGUID: 5CdvY61zQTah4PEzWGRkZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="268723820"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Aug 2026 05:18:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvDKt-00000000bzd-2ZjN;
	Sat, 15 Aug 2026 12:18:03 +0000
Date: Sat, 15 Aug 2026 20:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [drm-xe:drm-xe-next 8/9]
 drivers/gpu/drm/xe/xe_debugfs.c:46:1: sparse: sparse: symbol
 'wedge_cold_reset' was not declared. Should it be static?
Message-ID: <202608151936.YwZijiM8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   9736ca77f060472d196c118c5f14943b4606f6d3
commit: f29c2bd7eaeb73afcdbd4e3bbf54d6f8799a9b06 [8/9] drm/xe/ras: Use fault-inject to trigger cold-reset wedge
config: i386-randconfig-061-20260815 (https://download.01.org/0day-ci/archive/20260815/202608151936.YwZijiM8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151936.YwZijiM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151936.YwZijiM8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_debugfs.c:46:1: sparse: sparse: symbol 'wedge_cold_reset' was not declared. Should it be static?

vim +/wedge_cold_reset +46 drivers/gpu/drm/xe/xe_debugfs.c

    43	
  > 44	DECLARE_FAULT_ATTR(gt_reset_failure);
    45	DECLARE_FAULT_ATTR(inject_csc_hw_error);
  > 46	DECLARE_FAULT_ATTR(wedge_cold_reset);
    47	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
