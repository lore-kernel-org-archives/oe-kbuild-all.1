Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFB212E75
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727510647; cv=none; b=Mr8HP1tzsnuROjzoinl70cRCAgaFqct6/pdajYgSGuxji+4xz1ycCaCy4DlNKr6FhhqscGuzg2UfRjGotr5nXlntY39e3Ax4GEX1GEGlg1D5W6kN3IhlE4pV2tFXbmg2VbPngnFjpXkZ6vKkMQ3tXoC/c/0HVBZD96iz6kfSRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727510647; c=relaxed/simple;
	bh=AOL1SauI0xFa9iuo1Z+8BKG3hTb8IsZbSGWD8adZdJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHfWBed/ow6W4ydA3govxv6E5QJJrq6f6LexnkJeO8QVrprf+r4TYlqqvFV/vFwErXqfK8yZCsBc2U7TSz+/DHKGboj6CcIyxahGOqqMtxqHYA/BIZObz8z8HPcxXYBg1UMaOx+XhurkpkFW9C+OKBafGxhRT5IWnks8urSDrt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgxJ9fSJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgxJ9fSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727510645; x=1759046645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOL1SauI0xFa9iuo1Z+8BKG3hTb8IsZbSGWD8adZdJM=;
  b=QgxJ9fSJ1p8bpxLfJjDUingyktXB9BsNdGLNPNdhZPSWD5sqF1RUFKUO
   QQUy9qXG6tAH8GwKx0vNek36nUsJbjZhhG+sJsiaGQ0Olub2KH6oB/g3Q
   92ZKtxcCkzVGUt8Ymc31CGJGhDNPyjIvZ7GpFstVNj5Q6eCr8AlFQhr9F
   4ztpgy+mMHsJh5znI5OSjXj2yAZxLT6yAvtGH5oM9Vo6C8lxgtWSa2MWi
   Fxz20uzNsZU1rGX46BDH6UMhAOlLYskrVdWh05s2Nl76Lzy5v9qV8drly
   jA2lfz9j8tnp95xLEsmF7GpxgaTUdGwlErfbqQVpED4kx/fgDmbJgLkt8
   g==;
X-CSE-ConnectionGUID: i6yHQ3aAS1eEDSko+pxO0w==
X-CSE-MsgGUID: 5RmSfx2ZQsCFaRltbi+NMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="14278284"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="14278284"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:04:05 -0700
X-CSE-ConnectionGUID: nYpQrZhIQYexOYPF9Wquow==
X-CSE-MsgGUID: 0CYzqD3YRlqDQoLKAJOcfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72638516"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 01:04:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suSQr-000N1N-1K;
	Sat, 28 Sep 2024 08:04:01 +0000
Date: Sat, 28 Sep 2024 16:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4176/16788]
 drivers/gpu/drm/imx/dw_hdmi-imx.c:326:6: warning: no previous prototype for
 'imx8mp_hdmi_enable_audio'
Message-ID: <202409281511.vWI6B0Zk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: a8465fc1e0fad08c5bae2388712b530fc8050f2e [4176/16788] drm: imx: hdmi: Add iMX8MP hdmi base on dw_hdmi bridge community driver
config: arc-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281511.vWI6B0Zk-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281511.vWI6B0Zk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281511.vWI6B0Zk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/dw_hdmi-imx.c:326:6: warning: no previous prototype for 'imx8mp_hdmi_enable_audio' [-Wmissing-prototypes]
     326 | void imx8mp_hdmi_enable_audio(struct dw_hdmi *dw_hdmi, int channel,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/dw_hdmi-imx.c:332:6: warning: no previous prototype for 'imx8mp_hdmi_disable_audio' [-Wmissing-prototypes]
     332 | void imx8mp_hdmi_disable_audio(struct dw_hdmi *dw_hdmi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx8mp_hdmi_enable_audio +326 drivers/gpu/drm/imx/dw_hdmi-imx.c

   325	
 > 326	void imx8mp_hdmi_enable_audio(struct dw_hdmi *dw_hdmi, int channel,
   327				      int width, int rate, int non_pcm)
   328	{
   329		imx8mp_hdmi_pai_enable(channel, width, rate, non_pcm);
   330	}
   331	
 > 332	void imx8mp_hdmi_disable_audio(struct dw_hdmi *dw_hdmi)
   333	{
   334		imx8mp_hdmi_pai_disable();
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
