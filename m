Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A485F267AFE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 23:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739316262; cv=none; b=HileVGcC84rGnB3cp3BCMl0vEj6lPWcH7AEof8tovlVLkzBI1AD2lNTqtTzxRNPaRduRtgQGmEShsL0iGkgaTP3gWVwC1Dk8MVix3GQo1cmu2MJROyc72l2MxpOCfDGdcke57VbIplkX3XcGp9SpFH2L3JR6A02m7py0BEFvZus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739316262; c=relaxed/simple;
	bh=0q+6vCCURTkF9k7e835uOatV7KbXs+N6+XiqIYC35Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOcoTRmRBx2ykuOtu6z/QGqEDCLmXKx62s2AolKX2twLNMVs8TcisqrsdSFIYfdJr5qzhce8jt+nuoNx1VzinZxBnbjNz2JwVMNnUwUiV7sk1ZrtnoUZ78ylNalJJHMRoSzGDEOO1/VL0Hp5WSCisrm2NY+TBx8sZmFTfj15CSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4MsNt3K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4MsNt3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739316261; x=1770852261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0q+6vCCURTkF9k7e835uOatV7KbXs+N6+XiqIYC35Hw=;
  b=R4MsNt3KPFKrecx+9YoFZhPN9zUUwSCBqLwwWn9p7OM3ZMhDvtUWxWtY
   O7VadrZ1vaLkp18DnEpAVrgfXeRbzf+M+JTF+vEtNSRkyDM6wd0aclWyd
   VOOZ+qyOmYm2WgD3Y2omVD1cFjQpsp+DWz9xjGvmAl905GymzN1QcijQg
   gSs0LAtkWi0CG5sCT+10uAzJpgqqHwFyna1ctxSv/b9hURKJDT8vpFc4q
   Y+NSm14el8pQVLwmAcpQWaV7+3KHyxljFF4j+OccGo6GIb9YIWH9izenU
   b8M+0f5jAytlxEsmcvwIHiped+gNIRXq6x2yuDJjQ0dapisLyIle+UIkr
   g==;
X-CSE-ConnectionGUID: r8CWWqK5TDWK8WcCnfwDUg==
X-CSE-MsgGUID: Dv1TwgTYQOiqywGHTGwGuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50595484"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50595484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 15:24:20 -0800
X-CSE-ConnectionGUID: 3g1rVuGPSXSeID/++IPGLw==
X-CSE-MsgGUID: mDrx931gQ4S7l+Q5osUK0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112514522"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Feb 2025 15:24:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thzc0-0014pT-1J;
	Tue, 11 Feb 2025 23:24:16 +0000
Date: Wed, 12 Feb 2025 07:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 229/229]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:3909:6: warning: no previous prototype
 for 'mtk_dp_hdcp_enable'
Message-ID: <202502120732.7vFmuE9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   69fc64873274f4b1c5a6c4617cc39b8d59fafbdf
commit: 218314d73d3257a1468ad9c3f9355adffca0445a [229/229] CHROMIUM: drm/mediatek: Add dp HDCP support for SST mode
config: arm64-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120732.7vFmuE9y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120732.7vFmuE9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120732.7vFmuE9y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_v2.c: In function 'mtk_dp_video_config_v2':
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3374:12: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3374 |         u8 data;
         |            ^~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c: At top level:
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:3909:6: warning: no previous prototype for 'mtk_dp_hdcp_enable' [-Wmissing-prototypes]
    3909 | void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4263:18: warning: initialized field overwritten [-Woverride-init]
    4263 |         .reset = drm_atomic_helper_connector_reset,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4263:18: note: (near initialization for 'mtk_dp_con_funcs.reset')


vim +/mtk_dp_hdcp_enable +3909 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  3908	
> 3909	void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
  3910	{
  3911		if (!mtk_dp->training_info.cable_plug_in || !mtk_dp->dp_ready) {
  3912			dev_dbg(mtk_dp->dev, "cable_plug_in:%d, dp_ready:%d",
  3913			       mtk_dp->training_info.cable_plug_in, mtk_dp->dp_ready);
  3914			return;
  3915		}
  3916	
  3917		dev_dbg(mtk_dp->dev, "[HDCP] dp start HDCP work\n");
  3918		queue_work(mtk_dp->hdcp_workqueue, &mtk_dp->hdcp_work);
  3919	}
  3920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
