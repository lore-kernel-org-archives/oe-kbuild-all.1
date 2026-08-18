Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A233344A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787034592; cv=none; b=E3sl2tVl3FiCMkTtSfTOYhVek24uaRTgEpX/gcCld2arqLMFc64VfS/rUqc1epZgKCE2TV/f9mGS/4d+veKKORU8wcECKp+IIkrYNkSbkS/RxOTThGD874ZZkiNf4FzYrocwQm7Q6cPiz/2NA/77DRKJXVU9m9ToayBz5pX+7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787034592; c=relaxed/simple;
	bh=kE+qS0XsQEwf/JCsfq2hHvrlqdOXdYs0PMgi7s9mVqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d9SYFyM3+XvLnxp0AfdXoS1Kf4elbxu7NosomkEzMG+FqnYeiDSrnR1Ny88ymjYCoF/IBH0Jmc/DN4cW9mJFa0e9jaXzkzFZwgNP13CqZw3jx/3agM0vkGhhxAad0/zutWmwBhLWOG86AKy2PiTpQ3WuU1HIBB/4j2JawUWOnRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvVKZBED; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvVKZBED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787034591; x=1818570591;
  h=date:from:to:cc:subject:message-id;
  bh=kE+qS0XsQEwf/JCsfq2hHvrlqdOXdYs0PMgi7s9mVqI=;
  b=BvVKZBED+stSDFUnGzF5PKhlPSb4/IMq993uJ4+cr46YMh4tVSX2+2gQ
   ldw7slcJGV9GyIela7GiOzkU1UNcSJNS1qgBLqOgELu3GSPMA4ImpbAik
   Xm6d4zNn9gJ2Tb5pWitpwtRe0BPx4/F3TqiSCxOFlIn4tYg9/Zy3T0yMB
   0G6QDULI1yx+R6Rz5eq+3w2uV03kYFoYStXboyjDd5OVbpo2Zqtfs6Lsb
   w74hsY6dFpP7lIipfes6Ra0LeJQRvLK9cXtH88HHii8ZJcStsxnUOh1Ml
   90sEF3A3KHha8XBhtbCJ5IOt1WIdGRmMH91+Oy4MWx4wKQTbRGr12BRiO
   w==;
X-CSE-ConnectionGUID: FjYr9+aARs67JURZn8foQQ==
X-CSE-MsgGUID: glAtysMpQ6qYg55ZxTKuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87372879"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87372879"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 23:29:51 -0700
X-CSE-ConnectionGUID: 4fWlCROsQje+QWha0TEkhQ==
X-CSE-MsgGUID: ZZJOMublQNyv9ZTnu/XUzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261850877"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Aug 2026 23:29:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwDKU-00000000e9k-2tR2;
	Tue, 18 Aug 2026 06:29:46 +0000
Date: Tue, 18 Aug 2026 14:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1201 2/2] ERROR: modpost:
 "bch2_printbuf_exit" [fs/bcachefs/alloc/backpointers_test.ko] undefined!
Message-ID: <202608181403.ZOroPVIA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1201
head:   e113faba0d5cdf92b15c1680632417bdc6666a2c
commit: e113faba0d5cdf92b15c1680632417bdc6666a2c [2/2] bcachefs: add kunit tests for backpointer to_text
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181403.ZOroPVIA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181403.ZOroPVIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181403.ZOroPVIA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x1ac (section: .text) -> is_static_object (section: .init.text)
>> ERROR: modpost: "bch2_printbuf_exit" [fs/bcachefs/alloc/backpointers_test.ko] undefined!
>> ERROR: modpost: "bch2_backpointer_to_text" [fs/bcachefs/alloc/backpointers_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
