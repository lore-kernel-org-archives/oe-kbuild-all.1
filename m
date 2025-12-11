Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436FF1A9F9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765428762; cv=none; b=ff6SiynhvVvOfZduexM7lFjBX6z1pDmzlOXqjXlz5QqaecoX9+T9MWyiymViAGwgoB8bDgn3ELpGTvwB54osJmNftPT5OY7YJMLkPdROR84m/7yqOKQ/BOaz85EgU5Jm9rehw1yr0KA2pnYRdorABlgjrOeGOJhHr47lInBzkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765428762; c=relaxed/simple;
	bh=RLOvS2UOKhVDWh1zsoY1S77ONpx6U33DQqQDH56Gv0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OwyV1VVWGay1cCAGE3uf1u9HjxaDfj0JkSaefeLMvEQaFe84Tb4EUSyw4JSukfCYYG0TXAsuiT2K0UH3hhoKN7202EA7JMEVO4nCKMOTw3fKB1kE9Rt8LfN20d07/rPsW5M3vN24cJZN25jB4igPtJWgyc3pADAjAyfQEZu17qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnlT83BR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnlT83BR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765428760; x=1796964760;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RLOvS2UOKhVDWh1zsoY1S77ONpx6U33DQqQDH56Gv0w=;
  b=NnlT83BRxy503epfGaM9JfDy2VREdDqKbOUp5ITVxkTbCZszNY34PBv3
   IHoLUVe7n2UlSJJ+XgHDFEq1WSzMGEMiaMCnNEEjWUqTWhBAFsNENSBV3
   728UUNSuN+keKFNqKQz6RTIF9nbg/jExOGl4XFldAhsEDsvM+Phk/hLgx
   vnJPEOKg45gbVb4QG2dtmh7DXity4x6TFV55zOXJzIoZC1ciOP7fM4I4O
   W7p74beYwj0WpAulFYr/SnW9vSmdxkLfdtJ6EvzD9EVrL98tqVQpG/S16
   Vcxdj59zPm248UGRu0zFtyEnTPzGfuGeMNTWTLotHntJJXzCgL8zLyQll
   g==;
X-CSE-ConnectionGUID: eeF7PgzUT3y/HKzZu5j8ZQ==
X-CSE-MsgGUID: fmyaQ72fTcilp1/gBpv/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78520053"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78520053"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:52:39 -0800
X-CSE-ConnectionGUID: aMRltlN+Tf67fYkFrg8kcA==
X-CSE-MsgGUID: IU/ixHNnQ4iifOrNOZEJ8g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 20:52:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYfM-000000000uq-3IbC;
	Thu, 11 Dec 2025 04:52:36 +0000
Date: Thu, 11 Dec 2025 05:51:51 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lin Yujun <linyujun809@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] htmldocs:
 ./include/drm/drm_client.h:121: warning: Function parameter or member
 'KABI_RESERVE(1' not described in 'drm_client_dev'
Message-ID: <202512110521.WzYXo1Tx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   423fccda72fc2b78107cc119a1755d968c2c36de
commit: 1658eb12c6b6bbcff49c2e8fa1fc13f32bd45ee4 [3508/3508] drm: drm_client.h: Add kabi_reserve
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110521.WzYXo1Tx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110521.WzYXo1Tx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'top_gain' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function parameter or member 'bottom_outside_gain' not described in 'mpcc_blnd_cfg'
   Error: Cannot open file ./include/linux/backlight.h
   Error: Cannot open file ./include/linux/backlight.h
>> ./include/drm/drm_client.h:121: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_client_dev'
>> ./include/drm/drm_client.h:163: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_client_buffer'
   ./include/drm/drm_atomic.h:246: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state_funcs'
   ./include/drm/drm_atomic.h:347: warning: Function parameter or member 'KABI_RESERVE(1' not described in 'drm_private_state'
   ./include/drm/drm_connector.h:527: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h


vim +121 ./include/drm/drm_client.h

