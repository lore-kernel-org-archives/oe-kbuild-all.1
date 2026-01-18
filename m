Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C8350096A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768722793; cv=none; b=haI91L1NsuSuw+S1W317iI8mGWOePskAx/Cm/b/6/ZCJKrrbQYaS+EEbPYj8oEBA5Py9VFh8D13DLZ7AbRk+V8nxaL62v18tK9z9vCedQRsuAAbp+Od4Oqt1aKwDOOetpYA1Nns0l0VeC1DFAgOytXK9HsV/GRn1MxmJMWsI7Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768722793; c=relaxed/simple;
	bh=d1KxHMK/T7LLxX+cyPGs62F/RONDWvq4PnnDrZKlPHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+yd1WYWPJJ9dIbuy2wkWASy+pIT2zwNC8k6//nK1YWp2KheSv545Fx+7UB/ofVBWItaHfgCV4gApFcTkc+2Skyu+6dZzGlU0uTTiC34dUzD5NRVKZPC/94/zwp1E25cmEr9NUvwobQNAjA379Me7sORHYTw6/zEH/B4ws8RMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnIR8MW5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnIR8MW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768722793; x=1800258793;
  h=date:from:to:cc:subject:message-id;
  bh=d1KxHMK/T7LLxX+cyPGs62F/RONDWvq4PnnDrZKlPHU=;
  b=YnIR8MW5RO08sRIjdrwm1IA2nK0UKyZfkEiYVUOAi+S+uFqsuU9D3NVX
   ula6/ATKs6idwUttZT2Cloi51hO+JLAJ206Ixu+skmIswz/hJh9dfG+NJ
   x6i923Jo7rt1HEHyS8YpLy8GDHEXOI9f3PzMZzLn75M8kZJ4WrmyRMebF
   W3xa/uVbQuMYYuS3sS5V3f8mu4tWQoCDuIFGVM5esbSRe6cJUeNHiMdPh
   /tvrCo+8ld0quV796GY7edI8tqdHvrr2tBHrRL3hrSEqttks9XevBRvA0
   aemM799Aq3eWdB7wbHz+RA1AmdMk5vHGi/XFh5uSVJNxXx+juK62qVZ6Z
   g==;
X-CSE-ConnectionGUID: RzXnUe87SKOgqcuYlMIsBA==
X-CSE-MsgGUID: iYVvu4UlSw+5+U4CWcXdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69704536"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="69704536"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 23:53:12 -0800
X-CSE-ConnectionGUID: W87O0XB/Q7i2WdsHS4wMAw==
X-CSE-MsgGUID: eRqr5E45QkOXXpFNNX1X8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="204744364"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2026 23:53:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhNau-00000000MmK-10VZ;
	Sun, 18 Jan 2026 07:53:08 +0000
Date: Sun, 18 Jan 2026 15:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-cbpf-restrictions 13/18] ld:
 bpf_filter.c:undefined reference to `bpf_prog_destroy'
Message-ID: <202601181535.6vRsGqy5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-cbpf-restrictions
head:   0f8a03cfaae90d44799d4cd29cc308ffdd81d93e
commit: 54ec4b557138b03daba520779114b482590edde5 [13/18] io_uring: add support for BPF filtering for opcode restrictions
config: i386-buildonly-randconfig-001-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181535.6vRsGqy5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181535.6vRsGqy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181535.6vRsGqy5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: io_uring/bpf_filter.o: in function `io_free_bpf_filters':
   bpf_filter.c:(.text+0x1f7): undefined reference to `bpf_prog_destroy'
   ld: io_uring/bpf_filter.o: in function `io_register_bpf_filter':
   bpf_filter.c:(.text+0x43f): undefined reference to `bpf_prog_create_from_user'
>> ld: bpf_filter.c:(.text+0x665): undefined reference to `bpf_prog_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
