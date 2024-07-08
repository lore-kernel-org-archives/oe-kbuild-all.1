Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F77D304
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 05:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720418047; cv=none; b=D44TgBXux8/v7ln/HkofPasVXit3tx+6rLXnwG48iqyYQO6Ym03JQYsKRpR7hz4x1MuEYh0I0yR9M6IDFjNOiGB4PPritfZDJA9Fefb/pXrec7CcQq4UmMgDuc9gJOrop96Wo64HOpoWaFYFpLJF6TOIonK5mTbv+geQg0UmElA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720418047; c=relaxed/simple;
	bh=gWK14INYFEkDDVKh2f3syMoAIL4a1srE4cm5hxDRiAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeTNi6QIqCUy+gqSPyB6sqfNXs5ptMix0xNv7xC7Fawn/64kNC5KjSlcTv+S5l6Hqw0bJ8gnbmU3xBVOM20H4RGiWP1XRGwIW49oHsV+NNgbCxM1w3+wZH0gIyWZZCh+XJPklA9KjpH2TmginEbN8fdXWdp4hIcWCjjU09eK8IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOYWOgnX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOYWOgnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720418046; x=1751954046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gWK14INYFEkDDVKh2f3syMoAIL4a1srE4cm5hxDRiAw=;
  b=HOYWOgnXgOm1bONZbtolOGlv1hvJuxnOlQNyHJdNKZS/5t6mXeHPgb6B
   f8Gg7lMIizaE6qC9ManoijvSr6HPn9GaDw872Wsg1w+5HdY03deF+pRpr
   Lvc14o5bTSNHNctvL8XZH9d9kUd8GF039puSsXfHM1TVUWblSNg+2PHj9
   FpV5X0Arbpr67VhTm9myKAESBKKLXcL2XentJRbYvcGe6yxQMvStW73eK
   wET6gEk+QGFq0ORldRLS3H9uI5BoDYliLZJfsRAdrVeh4htIjlrbjkVj5
   8S6kmTXqMKdQWBx4x6ofLWefbBIPolCTgakrrt+EEtT5yli9Ja8RgIam2
   Q==;
X-CSE-ConnectionGUID: WzAmbj0ASzKPWZupKGQurA==
X-CSE-MsgGUID: WwX7WGYXTS+RDBUnuaRiyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="35135373"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="35135373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 22:54:06 -0700
X-CSE-ConnectionGUID: YRQyi2YTSdu7FkgBa+USgA==
X-CSE-MsgGUID: WOxEGSGIT/m2PU15PRAMoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="51830799"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jul 2024 22:54:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQhK3-000VXG-2n;
	Mon, 08 Jul 2024 05:53:59 +0000
Date: Mon, 8 Jul 2024 13:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com, ptosi@google.com, dan.carpenter@linaro.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Igor Skalkin <igor.skalkin@opensynergy.com>,
	Peter Hilber <peter.hilber@opensynergy.com>
Subject: Re: [PATCH 7/8] firmware: arm_scmi: Make VirtIO transport a
 standalone driver
Message-ID: <202407081344.9OceqFie-lkp@intel.com>
References: <20240707002055.1835121-8-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707002055.1835121-8-cristian.marussi@arm.com>

Hi Cristian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on next-20240703]
[cannot apply to linus/master v6.10-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cristian-Marussi/firmware-arm_scmi-Introduce-setup_shmem_iomap/20240707-082513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20240707002055.1835121-8-cristian.marussi%40arm.com
patch subject: [PATCH 7/8] firmware: arm_scmi: Make VirtIO transport a standalone driver
config: arm-randconfig-r111-20240708 (https://download.01.org/0day-ci/archive/20240708/202407081344.9OceqFie-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407081344.9OceqFie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407081344.9OceqFie-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/scmi_transport_virtio.c:795:24: sparse: sparse: symbol 'scmi_virtio_desc' was not declared. Should it be static?
   drivers/firmware/arm_scmi/scmi_transport_virtio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +/scmi_virtio_desc +795 drivers/firmware/arm_scmi/scmi_transport_virtio.c

   794	
 > 795	const struct scmi_desc scmi_virtio_desc = {
   796		.ops = &scmi_virtio_ops,
   797		/* for non-realtime virtio devices */
   798		.max_rx_timeout_ms = VIRTIO_MAX_RX_TIMEOUT_MS,
   799		.max_msg = 0, /* overridden by virtio_get_max_msg() */
   800		.max_msg_size = VIRTIO_SCMI_MAX_MSG_SIZE,
   801		.atomic_enabled = IS_ENABLED(CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_ATOMIC_ENABLE),
   802	};
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
