Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B72E92BA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328822; cv=none; b=B4jvAV8oZRxfWL/MCIzr91+J72w6E/N6l0AUc55RhWZ17u63y6kV54QPwi8Y0QQ55cELimitwe+re8hxjeH5OluvC5hPRYRtQqkQz0zMsQLHT18umGoLkCh9G8H94jFDreXZrPk7WYoR5gM6b+C7R4f5QoGde4y1J2/4fSFyeaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328822; c=relaxed/simple;
	bh=3MsgljcBDCelfGa7XKseSs3tbgnIwH2i9lWZqvT/38o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IlQVk2nWwt6HC/6blwsivVtPSaJ/w/zkz4Jf4WNufot80A2XCKyTuFrS7T/OZuGPN2djF1xlfW6khxZnRFJ8ANePlz92VfrRRSXCyEDJXcFG5qlYqrENqAXjHwutt2Vr6AawpIVLkoPO9X88b3CxiMbsnKh1SjnFU97oyhvbiUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8zeuN9h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8zeuN9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789328820; x=1820864820;
  h=date:from:to:cc:subject:message-id;
  bh=3MsgljcBDCelfGa7XKseSs3tbgnIwH2i9lWZqvT/38o=;
  b=g8zeuN9hvEOKesf8yBM6dAjqJ5GDqEDg999mcrt6x3PnNBQjsOFk1neV
   U4sUDWVP2y5BGOZ+9IDZgL0GDdDh9E+qTuLNRsD3Br21hax8W8d/o38aG
   SO9PNMI5PjDPblnbpia3aC93DBExhLcuJUZTAgg0VWAfAkClmqlq9zuEL
   Dqm5KY5oHALi3N3zXRjzJuvai5Ahx8BeMkcvz+D7aMk9nfbAUUikTbbkC
   GG6Xf3Q4Dho7CfBZn0XuCsVKKYlYuc5OBPwrM3R6vh7lFCs1ljRY823iL
   puuIzChoudP8462IyER3bzgYPGqwHilv2yt62dR4WJAO9flTOCcxu1TPg
   A==;
X-CSE-ConnectionGUID: b8iLBxmWSeyTtiLWVqForg==
X-CSE-MsgGUID: TDN76fJwSgaBxEgPEuaPBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89631542"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89631542"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 12:47:00 -0700
X-CSE-ConnectionGUID: 9DPkZ+iCQ4i5axZ4f+jQ/w==
X-CSE-MsgGUID: K54T2fxxQi+kjfOxfbqbGw==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="271041014"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2026 12:46:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5qAC-000000001Gl-1nq6;
	Sun, 13 Sep 2026 19:46:56 +0000
Date: Mon, 14 Sep 2026 03:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:tty-nowait 2/20] Warning: drivers/tty/n_gsm.c:3751
 function parameter 'to' not described in 'gsmld_read'
Message-ID: <202609140352.tqlZQXed-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tty-nowait
head:   1d49005e657d7a7da34f2f23560af9178d9878ed
commit: 9adafa6e53be9396fc7d5065a949a36b25bb9fc3 [2/20] tty: turn the line discipline read op into a read_iter
config: arm64-randconfig-001-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140352.tqlZQXed-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140352.tqlZQXed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140352.tqlZQXed-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/tty/n_gsm.c:3751 function parameter 'iocb' not described in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 function parameter 'to' not described in 'gsmld_read'
   Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'file' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'buf' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'nr' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'cookie' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'offset' description in 'gsmld_read'
   Warning: drivers/tty/n_gsm.c:3771 function parameter 'iocb' not described in 'gsmld_write'
   Warning: drivers/tty/n_gsm.c:3771 Excess function parameter 'file' description in 'gsmld_write'
   Warning: drivers/tty/n_gsm.c:3751 function parameter 'iocb' not described in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 function parameter 'to' not described in 'gsmld_read'
   Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'file' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'buf' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'nr' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'cookie' description in 'gsmld_read'
>> Warning: drivers/tty/n_gsm.c:3751 Excess function parameter 'offset' description in 'gsmld_read'
   Warning: drivers/tty/n_gsm.c:3771 function parameter 'iocb' not described in 'gsmld_write'
   Warning: drivers/tty/n_gsm.c:3771 Excess function parameter 'file' description in 'gsmld_write'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
