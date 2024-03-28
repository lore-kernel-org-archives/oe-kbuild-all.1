Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACA87EF00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711656400; cv=none; b=rD+XhJuMlxiVc6zCmbbDkm7DUx/M0CaQmAFcrK8C2m6Afx4JFKJsDhPInCIb0mZleDTD2V4Y+EcXfJfuZGzmA0QchqfWa+MvaGhIG7EYzgZVFz5oYRQkx1czHbkou5FwDZOtREscni81X/r0hTm3E4phNZraXiAVAZIX0OynrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711656400; c=relaxed/simple;
	bh=Wxy3FfO8nWGTOCNgNtvEM6jvzzVf2qp+0P+Xe146MYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jV5r220VsnEuSxd5t2levnUL19/WfL180U80yNth0mWlMtWEUvLkLlFWUYLLDa8Ee3axw63f2suPzp3symeOKTScMi9AWZMY/xNrmaGkdVnnMcUxY8JL20Fa5ciuXQWuZ1DerJtA1w5akH/zYreGOMV4OiglcGvYW6vv1lFrAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkWh6/zi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkWh6/zi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711656399; x=1743192399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wxy3FfO8nWGTOCNgNtvEM6jvzzVf2qp+0P+Xe146MYg=;
  b=PkWh6/ziy8NXWSG+Yvi2yzdPcOW9Oacyw8fwOmOe2Lg3srYd3Nyjs+Vd
   SzlGhMGNtnUyDUv3cNnfnzFzNIH3xeOERzjo7t+wjO4mRFxr4yNHVYIrG
   ARc1kWPJxzGmeb41dfq3ZTDsDusfF/ctqwVarNsRzmn+ySJZaGOytU5y2
   2zrhBDlgRkNFhSLtnZSRzbceTltWvU/yOfqRuCV/SrHaMDwTPnj9z7BIr
   myQWsgKYT9Zy96aba8EitILmkaHeDtLSiSACf4mWQ/GAidE1G/di2KCWQ
   LUk43MiygMphNNYDJcVLcs7aeTUpc18n5IJXnNoUu34QtdgnLscQ1hy5U
   g==;
X-CSE-ConnectionGUID: aMcmn1thT2++Q3xi5iWFpA==
X-CSE-MsgGUID: 7rEoIRwkSMCrADb16SI6qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7030077"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7030077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 13:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16786650"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Mar 2024 13:06:21 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpw0w-0002US-32;
	Thu, 28 Mar 2024 20:06:18 +0000
Date: Fri, 29 Mar 2024 04:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-linus 12/17] include/sound/tas2781-tlv.h:18:35:
 warning: 'dvc_tlv' defined but not used
Message-ID: <202403290354.v0StnRpc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
head:   2d0401ee38d43ab0e4cdd02dfc9d402befb2b5c8
commit: ae065d0ce9e36ca4efdfb9b96ce3395bd1c19372 [12/17] ALSA: hda/tas2781: remove digital gain kcontrol
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403290354.v0StnRpc-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290354.v0StnRpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290354.v0StnRpc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/sound/tlv.h:10,
                    from sound/pci/hda/tas2781_hda_i2c.c:22:
>> include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not used [-Wunused-const-variable=]
      18 | static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
         |                                   ^~~~~~~
   include/uapi/sound/tlv.h:53:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      53 |         unsigned int name[] = { \
         |                      ^~~~
   include/sound/tas2781-tlv.h:18:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
      18 | static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/dvc_tlv +18 include/sound/tas2781-tlv.h

678f38eba1f2fe Shenghao Ding 2023-06-18  17  
678f38eba1f2fe Shenghao Ding 2023-06-18 @18  static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
678f38eba1f2fe Shenghao Ding 2023-06-18  19  static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
678f38eba1f2fe Shenghao Ding 2023-06-18  20  

:::::: The code at line 18 was first introduced by commit
:::::: 678f38eba1f2fe33ff700e85390ac98393e609ef ASoC: tas2781: Add Header file for tas2781 driver

:::::: TO: Shenghao Ding <13916275206@139.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
