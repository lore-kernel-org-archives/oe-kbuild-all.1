Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9847B12E6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFVPIYJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702551699; x=1734087699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tStEvbSDiRiak4yKgqAtDq3tYukI60wxecpagS8ZV10=;
  b=gFVPIYJeJ43jM3uX6hmiIpBaUX1j0AUXcr0M3GiisgAicqWm7U5KCink
   +8acWOZW9DFebzGppe74zRFsyQcuCbX/fPA+KwudLq6WjeiIETSUv7UPR
   AsqNnhXzEwxtp47R8sC8jBo2c7+UYabZSQGuUYUZUpIX7YPL7rkqtJrVd
   SQEUKW4g37SL1P7ZGCcUe5gwjxxe7tO8fXqSBSp6w0pG7C2SC97rSISfC
   b7vrspBmjF3j4xC6T44RAy5e0o3BHb2g49LKBznxQFaHfXhypMJR2/B/2
   ikd9QGKhdDiKjQrL7M9fNivNbkHErtm3hCfoaJq0yjCCV7RLfkr/8HUcz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1955530"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1955530"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777859170"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="777859170"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 03:01:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDjTD-000LxT-0U;
	Thu, 14 Dec 2023 11:01:35 +0000
Date: Thu, 14 Dec 2023 19:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Joshua Ashton <joshua@froggi.es>
Subject: [linux-next:master 7445/7726]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:312:
 warning: expecting prototype for drm_crtc_additional_color_mgmt(). Prototype
 was for dm_crtc_additional_color_mgmt() instead
Message-ID: <202312141801.o9eBCxt9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11651f8cb2e88372d4ed523d909514dc9a613ea3
commit: 0f5afa190b890052cae187496f660699f00067ef [7445/7726] drm/amd/display: add CRTC gamma TF driver-specific property
config: i386-buildonly-randconfig-004-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141801.o9eBCxt9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141801.o9eBCxt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141801.o9eBCxt9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:312: warning: expecting prototype for drm_crtc_additional_color_mgmt(). Prototype was for dm_crtc_additional_color_mgmt() instead


vim +312 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c

   299	
   300	#ifdef AMD_PRIVATE_COLOR
   301	/**
   302	 * drm_crtc_additional_color_mgmt - enable additional color properties
   303	 * @crtc: DRM CRTC
   304	 *
   305	 * This function lets the driver enable post-blending CRTC regamma transfer
   306	 * function property in addition to DRM CRTC gamma LUT. Default value means
   307	 * linear transfer function, which is the default CRTC gamma LUT behaviour
   308	 * without this property.
   309	 */
   310	static void
   311	dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
 > 312	{
   313		struct amdgpu_device *adev = drm_to_adev(crtc->dev);
   314	
   315		if(adev->dm.dc->caps.color.mpc.ogam_ram)
   316			drm_object_attach_property(&crtc->base,
   317						   adev->mode_info.regamma_tf_property,
   318						   AMDGPU_TRANSFER_FUNCTION_DEFAULT);
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
