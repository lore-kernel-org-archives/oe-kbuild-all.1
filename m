Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3928F5E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 03:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316742; cv=none; b=YTvfLE4xt76vipNV+FjDrAfm0VdjoMpkiGMWKlguDM7YiR3KS2DA8/sDfWQY96z72s7cwa/UBjoP1JHk3qWn7iDYorq+R+xPyASVhicCbJ0qwj1LDGZeaYUgCVA/NCmJL4WTRnmvy+usTee6870g3af0ML85vBRv/rePpCmNUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316742; c=relaxed/simple;
	bh=hGBEoFsOBqhB83G+ZfkEDMjkH90VoRY6l0ziksQ/zjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SwEyopkSTLhQlsNheWSoS2pQzkx2F92/hEZ2Zj7mar7jDHY4t9NSzpHrQnx8OEa887DuBrdfLoA5L4/mOmA7Kxm7/FQ9ORANZJ33Op5iYXFfovCqScI2qH5PnAUdpJTPh5JTEP98caEvJWGMd+48SbalHYiNk6aLHfSnGzzq24w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsUe/ZAG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsUe/ZAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748316741; x=1779852741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGBEoFsOBqhB83G+ZfkEDMjkH90VoRY6l0ziksQ/zjo=;
  b=OsUe/ZAGid9SoSW4Z4jIkcC8ey9h7Vhei8YeEQjB5CZZeqpOyeZre1db
   sy1/axSdX0vrgeMlNGi7Gj4mEX7vRGFisTSMmpLWJGJOYcKwFHvWnX3Rw
   bpSglfurVqHCi89lcVfU1QV7AmQSite0517kwjYN9iBj/heCdy7HouYN8
   czc6DfDLcCRzSDxlr+gZg90J+rRsaPHZkVYBw5jzZM5FdfUurm4RLTZnn
   TGiELFOQS/odnkWbE+ctHpDutI4KKtZGKeBv4q/xoDAU71y49YaGApNhY
   pCfdPYcdrgimpJWUlsE1iruMVTo6rgkyWu1SCPrBoPC2i7mypD0/WKULK
   Q==;
X-CSE-ConnectionGUID: /swgHOAsTBaEL2FEIsZoDw==
X-CSE-MsgGUID: W/TQowMUSIaimNZNDCU9RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49540897"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="49540897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 20:32:20 -0700
X-CSE-ConnectionGUID: mcoEP2VfQkCZqga3fAInXA==
X-CSE-MsgGUID: TpYSpsnSQzqv+P5c/TavOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="173506041"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 May 2025 20:32:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJl33-000SrI-1j;
	Tue, 27 May 2025 03:32:17 +0000
Date: Tue, 27 May 2025 11:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c:233:6:
 warning: no previous prototype for 'mtk_vcodec_dec_enable_dvfs'
Message-ID: <202505271126.2PctcHm8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: 622d2b38b47c46cd9c5d33e14c31ea3e36e996ed [133/133] CHROMIUM: mediatek: decoder: calling pm interface change freq and vol
config: arm64-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271126.2PctcHm8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271126.2PctcHm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271126.2PctcHm8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c:233:6: warning: no previous prototype for 'mtk_vcodec_dec_enable_dvfs' [-Wmissing-prototypes]
    void mtk_vcodec_dec_enable_dvfs(struct mtk_vcodec_dec_ctx *ctx, int hw_idx)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c:239:6: warning: no previous prototype for 'mtk_vcodec_dec_disable_dvfs' [-Wmissing-prototypes]
    void mtk_vcodec_dec_disable_dvfs(struct mtk_vcodec_dec_ctx *ctx, int hw_idx)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_vcodec_dec_enable_dvfs +233 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c

   232	
 > 233	void mtk_vcodec_dec_enable_dvfs(struct mtk_vcodec_dec_ctx *ctx, int hw_idx)
   234	{
   235		mtk_vdec_dvfs_begin_inst(ctx, hw_idx);
   236		vcodec_pmqos_helper_update(ctx, hw_idx);
   237	}
   238	
 > 239	void mtk_vcodec_dec_disable_dvfs(struct mtk_vcodec_dec_ctx *ctx, int hw_idx)
   240	{
   241		mtk_vdec_dvfs_end_inst(ctx, hw_idx);
   242		vcodec_pmqos_helper_update(ctx, hw_idx);
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
