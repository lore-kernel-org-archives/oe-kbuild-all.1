Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0081B87C9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783474559; cv=none; b=P/GbVMQ2o4pwH8Ldv8YMSc2LTHhNWzzlBLiUgIbg5DWiiIGTDO55Vm37ijfCK4WW67pAbvIy069YVnOVhmSzWAjjNvGeZUNaA6DRIu7W9W5IONOBcaHEfWIMWmQePo5hRgFBywYa5zFR92JMEbnZDoei2fAE3LfuDM4/+owdA2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783474559; c=relaxed/simple;
	bh=H/s2znrT1Tclq9uveKoQ+8jHppx/wjHf3mnFKngwcWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f29RtPCeLeKTCzSjy55+xMVT9xZwhwHe2fcCCHmB0Dzu9u37r3krSs3UCDw22SdF4oRxuKthkcjBWDT9m9pnP4Wg2ETQVmW1KfsiEagRwSwiNo7A0GCHKxspW11x7yroA5matKN13nn+1Ye3X6RhDmydRWf5dWTME8CqmMqYuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWtZEV9B; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWtZEV9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783474558; x=1815010558;
  h=date:from:to:cc:subject:message-id;
  bh=H/s2znrT1Tclq9uveKoQ+8jHppx/wjHf3mnFKngwcWM=;
  b=lWtZEV9BJCuDSIBwzhR2VXDlnFYwwN7GEaye3iMkQsOCmUEQQIJ+mf38
   4McP0sg/poZ53JtMcAL+2/WYaYg1mlcpr6WGvrth/eY2IERKZW/wRLGqU
   dRJ9UxLtOvtcPtDISu9EC14PDlSuN9dSeqrITRvmBgCKA9n1C5MrPwu7v
   8S95HalrM9w/jEHtpLldaiQPPhxqVUuwjZmhujxRPpnRJCK92vXswVPQg
   OY5JEVC98TalY7y90n+j0QUQP1tl04NX/ptDRF7ineMaKORPw2PQhTEjH
   mflxT6GDQLyVzotoGB2uY49HtMai0BSDLCbN4aSWslzEnaZE/wG4hSoTt
   Q==;
X-CSE-ConnectionGUID: 5AnN86NhTly3+cUzBbgDtA==
X-CSE-MsgGUID: LEwwFvqbTe+WOQoNYPPMhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101681176"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101681176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 18:35:57 -0700
X-CSE-ConnectionGUID: kbx9WTrhQ5uPeURE8M4tzw==
X-CSE-MsgGUID: 5ICZFqndSiWB1U55rheQsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278523898"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jul 2026 18:35:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whHCb-00000000FtH-2ctH;
	Wed, 08 Jul 2026 01:35:53 +0000
Date: Wed, 08 Jul 2026 09:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V5 24/27]
 drivers/firmware/arm_scmi/scmi_system_telemetry.c:224:13: warning:
 'base.flags' is used uninitialized in this function
Message-ID: <202607080913.xZyiNIhD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V5
head:   12bf8bf979989adcd25b57e702706658e00cee91
commit: 7fd3f28bf9eec2fd5f7d048c336d9b2035d263e2 [24/27] firmware: arm_scmi: Add System Telemetry driver
config: powerpc64-randconfig-r054-20260708 (https://download.01.org/0day-ci/archive/20260708/202607080913.xZyiNIhD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080913.xZyiNIhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080913.xZyiNIhD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/scmi_system_telemetry.c: In function 'scmi_tlm_info_get_ioctl.isra':
>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:224:13: warning: 'base.flags' is used uninitialized in this function [-Wuninitialized]
     224 |  out->flags |= in->reset_support ? SCMI_TLM_BASE_CAN_RESET : 0;
         |             ^~


vim +224 drivers/firmware/arm_scmi/scmi_system_telemetry.c

   212	
   213	static inline void scmi_tlm_to_uapi_base_info(struct scmi_tlm_base_info *out,
   214						      const struct scmi_telemetry_info *in)
   215	{
   216		/* This is a trivial copy */
   217		out->version = in->base.version;
   218		memcpy(out->de_impl_version, in->base.de_impl_version,
   219		       sizeof(out->de_impl_version));
   220		out->num_des = in->base.num_des;
   221		out->num_groups = in->base.num_groups;
   222		out->num_intervals = in->base.num_intervals;
   223		out->num_shmtis = in->base.num_shmtis;
 > 224		out->flags |= in->reset_support ? SCMI_TLM_BASE_CAN_RESET : 0;
   225	}
   226	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
