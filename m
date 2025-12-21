Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204911E5B63
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 01:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766281376; cv=none; b=d1uWDnIOXBmkTbFZR+28bvGdgAX/nQ/94/0RugZgAVA8eLxPDPDGvoCu6qFSwmV3vmVn986TS1Bu2vSEeyaxNu+gs0fkX/Y73G+yR6O49Zp6RcXwVJGWqaYNJ641K9QS73FG5nqTcrMsQ7b1PJ+O5z/t72e+ooYFYqLEeNfhLRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766281376; c=relaxed/simple;
	bh=Frl7Q4D9rajHRAG6lMjKUAlj1+IvTFfdTTP40E7HB8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ConQEh2B16HkpkHt2TAgziGpPZNYrUDKommJv1yTpRhfnjxLe51gSZrllS8Gqw8ZuqfZHn9s6Q3ay3iHGvLHKz7zfK0DPqLBPbnRqsZVqDwfcn8e3nZlildIvUn5FFe3mVdx3/J6RVMkrSR8Ids0BIFkZoINbKuJa5kJp5SsI7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwJIkDrA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwJIkDrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766281374; x=1797817374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Frl7Q4D9rajHRAG6lMjKUAlj1+IvTFfdTTP40E7HB8k=;
  b=bwJIkDrAp0s1rqw05pbZZJqlJxUH19AC/385yL+Pm2UV96tvTCALejWU
   4bV0kWLS8nw85Vm7XuKuONimyIvc3/7+HDotP8DkJDy4qCSqh8IgzQwRU
   LBIKkqQmKId69+iicFHnN9FBdKCyx3xbbMqRiP5gXcyfvv4IIIfEnO1dC
   wmMx/6q9L5OVF+/S1qb++Y+RmENwWscV7GZuw8Jc9i7+obB/DfSc7WFw2
   ioq370Okz2kF/swPLa4KeaXQyzBx0D7fSWb4JgkALrTZUW3n9V3IlYwRm
   muIKo2k9egxRnKV/uO+rgPquU/z2Cs17tNKDAyFYYNB+biLX2H+Fdft18
   w==;
X-CSE-ConnectionGUID: 0YWg+LRkTdOUj9QOBqGIRQ==
X-CSE-MsgGUID: VKT0xx3uQAqPcHV9QCtDGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78509297"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78509297"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 17:42:54 -0800
X-CSE-ConnectionGUID: ClbilctlQnaRpEYLDatS8Q==
X-CSE-MsgGUID: JVqYDd2pRVWSzxhWcDxqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200086216"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 17:42:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX8TC-000000004t2-0mjS;
	Sun, 21 Dec 2025 01:42:50 +0000
Date: Sun, 21 Dec 2025 02:42:21 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for CAN_RX_OFFLOAD when selected by
 GKI_HIDDEN_MCP251XFD_CONFIGS
Message-ID: <202512210245.oJRMtXr7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 39f48f66f74cdfa79f254376442a07663ab58335 [12/12] ANDROID: GKI: Add GKI_HIDDEN_MCP251XFD_CONFIGS
config: x86_64-kismet-CONFIG_CAN_RX_OFFLOAD-CONFIG_GKI_HIDDEN_MCP251XFD_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210245.oJRMtXr7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210245.oJRMtXr7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210245.oJRMtXr7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD when selected by GKI_HIDDEN_MCP251XFD_CONFIGS
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
     Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
     Selected by [y]:
     - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
