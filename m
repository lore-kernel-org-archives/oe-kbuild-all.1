Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772316B3B7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590894; cv=none; b=vDHye3wceaU1HaZRn+gEmgRftqaSbmTKWcJP9+75FI4idxTeprC2gTYmdoWjUif/LO414ZibZeSFGa4eiPckyq+IINY63e5Df1zOMGxHJb0kDtqWkyhGXylndw6VJg2Q41WeiTK5FMU3sQZ/LDQNNuJ7qBYSyhUApjG/xswmxYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590894; c=relaxed/simple;
	bh=yx+QX8dDO7/UQ2JVVTDmJ38ZgOD2DS5ylUal+C+0/ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qh0qno18gubPsDPkBhHG/aToOLAZP7ka7wq+klZnZZTyrEufTCkz8HYL9faNil5WFQ/P11mIDFyfjMX8lSs+pZ7RIdew7rZeutbfI1SNZ8dk+280do4GWq7cKAFnTnMdImevZyf9z9pQua07ktOyC25cQmeAFWJ9pOJeMj7xG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RS+/yFX9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RS+/yFX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736590892; x=1768126892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yx+QX8dDO7/UQ2JVVTDmJ38ZgOD2DS5ylUal+C+0/ao=;
  b=RS+/yFX9eeveHgmEYhp3tt199KBiORbEJrN2XdpcTtmpvjegNAYCxN0A
   Nr/ZZQIgt4vLjkMerjCvHm0RL/DY1j2FSxepdcvOYCG1hmvRt21wjCqAz
   sf/Z8KoKsoim+YKOk+YdBOWjshv8aL/Cxtb9jTJJUSgPhQXUJSrzYfH/w
   knyDvTEuNS9A8j3Mn1hNjDW+tfaPbGsxi9qruq2b4ERgi9xijQuOPnS9N
   gQcEjf1FrH9K49/lWcilpj+iCeA2Id4cmRx0iVq7SFTJlsZpLNoYe/0NE
   N56xg353lPXx+6xXjAEtYJBc4WxQadFHXy5BUKDQZNtyBjEultPAtHJfB
   w==;
X-CSE-ConnectionGUID: Q8RjRG8nTSufKX5208iscg==
X-CSE-MsgGUID: lTWN800eSeaQuHFJ56sUag==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37041787"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="37041787"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:21:31 -0800
X-CSE-ConnectionGUID: eWU2v4TaSV+dV7/13oGBHg==
X-CSE-MsgGUID: zux7HR5oR6On+PEmVttrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109072600"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jan 2025 02:21:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWYcS-000KTj-0q;
	Sat, 11 Jan 2025 10:21:28 +0000
Date: Sat, 11 Jan 2025 18:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 1/1]
 drivers/gpu/drm/img-rogue/1.17/server_rgxta3d_bridge.c:3200:2: warning: cast
 from 'IMG_INT (*)(IMG_UINT32, IMG_UINT8 *, IMG_UINT8 *, CONNECTION_DATA *)'
 (aka 'int (*)(unsigned int, unsigned char *, unsigned char *, struct
 _CONNECTION_DATA_ *)') to 'Bridge...
