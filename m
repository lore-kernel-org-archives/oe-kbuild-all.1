Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53732375F82
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534192; cv=none; b=b7UTpW0Izh/vAlRzlJR/2fEMH1SI7S1hc2Yl1r20AhfWyogRTblHb4RntzgxGWWttJ7oaM5xo77umWPcdLw3YO/IJye7Z6yENYYHmR59AJ1Nr1i1BE7sMX+9WdNrOWAIXTmzDkWA32599UltgcYzarZ577eb3WkvI0gDZyrQKSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534192; c=relaxed/simple;
	bh=5woZww5lSHTa9ykIeUYOI3sZGJfBJaxsZcLXya4IYCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fPuSLpHniQWDf8jneBX+C5Q/T580f3JV4BRXw4c8QIoQM92cJJ156ddhSBQZ6vknlRnkdIJfU6ZO7gh4020I9IUeyxyg4//DzRHpDpo7r20N+BTgUiq90eVGNxyirLrvRiZqLr37m0vC/X60MR21n65+q/ilJwBCJbmB6///ws4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4IaOpX9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4IaOpX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534192; x=1807070192;
  h=date:from:to:cc:subject:message-id;
  bh=5woZww5lSHTa9ykIeUYOI3sZGJfBJaxsZcLXya4IYCA=;
  b=I4IaOpX9zULHue8eicdWzuaKQ7ZhxBZMPO4hFNuC6x9G7lBaM7sE6y7u
   sYrjlNze129Th7E/Nsbc6Sq9Nuyhwr/axEsg2aQyv0KDPMVJtnl0jSHiE
   ObvQGSlZYfvKSjnBqMwqeye6M5XCSApS0k+jPFLA3YsHMNb2z9sjVO4ay
   fSQ8wEyOERfTa34S6qRLOBTV+G2XioXIi0O3tVfQzKP0VS1X99Uiyj9iE
   04CrZ9wVutzrHOu+x4thtUvMj0ZIGW1NgreP6eWJxHjXYLxZsjVdfg4ez
   2JhiQt5zO1ZBupHV5yI9WCSTWmX5i5g6mIo8R1YrT2WVZl5UDD4apwldI
   A==;
X-CSE-ConnectionGUID: 3gr2TRIAR1uZgpigTvNj/A==
X-CSE-MsgGUID: 1BeCvt4OTHubkggdLL7R6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87563832"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87563832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:56:31 -0700
X-CSE-ConnectionGUID: dKXOKh5rQFe6EsTfVV1O8w==
X-CSE-MsgGUID: R/nzbQabSZiI18A3lzzFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232926700"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 20:56:29 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xY8-0000000004n-0PDm;
	Tue, 07 Apr 2026 03:56:24 +0000
Date: Tue, 07 Apr 2026 11:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10571/12133]
 sound/core/control.c:1317:50: sparse: sparse: restricted snd_ctl_elem_iface_t
 degrades to integer
Message-ID: <202604042022.ne7YldVo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
commit: 0542972950ef26670a5696e43c0ea2b7b6ac96d4 [10571/12133] Merge branch 'for-linus' into for-next
config: s390-randconfig-r134-20260404 (https://download.01.org/0day-ci/archive/20260404/202604042022.ne7YldVo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604042022.ne7YldVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604042022.ne7YldVo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/core/control.c:959:17: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:959:26: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:960:17: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:960:26: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:979:48: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:1007:41: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
   sound/core/control.c:1118:34: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer
>> sound/core/control.c:1317:50: sparse: sparse: restricted snd_ctl_elem_iface_t degrades to integer
   sound/core/control.c:1745:40: sparse: sparse: restricted snd_ctl_elem_type_t degrades to integer

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
