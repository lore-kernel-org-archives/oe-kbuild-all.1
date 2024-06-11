Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710417B4F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106861; cv=none; b=JZBT63/fnbq+PYh4GUTLxrbdBkqhibNiJmBE/e1MKKjcGSGsd8cziHXZjniLBvxOryQF9FP1pZMG/93I4mpeVvUDdzSKtwqjKicjK0rz7SFOXe9ziWSWkTqltC39n+XPIsNmGeukKRrwcu6Zf8AHcEn3Ep3JapGL//v/WNZR544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106861; c=relaxed/simple;
	bh=nsFzr206zcq/KW2NX7DYjOQoZNunCzRprWcE9OQeboc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VIJSjzOEK/FSxqdY2baPqG3cIPvHYY9hz8bo77j3lpGOTtwmQbbQ9pr0CeJ6ftWyI2/ZnIarZYZPwg38QjyP2WKaUcXmipWdmJRRpXBeECpXF0LuL51aaZOXykt1bWIiFmpykXxxg+6XdGlnTloUIQamSG72uG3x32G3gqSFTx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tza7I4Xy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tza7I4Xy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718106860; x=1749642860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nsFzr206zcq/KW2NX7DYjOQoZNunCzRprWcE9OQeboc=;
  b=Tza7I4Xyvok4P93EW2NC2Toz4gERUNGigls99Vt34Z6cLaEwoZOsDAVg
   4i4E8BnBDk4+ftwc1aYh+22zZ8rAtlamT2LGhBmSBulsMZu5b69zEJPIx
   HwOzkU63xMDZ9Nr+2MvUaszfQkdm1V6NU6SffhTCG6RHlEkoNKNiU29vp
   o9rlmSAE18YtNQ8+VuwzEcmpUNd1L5qZFys1NFvcU8HkB6jTTvjvTTIt/
   nfwkPd3fOHtg3Vbs9Nd2mUdnu90G5Ovd5bJ1Wbg6iUH3Jj/KVbJxUmwFO
   aIyLqBYJgttpNBYRl1B9rU0H5n9ZWtR4z/8oI3LKCarJgo4sm6WRf5Mdh
   A==;
X-CSE-ConnectionGUID: JM5vArg6QPmHp+91EV5ezQ==
X-CSE-MsgGUID: nNaGGWVRQuqmu6qOFfBARA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14981349"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14981349"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 04:54:20 -0700
X-CSE-ConnectionGUID: WXpsK2zPQcezUISpguUACQ==
X-CSE-MsgGUID: QBFaD8ONTXq68/lOFI+aWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="43847786"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2024 04:54:18 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH04u-0000Nm-1N;
	Tue, 11 Jun 2024 11:54:16 +0000
Date: Tue, 11 Jun 2024 19:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/5] ERROR: modpost:
 "v4l2_m2m_init" [drivers/media/test-drivers/vim2m.ko] undefined!
Message-ID: <202406111904.aYgEHbvx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   4f140e67f32c3b5cc82ab622d83961ac7adfc538
commit: 558762106d6e6e046ab9af372b9cadf4222893d7 [2/5] Merge 8afc66e8d43b ("Merge tag 'kbuild-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm64-randconfig-002-20240611 (https://download.01.org/0day-ci/archive/20240611/202406111904.aYgEHbvx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111904.aYgEHbvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111904.aYgEHbvx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_m2m_init" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_release" [drivers/media/test-drivers/vim2m.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_register_media_controller" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_unregister_media_controller" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_ctx_init" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_ctx_release" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_job_finish" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_buf_queue" [drivers/media/test-drivers/vim2m.ko] undefined!
ERROR: modpost: "v4l2_m2m_next_buf" [drivers/media/test-drivers/vim2m.ko] undefined!
WARNING: modpost: suppressed 19 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
