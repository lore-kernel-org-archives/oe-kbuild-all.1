Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43056288C36
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 18:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099068; cv=none; b=Wr3WqmvbiiEUHHkUDISId7usyVyxJv+M9AA5TYvKPB2fHFk10LnqrWbikIIqfgoXrCZPK/CLHeWrXYYQ3ApfDoQ64sxpx1h2NuV9AtNoZMy7TV8ryaDwEui9hX5SPu0yeWgMah6PQ/VIj/z5NtSMEtY6TAU9FwYZjUG/bO6m9q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099068; c=relaxed/simple;
	bh=KE6ov6VxJy3eH+5gtcTgrUenNAPl43s6oXscX1TirP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwcxOvPIhOUZoaG3Lct6FsNsAtB7Dw7A5B/ksUrYYMS3eW0Ac3tpOI0hr2s1Ernyv734bbHmIrjaXYsFRz//oscnduNAmIBaNJ3eJdUV0KXeRZMUP2f+nUwNCBdZ2X9NKIzlfBDZNt8AP0Ylevu1b7a60rHP38TfFC3y1Y30t/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Que4SZPf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Que4SZPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750099067; x=1781635067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KE6ov6VxJy3eH+5gtcTgrUenNAPl43s6oXscX1TirP8=;
  b=Que4SZPfUDPCJRgt0HehzUWopbdlS7Dz/MA0DqyeGzcOXTmIhwYomoR+
   ZcAeFeoIbT5TGCtMYq8uON3wZXUf4bjK55DMkaGkrSY47jrYqrUjYf97g
   8LGlEhXu7CfsCWKZwzMqSQ8Ji/VYbmtnPJd48LjcL+vNSKf488WUulQTI
   yL4/bfIdGrkzVZLjdWMSkvilRtH8IAXFpYD335PIkzyCfVD3asUi7Cto8
   hjr30lZsuP9tVSH3ALb58Xlp4xmx0Ofsy8mgX4+CkjzHk0tj3Q1v652/z
   OIu2YR0/yqXj8/rZzAp3Jk5ET2yKdhv/xT31NrGGUZT9jotjhNkRGHuVs
   w==;
X-CSE-ConnectionGUID: ChIm8lrIRIqHusdtd9V2lw==
X-CSE-MsgGUID: X2iWsz+SRpqxw0Nk+tuTTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69833194"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="69833194"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:37:45 -0700
X-CSE-ConnectionGUID: KLM1NHX6Rq6ypo2NlKcyZQ==
X-CSE-MsgGUID: YE69aa4aS52n23NSgtwAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148442885"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2025 11:37:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uREiE-000FGS-01;
	Mon, 16 Jun 2025 18:37:42 +0000
Date: Tue, 17 Jun 2025 02:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 12/12] lib/spdm/spdm.h:520:35: warning: non-void function
 does not return a value
Message-ID: <202506170212.ssRps0KU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   d8df4fbe15804f6b84dce2f91b07679f2c89fe12
commit: d8df4fbe15804f6b84dce2f91b07679f2c89fe12 [12/12] spdm: Multicast received signatures via netlink
config: powerpc-randconfig-r073-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170212.ssRps0KU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170212.ssRps0KU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170212.ssRps0KU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/spdm/core.c:15:
>> lib/spdm/spdm.h:520:35: warning: non-void function does not return a value [-Wreturn-type]
     520 |                            const char *spdm_context) { }
         |                                                        ^
   1 warning generated.


vim +520 lib/spdm/spdm.h

   510	
   511	#ifdef CONFIG_NET
   512	int spdm_netlink_sig_event(struct spdm_state *spdm_state,
   513				   enum spdm_reqrsp_code rsp_code, u8 slot,
   514				   size_t req_nonce_off, size_t rsp_nonce_off,
   515				   const char *spdm_context);
   516	#else
   517	static inline int spdm_netlink_sig_event(struct spdm_state *spdm_state,
   518				   enum spdm_reqrsp_code rsp_code, u8 slot,
   519				   size_t req_nonce_off, size_t rsp_nonce_off,
 > 520				   const char *spdm_context) { }
   521	#endif
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
