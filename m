Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5725200CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705499656; cv=none; b=uPZm1VWrwTLvb2Q4fVeWoxDVwOXDMaPBXoOUZyG0GXkmUhGUnadYAjPWQzH9YUgXK5gqF7zfNxOTL5tZFd6wio+OIsx3WaDDze2ooIMp5J6uAYJjFCj9rtZc75+kuWLuMlcgs5aMRaTj0dqTFBa5QHr/RPJL9Wf09Y/na1fVjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705499656; c=relaxed/simple;
	bh=DZkTto3XdxT0Ma2+igjjGiju5MmWmdSjnbjTGD/KNk4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=Loq/xT9PTVLNH8tJjPJbtrM9+u3H1/YVTKCLNbOJ/QQkLrYXzgz4W3HvYUoYrDk+OO6FkaCTmKJYGen+jW7yKLx4UhA9+EBIHMakQw5DJrJ33j3jXmkFFpVS3svnkd2FpNK2ec05sGbYGkeYTBJeK5Uqx1TXLvm+qwMayNulHR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMcs/w9D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMcs/w9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705499655; x=1737035655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZkTto3XdxT0Ma2+igjjGiju5MmWmdSjnbjTGD/KNk4=;
  b=YMcs/w9DuT/M73ZW8nL0ZpFxw+pQ9HG7N5pQJgyq/JJfhJv7ydJYShTh
   iDC1dNtBfsgYOq0vVVB0ffRqiM9BfDUohkGwQCRpFjE7UO2oTLN8jSgyP
   UCba1xN9CuAdJP0HJA7TYr9eAcPApNu+HzX7EAblKQdYNEEuoSa5s0bis
   FyWccNDEU95+nAB1ie5nhKVKK+wEmhRnK/zmCC3PloFel4c68MJjRaB/2
   9K7zQEQAhRYGHUb9KodPJgKD6uheJ1Oad4aS+0E77z8GKRxji39mnZbUc
   KXbg/DrCbM8L3ethOrzAKyXxpBNOR8ZLEk1BT0peJWaCfMWwcadv06BFN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6874036"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6874036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 05:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="26493559"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2024 05:54:05 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ6Ml-00023i-1V;
	Wed, 17 Jan 2024 13:54:03 +0000
Date: Wed, 17 Jan 2024 21:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Chung <chiahsuan.chung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sun peng Li <sunpeng.li@amd.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 13367/13716]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:100:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202401172119.Fc2Ic3l9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   943b9f0ab2cfbaea148dd6ac279957eb08b96904
commit: 5950efe25ee02df4983864b3bc1f460ad5c8d862 [13367/13716] drm/amd/display: Enable Panel Replay for static screen use case
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240117/202401172119.Fc2Ic3l9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401172119.Fc2Ic3l9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401172119.Fc2Ic3l9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c:100: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The DRM vblank counter enable/disable action is used as the trigger to enable


vim +100 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crtc.c

    98	
    99	/**
 > 100	 * The DRM vblank counter enable/disable action is used as the trigger to enable
   101	 * or disable various panel self-refresh features:
   102	 *
   103	 * Panel Replay and PSR SU
   104	 * - Enable when:
   105	 *      - vblank counter is disabled
   106	 *      - entry is allowed: usermode demonstrates an adequate number of fast
   107	 *        commits)
   108	 *     - CRC capture window isn't active
   109	 * - Keep enabled even when vblank counter gets enabled
   110	 *
   111	 * PSR1
   112	 * - Enable condition same as above
   113	 * - Disable when vblank counter is enabled
   114	 */
   115	static void amdgpu_dm_crtc_set_panel_sr_feature(
   116		struct vblank_control_work *vblank_work,
   117		bool vblank_enabled, bool allow_sr_entry)
   118	{
   119		struct dc_link *link = vblank_work->stream->link;
   120		bool is_sr_active = (link->replay_settings.replay_allow_active ||
   121					 link->psr_settings.psr_allow_active);
   122		bool is_crc_window_active = false;
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
