Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE16A359A81
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 23:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791417049; cv=none; b=XhVSY4QtkJ5z34xDG8eTgDFCEJYeDF/PmF76C7Ycys4CnxP1A1zx25UeAiPTn0Bje+lDV14uyzbkIX38MTY939yZuqCuPM72SGRxgAhUANgmSZurxbUTOM/Eg7ZiTXt6jPJ24Z+l4PeieyMolUqxbPqhVb/v7vWvlhBBJApGklQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791417049; c=relaxed/simple;
	bh=/HKfd0ky2DSkNBiWY/Vs9Rktwu5AD0z3rrHoNFYnUKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RsZSOnz/kp+DjN9nHpP4+CrY8Ljwqp0E618DsPsXePxV/iPWbwGK3mXAhEtzLjGSHC3QT7WNOT8yU9Py1JK3J98Qxx0cTyPyllxDSopiSa1jvoWomig4o63eywRhYr++q6bEeJNj01ToYazxLIaKQGGlsz5OGktJW3dOmdYikHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcInnIGr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcInnIGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791417049; x=1822953049;
  h=date:from:to:cc:subject:message-id;
  bh=/HKfd0ky2DSkNBiWY/Vs9Rktwu5AD0z3rrHoNFYnUKY=;
  b=WcInnIGrIqtbu5T7wRyEfoVZ8fhI2k+rb2zvb3zMvkHE2YgJzjkyo2sA
   3xbBqTbvVBRLSrCCa55pvm3EM3AYbPuOJrKoJEWcnIzThMOehtCJDTxqd
   wUTIHiD3Vt7i3qg4IQWqPk/qNkom8pjy69b0KP3VrSnsoofn8X8cdZT8Z
   GtKkGDNqvVJHkapNH3gwm/CqhdJLA3tzWpn8AFKADoBTDMaXnL2mXopzK
   YCupjrcUg8OQjeU2QRAzjZgw7JeCYD3d9ohUYejOS740Tap7NzTSXqvQY
   /Hb0Qe4sdgRNG3PZMklxHnxuYLOrcYTkW7oMKbhd+fQP+Qy3E0fIip+oo
   Q==;
X-CSE-ConnectionGUID: 92bNNsMeTGimSL9nigwyOg==
X-CSE-MsgGUID: F6yvKyOfRC6d8pdGHzSYZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="186029"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="186029"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 16:50:48 -0700
X-CSE-ConnectionGUID: 7KkbgAByQ1SKoDxACqVIcQ==
X-CSE-MsgGUID: O5cFM80KRdGTK1psQO5sPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="285673729"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2026 16:50:47 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEbPI-000000004Jn-3zuF;
	Wed, 07 Oct 2026 23:50:44 +0000
Date: Thu, 08 Oct 2026 01:50:17 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:mlp 58/59] undefined reference to
 `sock_from_file'
Message-ID: <202610080139.TegH9UHO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux mlp
head:   cb749145988a07c430f0cc8004d3d40b4227fe1f
commit: 54493c2a59093e36a0f02fec2073203cd83bfb10 [58/59] epoll: Prefetch the ready items' files, sockets and socks ahead of delivery
config: alpha-randconfig-r2307-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080139.TegH9UHO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080139.TegH9UHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080139.TegH9UHO-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: fs/eventpoll.o: in function `ep_send_lookahead_step':
>> (.text+0x8e0): undefined reference to `sock_from_file'
>> alpha-linux-ld: (.text+0x8e8): undefined reference to `sock_from_file'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
