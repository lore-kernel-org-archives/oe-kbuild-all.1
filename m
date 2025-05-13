Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7602BE106
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155583; cv=none; b=rs8op5/HJiCanhiNBdDFIjiplrLt6JA1H2IvJhgIHy33cIQPTCDuQy4SU+36j82sgXy/Sk7g2MP6mTjQ88KbLm5oZOq/JYNmhKn6FxycmCq+N1Wb8DpPyqoXkU9Rqr9uOuURoKHRox0nnDALo4EFh+E4UGLxnLnQU6DnxHwqgDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155583; c=relaxed/simple;
	bh=MSCkUA6vnRhy8Sae4hmW1h3EhXHjttD7BUxZq5ZLzwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KrGsBsEz4/o0ZIuriAUVff8eu6sjvSB+5iYIOejclqDOvvCxVahV/qg4uuRQd8x+28BcJy6h86GbWSQrNiigfyQzd9+7MsCJPi2tl87yrSgpAPyApcrjGw4BJPa1sy7GTeyp9akRJ2lIInKlzikzD2BKi4Ee4vG+WLyF74cRcMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQyyt+Q8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQyyt+Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747155581; x=1778691581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSCkUA6vnRhy8Sae4hmW1h3EhXHjttD7BUxZq5ZLzwg=;
  b=FQyyt+Q82cpICJOBtdnGsasFVnYAqSFUeS/T0pkWjhkbYDWv3h2BKIS+
   RgCNnNOUBmpKqwVNfpgkvCtldX5ALfVbJCVWBdyYPenqeYGcRaeq0uNeg
   ohmsIIYJCc1aSlVzOf53Gb6RSy40D9KbIBhTK0mIav+D3QeANyRhVpaKL
   pNBVQZ9C6P2P5+WlzxtBA/Dx7RbVad3zsAPRgSfqUidlJ3d+STGubUDBq
   iCr/c/rgGxfzZngortCRW1yoNNvrxbQn66OwZPySfGq+Y0jmH3xkyX2Ol
   /ZLlTBFgnmPxoqxpyBNf9o7fnpqfzsXcYm1zZrQDNJ+GSivbRg+ct/1eL
   w==;
X-CSE-ConnectionGUID: JGR636vzTbC3FQiSXddYhQ==
X-CSE-MsgGUID: UJuRTtAjSaavLR8xqOycAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49091038"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="49091038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 09:59:41 -0700
X-CSE-ConnectionGUID: 3WlXync2Q/ylJUyQ6nxDPg==
X-CSE-MsgGUID: DgTx8mmYQsWAmyAgE7R6ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="138690659"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 09:59:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEsye-000GFV-2g;
	Tue, 13 May 2025 16:59:36 +0000
Date: Wed, 14 May 2025 00:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [rafael-pm:bleeding-edge 131/143]
 drivers/base/power/wakeup.c:376:undefined reference to
 `pm_sleep_transition_in_progress'
Message-ID: <202505140033.hlHonEIr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   e6b70b05628d6ec7335b0fcfe50e60e273fba2d2
commit: d1b37a4c5081dbad554b8e792b7a7937b635db58 [131/143] PM: sleep: Introduce pm_sleep_transition_in_progress()
config: riscv-randconfig-002-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140033.hlHonEIr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140033.hlHonEIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140033.hlHonEIr-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/base/power/wakeup.o: in function `device_wakeup_attach_irq':
>> drivers/base/power/wakeup.c:376:(.text+0x15c6): undefined reference to `pm_sleep_transition_in_progress'


vim +376 drivers/base/power/wakeup.c

074037ec79bea7 Rafael J. Wysocki 2010-09-22  354  
4990d4fe327b9d Tony Lindgren     2015-05-18  355  /**
4990d4fe327b9d Tony Lindgren     2015-05-18  356   * device_wakeup_attach_irq - Attach a wakeirq to a wakeup source
4990d4fe327b9d Tony Lindgren     2015-05-18  357   * @dev: Device to handle
4990d4fe327b9d Tony Lindgren     2015-05-18  358   * @wakeirq: Device specific wakeirq entry
4990d4fe327b9d Tony Lindgren     2015-05-18  359   *
4990d4fe327b9d Tony Lindgren     2015-05-18  360   * Attach a device wakeirq to the wakeup source so the device
4990d4fe327b9d Tony Lindgren     2015-05-18  361   * wake IRQ can be configured automatically for suspend and
4990d4fe327b9d Tony Lindgren     2015-05-18  362   * resume.
6d3dab7d84177f Rafael J. Wysocki 2015-07-07  363   *
6d3dab7d84177f Rafael J. Wysocki 2015-07-07  364   * Call under the device's power.lock lock.
4990d4fe327b9d Tony Lindgren     2015-05-18  365   */
7bf4e594c28afc Rafael J. Wysocki 2018-01-05  366  void device_wakeup_attach_irq(struct device *dev,
4990d4fe327b9d Tony Lindgren     2015-05-18  367  			     struct wake_irq *wakeirq)
4990d4fe327b9d Tony Lindgren     2015-05-18  368  {
4990d4fe327b9d Tony Lindgren     2015-05-18  369  	struct wakeup_source *ws;
4990d4fe327b9d Tony Lindgren     2015-05-18  370  
4990d4fe327b9d Tony Lindgren     2015-05-18  371  	ws = dev->power.wakeup;
7bf4e594c28afc Rafael J. Wysocki 2018-01-05  372  	if (!ws)
7bf4e594c28afc Rafael J. Wysocki 2018-01-05  373  		return;
4990d4fe327b9d Tony Lindgren     2015-05-18  374  
6d3dab7d84177f Rafael J. Wysocki 2015-07-07  375  	if (ws->wakeirq)
7bf4e594c28afc Rafael J. Wysocki 2018-01-05 @376  		dev_err(dev, "Leftover wakeup IRQ found, overriding\n");
4990d4fe327b9d Tony Lindgren     2015-05-18  377  
4990d4fe327b9d Tony Lindgren     2015-05-18  378  	ws->wakeirq = wakeirq;
4990d4fe327b9d Tony Lindgren     2015-05-18  379  }
4990d4fe327b9d Tony Lindgren     2015-05-18  380  

:::::: The code at line 376 was first introduced by commit
:::::: 7bf4e594c28afc67bc120a380ca774e43ca496d8 PM / wakeup: Do not fail dev_pm_attach_wake_irq() unnecessarily

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
