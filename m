Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456B418A36
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 10:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223382; cv=none; b=q3uLlmRgIqOKIUOM7eKvv46/rAHJchCLAASncT7KdDexDk//8B2UKw6y3+sTofAeHLqYNvrtnn7903ofumiGGLfFb++Xeph2BF/5peZ/6sYMfjgyoMslcuC+KS3KxNytyxNbxryvo74C2rRy8J2klXb0nmDYiFbseSzEbhaAMEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223382; c=relaxed/simple;
	bh=KWysdRRj3tWGYoZyH//oVonF+XfNs4j1qd5YSYkXmzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s5l8MKn7nRvUTeunkH8HAmx/JLTL1dsiDvv11+YAjr1Eavf5CAyGX/WupLTelPqga+Q89JvUk6Vk2QiDCnNlvEoIUs6frmI/Zj/baVlUNQ294908rKAFj9KUTMXLo9+2UuOj81kl2LQSLU4h/VpjKY2vQ8ISt6AqwV7ZPOak+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gju73nqM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gju73nqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787223379; x=1818759379;
  h=date:from:to:cc:subject:message-id;
  bh=KWysdRRj3tWGYoZyH//oVonF+XfNs4j1qd5YSYkXmzs=;
  b=Gju73nqMdwr44g3VgDCMOVz3qZGtfyfbrEoEQ1Q2rYf9ghjUDs2gGfyc
   CN/TqRpJzO8skGs/5mfIQ04+x110yuBRcHfSSYPThHKy8SZsvP3P4aBSW
   xq8Jos2OBGEOv3RMnVnSWLvE0dMEuxwLEb2WXP5k2yuQbL4BcyEfiC1Xi
   HROvx9AiTm/rDNp1NksQiG3n5Z2A5hsGzTbKYY81LXj3TI8Ae6lINn+aq
   0R8Piu6YstUY2Z7zBjomulLdB+jN+qs0XIygKIN2dQ7XcDt7dut9w1MUV
   Nr/crzEOgaqTMR18Sb2gGxqOElIT2e3U29HlIfoKaX2zy2urBnjDgYzEy
   A==;
X-CSE-ConnectionGUID: WeQg0Ih0RfGWWchhK6NwuA==
X-CSE-MsgGUID: LSLVc9DwRRWrcb/SHWfpug==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87776578"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87776578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 03:56:18 -0700
X-CSE-ConnectionGUID: WBTF9QwbRZqGfAjnhCUFkA==
X-CSE-MsgGUID: 0jJ6Ehy+T3yXgFUscyLulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="289471092"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Aug 2026 03:56:17 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx0RS-000000007Un-3twj;
	Thu, 20 Aug 2026 10:56:14 +0000
Date: Thu, 20 Aug 2026 12:55:31 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/node_features_v6
 42/44] Warning: mm/page_alloc.c:7700 function parameter 'alloc_flags' not
 described in 'alloc_contig_frozen_pages'
Message-ID: <202608201245.51IN4MtF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/node_features_v6
head:   38c7f48162aa282dc6a9edfb7011378594057c10
commit: e349bc96af39536035720fe607b05fc4cbd269fc [42/44] mm/page_alloc: let a contiguous search target a private node
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260820/202608201245.51IN4MtF-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201245.51IN4MtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201245.51IN4MtF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/page_alloc.c:7700 function parameter 'alloc_flags' not described in 'alloc_contig_frozen_pages'
>> Warning: mm/page_alloc.c:7700 function parameter 'alloc_flags' not described in 'alloc_contig_frozen_pages'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
