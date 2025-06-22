Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E419995E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584152; cv=none; b=oKTWdME6M4XJsklcw6ZoTtV8JX2cCM00MMBEZBB69w2WK+pDQzRTiicEMX//g+/9Vp69W/L7qDucRlOrT57pab/zJahITW7VoILTM1fMTy05PJuHx8NZK0bJTmTQAM0mzlgo6yKVo2nIsXF7RMkwBDeMmd+GB+BjJdfac7c7sfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584152; c=relaxed/simple;
	bh=cNpoVNKfaRvJYkUqsAXIJEOXd4xAotnHUkbzDkwbB50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJEQKTRrzQ7sVplNGK/HWZfUWayAoNmhUqzIq0MgVeJQBxdw1mmXfXggr91KlmKLq0eo2c9vrJY2ZFJyGF9giRjKbOWKW+iHQh4uV2lhTYI91mccySbj2PFnFDx/7SWTd/gY9OsSfj8DCE7l8axx21y0z1BAOAU9ac5wkMf0dcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgkadNUj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgkadNUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750584150; x=1782120150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cNpoVNKfaRvJYkUqsAXIJEOXd4xAotnHUkbzDkwbB50=;
  b=kgkadNUj8Lt1B6CDWugGqkAEvLyIa2jXsfVh7cn4tklCutEiRJ+hzLID
   9Ls9rhBt67MhWF72rXNMQr/R7pKFHVJ42ySMWTLyAVFV7ysis7+I7N1sq
   BNbDi1w/67R8zEwoNbj2nSwImadsIiXpQFWMGTf6TFbqE5hBcv9P5xFU3
   eEDcJXhzkjF540lIRDtjv2u/MesQ5a93vJ2u+g9U2A1oWs6VUwxwXD5/z
   0gRHZOo7k/+b7BLZIrWvO9wQRdBu636c33imrCU0LRtqQOFkOpC0tUdmy
   fXMgpSrJfkPLWdUKEwt3sfjfQMxzMCiteFaHkM6h254ZiSaJZPslPCwbU
   g==;
X-CSE-ConnectionGUID: urFLL+tVRTGaPC7NPg+xXw==
X-CSE-MsgGUID: aBnj1DSZRcWa84x+SzWMlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52670860"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52670860"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 02:22:30 -0700
X-CSE-ConnectionGUID: QbvLu81GQNq0qwqKXna+9Q==
X-CSE-MsgGUID: kb6lFv/uTTGwjZ2nqcNSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="156809187"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2025 02:22:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTGu8-000NB0-0y;
	Sun, 22 Jun 2025 09:22:24 +0000
Date: Sun, 22 Jun 2025 17:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tao Chen <chen.dylane@linux.dev>, ast@kernel.org, daniel@iogearbox.net,
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tao Chen <chen.dylane@linux.dev>
Subject: Re: [PATCH bpf-next] bpf: Add load_time in bpf_prog fdinfo
Message-ID: <202506221641.xWzKiW3U-lkp@intel.com>
References: <20250620051017.111559-1-chen.dylane@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620051017.111559-1-chen.dylane@linux.dev>

Hi Tao,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Tao-Chen/bpf-Add-load_time-in-bpf_prog-fdinfo/20250620-131249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250620051017.111559-1-chen.dylane%40linux.dev
patch subject: [PATCH bpf-next] bpf: Add load_time in bpf_prog fdinfo
config: m68k-randconfig-r123-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221641.xWzKiW3U-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250622/202506221641.xWzKiW3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221641.xWzKiW3U-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/syscall.o: in function `bpf_prog_show_fdinfo':
>> syscall.c:(.text+0x1088): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
   timer-tegra186.c:(.text+0x130): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
