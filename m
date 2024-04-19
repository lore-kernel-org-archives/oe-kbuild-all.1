Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F007B7641E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 23:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713568937; cv=none; b=GbqfEfuAkpAnGKvdoGqB7Jo/YtDt+O/PZOWBxTGMb0O7rY/D8WMgJzKpv98AKh8A+UifV+iIexJ1pFBv1b7Sgt+JRPIKOeMNajuhVjcjE7VzlI48s0NpQywiNKebWm+qC18rLzjPnEjmSJkDVpzP+c/LR9EUDJHYYlRpNx/wSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713568937; c=relaxed/simple;
	bh=gMEJADjNL6qtIhc/NQBuPhUE+eQbgUqkDCQb3dGaxKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0K6AEuz3D662kV6KsGAQZ77bDkGJ0aQ/0Ehvobnl/vxu2Lg/I/D6+TZAsyR/Q4tmV4qalOFhgy8YJOIS1elte4O4us4bK6tUfTAatfKu+xuaZjv+hA89qHbo80NkRRH5xMKb9utbGZqGDJFwFtcDLrAYw4woL0tnCgTbC7glFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qi7zTVSS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qi7zTVSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713568936; x=1745104936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gMEJADjNL6qtIhc/NQBuPhUE+eQbgUqkDCQb3dGaxKk=;
  b=Qi7zTVSS8As33lnMGy7q1UsPxrzrfi3QEzcUmo2ES3krwtkFsqmisMKi
   3laAxD7lswhMyj+EHk+6cA0ozhWXLySDLhs5MmgJhk0be7ThvpI4rJXl4
   zpH8VszK4U0mRbpE9PBB5fkT+Jw5yv4FGs0PdnzZOrmWq+3xrxuAkPSJb
   0pBarVmykchs+P6UKjiCd4dnC1rBGD2jD03/NOpNlpUfP79oKbazdQB4D
   EySYfMw9ucHqQeDVp6wHyyfAms65Kr9k5bkh4ci8xuLiwHnYrmnDg2M5V
   CMgBk8On8BrUScaVb6+g83JW8mioSCyymyD/wvxtRWj2bO6NTMogQ3DcO
   g==;
X-CSE-ConnectionGUID: UG7x0zQTRYK+ShKlNrMPAQ==
X-CSE-MsgGUID: linkk4tkQkO0T7mkqLrezA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9048452"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9048452"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 16:22:15 -0700
X-CSE-ConnectionGUID: 1lBVTkHrTXemfsHJ0RwKlA==
X-CSE-MsgGUID: xAWd74efQQaIRCdN/oTyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="23537835"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Apr 2024 16:22:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxxYZ-000AY4-0j;
	Fri, 19 Apr 2024 23:22:11 +0000
Date: Sat, 20 Apr 2024 07:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [linux-next:master 7019/7122]
 drivers/gpu/drm/panel/panel-lg-sw43408.c:185:28: sparse: sparse: symbol
 'sw43408_backlight_ops' was not declared. Should it be static?
Message-ID: <202404200739.hbWZvOhR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
commit: 069a6c0e94f99437652dbb7229a56233c7d39968 [7019/7122] drm: panel: Add LG sw43408 panel driver
config: arm64-randconfig-r123-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200739.hbWZvOhR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240420/202404200739.hbWZvOhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200739.hbWZvOhR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-lg-sw43408.c:185:28: sparse: sparse: symbol 'sw43408_backlight_ops' was not declared. Should it be static?

vim +/sw43408_backlight_ops +185 drivers/gpu/drm/panel/panel-lg-sw43408.c

   184	
 > 185	const struct backlight_ops sw43408_backlight_ops = {
   186		.update_status = sw43408_backlight_update_status,
   187	};
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
