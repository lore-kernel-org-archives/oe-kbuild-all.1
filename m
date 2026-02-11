Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5252C0F69
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 07:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770793224; cv=none; b=SakkuniXXID6PgzCP0iwGofcVxhXTkW58yS21gx4mQ5zrk9yEycFV5tOjcxwxiANv661K8ZHPNwNqiYsFYc4XkRo75hF5TLnd+TQMogklqo7l3qYq5be6DEffaGqDoxZCNa4vm/VZCdB+R2JZQONBFraMJ0u4KvOWbM8BoNI8Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770793224; c=relaxed/simple;
	bh=vuYr2vq0cFwE4qvKD7Lfl9rzFyIgt6TyCPiwKZCLEok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/PLSLHX8Vs4LbEsS6zFwxcQnn5PiRcupx4O8NN/Ordo2fpB8rSonOdmJP31NPYVT+iRTi3THqhAbuIFSzyYLpA37scEuFVGAVWEBg7RmQ85pMYs9kLORbHC1IVRjazK4vpOw598G1e9T6WEk5ENPdcgYfRv+Gmk0otviE7qSeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bp1pgJh+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bp1pgJh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770793222; x=1802329222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vuYr2vq0cFwE4qvKD7Lfl9rzFyIgt6TyCPiwKZCLEok=;
  b=Bp1pgJh+H7UXHhzqxyhg9CD1qIaM+a9/mzSmlY2/pf7eHl1N6jtFSZrp
   nW8hdxsGe8jcUbITuuXXf2EMQcDt4PwKR+BJCYeFH6h4Vvjcnw3Kt/5SH
   o1GCBoXQm00s2t65j0q7V3s9qtGOP38BN1wIar2hTn3im5h+t6/u3wPpo
   Ri17wbLwbd3xRmeoJf+jSu/DQq03fqcchnfmzZ7iH78TvpYg+4rAjprvv
   VLHeJp6eSSMuSCsaTPgydoa/zEH27/6we+8z7ZHd1y7c/3sNni7cQcGQ4
   nuweBttux7ACjuK/9XXP54TVysaEnRLp+PnK5nm3hK6jAoBc53nMbMqM7
   w==;
X-CSE-ConnectionGUID: 6sCzzlO8RoaAEmNqk1iogQ==
X-CSE-MsgGUID: YgroGbiwQr+0D+g0X+wQ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71650053"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71650053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 23:00:22 -0800
X-CSE-ConnectionGUID: xXYVsZPZSGu5C+8U+B6owg==
X-CSE-MsgGUID: Lt6Lu1kSTauP4DuPwHkRaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="242766222"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 23:00:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq4Cs-00000000plY-48wi;
	Wed, 11 Feb 2026 07:00:14 +0000
Date: Wed, 11 Feb 2026 14:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, bmasney@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com, Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: Re: [PATCH v11 2/3] clock: eswin: Add eic7700 clock driver
Message-ID: <202602111424.mhTAakDX-lkp@intel.com>
References: <20260210095106.839-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210095106.839-1-dongxuyang@eswincomputing.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.19 next-20260210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dongxuyang-eswincomputing-com/dt-bindings-clock-eswin-Documentation-for-eic7700-SoC/20260210-175433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260210095106.839-1-dongxuyang%40eswincomputing.com
patch subject: [PATCH v11 2/3] clock: eswin: Add eic7700 clock driver
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602111424.mhTAakDX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111424.mhTAakDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111424.mhTAakDX-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/clk/eswin/clk.o: in function `clk_pll_set_rate':
>> clk.o:(.text+0x1278): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
