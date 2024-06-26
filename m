Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FECA17CA13
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398037; cv=none; b=YGMSngFqELLkr2fIbWGrc3jWEs9d2lz73iSBYbkiSLOTAWZw/cqUC+/DCh2FhjkljFM//1wmY+viWF+gbZpDBQ6GjQdwLxZqa9Nzd4P7rFlOedFvxkpvD+01hb6vtm+zni6eN/HoOQDFhKI6igX+Oak1ZN7deSKbjJ8YrEghGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398037; c=relaxed/simple;
	bh=pcusK5I1asUQhZYFlhfb9xG5PYAs9uCterQN727ePao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UvfyU5fU8ny0JVUFXicHO4A5tF2vx980nxaf8hPQ1TZyjTGSFIag9KZheHcMRaGFlnGuPoTZiRKrYd/f5MOhr2RWxG9Nb9cedXSnBMkimI1mGQ87aEZBsYuN6zjRbSZYyDSaLGkPIw5St5hk1x8H2eQQFHDRcPdPKuYs43lAVkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQwDXusM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQwDXusM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719398035; x=1750934035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcusK5I1asUQhZYFlhfb9xG5PYAs9uCterQN727ePao=;
  b=bQwDXusMJjYBJWod71NxMueOkfAT5dh4nHoqqZtnZE2jVCN3s/FeQ17L
   CkP2Si51V7sR51Aw1q8VRNGKSYmmAvFdcZpmKgwtRcNQVk0SQoblkgYRz
   Cx6HjJYN3HBeLoZkDa0DIzh//Qk6FlEIIaAorNCsS8DGgj2ri7bPcBTee
   4S9Hz9krq9eOciGHMkXSfOsz5I9pLZL64wTleipo7AbKYpD3ihQPWALFZ
   nCAd14QOdJSjYe7l9Fyxzh3RV1jxhFqc+GnPncQaYI584y7A6VFUR6rki
   J48lmILa79bNzpz13kUoFUsAoMlC5hp5L3on9q1TZfyHZvKX2DtmvqOwG
   Q==;
X-CSE-ConnectionGUID: sAYD3x1IRZyXkiMYdgP0gg==
X-CSE-MsgGUID: sa06mpaSQGKdc85ZhHy4tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="12255790"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="12255790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 03:33:54 -0700
X-CSE-ConnectionGUID: 93vpVi/JTGa1Vsz/cjULZA==
X-CSE-MsgGUID: a6UMpWjNTE2yRC3iXz1NtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="44029620"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2024 03:33:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMPyI-000FCA-1L;
	Wed, 26 Jun 2024 10:33:50 +0000
Date: Wed, 26 Jun 2024 18:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [linux-next:master 4252/8232] intel_vrr.c:undefined reference to
 `__udivdi3'
Message-ID: <202406261827.sE7rR1qZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 1676ecd303acca213852156fed0873c265d88512 [4252/8232] drm/i915: Compute CMRR and calculate vtotal
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240626/202406261827.sE7rR1qZ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261827.sE7rR1qZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261827.sE7rR1qZ-lkp@intel.com/

Note: the linux-next/master HEAD 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `intel_vrr_compute_config':
   intel_vrr.c:(.text+0x551): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `intel_vrr_compute_config.cold':
>> intel_vrr.c:(.text.unlikely+0xa1): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
