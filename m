Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EA52C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 06:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772517952; cv=none; b=tfoPhcPfZnxT6/jGY1cK5qvUiU3qBfvl5kQrFHqYGHgjBh6KSfnC0CIrwuGClPWgNR/rO1sljtGTvzydNLsCghnS74pdVVjwpZhT/xL8tEB7uFYidZqIKkmQajaB5ral1egLITW7fi7Ko49GDAqVQbmWBwsH8eDrn9VBRHa59yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772517952; c=relaxed/simple;
	bh=xzoC9afv6lSlh7HzvGor2t5Gb18aErMB0CXAAkL8v/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fkDNoG7BdI0CoDuVmK1F8n/gOjYDSJxjoLLPpVblBuMCzIB39YHdHcSpQqqSK9yUf3F0BUjwPq2lDNYxUfEdeDfsFR+v4O/YGjFuuLEfVz6Nl8oCcXdQDRoe6byYyq8m1lB1LBvyf3pOjsCgBmz+LxFp2yPfS0P+VDH95e18m0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHLLEpj1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHLLEpj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772517950; x=1804053950;
  h=date:from:to:cc:subject:message-id;
  bh=xzoC9afv6lSlh7HzvGor2t5Gb18aErMB0CXAAkL8v/A=;
  b=iHLLEpj17dEg+lkWHYuRMjU7Xo7yAA2D/+JazrOakOcLtfuSfPSoqLT6
   1E9ihe54WQnpj7Esgqd4x1J2tY5IY58ykXFJfBng+CL2y/dgn9EqjfiNY
   /pWZzv8XMCR4KPMu+NB9ug3/ku3cAxNxNee4lzWvM47QRWYQw5Yd7qSrr
   7+LgRbZXehxNUJp5n10SbIGE73RQsiJsSQ2PKXKwiyNV4zZG6oKJecNQ5
   dpaRV+X0hKXG3HkwRXOrZWI+6IphiEVFtEQXBz0aXQff38sgBXfA0obDW
   PBKKkZoCSY9o3Q2GUcENdwXsmfTX5aRzgKyuvoq+JRb5y3ZOHZZa1PnZ5
   g==;
X-CSE-ConnectionGUID: zkgSrIeBQeqwwuYuQB2CPQ==
X-CSE-MsgGUID: b4edQnpUTCKZtgok6hLOiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72738739"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="72738739"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 22:05:49 -0800
X-CSE-ConnectionGUID: PNL5Hq3UR86CWvDm4o24JQ==
X-CSE-MsgGUID: iPlKUJPTR26OFMxftNO64w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="248379640"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2026 22:05:48 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxIt7-000000001mb-0Xff;
	Tue, 03 Mar 2026 06:05:45 +0000
Date: Tue, 03 Mar 2026 14:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2914/2966] sound/core/control.c:1317:50:
 sparse: sparse: restricted snd_ctl_elem_iface_t degrades to integer
