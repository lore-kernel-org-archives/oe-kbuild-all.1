Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556752;
	b=AA4Kw+WJeyXl91NtmZ9xwX13gn/6K+No+dsKS4bPSNFCLwbSZwAxLHcZwUrEbZvPSLMB
	 TyL9mvQ7FAZ5+X0rJ8NHjCDoO1w/rY+TMEuSdFgThJh9Qil+Y6xOj1w0x9xjjITX0etdB
	 qtSKYT//37r4k+EdE2TtflX6XYXcUVSw4yIIq3seJj0Z3wgGdxCoingPSLkQQlyEY9iXK
	 0IUchWJCrAwJUMc8ZhuTvnSJHFRQo8vEGwRFmTaaSCSJ8XNIRW38Jag0zp0GwyJu/JgsM
	 itW0JgANLxl6YNcqKBGWKeBAGEnAAxneq4X1aCncdnPu6IzcERCKwmT+aWWfWoWznJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556752;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UFSKrAVOLA1wEpTJoIDIGEDNkgB/EG9yWn5pjWxJXkY=;
	b=3+6w9tb1JWl2vEfFXqTX2Q2zMzY5FZ4F7huO7vjiRP+xJrWHVrvi1SbXdhjdHzpDTxyO
	 CB8uryhQpuMXYSay+1r8bCf6YcEG26wKdnvu5mSl+zh9wFnT8t9uST6UZzAhcVKJDMAwb
	 3jIhcDdzyX85N8k8SdLKnnRj7w2i49ud6LODwra4fNHUkSSQVVF3GCGLpAL6wuUGpK+Od
	 3HYGT5BgkI3od/pXSWLa3fwa4aQUi0SNpGWQZ561yjk+pVo/jMgu1QdEbSrKaZFdhK+L1
	 a+lO5Do9Zm5aAjkQKWcRKmp8ReMyd0FS2zxVRjKbYTOe5Rb1U1Yk8olg6o8rrzrjQlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYQOK5O+;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750DE606A319
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 04:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750DE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PYQOK5O+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792556750; x=1824092750;
  h=date:from:to:cc:subject:message-id;
  bh=qf8jMqBzZXTPgY+3Fb5JgnJfv5kG5G8lrQNDMdfR9I4=;
  b=PYQOK5O+aKUxjLyxYgMTmu/H05WDT+/Hr+MnMtn7pvQTYgprMlQ/kcTK
   llaLEyKKLKFwqVvXfzN52PnB+mHjBG6WyljAZ0H2vu4u9mGiTQOz5YmgL
   CvwNOA7QxvpHwfBZSBT+9fiX9EE1sr9P0Z5xZSytFENEGXCAwIsy1My2r
   clkec67ZV+uiCclZSLe6lsjFklPxJ2kHB4lYojRFCBmrDR61GQ1D8O/g1
   jbLfhcWWrz7ZDEKzPNLWfE5QvdN3IibFp0Aks4ADthu8cfnKRiZVhqlp+
   bTuAlMPo91rqm4Pz/1W9+UuU0sfnNcBxG4Q5yw/WTr4ER3h1f9Ugqa5VS
   w==;
X-CSE-ConnectionGUID: 2F8EXrf+TMaKFx9XEaBMJg==
X-CSE-MsgGUID: xhqaDhWDRuS6ciV05MU7MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1176996"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1176996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 21:25:50 -0700
X-CSE-ConnectionGUID: pjtnv2qdQHeV7YsRiYtyTg==
X-CSE-MsgGUID: lmst17+kRHO4o8jb6HDGpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2929807"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Oct 2026 21:25:49 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJNta-000000006dP-0xdS;
	Wed, 21 Oct 2026 04:25:46 +0000
Date: Wed, 21 Oct 2026 06:25:25 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Tzung-Bi Shih" <tzungbi@kernel.org>
Subject: drivers/firmware/coreboot/coreboot-cfr.c:343:5-11:
 inconsistent IS_ERR and PTR_ERR on line 344.
Message-ID: <202610210637.LiJ3U0ob-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72a16bcff25e9f4a1d6d42a243301b1b76db2f32
commit: f2e05ce9763feb1dd7da15afd2cc61df227ee85a firmware: coreboot: Add CFR firmware attributes driver
date:   3 weeks ago
config: i386-randconfig-r2106-20261021 (https://download.01.org/0day-ci/archive/20261021/202610210637.LiJ3U0ob-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f2e05ce9763f ("firmware: coreboot: Add CFR firmware attributes driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210637.LiJ3U0ob-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/coreboot/coreboot-cfr.c:343:5-11: inconsistent IS_ERR and PTR_ERR on line 344.

vim +343 drivers/firmware/coreboot/coreboot-cfr.c

   335	
   336	static int coreboot_cfr_read_value(const struct coreboot_cfr_setting *setting,
   337					   u32 *value, u32 *attrs)
   338	{
   339		efi_char16_t *efi_name __free(kfree) =
   340			coreboot_cfr_efi_name(setting->name);
   341		int ret;
   342	
 > 343		if (IS_ERR(efi_name))
 > 344			return PTR_ERR(no_free_ptr(efi_name));
   345	
   346		ret = efivar_lock();
   347		if (ret)
   348			return ret;
   349	
   350		ret = coreboot_cfr_read_efi_value(efi_name, value, attrs);
   351		efivar_unlock();
   352	
   353		return ret;
   354	}
   355	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
