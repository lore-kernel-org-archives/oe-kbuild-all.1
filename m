Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7CB524C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 05:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573492; cv=none; b=M7WOxrSnb9XvztKYHOo3RPCFQXg9Qr66B63tEFaEzPVje5F1iNwvM9qmEWqUWbUPwEX7AxYzirfDN4pjI7UivgKjwMPnewGJPdyvdyCXu+jgOzkfbrLMEpvIe188O5pG4ofaFz+OQtmPuZXVXBYIZU11rz8KNClzyL2icXlPlLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573492; c=relaxed/simple;
	bh=+tT0G8qXUXoLIonVzYjSlpstOvJo+9o2EQfo8UkQQkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+9TaaVw2Vwkl1d+buXhh82EYkDYSc8Yv06fXiTFNRNI8/RuuF7lEzA3S9KfykZX/2sywjEqMVHiwO49Zis+F6hoK+2riRLTKdwOW3tvl2PyhnF+/Xbhs+8NE1oHJ7KXz8j5zFZgEyn8rvEFRZ6jnpOiv7Cll+GBoblL/vLKiIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dK8jKAYK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dK8jKAYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743573490; x=1775109490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tT0G8qXUXoLIonVzYjSlpstOvJo+9o2EQfo8UkQQkM=;
  b=dK8jKAYKpDMjl8HMRU5zLTnsmmbs7q/p5TDD43vOk0Hanh/vQ9yo2wp+
   +mRnZ+WfDbgP38sK4Ft6GN2sc0nxBWOjWjF33e7OVETKX2KhFp180IMqz
   TicrrwcBC3VCtxkdopg++ML14a6mrRKOukzJQ57RcqS8xWUmP0GGlDyxt
   aobNI5QrFgFhtiszNY3tiKblvSA02nfUTYDGX1igkrlOaNfMLZ7biCY2b
   6QsKjQl4RHe0Sy0/ykU605/4qTOKI0CFy7x0vUOdjtW+EvjjA/ik1hrtc
   0imKBR1CV8EZUswE9Rnf6TTE8C8/QvHhTY1vt02trOAihcchOMzIPMsF1
   g==;
X-CSE-ConnectionGUID: Jbg1HyifSiatjTsJ2lPs7g==
X-CSE-MsgGUID: XRCkRHxHSkm/SDnF8a8xEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55580346"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="55580346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 22:58:09 -0700
X-CSE-ConnectionGUID: GGpgT1emQre20iqPY11tVg==
X-CSE-MsgGUID: qR/Oja2rQpWe5WHlFBjrFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131457994"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Apr 2025 22:58:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzr6z-000AVS-32;
	Wed, 02 Apr 2025 05:58:05 +0000
Date: Wed, 2 Apr 2025 13:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for DRM_PRIVACY_SCREEN when selected by
 GKI_HIDDEN_DRM_CONFIGS
Message-ID: <202504021303.sRTS0Tvn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   6aa937cab13a62167225dbd06a66739187dbceb1
commit: e597c0793e7dc765d11866199b6444972c027b6b [1/1] ANDROID: [TEMP] GKI: x86: Enable DRM privacy screen
config: i386-kismet-CONFIG_DRM_PRIVACY_SCREEN-CONFIG_GKI_HIDDEN_DRM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250402/202504021303.sRTS0Tvn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250402/202504021303.sRTS0Tvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021303.sRTS0Tvn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN when selected by GKI_HIDDEN_DRM_CONFIGS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
