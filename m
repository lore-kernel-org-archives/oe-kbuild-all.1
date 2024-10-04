Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360A231CA2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 22:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728080206; cv=none; b=KqSI1oSFfbZgaJ35uF8oNz1AV9M4Vw+mPy35m9tdt06kTyAi7tqiHFPQ+rDPf7Pg/WvpwiGhAnD6cgnoYocidETN3m2cgt3i9L140Efh3ffNI4LwWEqPiCpYWxV/fzGAM3HpV1fvzrHMIgD/XND5gQuKCgU5PFjlcxemDJTleQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728080206; c=relaxed/simple;
	bh=DRM3FPxgYJfxr/KKhfQMzvP9FAwnQWvOyKbfZGAPE1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0WchJhowJlAFL7hn6EsiFy84YA3OVIinXe6/dgvyt2y/qMKEShlRl4pSFNLSOQn+PWvuwaSgDNWKdMcbPsSpRKigXErFd4Bnh3ixT51WzVxqMgmHA44uapyx1AQYEMmApkGvlHjqii9df8pt9gXejAs8nelzDAr0FPk3tOxCs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3L3Rne5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3L3Rne5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728080205; x=1759616205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DRM3FPxgYJfxr/KKhfQMzvP9FAwnQWvOyKbfZGAPE1M=;
  b=B3L3Rne5iKq+3RM1v4WsNBMYzGckhHcqwO7EQmd8GokObFrvFnZBaELN
   YH3+8zOLSETtfd+Ea4wc3A3aFHZ58HqF4cQhnVWZsp0tjzHUJMi/g+TxF
   sYBsfI0Beg3MLVmn4SXTZCwC6BMCuS6hWZOkn78dhIjOGRpHfLH96CCV3
   kgKQJy1V8EnXuKrLCS9nCb96m2Namaw84h74NG/LJhCNSbG+gNrKeVpRY
   VJHzumb2ZREiOm0GfYMTeN9o3qzwYm/ZtDZhJYWdoi1vUWRj0ZkuLAy+t
   SGduti3qceIzK3qDXj3OJy5EEdd5GY0Z/ZAdfOPp7wLYViDmtTwNV/vna
   A==;
X-CSE-ConnectionGUID: LeXIy9SoTG+eDF1Dzqo6gA==
X-CSE-MsgGUID: 0wGsxc6mRmqRlu9HvUO9pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27446764"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27446764"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 15:16:44 -0700
X-CSE-ConnectionGUID: AtkkCjLnS8yS/5MtXsVmMg==
X-CSE-MsgGUID: W2cyLahtTOuPHaCdYtiX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="75658696"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Oct 2024 15:16:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swqbJ-0002HV-2Z;
	Fri, 04 Oct 2024 22:16:41 +0000
Date: Sat, 5 Oct 2024 06:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH 2/2] ice: ptp: add control over HW
 timestamp latch point
Message-ID: <202410050523.LBCNvMD9-lkp@intel.com>
References: <20241003213754.926691-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003213754.926691-3-arkadiusz.kubalewski@intel.com>

Hi Arkadiusz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-net-queue/dev-queue]
[also build test WARNING on net/main linus/master v6.12-rc1 next-20241004]
[cannot apply to tnguy-next-queue/dev-queue net-next/main horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/ptp-add-control-over-HW-timestamp-latch-point/20241004-054415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20241003213754.926691-3-arkadiusz.kubalewski%40intel.com
patch subject: [Intel-wired-lan] [RFC PATCH 2/2] ice: ptp: add control over HW timestamp latch point
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241005/202410050523.LBCNvMD9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050523.LBCNvMD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050523.LBCNvMD9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:6258: warning: expecting prototype for ice_ptp_hw_tx_ts_point_set(). Prototype was for ice_ptp_hw_ts_point_set() instead


vim +6258 drivers/net/ethernet/intel/ice/ice_ptp_hw.c

  6248	
  6249	/**
  6250	 * ice_ptp_hw_tx_ts_point_set - configure timestamping on/post SFD
  6251	 * @hw: pointer to the HW struct
  6252	 * @sfd_ena: true to enable timestamping at beginning of SFD, false post sfd
  6253	 *
  6254	 * Configure timestamping to measure at the beginning/post SFD
  6255	 * (start frame delimiter).
  6256	 */
  6257	int ice_ptp_hw_ts_point_set(struct ice_hw *hw, bool sfd_ena)
> 6258	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
