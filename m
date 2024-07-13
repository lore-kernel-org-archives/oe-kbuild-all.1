Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95593AC0F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720859292; cv=none; b=D0E9+bhTW9YSTfahq6NcnnVmo4wn8E6lcvKeis8d+xR/TMkF2dxSsOtUctJaULHR7GPnBSXbAO2qgosaImgIizS66yEmqSS4CIS2bweWx4f2bZVjQyKUo6aPRtX9kdwR7QCzYhInPqA1Wp5cnFj7calhtJBv2dXdAJDOrYQdrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720859292; c=relaxed/simple;
	bh=j0QrmYOnoG3TH4YcPLz5K0DjzjjuffG0/rW+SyTRJcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPoLukIvqNDYsoqNxfGTD71KXfT8BT7xti8a1XBRKF1Kug0LekQybFiaBiTx30lt7FEUfw2KRkW0sv3nmWOSB78prMIawhYhsR3wS0tcHKN3+xNrx1CRmFL70UNnwh87Lr+DMHMBn4nT9GAmW5+ldxGySET90bGBiPWeF3rQAgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6iYfw3P; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6iYfw3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720859291; x=1752395291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0QrmYOnoG3TH4YcPLz5K0DjzjjuffG0/rW+SyTRJcY=;
  b=D6iYfw3PLq0kbw7ztLL/vV3rtyIl/W5lVY3O/SLR09nmtJR5lsYO/FV+
   4Dw2TGbeGVC4c/S26ta4PRWmY8ykWU56J13rfBrB7vJXMx9i5yAFipZek
   ggC3aoNWSRTafKyvQINeB+y4ULvfwdPLi1FeJ7IwoshmOL0WQ+WlgMylx
   LYT/5Q0cQpYtjnOmztdn5i1JpsZe3gmh4cCbOne0YWE0diFChQwqPb3Oe
   YSURwBJ7i2uN0OqyHd5ipFmy4ka1dGYZTzPJgGcEHIIJjkryk+8lWhrYf
   QmpEJGMs3qQ2obZPpetKSMTXr/EZW5LZ1DyEHMy1hFrA6v8OQAbiBJqtc
   A==;
X-CSE-ConnectionGUID: fVRAIkXJTgmO3W6QRk+Vwg==
X-CSE-MsgGUID: +uwT+UMfQoC0uQEMvl0K5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18502025"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="18502025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 01:28:10 -0700
X-CSE-ConnectionGUID: epjEgD0dTaqYPh4Pz9hLtA==
X-CSE-MsgGUID: VpzZ+bPLQzKGwb3d+QmGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="72349202"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2024 01:28:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSY6x-000bsY-1N;
	Sat, 13 Jul 2024 08:28:07 +0000
Date: Sat, 13 Jul 2024 16:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 256/257] include/sound/tas2781-tlv.h:23:28:
 warning: 'tas2563_dvc_table' defined but not used
Message-ID: <202407131659.uSVINfrZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   c51cba4755609ad97ba97713210c16f043c73224
commit: 75ed63a5ab5d1d2872c735bc7edf8fef0e2fa2ea [256/257] ASoC: tas2781: Add new Kontrol to set tas2563 digital Volume
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240713/202407131659.uSVINfrZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131659.uSVINfrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131659.uSVINfrZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/pci/hda/tas2781_hda_i2c.c:23:
>> include/sound/tas2781-tlv.h:23:28: warning: 'tas2563_dvc_table' defined but not used [-Wunused-const-variable=]
      23 | static const unsigned char tas2563_dvc_table[][4] = {
         |                            ^~~~~~~~~~~~~~~~~
   In file included from include/sound/tlv.h:10,
                    from sound/pci/hda/tas2781_hda_i2c.c:22:
>> include/sound/tas2781-tlv.h:20:35: warning: 'tas2563_dvc_tlv' defined but not used [-Wunused-const-variable=]
      20 | static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
         |                                   ^~~~~~~~~~~~~~~
   include/uapi/sound/tlv.h:53:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      53 |         unsigned int name[] = { \
         |                      ^~~~
   include/sound/tas2781-tlv.h:20:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
      20 | static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/tas2563_dvc_table +23 include/sound/tas2781-tlv.h

    17	
    18	static const __maybe_unused DECLARE_TLV_DB_SCALE(dvc_tlv, -10000, 100, 0);
    19	static const DECLARE_TLV_DB_SCALE(amp_vol_tlv, 1100, 50, 0);
  > 20	static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
    21	
    22	/* pow(10, db/20) * pow(2,30) */
  > 23	static const unsigned char tas2563_dvc_table[][4] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
