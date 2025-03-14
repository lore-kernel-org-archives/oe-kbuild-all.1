Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA313D8B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741933727; cv=none; b=JoSM7yI8Kkh0+iqwb44e3HmSnKmyfFrV7KX/YP+Wu8UvrD/kJScHn0QzuDEnlPm61Pf+ub+fanoqycT9wSa2S9YiFafqE4yQgbhMO2D2QZ9WHpy7yidfTZCBWZAJNQgKbkJKJ4/x+KpqN4osZ+Z+A99ZtQG6AqIawGiJOTUZqCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741933727; c=relaxed/simple;
	bh=ihmAxb9cxEISDTFbzn1b94GQP3LKBjJp4eKTDhG1sbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rO2LMSakHTPR/wFZc9BP2NQyMzt0ovHj1XjWd58j/jkEbY+/pkZZyuMVoYWreSqQIng/VC8YR13Hems3KHo5MIW3DqsHV/s7WZqMHH/YBBf+zhMygdU5f0Fn9pu/Qh606ulukyBcgn/aBeJhf83UCkcAotnf5xekyQz6D48orBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI87ALwZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI87ALwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741933727; x=1773469727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ihmAxb9cxEISDTFbzn1b94GQP3LKBjJp4eKTDhG1sbY=;
  b=nI87ALwZt4NDd0wS6k6rEvQjcZFMpohK/YXmgk0EN5VgyMAx90sHtkZ9
   J4s+AHiTd5JhW3aNYVtkhvttlp9umxZZPsew9+Hoc0NuSK9AKLa3UvRx3
   RonudFCf7dAz+mKzUoWZkjqnJuNLdJH5ns4dh3qQQ8NvEb68zqwrnJBmQ
   LJ4Ma/Pw8xCSH7XsD6qHH2tY4w9dBtQGLHpmxdXDbZBCZI+w5B6hHQ33B
   JYFyKInhxZelvTodjiPiuntnylLcY50MRgjJSRGjqwiYUuDgdl5hYspE2
   rv0rYVpyUVGKtNpP/FtSgLVU4nacXoNMnLsVKqWH0wZakfDJvO1hWeAe0
   Q==;
X-CSE-ConnectionGUID: Z8JGYLCATPaUE61HJzNdFQ==
X-CSE-MsgGUID: adCA923DSrKNP9/vGucF8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43107078"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43107078"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 23:28:45 -0700
X-CSE-ConnectionGUID: u+W3GCh2TzOiVYdV1wuN7Q==
X-CSE-MsgGUID: 385Pws7ITGCSuqs/NxYDDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="125799830"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Mar 2025 23:28:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsyXB-000AAS-1h;
	Fri, 14 Mar 2025 06:28:41 +0000
Date: Fri, 14 Mar 2025 14:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-6.15 77/105]
 sound/soc/amd/acp/acp-legacy-common.c:24:29: sparse: sparse: symbol
 'acp_common_hw_ops' was not declared. Should it be static?
Message-ID: <202503141442.iT0LHEMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-6.15
head:   d9a06936ee9e64952e161849059f6cf096b33e4a
commit: 8ae746fe51041484e52eba99bed15a444c7d4372 [77/105] ASoC: amd: acp: Implement acp_common_hw_ops support for acp platforms
config: x86_64-randconfig-121-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141442.iT0LHEMx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141442.iT0LHEMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141442.iT0LHEMx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/amd/acp/acp-legacy-common.c:24:29: sparse: sparse: symbol 'acp_common_hw_ops' was not declared. Should it be static?

vim +/acp_common_hw_ops +24 sound/soc/amd/acp/acp-legacy-common.c

    23	
  > 24	const struct snd_acp_hw_ops acp_common_hw_ops = {
    25		/* ACP hardware initilizations */
    26		.acp_init = acp_init,
    27		.acp_deinit = acp_deinit,
    28	};
    29	EXPORT_SYMBOL_NS_GPL(acp_common_hw_ops, "SND_SOC_ACP_COMMON");
    30	void acp_enable_interrupts(struct acp_dev_data *adata)
    31	{
    32		struct acp_resource *rsrc = adata->rsrc;
    33		u32 ext_intr_ctrl;
    34	
    35		writel(0x01, ACP_EXTERNAL_INTR_ENB(adata));
    36		ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
    37		ext_intr_ctrl |= ACP_ERROR_MASK;
    38		writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
    39	}
    40	EXPORT_SYMBOL_NS_GPL(acp_enable_interrupts, "SND_SOC_ACP_COMMON");
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
