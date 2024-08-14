Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4BF1C680
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624361; cv=none; b=TJSSWefdTYXGSgHaCW/9JV3SYWphKMVnOOjKbaezXyDz/ykcbFCdStIXJN3HhhE36a2tIuIeAhu6zojyS2NxBXv+UqwiWfxe2DyWDVg1nbJx4YjJ4tSQ9GHwYZa6+YxopuWpRwroIj9+2xnyPVpBt5U6iJfGLluaBIEoraWtQgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624361; c=relaxed/simple;
	bh=yo8iTIYxkIJvF9NJrQxybgA4EY1SEm/gD1H2naiUoSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VERbs4jGv9wyZvgMfAJnGq5+fz+9aMyeCobDIAV3e9yrQ3zCCG7soBg+6Wl5AB2+rXgb6iC+P/RqcS/FkY20uB3zI1tRkvD30KTYH05hUY8puo3vl4FxsQqHOeZ7m91BwzTqgwo3F8mMwh1Jz3G60lfQWgtwXgejouiIF4OmGos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCYTKpLm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCYTKpLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624360; x=1755160360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yo8iTIYxkIJvF9NJrQxybgA4EY1SEm/gD1H2naiUoSA=;
  b=UCYTKpLme3LOSzaNaXD9TQCoZx48bbLHixks6WzXY2cKuBLz/dWOPXHj
   SzTk9jLdcpEBnxlkmcylCq+UMgIowsCjn8nGSdmIMqMhYS8VAckcxjCG5
   Pcqv4Jex6UVF8fpdk2Of45BdnAB4OPWM08DcwO7DWwQg//X/6xnq2lBim
   qyuklURBhfs1R5ZfP3NokCw1OeTMwLAqUEM5awB+13mSeAcsQ8WGRN9FP
   xPWrG10cET0GykfgubqYevNGKSg/7aYNZ27zvtgUqSOtDABEc2BgD57o+
   CyU3gDG03FXQLy//rv6lXI3cwsocg0zyPjwonda4UjIsMpx504ry5qIX+
   w==;
X-CSE-ConnectionGUID: 4Div6f3/QWaRHj3wTvqEkQ==
X-CSE-MsgGUID: uaBOFXX0SBOZ85Q03y8D6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32401343"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="32401343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 01:32:39 -0700
X-CSE-ConnectionGUID: 8Mtau9wXSNKyFhTOfoWV6w==
X-CSE-MsgGUID: X32whqZDSyKJvrjyXOjfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="58904730"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Aug 2024 01:32:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se9Qp-0001Su-10;
	Wed, 14 Aug 2024 08:32:35 +0000
Date: Wed, 14 Aug 2024 16:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:pending-fixes 191/279]
 sound/pci/hda/tas2781_hda_i2c.c:530:30: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202408141630.DiDUB8Z4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   bd5989ca496c1db7c3b1f279cb5dcabdfc33aa28
commit: 3beddef84d90590270465a907de1cfe2539ac70d [191/279] ALSA: hda/tas2781: fix wrong calibrated data order
config: i386-randconfig-063-20240814 (https://download.01.org/0day-ci/archive/20240814/202408141630.DiDUB8Z4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141630.DiDUB8Z4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141630.DiDUB8Z4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/tas2781_hda_i2c.c:530:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] data @@     got unsigned int @@
   sound/pci/hda/tas2781_hda_i2c.c:530:30: sparse:     expected restricted __be32 [usertype] data
   sound/pci/hda/tas2781_hda_i2c.c:530:30: sparse:     got unsigned int

vim +530 sound/pci/hda/tas2781_hda_i2c.c

   515	
   516	static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
   517	{
   518		static const unsigned char page_array[CALIB_MAX] = {
   519			0x17, 0x18, 0x18, 0x13, 0x18,
   520		};
   521		static const unsigned char rgno_array[CALIB_MAX] = {
   522			0x74, 0x0c, 0x14, 0x70, 0x7c,
   523		};
   524		int offset = 0;
   525		int i, j, rc;
   526		__be32 data;
   527	
   528		for (i = 0; i < tas_priv->ndev; i++) {
   529			for (j = 0; j < CALIB_MAX; j++) {
 > 530				data = get_unaligned_be32(
   531					&tas_priv->cali_data.data[offset]);
   532				rc = tasdevice_dev_bulk_write(tas_priv, i,
   533					TASDEVICE_REG(0, page_array[j], rgno_array[j]),
   534					(unsigned char *)&data, 4);
   535				if (rc < 0)
   536					dev_err(tas_priv->dev,
   537						"chn %d calib %d bulk_wr err = %d\n",
   538						i, j, rc);
   539				offset += 4;
   540			}
   541		}
   542	}
   543	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
