Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E86414DD3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970796; cv=none; b=QbypHIjCfW0Y4WhnKJQXWnK8zEc6PfxOkZGEMz8tM7QuwqdwE91txeOdEJmekxwoZ1KvonSYJXZ+/429E3DGi4fMwVNQrLsidTdip5hNoX+G8d47ujH22byiNW8TotKMbyOTRWr2CPRGDf2AeMouZjPEKjChyRtpb9Y2t3z9n0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970796; c=relaxed/simple;
	bh=GCCShGLZVKOdzr3A/Zcu7hyC8d+KMfinoxQ0UwbtU7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D4m69JlJz6AeuNj7ueptYpT25pWyzFsSis2gSIXvM/twlLEUQhnUsyQzI4pkPEIP/GYD3hRR+5UXmTPeqtUZPjlVMSv/CkulEF7ceMefTiqi7BLXOhgGJWc6E8NpMeDoxEfqzlh12MX/MHv8xebjk1tq4/Cl7koMgUjyT/3Afh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezJ4VDt0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezJ4VDt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786970794; x=1818506794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GCCShGLZVKOdzr3A/Zcu7hyC8d+KMfinoxQ0UwbtU7M=;
  b=ezJ4VDt0KCrm+pUdQIYrEumGAUsCThgpfA0WoLCt+k05FBkYvk4pb+YI
   KPHl/ZGBlmALAU1Cf5HFB3hbtgTTEruGVjfFBD6xjRFxRW7nZUQf2M0gC
   UCmsc+PhR9n43FHb9MOX0IN5qveh1U9N79yaCvtiGX5sMaZlNJWSm8xMM
   kAwoctkLVddRkcfL4r8gqIcCBscUOyVvPFG8r+bOA/Rz4tmghfAjwdAO/
   gNw9YmxeYDx+ZYgusbL1LmbxPid93fMqKe+wxt8qOz9M/UNXf7qT8+G6b
   bUccNvT4aa6b3v6EHtJTP2c6Zhsi21zmmderYF6NTI9NerHYR3dHTXEDA
   g==;
X-CSE-ConnectionGUID: KhzGxIAoSMOYM6RTUymGcg==
X-CSE-MsgGUID: vTk9kx9OSaiXO3xV56SFGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86564685"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="86564685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:46:34 -0700
X-CSE-ConnectionGUID: sPpsY5UMQFCrJzy2bnRiLA==
X-CSE-MsgGUID: TiMBwSIUSFW7eKRML9N7UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="263144311"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2026 05:46:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvwjV-00000000dSu-44Ph;
	Mon, 17 Aug 2026 12:46:29 +0000
Date: Mon, 17 Aug 2026 20:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [drm-tip:drm-tip 5/10] ERROR: modpost: "parse_hdmi_amd_vsdb"
 =?us-ascii?Q?[drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/?=
 =?us-ascii?Q?amdgpu=5Fdm=5Fconnector=5Ftest.ko]?= undefined!
Message-ID: <202608172028.2FLcycRK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
head:   ceef0899403ceea5643d80a02bfdf9587f3845b8
commit: 443d3c62afbe3786b074bbb40f7449823c898738 [5/10] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260817/202608172028.2FLcycRK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172028.2FLcycRK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172028.2FLcycRK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "parse_hdmi_amd_vsdb" [drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
