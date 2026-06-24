Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D6F20459A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782344490; cv=none; b=nHXm9BNP8jigaMCHiOe5X3zY0ftobzv4IpzzXa/gzlrTmGVZGBy34DaLdO4dgJPs5QE/KAxBkqMnSQA3Aa2uhleDnwGU0g19jG4/oT5LA9Hi3EJHQ3sBEUGy1MzvDqwkKr3Cwro7/7Rgsj1/Tt/q7Svneqg4Jn3F1p8M/Sw6gmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782344490; c=relaxed/simple;
	bh=rUeEvObnl56oMbALGIsaT4LgLkMMQtXTGCQvim7UmSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ayoluMeJwqgW2l+1yaZIw3TrfRQlz18zcMFe44hryDtaaK6o0YmXCUetX+6aYJqouWs0tBMLxh8gJTSoFUXiNw5q1QI4SRBpYhGec9x5AhQ9kh6G/tJq7XkTd4qNPB1oeO1C+u8LB7Ee1r73G1zmw3R+2FUhun9r0ubS3gEmgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrK+gd7B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrK+gd7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782344489; x=1813880489;
  h=date:from:to:cc:subject:message-id;
  bh=rUeEvObnl56oMbALGIsaT4LgLkMMQtXTGCQvim7UmSo=;
  b=mrK+gd7BckKOzGKB+I1DjHviTE7ig+l3WFHjPbBi12Lmdeu3d9S/lY1P
   NnuIr5kZFOonGroJrROQmtqcjehfQssx7e+qzBn0tUY8TOaebjaL6i5rl
   rV00QAZqvlr6C6pqyTvFzICDtT3tQ4Fg1nADlfUbNe2TX1Tz287FrdT4n
   Z8ykek6UbURRqMJR/2BSks38PWQhMuCOeIEIorXhJN4PZN++c8iyd1/0B
   VeNECJtPnaBE7q/apR8hEBDupxAhhBTbJSqj9cUJq9ttWQlXYDPztIp8T
   ut6Xq2Js3YlFC5AlzXGQsbPV74gcxU1sKMHaiyw4MHjM8D7iqc0tOa0PC
   Q==;
X-CSE-ConnectionGUID: KBnQ0K8GQX+O39nmSFz8mQ==
X-CSE-MsgGUID: mlz76O8eQ3S066dmEBEFKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94609930"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="94609930"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 16:41:28 -0700
X-CSE-ConnectionGUID: lSwE9osmQiuaa0hBpp1RUA==
X-CSE-MsgGUID: rjSoCLXUQbevLw9BRNK+9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="246112008"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2026 16:41:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcXDg-000000003jh-2HZt;
	Wed, 24 Jun 2026 23:41:24 +0000
Date: Thu, 25 Jun 2026 07:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:abi-test 29/34]
 sound/pci/rme9652/hdspm.c:6091:9: error: unknown type name 'compat_u64'
Message-ID: <202606250725.K2RP4JVq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: e430387d24b5e0a0c97ada8286448c698760b4f7 [29/34] uapi: alsa: rme9652: explicit struct padding
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260625/202606250725.K2RP4JVq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250725.K2RP4JVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250725.K2RP4JVq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/rme9652/hdspm.c:6091:9: error: unknown type name 'compat_u64'
    6091 |         compat_u64 card_clock;
         |         ^~~~~~~~~~


vim +/compat_u64 +6091 sound/pci/rme9652/hdspm.c

  6084	
  6085	struct compat_hdspm_status {
  6086		__u8 card_type; /* enum hdspm_io_type */
  6087		__uapi_arch_pad8;
  6088		__uapi_arch_pad16;
  6089		enum hdspm_syncsource autosync_source;
  6090	
> 6091		compat_u64 card_clock;
  6092		__u32 master_period;
  6093	
  6094		union {
  6095			struct {
  6096				__u8 sync_wc; /* enum hdspm_sync */
  6097				__u8 sync_madi; /* enum hdspm_sync */
  6098				__u8 sync_tco; /* enum hdspm_sync */
  6099				__u8 sync_in; /* enum hdspm_sync */
  6100				__u8 madi_input; /* enum hdspm_madi_input */
  6101				__u8 channel_format; /* enum hdspm_madi_channel_format */
  6102				__u8 frame_format; /* enum hdspm_madi_frame_format */
  6103			} madi;
  6104		} card_specific;
  6105		__uapi_arch_pad8;
  6106		/* x86-32 does not have padding here */
  6107	};
  6108	#define COMPAT_SNDRV_HDSPM_IOCTL_GET_STATUS _IOR('H', 0x47, struct compat_hdspm_status)
  6109	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
