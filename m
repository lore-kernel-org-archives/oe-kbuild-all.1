Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBCA7260C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438738; cv=none; b=rsNfJ3yACOisHCM9OBZwGMG95V07yD13WGINqgFMJwQ543zWTqgjVQCbY123Yimv62kMdMFxaoL1xrFmMPo7FWTd85p5Q5RbCxjZ/AVLjUjkOQ7XTlk+BNDy9M1nK7hSheQZ/D5U7PkNEHWpcT1jAYBt/hRLMXLGij1a+h35p1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438738; c=relaxed/simple;
	bh=PIgWwbFq2D3vXf1A04NnLpMOKVr/VEjD37468c2IiFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDFQehzWXC0DWsGTfeDH6iRd0KtePOdfU67zFjKHh2mHlv3M2BzH22aRoWoycKL+mEkeJRGHT25DmvG6kvzcq/KRvsiktV6bvRQW2eAFOLe0OSny0XV4o12E1anExDa2jTRFhvhLOG8xhd9u9z9hUEKNQlwe8q3+3gRq3SQ29Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6UqCZmM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6UqCZmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751438736; x=1782974736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PIgWwbFq2D3vXf1A04NnLpMOKVr/VEjD37468c2IiFg=;
  b=W6UqCZmMFq/Fcfl5qunTEXU0KGkV8KINNyFbe2cImDwhWKoWe0pkIC82
   uSDICZ/Y6ymU/qIw735vWXAWIXEB9Wgllf6fU6jQmi1nm8rDAOP/LWC3z
   ahL5gfpmLiYWQQUKjpgU9DaNwdU39qQzsP8gfLtaVDKgZ/ZdNLQZLCPf0
   DkpCQFlsFeyFby+tv2iwZNI0l9HymixClQMuN9xVn0DAbBjbWo9ofyJtE
   WAjoLWCCa4Ygji2njsT3jlROW1UqCoO670vrieBlYhxrhGMlcDOXMs3KM
   sE9CiLycZWI4gHhCCcVx0wOuACefylkfBYzaItoE5Si9F9r37y0IRwv7A
   g==;
X-CSE-ConnectionGUID: QX52R479QWuArrsGmSZxpw==
X-CSE-MsgGUID: zMipPkuJSgmSPiUpSxAfRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64768465"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64768465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:45:34 -0700
X-CSE-ConnectionGUID: AoOLehg/SouKG0kL+EHZuA==
X-CSE-MsgGUID: T2/0ZaNkSPS+jvBE7CHqfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="177671994"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 23:45:33 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWrDl-0000Eb-0s;
	Wed, 02 Jul 2025 06:45:29 +0000
Date: Wed, 2 Jul 2025 08:45:15 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] net/9p/client.o: warning:
 objtool: missing symbol for section .exit.text
Message-ID: <202507020802.Dmvtg8wR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: a6fb923f7803f40a567445dfe1ff3a539c8adc1f [1605/1605] 9p: Use a slab for allocating requests
config: x86_64-buildonly-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250702/202507020802.Dmvtg8wR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020802.Dmvtg8wR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020802.Dmvtg8wR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/9p/client.c:376: warning: Function parameter or member 'c' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'req' not described in 'p9_client_cb'
   net/9p/client.c:376: warning: Function parameter or member 'status' not described in 'p9_client_cb'
   net/9p/client.c:523: warning: Function parameter or member 'uidata' not described in 'p9_check_zc_errors'
   net/9p/client.c:774: warning: Function parameter or member 'in_hdrlen' not described in 'p9_client_zc_rpc'
   net/9p/client.c:774: warning: Excess function parameter 'hdrlen' description in 'p9_client_zc_rpc'
>> net/9p/client.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