Message-ID: <202603031434.kdkY7f1u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d517cb8cea012f43b069617fc8179b45404f8018
commit: 010febefdad8d1ceaaf1b8d1edf4d1d9a13f4606 [2914/2966] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
config: x86_64-randconfig-123-20260303 (https://download.01.org/0day-ci/archive/20260303/202603031434.kdkY7f1u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031434.kdkY7f1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031434.kdkY7f1u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/core/control.c:396:11: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long h @@     got restricted snd_ctl_elem_iface_t const [usertype] iface @@
   sound/core/control.c:396:11: sparse:     expected unsigned long h
   sound/core/control.c:396:11: sparse:     got restricted snd_ctl_elem_iface_t const [usertype] iface
   sound/core/control.c:959:17: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:959:26: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:960:17: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:960:26: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:979:48: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:1007:41: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:1118:34: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
>> sound/core/control.c:1317:50: sparse: sparse: restricted snd_ctl_elem_iface_t degrades to integer
   sound/core/control.c:1745:40: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c: note: in included file:
   sound/core/control_compat.c:186:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [assigned] err @@     got restricted snd_ctl_elem_type_t [usertype] type @@
   sound/core/control_compat.c:186:21: sparse:     expected int [assigned] err
   sound/core/control_compat.c:186:21: sparse:     got restricted snd_ctl_elem_type_t [usertype] type

vim +1317 sound/core/control.c

84446536f63d47 Cezary Rojewski 2026-02-24  1285  
84446536f63d47 Cezary Rojewski 2026-02-24  1286  static int snd_ctl_put_verify(struct snd_card *card, struct snd_kcontrol *kctl,
84446536f63d47 Cezary Rojewski 2026-02-24  1287  			      struct snd_ctl_elem_value *control)
84446536f63d47 Cezary Rojewski 2026-02-24  1288  {
84446536f63d47 Cezary Rojewski 2026-02-24  1289  	struct snd_ctl_elem_value *original = card->value_buf;
84446536f63d47 Cezary Rojewski 2026-02-24  1290  	struct snd_ctl_elem_info info;
84446536f63d47 Cezary Rojewski 2026-02-24  1291  	const char *iname;
84446536f63d47 Cezary Rojewski 2026-02-24  1292  	int ret, retcmp;
84446536f63d47 Cezary Rojewski 2026-02-24  1293  
84446536f63d47 Cezary Rojewski 2026-02-24  1294  	memset(original, 0, sizeof(*original));
84446536f63d47 Cezary Rojewski 2026-02-24  1295  	memset(&info, 0, sizeof(info));
84446536f63d47 Cezary Rojewski 2026-02-24  1296  
84446536f63d47 Cezary Rojewski 2026-02-24  1297  	ret = kctl->info(kctl, &info);
84446536f63d47 Cezary Rojewski 2026-02-24  1298  	if (ret)
84446536f63d47 Cezary Rojewski 2026-02-24  1299  		return ret;
84446536f63d47 Cezary Rojewski 2026-02-24  1300  
84446536f63d47 Cezary Rojewski 2026-02-24  1301  	ret = kctl->get(kctl, original);
84446536f63d47 Cezary Rojewski 2026-02-24  1302  	if (ret)
84446536f63d47 Cezary Rojewski 2026-02-24  1303  		return ret;
84446536f63d47 Cezary Rojewski 2026-02-24  1304  
84446536f63d47 Cezary Rojewski 2026-02-24  1305  	ret = kctl->put(kctl, control);
84446536f63d47 Cezary Rojewski 2026-02-24  1306  	if (ret < 0)
84446536f63d47 Cezary Rojewski 2026-02-24  1307  		return ret;
84446536f63d47 Cezary Rojewski 2026-02-24  1308  
84446536f63d47 Cezary Rojewski 2026-02-24  1309  	/* Sanitize the new value (control->value) before comparing. */
84446536f63d47 Cezary Rojewski 2026-02-24  1310  	fill_remaining_elem_value(control, &info, 0);
84446536f63d47 Cezary Rojewski 2026-02-24  1311  
84446536f63d47 Cezary Rojewski 2026-02-24  1312  	/* With known state for both new and original, do the comparison. */
84446536f63d47 Cezary Rojewski 2026-02-24  1313  	retcmp = memcmp(&original->value, &control->value, sizeof(original->value));
84446536f63d47 Cezary Rojewski 2026-02-24  1314  	if (retcmp)
84446536f63d47 Cezary Rojewski 2026-02-24  1315  		retcmp = 1;
84446536f63d47 Cezary Rojewski 2026-02-24  1316  
84446536f63d47 Cezary Rojewski 2026-02-24 @1317  	iname = snd_ctl_elem_iface_names[kctl->id.iface];
84446536f63d47 Cezary Rojewski 2026-02-24  1318  	trace_snd_ctl_put(&kctl->id, iname, card->number, ret, retcmp);
84446536f63d47 Cezary Rojewski 2026-02-24  1319  
84446536f63d47 Cezary Rojewski 2026-02-24  1320  	return ret;
84446536f63d47 Cezary Rojewski 2026-02-24  1321  }
84446536f63d47 Cezary Rojewski 2026-02-24  1322  

:::::: The code at line 1317 was first introduced by commit
:::::: 84446536f63d471ab16b2faa25eeab1df21ace0a ALSA: control: Verify put() result when in debug mode

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
