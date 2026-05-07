Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2903033C6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 21:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188483; cv=none; b=kDbnkOQsqtooPswiUK3xLFCSTvyT5M6udS6jiyNlRAO5Kg+DdrlMiu38DcAe1YxWGLYkJZkGabqrMD/Yl7C9GVqwmYdwofoiJEXOSdfdQU7hZqpqVOcr+VcF1VXpjUyrC6nVlN5ytjJQJ55neCMBK3Jz7YvnpjlXIpyT0/hBQDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188483; c=relaxed/simple;
	bh=iAUxQlFfYvOxhn/MSLP7Daq7XHPE06lyzkGVBrzD2/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GWGv5F9WY4t6MA4j/cyOc6vwcWJ6mjPGMwMXwuINHNovodbiD/I0rBIun1tTSl1BT6gPd8BFfmyZyJ7/GMVCryjxpw9UVcVSoc41mNDOt2c0RjpzlPPmpu8WixJtGAy3DA0cZnWU1z3rhcVOLiiyRHPSH9w3qUJgpKa0pQdHFx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcGV1m+k; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcGV1m+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778188481; x=1809724481;
  h=date:from:to:cc:subject:message-id;
  bh=iAUxQlFfYvOxhn/MSLP7Daq7XHPE06lyzkGVBrzD2/c=;
  b=BcGV1m+kaW+qHh1gYncOJvNtOcDzEmOtHHaE6GlrU5tXepkDAwetquJc
   Kxzmcg9EamC/Fx1ZOgLA0Y1mZM3BRAozhJSTKa8kx+TC9J7p1KtNGRUjr
   uhhXmtWKQPY0LY48UrutuvfUWe29RWhIlgrkOg+XvWjL/ZjvkKSaoP2DW
   15e2h4YzLuZjWP+FCNESKbnRVoFVpmFX40//mKD9/rOXWZEEkmgq6yFJT
   rl9FGhwlF5RH9avBNzFiGvCJFEcJlp/NqPOfAjJXeLaT43hFk+Rlc3Guc
   ZBr4nrSAq8yKfTLI9uK3Pc8MZnT1GkMWtUEcFwqoQ6Tn6CLtZ711OLScr
   g==;
X-CSE-ConnectionGUID: h0M+QmKHT96Celo4csQl5Q==
X-CSE-MsgGUID: 6Q1/yze6RTST3kw2E6jpPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90531681"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="90531681"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 14:14:40 -0700
X-CSE-ConnectionGUID: l0Zj863mQc+jQjGEnQwJeA==
X-CSE-MsgGUID: w63odDOORPK2Iy3J1yrbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="230181876"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 14:14:39 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL63I-000000000Rv-39od;
	Thu, 07 May 2026 21:14:36 +0000
Date: Fri, 08 May 2026 05:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/core/control.c:1317:50: sparse: sparse: restricted
 snd_ctl_elem_iface_t degrades to integer
Message-ID: <202605080539.maGqNAAY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab992f815d6736b5c7a6f5fd7bfe7bc106bb3dc
commit: 0542972950ef26670a5696e43c0ea2b7b6ac96d4 Merge branch 'for-linus' into for-next
date:   5 weeks ago
config: x86_64-randconfig-r134-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080539.maGqNAAY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080539.maGqNAAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0542972950ef ("Merge branch 'for-linus' into for-next")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080539.maGqNAAY-lkp@intel.com/

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
