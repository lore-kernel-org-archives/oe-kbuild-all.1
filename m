Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A92D8379
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319529; cv=none; b=qZGxvZz2dxDQU+OQ1rv30F6855rVJOSqWXc7SvAmTAjxEH8UqtwR8wuD4aKLkTcGZwbESwYPm1wbIKuiRfRGrhHqxpWX/3gc9S/Uy51bxTUOB71kMEKFxU8CTIlQ2IF6SoVEo4u4Uw32gy6kUan2EONqUcSi5di8CN3B/wZzUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319529; c=relaxed/simple;
	bh=an+1obYGqCUlD4hCbti5HArnUTQA/DZ7Z7428MY4aCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aneWFLAuyL+aQ0vFVuU9plptFs3e5RDYBZL6LrAEg5wCJT3AY+R7tnJJAx2THJnl7kH07/ui8BCrQWY1eJeYWsvXAOXyW0QLW4bK+ht50DllyXXtW6JQMiPKx1lVIeit1BTcCvY0/JfI0tUV/rCPb/aVrzoYurFzgoKYWPilNQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFvCGn6C; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFvCGn6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785319529; x=1816855529;
  h=date:from:to:cc:subject:message-id;
  bh=an+1obYGqCUlD4hCbti5HArnUTQA/DZ7Z7428MY4aCM=;
  b=UFvCGn6C8ClzcXNQ4sxbhNHjPV5N2JJ2ieKTDv/2YrY4+uay5yTVH4ZO
   Gj2NSUQR3Cu7VtWyip7/zA8zXRAYoDnOgNt0Fg5xhF99wqoDCP+v+N+Lp
   gJlcgeq2nw4JjCD7BuG3KdKfJaoqM+cMTyMpFssl0ulTy48aGysk9Sdoi
   aEHPCDRCv3MPlOAHr+X5ea8CkE1iGq/YFJLAvJnkf88MQTuGBnUFxmZbJ
   dcIRssVzTx+cXEZrp6KR99JEMXSdOviKjCBafAomR3kgNrqLvSB/aXapO
   T/yRTBKt89tbQE+W1UwJzL4t5TQ3Y0kHCQ3o2O+xuAo4/A46Qt0RiA94+
   g==;
X-CSE-ConnectionGUID: sfa2D13NSbCyq8KNt6f8zw==
X-CSE-MsgGUID: ZEjYMy2UQyKPGi66u1WCFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85771946"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85771946"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:05:28 -0700
X-CSE-ConnectionGUID: cHTniOC2TOO8tRKc7i0WlA==
X-CSE-MsgGUID: F+7I6KymTEqbQXXmopLCuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="258730584"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2026 03:05:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp19z-00000000fFq-425D;
	Wed, 29 Jul 2026 10:05:15 +0000
Date: Wed, 29 Jul 2026 18:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Stella Liu <yu-ching.liu@mediatek.com>,
 Jeremy Yu <chengwei.yu@mediatek.com>
Subject: [nbd168-wireless:mt76 28/135]
 drivers/net/wireless/mediatek/mt76/mt7925/nan.h:113:29: sparse: sparse:
 invalid bitfield specifier for type restricted __le32.
Message-ID: <202607291729.YGMNDVwv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless mt76
head:   7f932e0223ee060815f66d631767412e329d4492
commit: e973945bcc208217930d66d8dfa9201052ea652f [28/135] wifi: mt76: mt7925: add NAN MCU helpers
config: loongarch-randconfig-r123-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291729.YGMNDVwv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291729.YGMNDVwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291729.YGMNDVwv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c: note: in included file:
>> drivers/net/wireless/mediatek/mt76/mt7925/nan.h:113:29: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:114:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:118:34: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:119:34: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:120:37: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:124:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:125:32: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:126:33: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:127:35: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/wireless/mediatek/mt76/mt7925/nan.h:128:38: sparse: sparse: invalid bitfield specifier for type restricted __le32.

vim +113 drivers/net/wireless/mediatek/mt76/mt7925/nan.h

   110	
   111	union nan_band_ch_ctrl {
   112		struct {
 > 113			__le32 type : 1;
   114			__le32 reserved : 31;
   115		};
   116	
   117		struct {
   118			__le32 band_type : 1;
   119			__le32 band_rsvd : 23;
   120			__le32 band_id_mask : 8;
   121		};
   122	
   123		struct {
   124			__le32 ch_type : 1;
   125			__le32 ch_rsvd : 7;
   126			__le32 op_class : 8;
   127			__le32 primary_ch : 8;
   128			__le32 aux_center_ch : 8;
   129		};
   130	
   131		__le32 raw_data;
   132	};
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
