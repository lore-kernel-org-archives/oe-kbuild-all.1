Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585191;
	b=NqItuEfHCZLK+6WUo512zAoDiXutn+PQ859SgGnqkcDNj0BTsot6jR9lGhbrE23ZXbOs
	 JTn0yzaR5583jkf44arMflqsUcvnO/TP4k451XlevvFU+B+oEVyJNKLZeL4SeX5cVx7DD
	 1aftXGdPFBPfaMvJ2JpsXOri+vkSqUb4YJ9DNKxf2Bg1Wvt5ZvaNBgaMN+dl9BW3OcGEL
	 z3jEcP+aHfgEJ0B+7YpxwKX7Oi3WBabVgxZRXKwhzvF3bCkjXIRzHOYZqHYleUB+vc5ky
	 J4376TfMicqcvIp9RyHXvQ9vfjC+nMeGouONRlV5ejCU67Pkz/WTQ3kugr2LKyl5sYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585191;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VmM1PCJE4vlGf2Cqr55WhuavTo5Znf+Q/yGMIG2PLk4=;
	b=AteLKjUJInO7bfkS9yGO6FvjqsEGIh4PFxCuAVzPKRqsAw2R1/Ymb0ajRC3ibpA8yTRc
	 wblsd/+omC2oFm0JCl+VkPZW2IGqN9DHhEYthHN89cdWwyPFjBtFP+Es2PP4Gz0Xk2824
	 21b6KdJNwKIoBe5MA47D2MXV73x7NUkj0l5hLBJWltk5nIPgOp0fi3uMrJLeXnpj3lRwE
	 QUYviqUCMHZEN4btmCA3KkCoBIXdqHp3aXTz60C19a1IXG5ut729WUc3pbadC/E5d5Js+
	 tzXJU05lNyEBbYfw96NriuuWC5Aa8PUhPqaw6spH6PqS2lXG1kD3wN3X9Dyxf6Vvy7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfchFjjo;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B95606A324
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 02:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B95606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OfchFjjo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793585189; x=1825121189;
  h=date:from:to:cc:subject:message-id;
  bh=5Xcl8FXDdyMluGOFSkbg4SqHdJAreIwb3Po5gowPefk=;
  b=OfchFjjosufX6vd4W/e2E4XeCXLqP8PLpehaaRcgsLywE7N+hM6Ps0cq
   0Fcr4EUqxTaln3y0To5zSNT4PTmCoEkOyBvSZhRiRD3D220DHM6Y357n/
   g0Rf1yO2gfL73gfUWeoSwKf8rL29t8WgqAmW12RMSGvpAn9QjLeaj+c0A
   kJu6/tK/3rh12mDPj2SQp1NsoNdwTi+Htk0JQp2BZTsTCVFhsS5MoiW+c
   ASRZjD5uWg6TCggGzx+kHFeP88Zb6eyEq1SqxUTYIBg5QfPcT7KhkYNOf
   K0Vs4qftAcOdZy6ZemH1dH1L88KpgLi39kd3d0M10xnr8uZlFvrRLmhUf
   A==;
X-CSE-ConnectionGUID: zDYygL3eRBWrvY/m721wmg==
X-CSE-MsgGUID: /ii7lzDUQR6PiL6WZMQfkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2148897"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2148897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 18:06:28 -0800
X-CSE-ConnectionGUID: BxhSIog9QD2z1Ly1p+G5mA==
X-CSE-MsgGUID: hQFTZXCyQZmHNGeKMVCOKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6350503"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2026 18:06:26 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNhRG-000000008EB-0nF2;
	Mon, 02 Nov 2026 02:06:22 +0000
Date: Mon, 02 Nov 2026 03:06:06 +0100
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/backlight-property-v10 8/16]
 include/drm/drm_panel.h:422:20: error: redefinition of 'drm_bridge_is_panel'
Message-ID: <202611020334.FlPuqKLy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/backlight-property-v10
head:   badf7e43956b19ce60ad755613daf91db658270d
commit: 8aefd0168ad20f8e91f989373f0c8a69ab8c63a4 [8/16] drm/bridge: add connector luminance operations
config: powerpc-randconfig-r2200-20261102 (https://download.01.org/0day-ci/archive/20261102/202611020334.FlPuqKLy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3e5b45eed6c3ec25f4f1cc81ce0be10106a8f31f)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020334.FlPuqKLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020334.FlPuqKLy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:41:
>> include/drm/drm_panel.h:422:20: error: redefinition of 'drm_bridge_is_panel'
     422 | static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
         |                    ^
   include/drm/drm_bridge.h:1562:20: note: previous definition is here
    1562 | static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
         |                    ^
   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:41:
>> include/drm/drm_panel.h:427:19: error: redefinition of 'drm_panel_bridge_set_orientation'
     427 | static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
         |                   ^
   include/drm/drm_bridge.h:1567:19: note: previous definition is here
    1567 | static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
         |                   ^
   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:41:
   include/drm/drm_panel.h:440:34: error: redefinition of 'devm_drm_of_get_bridge'
     440 | static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
         |                                  ^
   include/drm/drm_bridge.h:1581:34: note: previous definition is here
    1581 | static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
         |                                  ^
   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:41:
   include/drm/drm_panel.h:448:34: error: redefinition of 'drmm_of_get_bridge'
     448 | static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
         |                                  ^
   include/drm/drm_bridge.h:1589:34: note: previous definition is here
    1589 | static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
         |                                  ^
   4 errors generated.


vim +/drm_bridge_is_panel +422 include/drm/drm_panel.h

152dbdeab1b2571 Sam Ravnborg  2019-12-07  404  
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  405  #ifdef CONFIG_DRM_PANEL_BRIDGE
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  406  bool drm_bridge_is_panel(const struct drm_bridge *bridge);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  407  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  408  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  409  					      u32 connector_type);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  410  void drm_panel_bridge_remove(struct drm_bridge *bridge);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  411  int drm_panel_bridge_set_orientation(struct drm_connector *connector,
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  412  				     struct drm_bridge *bridge);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  413  struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  414  					     struct drm_panel *panel);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  415  struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  416  						   struct drm_panel *panel,
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  417  						   u32 connector_type);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  418  struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  419  					 struct drm_panel *panel);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  420  struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  421  #else
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16 @422  static inline bool drm_bridge_is_panel(const struct drm_bridge *bridge)
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  423  {
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  424  	return false;
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  425  }
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  426  
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16 @427  static inline int drm_panel_bridge_set_orientation(struct drm_connector *connector,
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  428  						   struct drm_bridge *bridge)
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  429  {
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  430  	return -EINVAL;
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  431  }
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  432  #endif
aa8a8c7e4641ebc Luca Ceresoli 2026-09-16  433  

:::::: The code at line 422 was first introduced by commit
:::::: aa8a8c7e4641ebcef02dd6fa387ca334857367f4 drm/bridge: panel: move all code to drm_panel.c

:::::: TO: Luca Ceresoli <luca.ceresoli@bootlin.com>
:::::: CC: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
