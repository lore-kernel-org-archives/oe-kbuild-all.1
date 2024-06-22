Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CB748E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 03:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719027037; cv=none; b=hn5Hpv1xLneEVzdM289TFAJ/W9boI2giQKe0f6cu44C5HJfV/bAmMNqvFiAcDyAQY+IS27eV80Y94U66HIV+bkkh4r3HcQ2zTh5YzlIT8qC8M+aRpK9FofpFTtgxhWX0Jz+AbblmLQk53o01lBe7t5IDIFL8X2H9wQlHKLpr6AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719027037; c=relaxed/simple;
	bh=HeaTEkD+CnCZPyCtGwDk3bzzxX6ozhtGX/+0J5kawLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TO09PKqWV1a96LgZ6EszvWKlV7HExSshzMcQloYixTZKZbj1xMtKkIj4RsUpRZjv860E3HQ0pIQuzIN2tMLJOK+SuIxyDv9lIf7owmYUJewbn/oLqD1VhumPF2gdofvjQKfgoCwhVPwn4XMDAkmXvBGww305yw20/3gD3q643H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUUPU1Ha; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUUPU1Ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719027035; x=1750563035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeaTEkD+CnCZPyCtGwDk3bzzxX6ozhtGX/+0J5kawLs=;
  b=XUUPU1HafwtclUeKkRgii06XK6zzeK/NmbaWNX6PECLYoISaJNcOMBOY
   f0u0xqCtHzfvwe4rYfBh0y7ymSWbkYzlmPWH4Qm+13CyrUObpqwoXgu0t
   TQjUq1spkA1VAqADLBFu7qhn1A1wlYXsVM491jlMcqS1s37fsHCC7QPrK
   x3sOs3YtZWQ+3nbJuFXlFAVRvuyApxYwXBV5cZPZ8u0rHJoUymc8CSx3Z
   eTFDR6ESIdiWWN5INO2c1n4CkNQI4YKzgnGms22n2EL5+sNXNAaHhWihm
   bxwtLbr/zXpUWz9MLU2CUBwHPEVTVyZvcNw5CYvmnC/dfET1TNnz7QaW3
   Q==;
X-CSE-ConnectionGUID: CH5Bfh1vTzWF+A7trqXd/w==
X-CSE-MsgGUID: i+bBy98FRUureRT+u83z3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15769054"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="15769054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 20:30:32 -0700
X-CSE-ConnectionGUID: rsgK88h6TTe/fYORUGTjHA==
X-CSE-MsgGUID: YsSw/0wgQWCK6qqprIC7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="43451401"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jun 2024 20:30:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKrSP-0009Gi-0d;
	Sat, 22 Jun 2024 03:30:29 +0000
Date: Sat, 22 Jun 2024 11:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 6/17] zcrx.c:undefined reference to `tcp_recvmsg'
Message-ID: <202406221128.ki4KaTdc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   e1d705ecf1cbeeaa9091d3d2f0504acfbb18475f
commit: a7542a0bfa7ee95a543b0dd9a781a0876f480270 [6/17] io_uring: add io_recvzc request
config: i386-buildonly-randconfig-001-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221128.ki4KaTdc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221128.ki4KaTdc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221128.ki4KaTdc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: io_uring/zcrx.o: in function `io_zcrx_recv':
>> zcrx.c:(.text+0x1059): undefined reference to `tcp_recvmsg'
>> ld: zcrx.c:(.text+0x10a1): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
