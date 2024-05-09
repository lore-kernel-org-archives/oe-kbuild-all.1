Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F2EED5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715283623; cv=none; b=uUvJxM9CHXDN6k0LtnaTVMaQrfXj95EQrVcGdjbsssqQGb9Mxkqre4d4lT1ffY0AvKQvBXEOL1KY5q3uJg/2vM+ud+OfqrSB2sk9HRGBClNiZKcrzdqD1cG8Cun4MLNliChp2OubUJGFynp2d6xiCe+krs2iccpt9IYuAy0p4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715283623; c=relaxed/simple;
	bh=vkWFMx6F6KswB8YZrLS9fW0pY1/J03909WUuQ7cgZLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oCtWxkZR3pMVxV+S50oO+31qQttjZ3rr3Yb8kvhnXRuy6p47mLfxxYGw+UFPdCFlkBJVApyNbYTXB6OVoIlGsikne3FsbBFlCxOO0Vs/D4pHXgB68vwHcw7Z/Rb+wtHFCV7/CZ+PoIg1QM98QKlkh11atbnVBcz5IdYQCg90a2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJnf9jFK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJnf9jFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715283622; x=1746819622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkWFMx6F6KswB8YZrLS9fW0pY1/J03909WUuQ7cgZLE=;
  b=WJnf9jFK9vBl6iUcN809AdMYBCZrXo9VKvHEG8NGCthxNn9DrABYu5sB
   Q7wrf4CGW7oE5hi/aFDQHvblZdadqGjGI3qfrF+FKOqGAiuQBXMaWtyaj
   puGb2uTKpoYD7pWYSptC3zeYuYAjAdHWeqJXEUSmCCWCfktuVIpnUCSMF
   Kl4bX7zInJqWc3g5Q3sZr4woZXDp00LoCm4eE5x1auZjbNyNnxINeUlWg
   b5saZfNVmuJVjhKD/QHuz7aQeIJMSZBAb6Mh1asC6QoaIVlX/FjPiebjm
   vWMLORqOLEmUB3ZNPsGrFB2CBhY93H529hJOtCNI6czYs0NJgd+mGCb0d
   Q==;
X-CSE-ConnectionGUID: sO68t+SpTXatL8jBdd69kw==
X-CSE-MsgGUID: QTOTjQIoQMiveebyPdWpMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21803707"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="21803707"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 12:40:21 -0700
X-CSE-ConnectionGUID: j+4KTr6/SW+YblcrfLYyNA==
X-CSE-MsgGUID: P6u44tTURDGNsWwnUQOJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29912892"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2024 12:40:20 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s59co-0005Hr-0d;
	Thu, 09 May 2024 19:40:18 +0000
Date: Fri, 10 May 2024 03:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 134/156] powerpc64-linux-ld:
 acp-probes.c:undefined reference to `acp_dsp_stream_put'
Message-ID: <202405100333.pclcHwLX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   6bbedd883ce43dc8b1074aa31169f3640776b63a
commit: 9c2f5b6eb8b7da05e13cde60c32e0a8b1f5873b0 [134/156] ASoC: SOF: Use *-y instead of *-objs in Makefile
config: powerpc64-randconfig-r063-20240509 (https://download.01.org/0day-ci/archive/20240510/202405100333.pclcHwLX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100333.pclcHwLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100333.pclcHwLX-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `acp_dsp_stream_put'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_shutdown':
   acp-probes.c:(.text+0x1a4): undefined reference to `acp_dsp_stream_put'
   powerpc64-linux-ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_startup':
   acp-probes.c:(.text+0x2e8): undefined reference to `acp_dsp_stream_get'
   powerpc64-linux-ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_set_params':
   acp-probes.c:(.text+0x4c4): undefined reference to `acp_dsp_stream_config'
>> powerpc64-linux-ld: acp-probes.c:(.text+0x4e0): undefined reference to `acp_dsp_stream_put'
>> powerpc64-linux-ld: sound/soc/sof/amd/renoir.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'
>> powerpc64-linux-ld: sound/soc/sof/amd/rembrandt.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'
>> powerpc64-linux-ld: sound/soc/sof/amd/vangogh.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'
>> powerpc64-linux-ld: sound/soc/sof/amd/acp63.o:(.toc+0x0): undefined reference to `sof_acp_common_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
