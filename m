Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF707A930
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771668966; cv=none; b=Hpb6WlpsuGDY8FFMtjHmLkMA08yANNqU96PpRXCOGaRDQbhFsBCl3i4hmnmhmyCZDtmi4Thc7SoN/9T/xbkDOFrQ2XUMJF1qtBbUcuyfarXdzqa1M9S0c6uHURNjTDt4kai3ImLS7o+mLiuK/wdOLIwO+w5iQOJAqGfmqHfG5Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771668966; c=relaxed/simple;
	bh=yFdCavry5PctEPscIlCrnI2NPKjjBCBpfJbc1yqguFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VyVC1jh/9URCyhBolnKvNtLWiCBO6vQ4r/L8icgOaZr4xOfWk6ffsL3jbt5noGjkyfOmKoztVax2xj6fpvEF3kquH/1ICtcKXPzAcw9civgsG9ywO9JptMcU1OokvBfH4gqTTpbIwrcik5a4k3V/mz+QOwfkEhIz77LmWbvETwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zoe5gfWW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zoe5gfWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771668964; x=1803204964;
  h=date:from:to:cc:subject:message-id;
  bh=yFdCavry5PctEPscIlCrnI2NPKjjBCBpfJbc1yqguFI=;
  b=Zoe5gfWWVzET29/yAUzvlqBg2X/hmwFl2CBUK0zaSbJBgNA4Nw585vdv
   3izhCPaHTQHPxOuGPOr3hCAuGVKd+Jc2V9oia/Xg9BQnw92hwwCbZXTGm
   fZC9/JvXsKe+QrrfaNAbo58vq/mn9QYkE1Vp7UcKAKRo+WGjAg0N2Lhd0
   mg1+/bQfzjCyjDCUxHjyKcJDQ5ZcFfjihpxssaNum9Zpwc4pw7BPw+kzR
   3gP027PngyDDPjVoEZXcPDQKaQWeHkieLra+NKo9Ijzf6KtupJHiGXDQf
   y2ERNEdnTcXlvFXeKzAJuH1TRITLSAZ4i/b3MUGEJ7KD6eH0eQnFmMhXQ
   A==;
X-CSE-ConnectionGUID: yVrKcF4uTlaeUvIcDsMdIQ==
X-CSE-MsgGUID: kMYM1RfyRGiMYApDcfb7+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="75355312"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="75355312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 02:16:03 -0800
X-CSE-ConnectionGUID: stRrm90/S0ycI0zjl0EspA==
X-CSE-MsgGUID: LB9dMUzHSfmYRt87guGngQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="252780082"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Feb 2026 02:16:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtk1n-000000014qQ-36ap;
	Sat, 21 Feb 2026 10:15:59 +0000
Date: Sat, 21 Feb 2026 18:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:for-620 4/15] ERROR: modpost: "__bitmap_weighted_or"
 [drivers/gpu/drm/xe/xe.ko] undefined!
Message-ID: <202602211811.cz6jvQkW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux for-620
head:   3b794289e60f9e1cc26d239bef32c93543213772
commit: 6896e9b54347a00f1804adb8c91cdc6970a69b2f [4/15] xe_eu_stall.c: use bitmap_weighted_or()
config: s390-randconfig-002-20260221 (https://download.01.org/0day-ci/archive/20260221/202602211811.cz6jvQkW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211811.cz6jvQkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211811.cz6jvQkW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bitmap_weighted_or" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
