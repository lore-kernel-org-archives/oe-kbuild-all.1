Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A9E2673BA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757432265; cv=none; b=kdAjJUc/Q6yFqVfYmYA4M3ucdyci4I33X7HMUzCnGn7WPEuEB8vfevubq40Z/rGLlr7QIkigwJMAgEXkR63/ZF66huIF2qzGR0waU8QgrSk4Va3engMj7KvAzMdGln8U/9XLcr3QkTxVkcJyuw5EalaRfIvbTYdSOmGGiMTC/08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757432265; c=relaxed/simple;
	bh=Vn1h/x9HU/8c78EHIGCM5fpc/ddSD6Avm/b1bzplRAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GODeBYB5Qk/Pbnf4tsei1MqywwJQzX64e1ubDdSnjfgZ+2W/doeuXzKMrJJRG/Z8F91bRt4ujkCxGSJeglCPpHf0yIzZB2qMhDL8s1rY/hmaWuire8sGjJMQio3UPch0WKpB+Uce4qtcIwKhlF5G7fJZZy5OJ/j5ysWHVNxcY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZn/WOjb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZn/WOjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757432264; x=1788968264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vn1h/x9HU/8c78EHIGCM5fpc/ddSD6Avm/b1bzplRAE=;
  b=jZn/WOjbr7MwINEqXd+cH+iBG3lapJh5hE3ADjjeIAFYYCXWoxnLTq6Z
   7RaojO4fUVdiwLHCLHpWAMFIooVOxnGJxTXW4gtuRO7f9gmpKyo8uzsN6
   LOBgE1guSpxKrrIznXEoSaXIvRRENosHdERc9OTgV90AcLjYvR3fpl5Fm
   FnTWr0+GqG0hk2sVB8V0KGbk+L4nUyD8RZuCdnsYgmJTKdmXKCJNG9z1d
   nzxU3lZIrJ15OEoWS2f9AK97j9GEl5Q8TwDQXnRrxQgT5A7GOmWWTVjLc
   KJ+fo4aTm0BLyv4i7tGH5fpSX1PH0EaG8tFBSj+vKFhuqZ5hYu+OIRDV6
   w==;
X-CSE-ConnectionGUID: eI1GT1i6QHenEg66fxXAgQ==
X-CSE-MsgGUID: qyvnkOduSECaTSbMY8ObFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="62352297"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="62352297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 08:37:43 -0700
X-CSE-ConnectionGUID: Gd3+7eU5SzGYIh3kbeA2cQ==
X-CSE-MsgGUID: G3z7mOAETBi8HA0klTB15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172401980"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Sep 2025 08:37:42 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw0Pb-00050l-2R;
	Tue, 09 Sep 2025 15:37:39 +0000
Date: Tue, 9 Sep 2025 23:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 0/36]
 include/sound/tas2781-tlv.h:18:35: warning: 'dvc_tlv' defined but not used
Message-ID: <202509092313.iXT8v9K3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gergo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   7c66eb275b3c520169869e4c57711b936da64de9
commit: b999e77ecf3a30e03f023c0acc1d97dbd5d42087 [0/36] ALSA: hda/tas2781: remove digital gain kcontrol
config: i386-buildonly-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509092313.iXT8v9K3-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092313.iXT8v9K3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092313.iXT8v9K3-lkp@intel.com/

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
