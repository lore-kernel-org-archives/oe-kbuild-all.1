Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827A2BD013
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990977; cv=none; b=g+reIIXABkoqlIen+sfO2oHZX0bPMT3mAJ1njWA4S3+Hd07mvpabfaabFOq/k/FP1q9LbyPXHWyq1k1hgO06htimw3Ck1qzSk2y0TC0OOHsj6pRHVFBX5NbqP3GVH/xdjsIezWYW2ycRdxVzsOkw1sJK2T/BYR77nyXWnftjpbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990977; c=relaxed/simple;
	bh=CfutuVK1wzmbDwh21rNys0bmr6xMd9exGWoLnWBdWbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDaLY9AOilBE0ralT5qsexMRqdw5c5N8N05LtKiE4QNUAKD88ZE6JiC/RQf1wIaMgS5+PyIf8gr5r04CBzkzBHWpDPagvDhQ66uAz1G2oC8UeXWv+xJYNLlvsJY6uhQy/iRL3ZXaPMjxY15jwE391FG2CK1GyAWPk/Nb3Dno9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7H2mzRs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7H2mzRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761990976; x=1793526976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CfutuVK1wzmbDwh21rNys0bmr6xMd9exGWoLnWBdWbI=;
  b=A7H2mzRsOfIbk+dJRezID5URd8B2bvMek4h+UpY6uwUbu/MsrVMULbml
   +AIkPsla/QIIeMAN4LPPyc7vTbtZ4dm7QXhY0gIPEqlwIV0sYJA2bMeAs
   Jxmcbe+Dz64O4dk7BWAp789Gm7vsl/ASC79sO0g3RiNSHj5mYsCr93fF3
   eXkpH5fN+Wzlmw1U+dfcUhl5Lnvle2nk6w7cxhSHtnejizcOAPkOTVE1H
   64KnsyNoA9N6EBeYcyNdMhDMr3fzFiZjp8mODir9YlxQG8kKWeey0dj6f
   +jqXAG+Qyuo2gA8JgFo1/+IZOTqaeyMK41SDXpLtHq6uYCO2P03s3QfAv
   w==;
X-CSE-ConnectionGUID: U0puWeu4Tf+EnppTVaSJxg==
X-CSE-MsgGUID: Tq66NhaiQPe7wYYiv/sqIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64029227"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="64029227"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 02:56:15 -0700
X-CSE-ConnectionGUID: 9yStbpcqTLSd4YvyV8ykGg==
X-CSE-MsgGUID: UF1ChgspSZORzdocnrv4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="209992855"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2025 02:56:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF8LC-000O6A-2R;
	Sat, 01 Nov 2025 09:56:10 +0000
Date: Sat, 1 Nov 2025 17:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matt Coster <matt.coster@imgtec.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/gpu/drm/imagination/pvr_power.c:341:undefined reference to
 `pwrseq_power_off'
Message-ID: <202511011739.SONHjSfR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba36dd5ee6fd4643ebbf6ee6eefcecf0b07e35c7
commit: e38e8391f30b41c5a24bb46dc6ef4161921e782d drm/imagination: Use pwrseq for TH1520 GPU power management
date:   9 weeks ago
config: arm64-randconfig-r121-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011739.SONHjSfR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011739.SONHjSfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011739.SONHjSfR-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_off_sequence_pwrseq':
>> drivers/gpu/drm/imagination/pvr_power.c:341:(.text+0x150): undefined reference to `pwrseq_power_off'
   aarch64-linux-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_on_sequence_pwrseq':
>> drivers/gpu/drm/imagination/pvr_power.c:336:(.text+0x188): undefined reference to `pwrseq_power_on'
   aarch64-linux-ld: drivers/gpu/drm/imagination/pvr_power.o: in function `pvr_power_init_pwrseq':
>> drivers/gpu/drm/imagination/pvr_power.c:320:(.text+0x1cc): undefined reference to `devm_pwrseq_get'


vim +341 drivers/gpu/drm/imagination/pvr_power.c

   315	
   316	static int pvr_power_init_pwrseq(struct pvr_device *pvr_dev)
   317	{
   318		struct device *dev = from_pvr_device(pvr_dev)->dev;
   319	
 > 320		pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
   321		if (IS_ERR(pvr_dev->pwrseq)) {
   322			/*
   323			 * This platform requires a sequencer. If we can't get it, we
   324			 * must return the error (including -EPROBE_DEFER to wait for
   325			 * the provider to appear)
   326			 */
   327			return dev_err_probe(dev, PTR_ERR(pvr_dev->pwrseq),
   328					     "Failed to get required power sequencer\n");
   329		}
   330	
   331		return 0;
   332	}
   333	
   334	static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
   335	{
 > 336		return pwrseq_power_on(pvr_dev->pwrseq);
   337	}
   338	
   339	static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
   340	{
 > 341		return pwrseq_power_off(pvr_dev->pwrseq);
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
