Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FAE264A84
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103776; cv=none; b=hUIog9bFT8Em/cf6uHerV9vjIaJ/jnnfdpPVj4A+5O4ME5ztA+P+syvcBSBTFp+mdyOcLA9uEiXWYDMH/ltFHJAgEUW851fwHay3XQ2jOenveJTV6uHeRqG3SFaymEYB3169PqzhjJ8uZAEsgnBEWy9Q4B9n+2Ss+fDNun405ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103776; c=relaxed/simple;
	bh=qeOGkURNlwpBetFktu+MeyI4x9vmKndylwbJNObkiZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nWLcAXz598moD4HrU87ls3P6R37KInYD6adzj2+xHT9ep8IFnYnWi4iqyveNmGi+x0vzlm0MOGDLujtxuqwoaMELdeOhMRg8E0YLJll6PBCwcTkojokyWJZ6A1lscPoQAQPBHLMo3cYi87n9HNIONMhmvShV+P1jdAGwjGW+wsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtMBekH6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtMBekH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744103775; x=1775639775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qeOGkURNlwpBetFktu+MeyI4x9vmKndylwbJNObkiZQ=;
  b=EtMBekH6lMuRg4i6og8DxbrOvjW+c9ywk/4Sj8OuUs7KxGeAh9NNCzeO
   jXkrCfxC4FpudEtFkdRzlepJuBt4PkYZENgDLS6IBfJ1sBJC92WQGrkUM
   fdjpBhXgr1AU80ZzuOf9c0f30c/L9U4+V+TI9RC/pjufCvyWqPzx0STnB
   0bY4K8V4CU4XHFWXjDPwFYsk9GH/Nghxjb4PosPkoTCYPK6QJUwjmk5cH
   Uuy0jxkEULkugInP1tj7kIXBQy24NUJXcJFA1vOHpo9mU866mjf4hRl7d
   2kTyL06xCKDwoDeQrTncd22W1afR6nnjh2qlPMCe3XWjhMWpSFUviki5+
   w==;
X-CSE-ConnectionGUID: 9l/LMsYeT1GBAr05Dmo58Q==
X-CSE-MsgGUID: F+qYToUhRUSglAfz+Gc2sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45240293"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45240293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:16:13 -0700
X-CSE-ConnectionGUID: M+tsXo+VRuSJmPhyDYTxuQ==
X-CSE-MsgGUID: MpiXbCXsQ82KxAiSa1Z0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="159201560"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2025 02:16:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u253s-0004ND-2D;
	Tue, 08 Apr 2025 09:16:04 +0000
Date: Tue, 8 Apr 2025 17:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 1/1]
 include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not used
Message-ID: <202504081746.viM43xo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   a3c3e7c841d92eee1abbb55d48d769cca8eeaeba
commit: b999e77ecf3a30e03f023c0acc1d97dbd5d42087 [1/1] ALSA: hda/tas2781: remove digital gain kcontrol
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250408/202504081746.viM43xo8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081746.viM43xo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081746.viM43xo8-lkp@intel.com/

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

678f38eba1f2fe3 Shenghao Ding 2023-06-18  17  
678f38eba1f2fe3 Shenghao Ding 2023-06-18 @18  static const DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
678f38eba1f2fe3 Shenghao Ding 2023-06-18  19  static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
678f38eba1f2fe3 Shenghao Ding 2023-06-18  20  

:::::: The code at line 18 was first introduced by commit
:::::: 678f38eba1f2fe33ff700e85390ac98393e609ef ASoC: tas2781: Add Header file for tas2781 driver

:::::: TO: Shenghao Ding <13916275206@139.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
