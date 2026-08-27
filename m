Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02BE3859F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850291; cv=none; b=In9VOgEcYAXIAEzSwxMuqC6aIsTxCvemQqcDgDOcTEGO4VKN8lj//BMJNc18Sd8khQc9RXEwf+R6BsWJzSCerqHrZ8eh4T2lgmZHMDHRFnOFfhel3CqCvZmfggXB77AyfB/APFdKjilqqLDNqSJCdY0WXlBVkAVvTxaKvccseyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850291; c=relaxed/simple;
	bh=71t0wKfXvu2VNVi5vpAh3sq7Rb2/zY0b93xkK/CKVSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nvmYr2dbD5eokiHb9ol4xPhRNkmtv0ZjgK0ZXtM+SzOsj4LJdtf5DoY8h1+PmbL2XJL9FQa/iJYxEXAn5ZNw5Q0PmiVhh09EOILJ0UAL8tobv6bfGQGoka/5+hdHgTr4yp8E1jS0vc7LgZ8uD+Gjgm/EaQDES0M8r/z+M6YRSEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTej6iir; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTej6iir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787850289; x=1819386289;
  h=date:from:to:cc:subject:message-id;
  bh=71t0wKfXvu2VNVi5vpAh3sq7Rb2/zY0b93xkK/CKVSM=;
  b=VTej6iirSJr+G+5FmffNFBf3JJooUG2W3kmMY2w/SD1v1w9xgHuhZnDH
   7wQWTarp5nCFCh7mYRXYs3H4XKctVR6t7a3jvSHeHfkU38y+Dh1eb7fcK
   ckcHDQgvSP0CktPawkEJwQUcCplF2IkEKb2x09pKPu90kJRwwnLouE2HS
   s3Q1voKizZc6hckJtFrBY3QebY58wX/5JsxzrAI/0dLrRL1ZnYsDQ4EJp
   BIYzQXB2F5T4IOIQh7PF3G+ZdmZ45tXzILGfqk5cCdzG5tXOep+n4zkEO
   hxsUlj2WWdK6Q87/jwSs9ckGInR1Re22+ChziE50FLNpwz8LqdT9D7nZE
   w==;
X-CSE-ConnectionGUID: Soa1WO62Sfy07z3/WVJkOQ==
X-CSE-MsgGUID: cXPrd7UYTTqyOhdUCMYSXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92216090"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="92216090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 10:04:49 -0700
X-CSE-ConnectionGUID: FnhZszxJTm2HgfDK4PXlCg==
X-CSE-MsgGUID: dxGltFNtR7WhtmIvtsrg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="267951948"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2026 10:04:47 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzdWu-000000000pZ-3uFt;
	Thu, 27 Aug 2026 17:04:44 +0000
Date: Thu, 27 Aug 2026 19:04:12 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202608271838.4AjdPEFD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d17c7fc3c8aab85da0676b913f9268a8cd402f50
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [6/6] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: x86_64-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608271838.4AjdPEFD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608271838.4AjdPEFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271838.4AjdPEFD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