c76f0f7cb546b6 Noralf Trønnes    2018-07-03   68  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   69  /**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   70   * struct drm_client_dev - DRM client instance
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   71   */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   72  struct drm_client_dev {
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   73  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   74  	 * @dev: DRM device
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   75  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   76  	struct drm_device *dev;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   77  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   78  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   79  	 * @name: Name of the client.
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   80  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   81  	const char *name;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   82  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   83  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   84  	 * @list:
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   85  	 *
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   86  	 * List of all clients of a DRM device, linked into
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   87  	 * &drm_device.clientlist. Protected by &drm_device.clientlist_mutex.
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   88  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   89  	struct list_head list;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   90  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   91  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   92  	 * @funcs: DRM client functions (optional)
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   93  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   94  	const struct drm_client_funcs *funcs;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   95  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   96  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   97  	 * @file: DRM file
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   98  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03   99  	struct drm_file *file;
d81294afeecdac Noralf Trønnes    2019-05-31  100  
d81294afeecdac Noralf Trønnes    2019-05-31  101  	/**
d81294afeecdac Noralf Trønnes    2019-05-31  102  	 * @modeset_mutex: Protects @modesets.
d81294afeecdac Noralf Trønnes    2019-05-31  103  	 */
d81294afeecdac Noralf Trønnes    2019-05-31  104  	struct mutex modeset_mutex;
d81294afeecdac Noralf Trønnes    2019-05-31  105  
d81294afeecdac Noralf Trønnes    2019-05-31  106  	/**
d81294afeecdac Noralf Trønnes    2019-05-31  107  	 * @modesets: CRTC configurations
d81294afeecdac Noralf Trønnes    2019-05-31  108  	 */
d81294afeecdac Noralf Trønnes    2019-05-31  109  	struct drm_mode_set *modesets;
6a9d5ad3af65a1 Thomas Zimmermann 2023-01-25  110  
6a9d5ad3af65a1 Thomas Zimmermann 2023-01-25  111  	/**
84cc4c7aecc4c6 Randy Dunlap      2023-01-30  112  	 * @hotplug_failed:
6a9d5ad3af65a1 Thomas Zimmermann 2023-01-25  113  	 *
6a9d5ad3af65a1 Thomas Zimmermann 2023-01-25  114  	 * Set by client hotplug helpers if the hotplugging failed
6a9d5ad3af65a1 Thomas Zimmermann 2023-01-25  115  	 * before. It is usually not tried again.
6a9d5ad3af65a1 Thomas Zimmermann 2023-01-25  116  	 */
6a9d5ad3af65a1 Thomas Zimmermann 2023-01-25  117  	bool hotplug_failed;
1658eb12c6b6bb Lin Yujun         2024-02-04  118  
1658eb12c6b6bb Lin Yujun         2024-02-04  119  	KABI_RESERVE(1)
1658eb12c6b6bb Lin Yujun         2024-02-04  120  	KABI_RESERVE(2)
c76f0f7cb546b6 Noralf Trønnes    2018-07-03 @121  };
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  122  
4d4c2d89913e2d Noralf Trønnes    2018-10-01  123  int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  124  		    const char *name, const struct drm_client_funcs *funcs);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  125  void drm_client_release(struct drm_client_dev *client);
e33898a20744de Noralf Trønnes    2019-04-03  126  void drm_client_register(struct drm_client_dev *client);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  127  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  128  void drm_client_dev_unregister(struct drm_device *dev);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  129  void drm_client_dev_hotplug(struct drm_device *dev);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  130  void drm_client_dev_restore(struct drm_device *dev);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  131  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  132  /**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  133   * struct drm_client_buffer - DRM client buffer
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  134   */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  135  struct drm_client_buffer {
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  136  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  137  	 * @client: DRM client
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  138  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  139  	struct drm_client_dev *client;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  140  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  141  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  142  	 * @pitch: Buffer pitch
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  143  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  144  	u32 pitch;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  145  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  146  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  147  	 * @gem: GEM object backing this buffer
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  148  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  149  	struct drm_gem_object *gem;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  150  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  151  	/**
a85955568939e2 Thomas Zimmermann 2020-11-03  152  	 * @map: Virtual address for the buffer
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  153  	 */
7938f4218168ae Lucas De Marchi   2022-02-04  154  	struct iosys_map map;
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  155  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  156  	/**
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  157  	 * @fb: DRM framebuffer
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  158  	 */
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  159  	struct drm_framebuffer *fb;
1658eb12c6b6bb Lin Yujun         2024-02-04  160  
1658eb12c6b6bb Lin Yujun         2024-02-04  161  	KABI_RESERVE(1)
1658eb12c6b6bb Lin Yujun         2024-02-04  162  	KABI_RESERVE(2)
c76f0f7cb546b6 Noralf Trønnes    2018-07-03 @163  };
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  164  

:::::: The code at line 121 was first introduced by commit
:::::: c76f0f7cb546b661b5e0ac769850a5c854927f65 drm: Begin an API for in-kernel clients

:::::: TO: Noralf Trønnes <noralf@tronnes.org>
:::::: CC: Noralf Trønnes <noralf@tronnes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
