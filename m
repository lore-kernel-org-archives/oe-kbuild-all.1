Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31178352C39
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769870420; cv=none; b=fv8oa1gfZgqOzOU2bDMJhbsWgCIHj3/j5PKJeEnoOHjbFyaGl3XvTb/HQwAXnB8Efyd0NfWmh7PufkoZHsMXJCcqkibx2R+Z/9+lH8DSLi3ZFn89h5LKq1TlqZI4GU50PEAoFRSCDREz91Bkf9U117LV9iUTBjIc6Pfauc+Zfps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769870420; c=relaxed/simple;
	bh=tY6m/cTYqnUSw7M0k9lA0ClDLspkEF/46elcqujW95U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WTHby6Mx53hb3XO5jMyvEZ9Tf0C9Qa6NXDWoDEZldK6THgmHRpMf4soXNtuzS5EXEDWf8YCtrZRLLIysLenjjdVPOEib7ipSE9X9mRk8P0/+PdkmAiri1+wu06F5INsEWCUT0QjDObep6CsSuPgZyNixkd2XTQDMyHHjZvTcjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oqf98ktD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oqf98ktD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769870418; x=1801406418;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tY6m/cTYqnUSw7M0k9lA0ClDLspkEF/46elcqujW95U=;
  b=Oqf98ktD9wDLOvOMQsiN1i+A8GluLPXqOPXTIOriB3wy8Rzth0itfsQe
   5dBekYsdS5DmKagf0JoeqV9U8MSUnGJ6tWuTYnIkAd1Dry5mhEfkSG8i3
   ndAfg+HKIZAEURyvY7XtHFw27n+nGf0TvdSYhVp/tvXpTR80W7VdgurdK
   OJO841O3famyCkSZ24St5chg0PfiCGJYvrk/VUoz4Ib5A8enrAaxxQCk3
   p+Chb8/o+QHe1n/IirQvj7/oNQyzVfs14YpSth3sje1mrd77jDp+H0a2k
   fxj7JPkFxFBtzg8MNBa4GkLeyxnghWxi8c8g4a/7+10sCZW26iwyDYHxZ
   g==;
X-CSE-ConnectionGUID: wHokJ15wRYSWhdZjx0vTvw==
X-CSE-MsgGUID: oH+YNSG3QDa/MRlorO7nLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73700120"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="73700120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 06:40:17 -0800
X-CSE-ConnectionGUID: 01t269l7QIGP537POWYkuQ==
X-CSE-MsgGUID: LUHQoopKT3a3xt49mmMHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="214025615"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Jan 2026 06:40:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmC8z-000000002i9-3PTf;
	Sat, 31 Jan 2026 14:40:13 +0000
Date: Sat, 31 Jan 2026 15:39:18 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs:
 ./include/drm/drm_client.h:158: warning: Function parameter or member
 'CK_KABI_RESERVE(1' not described in 'drm_client_buffer'
Message-ID: <202601311547.d7sAQWQT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Guixin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: ef314e56b70f4662163f3e1e094bcfa9627674c5 [0/3] anolis: kabi: reserv=
e some space for kABI
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601311547.d=
7sAQWQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311547.d7sAQWQT-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function par=
ameter or member 'bottom_inside_gain' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:109: warning: Function par=
ameter or member 'bottom_outside_gain' not described in 'mpcc_blnd_cfg'
   ./drivers/gpu/drm/amd/include/amd_shared.h:312: warning: Function parame=
ter or member 'prepare_suspend' not described in 'amd_ip_funcs'
   Error: Cannot open file ./include/linux/backlight.h
   Error: Cannot open file ./include/linux/backlight.h
