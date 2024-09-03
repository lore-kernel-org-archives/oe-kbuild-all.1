Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A51A3041
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725343846; cv=none; b=CsSGsOB3VPUCJ2xcdxIvr+j5+KtHsQF/O4YiLaR8beuj0e39H1OURTB+6F646AJf1pzYeQjBMMdGS/nivGj1IwfBjcePU03g9C8WEPGWR8PznAve4Nr2gDGtq3vN9lkR8IqoJ2otDT9X80vvUNPQ+oHHzE8mPeZp68+7hb/eLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725343846; c=relaxed/simple;
	bh=dwgwVXQlQjR6YAHGvIFnjFom6xCsOKtFwXPyoipoy3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGszYuJmHgT2veRlFlk8bnOPd9Cn7r0BQ/Y4I4kb6rFvn9DtkaNqfD08bZn8nNqNQVgHZbYfHKW5Vns1i2KObksjA5NIrep79YC1Cpz8S8hP8aojVZ1oPskHHYTwLUAXrwosu/aSTnwiCYMllR2DRTdlv9lE0biIc5YL2aagnqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtENt4jN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtENt4jN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725343846; x=1756879846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwgwVXQlQjR6YAHGvIFnjFom6xCsOKtFwXPyoipoy3Y=;
  b=TtENt4jNnHA4q6rQ35EpuzxHuNfGuS7DU3vcoyjdmGyMuhSVA7Nf3JZr
   tBTwa1ei3xEXbh2nvzMQUndrG4x1dKmL5/UTmrvNG7Egk3W+l/PTlSWcI
   hb2hgozyqMNd3i3kqqk7VgJIKFxfINl4NRrYf8giiDJY6e8RujrgOKU7N
   bCMs0evDFEByCia+iyBtOqAXoyYxCWSKgJX4tXLO8+i0VfIkIxDb9/R+0
   CTKTYhXJly/SDGhkJi5k9O6sQlZ3qNMWFqkuMvINAt+L9jYWiue+C+aQK
   rPTedcRu3SRa+N3Me1okVdTjvFfDv+ln6Mg9yd4C2BFbZ4Js437S/rRt5
   Q==;
X-CSE-ConnectionGUID: E89GX/csQMiuHJxa0PxxkQ==
X-CSE-MsgGUID: kBRZObYwTHazjY/yfNzkkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41393351"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="41393351"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 23:10:45 -0700
X-CSE-ConnectionGUID: wWEoSZubSUajoNxHJRgj2g==
X-CSE-MsgGUID: uK06MaJ4SC2rBvfP2yzAUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="95515306"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Sep 2024 23:10:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slMkT-0006I6-0W;
	Tue, 03 Sep 2024 06:10:41 +0000
Date: Tue, 3 Sep 2024 14:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Maslanka <mmaslanka@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-doc@vger.kernel.org
Subject: [daniel-lezcano:timers/drivers/next 4/9]
 drivers/platform/x86/intel/pmc/core.c:1213: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202409031410.a9beukFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drivers/next
head:   8f8b0349aa312eb7e67e623ed1f296a04126fe7f
commit: 2d167560d43c809c66e6389b6cc651b77fcbf951 [4/9] platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031410.a9beukFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/pmc/core.c:1213: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enable or disable ACPI PM Timer


vim +1213 drivers/platform/x86/intel/pmc/core.c

  1211	
  1212	/**
> 1213	 * Enable or disable ACPI PM Timer
  1214	 *
  1215	 * This function is intended to be a callback for ACPI PM suspend/resume event.
  1216	 * The ACPI PM Timer is enabled on resume only if it was enabled during suspend.
  1217	 */
  1218	static void pmc_core_acpi_pm_timer_suspend_resume(void *data, bool suspend)
  1219	{
  1220		struct pmc_dev *pmcdev = data;
  1221		struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
  1222		const struct pmc_reg_map *map = pmc->map;
  1223		bool enabled;
  1224		u32 reg;
  1225	
  1226		if (!map->acpi_pm_tmr_ctl_offset)
  1227			return;
  1228	
  1229		guard(mutex)(&pmcdev->lock);
  1230	
  1231		if (!suspend && !pmcdev->enable_acpi_pm_timer_on_resume)
  1232			return;
  1233	
  1234		reg = pmc_core_reg_read(pmc, map->acpi_pm_tmr_ctl_offset);
  1235		enabled = !(reg & map->acpi_pm_tmr_disable_bit);
  1236		if (suspend)
  1237			reg |= map->acpi_pm_tmr_disable_bit;
  1238		else
  1239			reg &= ~map->acpi_pm_tmr_disable_bit;
  1240		pmc_core_reg_write(pmc, map->acpi_pm_tmr_ctl_offset, reg);
  1241	
  1242		pmcdev->enable_acpi_pm_timer_on_resume = suspend && enabled;
  1243	}
  1244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
