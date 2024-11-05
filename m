Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDB26ACC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 03:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730778426; cv=none; b=Kjt6b/HUGkhfyT6Sxkfu/1ZXb7LrDlOEInyujwDIZH2+jmKpnng6G6sIH5KUQRi8YbjoOq1GUqoYKs01YBphGCUHbT4nzEBIqydPcZ3iK3Vnl8XGGy0reqA7BaHsFUXRU/RWaW8+xV7hN+EwVLElqeWTgpauZ3W3TWou6mdKvn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730778426; c=relaxed/simple;
	bh=v3c7Ok6iipLf2siUerlcD6n0AaVaZ9SzjXrTHaoTkRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVU9jPcPmuSIs8xz15tvcT5CqRUKA5QzHyvqxyJKSat3i6gFPfDrHb7vLjZDi4xfN17w/i/W2wgj8O57M5YvH6YNso1/L+H1GgUegaB+ol+/o2iDoE7CN5o3hg/u70cYRGATNXwG8K/UF86ECzwROmufIAWI/eLk2+dkvWpUPBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTtDavwW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTtDavwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730778424; x=1762314424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v3c7Ok6iipLf2siUerlcD6n0AaVaZ9SzjXrTHaoTkRA=;
  b=NTtDavwWTuhUSYEjh1unZiWrL+Y7sAnC66MAP1Mc9P4x5vthCz3RKT9O
   rqmOjgKhyPSpFX2yzMSzjsv7DePRcTGy/bIBPCwaY31QciRUHXsf++zko
   fhfcrtSX4KJA3GLGn0dB0qRwu3GlUlXmN12gP1BjdCVcWfLXcG3AANTBc
   3YLfd4tK4MjRKHiLJzOAXpgcuEfCOci7g/pSB6OfUOvyJ+3Y0QbCUkKB8
   XTZ5ukdPcJJFqb1MTMqUjmd2iK0sJ+tnjublfnbbAmwbiY1JXAzLbQdke
   s1tSyxGqef1MLOOYL3e0UppZOXYKcPb4sZnuNPkNs4CM1OsEqZGVH8cSM
   g==;
X-CSE-ConnectionGUID: CvHYYYe9SJS40QTK628Zbw==
X-CSE-MsgGUID: Rwdbf3ciS/qhkP3DVBp5ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18122948"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="18122948"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:47:03 -0800
X-CSE-ConnectionGUID: q4QQwP80TVWb4F0766a8oA==
X-CSE-MsgGUID: YRtGtRl5ReaxwBzXthMeFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83971716"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2024 19:47:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8AWx-000lZj-1q;
	Tue, 05 Nov 2024 03:46:59 +0000
Date: Tue, 5 Nov 2024 11:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Simon Horman <horms@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 66/85] iavf_main.c:undefined reference
 to `iavf_ptp_set_ts_config'
Message-ID: <202411051123.n3qTi2f2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   676d779106de51fc4e2685ca8de610ee5a70d35f
commit: 827d8d40f17baf7a78b28aa4146f52140b2baf8f [66/85] iavf: handle set and get timestamps ops
config: parisc-randconfig-001-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051123.n3qTi2f2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051123.n3qTi2f2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051123.n3qTi2f2-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_hwstamp_set':
>> iavf_main.c:(.text+0x1924): undefined reference to `iavf_ptp_set_ts_config'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_remove':
   iavf_main.c:(.text+0x7398): undefined reference to `iavf_ptp_release'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_init_config_adapter':
   iavf_main.c:(.text+0x8560): undefined reference to `iavf_ptp_init'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_configure_queues':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:381:(.text+0xf08): undefined reference to `iavf_ptp_cap_supported'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_virtchnl_completion':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:2710:(.text+0x4778): undefined reference to `iavf_ptp_process_caps'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
