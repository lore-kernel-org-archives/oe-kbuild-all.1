Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE612D24A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590290; cv=none; b=PM/Z5gp8ZAotn5AOmmYYhByvgQzoon0hJvyE2dk2SBtgFNMpGa1udpAxYwwEznbaKHtVwTE5jcKr0uHNU7jav0BymkbsuBxjOdBWbjFH3XZ9r+EkO/T5sZHZmMF04XDmhVSmYZFPiIhpeGNzXwIB/iZ5uFHK3WiP2fWessuQjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590290; c=relaxed/simple;
	bh=SRV7CV4Dr5bIqdS1TeXk5Bjumt8BIkEwldzGJDp6FJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDSIalTqEutHG5LKGESNI1zKOPNXmmhHfuYdP7QReJfJjyZYRwPlhxMEWykKu+CmKTWFI+3wgNVijIALAAzay9wi0kyWH/gLYWBTUC+J+yiF9ZurTHMdxBpImRKRl8nMdQWuIyNlpwQr6ENQ/Xh5+oQGUDv4yuQ3pX9wY2asUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ozk/7G2J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ozk/7G2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766590284; x=1798126284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SRV7CV4Dr5bIqdS1TeXk5Bjumt8BIkEwldzGJDp6FJU=;
  b=Ozk/7G2J9VNcE6L5P8dzeJBsw1Y5AMM0nLpLkMTQI+L4y2JE2J63BK9L
   bXgq6V5CoMn51zeSIR8P3YdkYsep2ZwmPKuVxtpgKSOwk/GHErjlpGHwO
   dN40CQ89NBtS6LCwHAVcwm42RH5WWQ/xybAnTPckft3pRQTKAW+DNXlmu
   sXNLZoQutJDGgPSc2v1isJgk0cjYX182ZQGwKZHHUjXVKj2rgasPGyx48
   EwtWAuxSdDmO9AH9H87Y0MAD4nJB8RB1omKdDK+z12LCm9GX8oNW60KjL
   rfS5O5JMnXx0fZSox2/IgsPD3Zwo5BUwIglqvn7KDk6180aYHkrVOboqu
   A==;
X-CSE-ConnectionGUID: BNDwhRxoSriYT2kFvUfvlQ==
X-CSE-MsgGUID: NJwTwWvfTEOBqvrSAqILNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68321000"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68321000"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 07:31:20 -0800
X-CSE-ConnectionGUID: NKMeCWRgTZChJYcusXWGbg==
X-CSE-MsgGUID: lFMya9Z5RRW5ZK8z7vYhHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="199688756"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Dec 2025 07:31:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYQpW-000000003C5-0zx2;
	Wed, 24 Dec 2025 15:31:14 +0000
Date: Wed, 24 Dec 2025 23:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yazhou Tang <tangyazhou@zju.edu.cn>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, tangyazhou518@outlook.com,
	shenghaoyuan0928@163.com, ziye@zju.edu.cn
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Add interval and tnum analysis for
 signed and unsigned BPF_DIV
Message-ID: <202512242332.vFPARGR1-lkp@intel.com>
References: <20251223091120.2413435-2-tangyazhou@zju.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223091120.2413435-2-tangyazhou@zju.edu.cn>

Hi Yazhou,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yazhou-Tang/bpf-Add-interval-and-tnum-analysis-for-signed-and-unsigned-BPF_DIV/20251223-171652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251223091120.2413435-2-tangyazhou%40zju.edu.cn
patch subject: [PATCH bpf-next v2 1/2] bpf: Add interval and tnum analysis for signed and unsigned BPF_DIV
config: i386-buildonly-randconfig-002-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242332.vFPARGR1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242332.vFPARGR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242332.vFPARGR1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/verifier.o: in function `__bpf_sdiv':
   verifier.c:(.text+0x10b8): undefined reference to `__divdi3'
   ld: kernel/bpf/verifier.o: in function `adjust_scalar_min_max_vals':
   verifier.c:(.text+0x1195b): undefined reference to `__udivdi3'
>> ld: verifier.c:(.text+0x11974): undefined reference to `__udivdi3'
   ld: kernel/bpf/tnum.o: in function `tnum_udiv':
   tnum.c:(.text+0x63f): undefined reference to `__udivdi3'
>> ld: tnum.c:(.text+0x66c): undefined reference to `__udivdi3'
   ld: kernel/bpf/tnum.o: in function `tnum_sdiv':
   tnum.c:(.text+0xccd): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