>> ./include/drm/drm_client.h:158: warning: Function parameter or member 'C=
K_KABI_RESERVE(1' not described in 'drm_client_buffer'
>> ./include/drm/drm_atomic.h:244: warning: Function parameter or member 'C=
K_KABI_RESERVE(1' not described in 'drm_private_state_funcs'
>> ./include/drm/drm_atomic.h:345: warning: Function parameter or member 'C=
K_KABI_RESERVE(1' not described in 'drm_private_state'
>> ./include/drm/drm_crtc.h:390: warning: Function parameter or member 'CK_=
KABI_RESERVE(1' not described in 'drm_crtc_state'
>> ./include/drm/drm_crtc.h:1182: warning: Function parameter or member 'CK=
_KABI_RESERVE(1' not described in 'drm_crtc'
>> ./include/drm/drm_plane.h:763: warning: Function parameter or member 'CK=
_KABI_RESERVE(1' not described in 'drm_plane'
>> ./include/drm/drm_connector.h:327: warning: Function parameter or member=
 'CK_KABI_RESERVE(1' not described in 'drm_hdmi_info'
>> ./include/drm/drm_connector.h:391: warning: Function parameter or member=
 'CK_KABI_RESERVE(1' not described in 'drm_monitor_range_info'
   ./include/drm/drm_connector.h:532: warning: Enum value 'DRM_MODE_COLORIM=
ETRY_COUNT' not described in enum 'drm_colorspace'
>> ./include/drm/drm_connector.h:827: warning: Function parameter or member=
 'CK_KABI_RESERVE(1' not described in 'drm_display_info'
>> ./include/drm/drm_connector.h:1349: warning: Function parameter or membe=
r 'CK_KABI_RESERVE(1' not described in 'drm_connector_funcs'
>> ./include/drm/drm_connector.h:1906: warning: Function parameter or membe=
r 'CK_KABI_RESERVE(1' not described in 'drm_connector'
>> ./include/drm/drm_writeback.h:100: warning: Function parameter or member=
 'CK_KABI_RESERVE(1' not described in 'drm_writeback_connector'
>> ./include/drm/drm_modeset_lock.h:77: warning: Function parameter or memb=
er 'CK_KABI_RESERVE(1' not described in 'drm_modeset_acquire_ctx'
>> ./include/drm/drm_modeset_helper_vtables.h:1514: warning: Function param=
eter or member 'CK_KABI_RESERVE(1' not described in 'drm_mode_config_helper=
_funcs'
   Error: Cannot open file ./include/linux/hdmi.h
   Error: Cannot open file ./include/linux/hdmi.h
>> ./include/drm/ttm/ttm_resource.h:180: warning: Function parameter or mem=
ber 'CK_KABI_RESERVE(1' not described in 'ttm_resource_manager'
   Error: Cannot open file ./include/linux/host1x.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
   Error: Cannot open file ./include/linux/vga_switcheroo.h
--
   Error: Cannot open file ./include/linux/ethtool.h
   Error: Cannot open file ./include/linux/net.h
   Error: Cannot open file ./include/linux/net.h
   Error: Cannot open file ./include/linux/skbuff.h
   Error: Cannot open file ./include/linux/skbuff.h
>> ./include/net/sock.h:557: warning: Function parameter or member 'CK_KABI=
_RESERVE(1' not described in 'sock'
   Error: Cannot open file ./include/linux/etherdevice.h
   Error: Cannot open file ./include/linux/etherdevice.h
   Error: Cannot open file ./include/linux/netdevice.h
   Error: Cannot open file ./include/linux/netdevice.h
   Error: Cannot open file ./include/linux/phy.h


vim +158 ./include/drm/drm_client.h

c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  127 =20
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  128  /**
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  129   * struct drm_client=
_buffer - DRM client buffer
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  130   */
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  131  struct drm_client_bu=
ffer {
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  132  	/**
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  133  	 * @client: DRM cli=
ent
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  134  	 */
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  135  	struct drm_client_d=
ev *client;
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  136 =20
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  137  	/**
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  138  	 * @pitch: Buffer p=
itch
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  139  	 */
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  140  	u32 pitch;
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  141 =20
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  142  	/**
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  143  	 * @gem: GEM object=
 backing this buffer
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  144  	 */
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  145  	struct drm_gem_obje=
ct *gem;
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  146 =20
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  147  	/**
a85955568939e2 Thomas Zimmermann 2020-11-03  148  	 * @map: Virtual address=
 for the buffer
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  149  	 */
7938f4218168ae Lucas De Marchi   2022-02-04  150  	struct iosys_map map;
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  151 =20
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  152  	/**
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  153  	 * @fb: DRM framebu=
ffer
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  154  	 */
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  155  	struct drm_framebuf=
fer *fb;
ef314e56b70f46 Guixin Liu        2024-08-26  156 =20
ef314e56b70f46 Guixin Liu        2024-08-26  157  	CK_KABI_RESERVE(1)
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03 @158  };
c76f0f7cb546b6 Noralf Tr=C3=B8nnes    2018-07-03  159 =20

:::::: The code at line 158 was first introduced by commit
:::::: c76f0f7cb546b661b5e0ac769850a5c854927f65 drm: Begin an API for in-ke=
rnel clients

:::::: TO: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
:::::: CC: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