Message-ID: <202501111808.2X73NVaQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   a716fc98be7a90b62c3996e3e70ba09d1d1bd6e3
commit: a716fc98be7a90b62c3996e3e70ba09d1d1bd6e3 [1/1] CHROMIUM: img-rogue: Improve MLIST/PM render state buffers handling
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111808.2X73NVaQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111808.2X73NVaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111808.2X73NVaQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/img-rogue/1.17/server_rgxta3d_bridge.c:3200:2: warning: cast from 'IMG_INT (*)(IMG_UINT32, IMG_UINT8 *, IMG_UINT8 *, CONNECTION_DATA *)' (aka 'int (*)(unsigned int, unsigned char *, unsigned char *, struct _CONNECTION_DATA_ *)') to 'BridgeWrapperFunction' (aka 'unsigned long (*)(unsigned int, unsigned char *, unsigned char *, struct _CONNECTION_DATA_ *)') converts to incompatible function type [-Wcast-function-type-strict]
    3200 |         SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATEHWRTDATASET2,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3201 |                               PVRSRVBridgeRGXCreateHWRTDataSet2, NULL,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3202 |                               sizeof(PVRSRV_BRIDGE_IN_RGXCREATEHWRTDATASET2),
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    3203 |                               sizeof(PVRSRV_BRIDGE_OUT_RGXCREATEHWRTDATASET2));
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/img-rogue/1.17/srvcore.h:140:66: note: expanded from macro 'SetDispatchTableEntry'
     140 |                 _SetDispatchTableEntry(ui32BridgeGroup, ui32Index, #ui32Index, (BridgeWrapperFunction)pfFunction, #pfFunction,\
         |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +3200 drivers/gpu/drm/img-rogue/1.17/server_rgxta3d_bridge.c

  3118	
  3119		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATEHWRTDATASET,
  3120				      PVRSRVBridgeRGXCreateHWRTDataSet, NULL,
  3121				      sizeof(PVRSRV_BRIDGE_IN_RGXCREATEHWRTDATASET),
  3122				      sizeof(PVRSRV_BRIDGE_OUT_RGXCREATEHWRTDATASET));
  3123	
  3124		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXDESTROYHWRTDATASET,
  3125				      PVRSRVBridgeRGXDestroyHWRTDataSet, NULL,
  3126				      sizeof(PVRSRV_BRIDGE_IN_RGXDESTROYHWRTDATASET),
  3127				      sizeof(PVRSRV_BRIDGE_OUT_RGXDESTROYHWRTDATASET));
  3128	
  3129		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATEZSBUFFER,
  3130				      PVRSRVBridgeRGXCreateZSBuffer, NULL,
  3131				      sizeof(PVRSRV_BRIDGE_IN_RGXCREATEZSBUFFER),
  3132				      sizeof(PVRSRV_BRIDGE_OUT_RGXCREATEZSBUFFER));
  3133	
  3134		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXDESTROYZSBUFFER,
  3135				      PVRSRVBridgeRGXDestroyZSBuffer, NULL,
  3136				      sizeof(PVRSRV_BRIDGE_IN_RGXDESTROYZSBUFFER),
  3137				      sizeof(PVRSRV_BRIDGE_OUT_RGXDESTROYZSBUFFER));
  3138	
  3139		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXPOPULATEZSBUFFER,
  3140				      PVRSRVBridgeRGXPopulateZSBuffer, NULL,
  3141				      sizeof(PVRSRV_BRIDGE_IN_RGXPOPULATEZSBUFFER),
  3142				      sizeof(PVRSRV_BRIDGE_OUT_RGXPOPULATEZSBUFFER));
  3143	
  3144		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXUNPOPULATEZSBUFFER,
  3145				      PVRSRVBridgeRGXUnpopulateZSBuffer, NULL,
  3146				      sizeof(PVRSRV_BRIDGE_IN_RGXUNPOPULATEZSBUFFER),
  3147				      sizeof(PVRSRV_BRIDGE_OUT_RGXUNPOPULATEZSBUFFER));
  3148	
  3149		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATEFREELIST,
  3150				      PVRSRVBridgeRGXCreateFreeList, NULL,
  3151				      sizeof(PVRSRV_BRIDGE_IN_RGXCREATEFREELIST),
  3152				      sizeof(PVRSRV_BRIDGE_OUT_RGXCREATEFREELIST));
  3153	
  3154		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXDESTROYFREELIST,
  3155				      PVRSRVBridgeRGXDestroyFreeList, NULL,
  3156				      sizeof(PVRSRV_BRIDGE_IN_RGXDESTROYFREELIST),
  3157				      sizeof(PVRSRV_BRIDGE_OUT_RGXDESTROYFREELIST));
  3158	
  3159		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATERENDERCONTEXT,
  3160				      PVRSRVBridgeRGXCreateRenderContext, NULL,
  3161				      sizeof(PVRSRV_BRIDGE_IN_RGXCREATERENDERCONTEXT),
  3162				      sizeof(PVRSRV_BRIDGE_OUT_RGXCREATERENDERCONTEXT));
  3163	
  3164		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXDESTROYRENDERCONTEXT,
  3165				      PVRSRVBridgeRGXDestroyRenderContext, NULL,
  3166				      sizeof(PVRSRV_BRIDGE_IN_RGXDESTROYRENDERCONTEXT),
  3167				      sizeof(PVRSRV_BRIDGE_OUT_RGXDESTROYRENDERCONTEXT));
  3168	
  3169		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D,
  3170				      PVRSRV_BRIDGE_RGXTA3D_RGXSETRENDERCONTEXTPRIORITY,
  3171				      PVRSRVBridgeRGXSetRenderContextPriority, NULL,
  3172				      sizeof(PVRSRV_BRIDGE_IN_RGXSETRENDERCONTEXTPRIORITY),
  3173				      sizeof(PVRSRV_BRIDGE_OUT_RGXSETRENDERCONTEXTPRIORITY));
  3174	
  3175		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXRENDERCONTEXTSTALLED,
  3176				      PVRSRVBridgeRGXRenderContextStalled, NULL,
  3177				      sizeof(PVRSRV_BRIDGE_IN_RGXRENDERCONTEXTSTALLED),
  3178				      sizeof(PVRSRV_BRIDGE_OUT_RGXRENDERCONTEXTSTALLED));
  3179	
  3180		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXKICKTA3D2,
  3181				      PVRSRVBridgeRGXKickTA3D2, NULL, sizeof(PVRSRV_BRIDGE_IN_RGXKICKTA3D2),
  3182				      sizeof(PVRSRV_BRIDGE_OUT_RGXKICKTA3D2));
  3183	
  3184		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D,
  3185				      PVRSRV_BRIDGE_RGXTA3D_RGXSETRENDERCONTEXTPROPERTY,
  3186				      PVRSRVBridgeRGXSetRenderContextProperty, NULL,
  3187				      sizeof(PVRSRV_BRIDGE_IN_RGXSETRENDERCONTEXTPROPERTY),
  3188				      sizeof(PVRSRV_BRIDGE_OUT_RGXSETRENDERCONTEXTPROPERTY));
  3189	
  3190		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATEZSBUFFER2,
  3191				      PVRSRVBridgeRGXCreateZSBuffer2, NULL,
  3192				      sizeof(PVRSRV_BRIDGE_IN_RGXCREATEZSBUFFER2),
  3193				      sizeof(PVRSRV_BRIDGE_OUT_RGXCREATEZSBUFFER2));
  3194	
  3195		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATEFREELIST2,
  3196				      PVRSRVBridgeRGXCreateFreeList2, NULL,
  3197				      sizeof(PVRSRV_BRIDGE_IN_RGXCREATEFREELIST2),
  3198				      sizeof(PVRSRV_BRIDGE_OUT_RGXCREATEFREELIST2));
  3199	
> 3200		SetDispatchTableEntry(PVRSRV_BRIDGE_RGXTA3D, PVRSRV_BRIDGE_RGXTA3D_RGXCREATEHWRTDATASET2,
  3201				      PVRSRVBridgeRGXCreateHWRTDataSet2, NULL,
  3202				      sizeof(PVRSRV_BRIDGE_IN_RGXCREATEHWRTDATASET2),
  3203				      sizeof(PVRSRV_BRIDGE_OUT_RGXCREATEHWRTDATASET2));
  3204	
  3205		return PVRSRV_OK;
  3206	}
  3207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
