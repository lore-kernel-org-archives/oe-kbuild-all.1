Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0214204C2F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588045; cv=none; b=SbBZACLAygS2VaLxT0cSu3c1kw0ayCnnsEDmQgiqQCdv4UF8QK/71oAIIgXo9oLpru4m7dKG+oPY3Gxvjo04WuRBZK9wVy5F6hZbGygYuwmkSpoNtA0OGWtzLNgLF7cxV2YOsblRDmWWRXj1RGUjdujiehha5OSQrONr7lZ61vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588045; c=relaxed/simple;
	bh=kDcyLXYE1A/m2YSD7QCOMk7vDxLcwD2GhPI+fo7AaZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNH9kmjGSJttneCmkIUak4U798ag2llPXuyCmDs0OUMcOrMBck/YeCr5MLEFR/Oku7uzQtDBs7kTuGQMqWW02sSvoXjkjzdvVtqkt1+Op1qe8AiEsA6m3NQ/X/T6sT8CUhfmiHaHNe6g1Zc8oxwoK97fVdxfglaLyXQpWWJmM9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiZRytAc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiZRytAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588044; x=1770124044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDcyLXYE1A/m2YSD7QCOMk7vDxLcwD2GhPI+fo7AaZY=;
  b=YiZRytAcjrogfiqzfzg0f251dJXAmYGPj209d3ShJBcZafETy3FAVnzm
   /Fu6q8+UNON5icY37jHyYp0zZnXbWALDUyieAThPWTa8inwugn0JQRgk0
   74Fom8n2LEI4WwTjZ/1NmoQS/T+5Uw0h8vY9Y/2AwEpm5K6lG64WLYMVJ
   rYTww8yOqFDJvYz6FGu4oAMaRnsvNmMPc6kN2S6Xsvq9agv3a/8lTUTu2
   ruh2FLKL+mNcZNSWZLkfWNH4/8ktKzZT36+gg2qkmSZapqWDJexNiiU3h
   V7nCYQoZBArSvNLgTjHgZA1w1O8iTplZ26pEY4N0lVGcZsyHmLXbPKpa1
   g==;
X-CSE-ConnectionGUID: 2+FMdwRqTVegbT7t52r83Q==
X-CSE-MsgGUID: QmZIQcTmTLG/hXSko9LldQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43000280"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="43000280"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:07:23 -0800
X-CSE-ConnectionGUID: ffGYrzutSpC/VBbNOYgvnw==
X-CSE-MsgGUID: 3UJMvRIPR82+RWKPkh7YPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110102642"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2025 05:07:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tewAZ-000qvz-1k;
	Mon, 03 Feb 2025 13:07:19 +0000
Date: Mon, 3 Feb 2025 21:06:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 57/57]
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c:77:9: error: implicit
 declaration of function 'mtk_crtc_read_crc'; did you mean 'mtk_crtc_create'?
Message-ID: <202502032144.wTFQ9VGD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6175b263c04ce3f5cf949719af87547964ae77fd
commit: b7c8e781f020aabd1461232257632f4c04ba97ca [57/57] CHROMIUM: drm/mediatek: Add CRC support for MT8196
config: arm64-randconfig-004-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032144.wTFQ9VGD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032144.wTFQ9VGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032144.wTFQ9VGD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_disp_outproc.c: In function 'mtk_disp_outproc_crc_read':
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:77:9: error: implicit declaration of function 'mtk_crtc_read_crc'; did you mean 'mtk_crtc_create'? [-Wimplicit-function-declaration]
      77 |         mtk_crtc_read_crc(&priv->crc);
         |         ^~~~~~~~~~~~~~~~~
         |         mtk_crtc_create
   drivers/gpu/drm/mediatek/mtk_disp_outproc.c: At top level:
>> drivers/gpu/drm/mediatek/mtk_disp_outproc.c:55:18: warning: 'outproc_crc_ofs' defined but not used [-Wunused-const-variable=]
      55 | static const u32 outproc_crc_ofs[] = {
         |                  ^~~~~~~~~~~~~~~


vim +77 drivers/gpu/drm/mediatek/mtk_disp_outproc.c

    54	
  > 55	static const u32 outproc_crc_ofs[] = {
    56		DISP_REG_OVL_OUTPROC_CRC,
    57	};
    58	
    59	size_t mtk_disp_outproc_crc_cnt(struct device *dev)
    60	{
    61		struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
    62	
    63		return priv->crc.cnt;
    64	}
    65	
    66	u32 *mtk_disp_outproc_crc_entry(struct device *dev)
    67	{
    68		struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
    69	
    70		return priv->crc.va;
    71	}
    72	
    73	void mtk_disp_outproc_crc_read(struct device *dev)
    74	{
    75		struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
    76	
  > 77		mtk_crtc_read_crc(&priv->crc);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
