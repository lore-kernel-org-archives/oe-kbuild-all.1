Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503933C2761
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 22:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216819; cv=none; b=KqFXUQGHpXwLtZirthBV4B6RlzF5rhqMSNKw5h5XghCOq2PAhON6E+bLwhjDoLcHg9Cj5mqQ3SbNCc9zHll5qQnS0mIKs254IIGsPLS35YuvSckD4SAc1K1x/dVeKPP/CC3LN5qCI/l3Ee0XTequ51kssQEaX1EbIPswDKjXfAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216819; c=relaxed/simple;
	bh=AtR8f6sEcPs4jejGOIaf0MFvrVghVbzME4/6I6rMiug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QVDo0AIebMTmNMkDYkBcWfsy24vNRnL+eHVc/HdHkJjRVoL3R2cJKBHE8u35/wsswhXYUSrgPgZQeE/Fe60LrhB53wYORRO0WI121bqDPKynjihFjVyfi/arjwZE6Gx+uffBwTFgPcSKpmQmLi6E22cd/fovjdSsg1c+fHB6msg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJ1/cLuk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJ1/cLuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781216814; x=1812752814;
  h=date:from:to:cc:subject:message-id;
  bh=AtR8f6sEcPs4jejGOIaf0MFvrVghVbzME4/6I6rMiug=;
  b=bJ1/cLukcqW3aHyaBgFDPQhUzZWITKvncPDuhTKr0fpDTh51fFsIdVAZ
   MV1DQpCCxAJ6NuFPL1Z5DUdBnr8QGDKD4gb2vZRQ02cUljj6POio1Iwk4
   BFN79MayKEmJM0BVqIQlhThRlvnlXkfB/7SZJi9xmoy3QFx76gZRdDOCZ
   gEWo0Sk+B+xNsa2S4BebehghYk08IZVB/V48ztj49xE09zvKkp1kZVK6m
   sIw8FYTNpzY1G+MrWwh6xd+5vTabMUJ/6r9Be9u4inGL8ArRWl5xG69QJ
   PAtaff9QI7hjB11eqT8HW6JrmbJq3cSrbDs/4aPq6c+UxP0nLO1iCIU8s
   Q==;
X-CSE-ConnectionGUID: gDLc4yPhTsqm5VZAw9s+uw==
X-CSE-MsgGUID: Ooo9cBhoQl2hlg31Hbx10A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82027558"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82027558"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 15:26:54 -0700
X-CSE-ConnectionGUID: JrDhaf8cTiq+ffDz19IWNA==
X-CSE-MsgGUID: zDSsNO7LR+i5PCP/xW3G1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="243691607"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2026 15:26:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXnrN-00000000NwV-3bJh;
	Thu, 11 Jun 2026 22:26:49 +0000
Date: Fri, 12 Jun 2026 06:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/core/control.c:1317:50: sparse: sparse: restricted
 snd_ctl_elem_iface_t degrades to integer
Message-ID: <202606120654.suk2F79G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 0542972950ef26670a5696e43c0ea2b7b6ac96d4 Merge branch 'for-linus' into for-next
date:   2 months ago
config: arm-randconfig-r132-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120654.suk2F79G-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e95871719c41a8de96b438b962ed3b8f869b9e0c)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120654.suk2F79G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0542972950ef ("Merge branch 'for-linus' into for-next")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120654.suk2F79G-lkp@intel.com/

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
