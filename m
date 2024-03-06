Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A89D1C6BB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 06:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709706737; cv=none; b=EEcYX2RfXbggbV3j/R6x/qWhel6fywY8HvOKjhbrCznBvMsTUxc/u46BJbyiOri5zKnUkBw0P+azTpEM18bOz2ih5aKWhcPxw86FEscgtMFUHl7b/GYyvOfDAAvWjUtQlxxIJDz0a7ixoSXkZ+xg/rRLGUuJtRiKgKFrK2e/AA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709706737; c=relaxed/simple;
	bh=htIi8bESZJh4+iPKhNQDXpfPPqyR/sWO8aCV0kHMS+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gy8b7YC1IYPV4DIhRWpS3dUXROTNY+OGVNaPEoIeL0Q3gsUZ54TbnD2MxZsURmSNHy7bKpKB/Ryfb6Dw3fCg07eBk04llBDCs/de8TuYzeLoK0PDCcBs3tqtYwxsA2atqT5rDmPWa+yvPR9joDTzoZypWLyHPR4NjFLCw9t+Y/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWDGrIwB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWDGrIwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709706735; x=1741242735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htIi8bESZJh4+iPKhNQDXpfPPqyR/sWO8aCV0kHMS+0=;
  b=SWDGrIwBSIb361lRsek2mAbRUw8YGkLf8r2/bQwlBJ1IN+2ILScsmxFK
   FuuuLcZ+slNsUP0mb/UA4idM+b8xIIvpzhNeOLTOzEphw75n/zxgwkq3c
   rzGiMX4Ccqtn0P4Yz7jKYA2d48kxHvq2Ts7i8NqeUBsPOJL4IcBsq66XB
   8Q1L2XZDt+4a3cfoYwqIqzzxbTvP3TQVC313mu6gk4Oa6tn+roLUR3j+X
   /8+a1Cbe9Kr+j0ld81QY0+i70KFjL5QAPnZbDADkYrG3bZR7PV0wTlX+l
   RmfinmTLk9OahbgrGNVjikzGeqziTOHE2FDuLy3U5rhLO7NXPYtF2C2ak
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21826735"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="21826735"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 22:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9628121"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2024 22:32:12 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhkoz-0003zJ-2h;
	Wed, 06 Mar 2024 06:32:09 +0000
Date: Wed, 6 Mar 2024 14:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 39/43] arceb-elf-ld: zc_rx.c:undefined
 reference to `tcp_recvmsg'
Message-ID: <202403061428.wtYtsjZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   5af93e6de5f9e457b5ee2106ddaa3dd019b6a6f2
commit: 1154ef787549a4e3e0059aa1039c5793d4af6d90 [39/43] io_uring: add io_recvzc request
config: arc-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240306/202403061428.wtYtsjZd-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061428.wtYtsjZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061428.wtYtsjZd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
   zc_rx.c:(.text+0x11bc): undefined reference to `tcp_recvmsg'
>> arceb-elf-ld: zc_rx.c:(.text+0x11bc): undefined reference to `tcp_recvmsg'
>> arceb-elf-ld: zc_rx.c:(.text+0x11ee): undefined reference to `tcp_read_sock'
>> arceb-elf-ld: zc_rx.c:(.text+0x11ee): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
