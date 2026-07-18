Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C8207A20
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784368878; cv=none; b=R/4geHISZ7BiQD6ft7kdd07XU9r03/cpdGIZ6xKrxTQ95iglqdfn45RT00EHIaES12Zs4rd6z4JlJZ4z+gxohz/dV7Ho6UTaEmZ6rPqpXAr59prruOMANQTHRx5ywTLCOK01CQbn8za8p7JnwKAv/6gIoOE63um8HhFAVDzmG2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784368878; c=relaxed/simple;
	bh=XVn1hc2A+YRj55Dp96jzHueg1CGNzRiIXMtrV2AHRoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=deaKCUX18BwDuHHYMIswSn3TqEVWtliA5/2dizmQysORV4Le+o6v16UsMFIWtzr0KQ08xHyjqHgX1Zdl4DykTX+PepOqBuNm5f9AUffHtpzZ8yxEXlIyYeIEXcEHeKn4BujJmVii8zFGjyv4MWnwEmSFDg5wKVDErFm/azBiQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhiEKIwZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhiEKIwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784368876; x=1815904876;
  h=date:from:to:cc:subject:message-id;
  bh=XVn1hc2A+YRj55Dp96jzHueg1CGNzRiIXMtrV2AHRoU=;
  b=AhiEKIwZ+Mh6g97zw8ty6UUfr0zQV07soAAcKqP3aflF3MlDl6j30tuh
   mX6LRc1otw79Tqv/yh3zlL3L+nFC5SER/7dj5pqPK49qs3x8MWx+AfA/f
   j8w3xJft/a9r9lzeJszFI09rWK6YMppwy7YJ95Sih89zt0HgJFu66Lahs
   uZ+m3isJ442TbuCfYHihG52usTXhcGt/wvxeJZMhfJoKp7EdcQsG4JR2c
   n7gdzZxt9jtuBnaZsKJskW6WdhddWvGYRLAcKgx/Rz6CssSfjzGaBraZf
   TYj4BDNmFzNW3WZpgVIUotzjh/HjFgV5BUt4SdCJs+OtdNCtpZEuzYUXt
   Q==;
X-CSE-ConnectionGUID: YI07MlkXTROD4gbcSnfqCA==
X-CSE-MsgGUID: YJc9NLNUSwiTeTH0MLabfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="95670835"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="95670835"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 03:01:16 -0700
X-CSE-ConnectionGUID: KzepwLglQ2SAkmIGnaHyrA==
X-CSE-MsgGUID: bJbGsJ/PQrinaiH2FKtFyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="260566888"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 18 Jul 2026 03:01:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl1r5-00000000Tgc-0Pr2;
	Sat, 18 Jul 2026 10:01:11 +0000
Date: Sat, 18 Jul 2026 18:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>
Subject: FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or
 directory
Message-ID: <202607181735.OakDjNCe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ihor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 522397d05e7d4a7c30b91841492360336b24f833 resolve_btfids: Change in-place update with raw binary output
date:   7 months ago
config: parisc-randconfig-r132-20260718 (https://download.01.org/0day-ci/archive/20260718/202607181735.OakDjNCe-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181735.OakDjNCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181735.OakDjNCe-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   Error while encoding BTF.
>> FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
