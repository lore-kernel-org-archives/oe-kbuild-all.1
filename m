Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B31A2C0C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715274797; cv=none; b=LofBjsHOBP9HvIFi44rVINlY6f5+tvnoBmxMzOAhgkMxl6ji2jvijuaSFH0+7GjdmXI4LXf4ZHQyEdTV0PxL6S0fSAk9OFtk7ahzcPEaoZAYEVvElugpJ/bZL59gy59ICcqbWQdRkM39TEpS5GQ6fsYO/3JnuyZ7E+J+x36+Ip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715274797; c=relaxed/simple;
	bh=Ci4a1mxVzVOKLo+ErN9qcFscgfp/7udd9S37crixp3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSqwhzC45N+JadWUZu94fjcFvz+Y2ULlk1r68163a+rExczLvLDrDh5yIznCu6NxA31EVdo8NSPyX7qoDjd2JEwtOsi5z3jGTna9plzJgIup/IMr1OUvn5mSOXNgPzJIvsQTdwzTIKsoVfLZvZM2DHDetrd/ZPaSMjxW7AjCGFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTeH9pzs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTeH9pzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715274796; x=1746810796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ci4a1mxVzVOKLo+ErN9qcFscgfp/7udd9S37crixp3g=;
  b=UTeH9pzsSyz5l1uLY9Rya871Jd6kIVdKCiAM8uLniIGioHS70cJV+gXE
   FudGUMfW5fQJ8kjmZF/K73HsbMuBCuTNfgqUYQZ4KkMcBViw+US6v1YPe
   ZFShn9LEnYryyGaF9hTQ4UORFyvpc6sXp/Vny7ZI359CCO/KmUNpdqiNA
   tTsgqJkYWaVst9JqZnFu6j/6oe3bmkzk0jNh/2q1s5c5NH7FPhggY4H0n
   1btqXxWaVxnO/fINhw+tokSeiHCGU8WEoPuOhk9GB+wAgrl2deBrte9KC
   tOZAiMIOSPwXQXEDtJ2unjmOnTZA3cpvVLsolXaPQMxK5Hdonq8J9OXqq
   g==;
X-CSE-ConnectionGUID: JG58U5KjSKO7sZT1eR38og==
X-CSE-MsgGUID: G1J/8pSATbiAl5RcvlE9pA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22617208"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="22617208"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 10:13:15 -0700
X-CSE-ConnectionGUID: trCMsmlWQ1+v38Pf6IcagA==
X-CSE-MsgGUID: FrCHC8L6Q9yl5iHeCISxAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="60495970"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2024 10:13:14 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s57KR-0005AF-2V;
	Thu, 09 May 2024 17:13:11 +0000
Date: Fri, 10 May 2024 01:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.10 131/152] acp-probes.c:undefined reference to
 `acp_dsp_stream_put'
Message-ID: <202405100111.L47ujRXf-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.10
head:   dd5cb1b42ac162c1a6e43ce5cc7c084b5525ba4c
commit: 9c2f5b6eb8b7da05e13cde60c32e0a8b1f5873b0 [131/152] ASoC: SOF: Use *-y instead of *-objs in Makefile
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405100111.L47ujRXf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100111.L47ujRXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100111.L47ujRXf-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_shutdown':
>> acp-probes.c:(.text+0x272): undefined reference to `acp_dsp_stream_put'
   s390-linux-ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_startup':
>> acp-probes.c:(.text+0x3f2): undefined reference to `acp_dsp_stream_get'
   s390-linux-ld: sound/soc/sof/amd/acp-probes.o: in function `acp_probes_compr_set_params':
>> acp-probes.c:(.text+0x62c): undefined reference to `acp_dsp_stream_config'
>> s390-linux-ld: acp-probes.c:(.text+0x65a): undefined reference to `acp_dsp_stream_put'
   s390-linux-ld: sound/soc/sof/amd/renoir.o: in function `sof_renoir_ops_init':
>> renoir.c:(.text+0x42): undefined reference to `sof_acp_common_ops'
   s390-linux-ld: sound/soc/sof/amd/rembrandt.o: in function `sof_rembrandt_ops_init':
>> rembrandt.c:(.text+0x42): undefined reference to `sof_acp_common_ops'
   s390-linux-ld: sound/soc/sof/amd/vangogh.o: in function `sof_vangogh_ops_init':
>> vangogh.c:(.text+0x42): undefined reference to `sof_acp_common_ops'
   s390-linux-ld: sound/soc/sof/amd/acp63.o: in function `sof_acp63_ops_init':
>> acp63.c:(.text+0x42): undefined reference to `sof_acp_common_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
