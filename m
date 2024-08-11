Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673F4CB36
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723379291; cv=none; b=hH/MMzSLOvTZLqnyY70pbEjsXdg03T7LHAybyskbIpmSxX00Tzzl/jHAwYn6j3HBlP+KpcTuHE5hR9VP5WZfRNvvOoYhgESVrYl8dVDupopankuZjEgNxfgKXZ+hAI1ubQwzjGmCli+IGW+2s542RppqiM0TiHorDCwCaP9sdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723379291; c=relaxed/simple;
	bh=ifmY/NwVet51VR/YQi8+8+GQTxggPltCSZCaVKRizfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz3NWF4ECBkTKGyIYf0fOwiaAQAQ2D4puHBFojSrglJN6K006VMqUD/X6tb1RuJ5TK+AnjjVF1kPbHMJuE9w2bwu+uygWW/0WLXhDCsZ46Gtp9BehcsE/ZX4VUDQ46MJwWPqy2LLNfcPb/oJ0OktLG5qt01OiKWpcVTzNyK6GWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5B8B/IL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5B8B/IL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723379290; x=1754915290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ifmY/NwVet51VR/YQi8+8+GQTxggPltCSZCaVKRizfk=;
  b=B5B8B/ILpzQDN7NFrqymp4qPLbh2LtwbDQop1yDZnr3C20Z1rsTNE6mU
   7FPlQDlr/8tg1pqiYoaE59I12a8I8MGdq9PH/09u4zII45Uqg/5tjaAP5
   lRLHbGVQ61vXkGBQ1tv/0EiQi0GhhRV6ey04UcHAqi01ubYYvz0E37ZdG
   jOInzbprlxOORYf3n3fOaFXIQlpAKsLH/Z3aJn2C+6R/MINOxZe0kYIeX
   qICBJnta5vapmPpe3xDep2w1r1xdZI0PQE1YaoaIFs8USYrXnnphfT3XW
   RlgV6wLIn1lP0sYtZ/FqB09LG96JwPhWLfxX4MBAHxWC8bROq6ZIzID3l
   Q==;
X-CSE-ConnectionGUID: 11/o+I1JTieD5Grx4i+K0w==
X-CSE-MsgGUID: I6F2h+azTQ6/1cVkvx7vsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="25262673"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="25262673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 05:28:08 -0700
X-CSE-ConnectionGUID: dztFoq09TQ+ksk8tLDz1WA==
X-CSE-MsgGUID: QX/NrWQTRjKd/99h+wucuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62932464"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Aug 2024 05:28:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd7g1-000ApD-2l;
	Sun, 11 Aug 2024 12:28:01 +0000
Date: Sun, 11 Aug 2024 20:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, james.quinlan@broadcom.com,
	justin.chen@broadcom.com, kapil.hali@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Support 'reg-io-width' property
 for shared memory
Message-ID: <202408112059.t5hPmQeS-lkp@intel.com>
References: <20240810214621.14417-3-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240810214621.14417-3-florian.fainelli@broadcom.com>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240809]
[cannot apply to robh/for-next soc/for-next linus/master v6.11-rc2 v6.11-rc1 v6.10 v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Fainelli/dt-bindings-sram-Document-reg-io-width-property/20240811-055659
base:   next-20240809
patch link:    https://lore.kernel.org/r/20240810214621.14417-3-florian.fainelli%40broadcom.com
patch subject: [PATCH 2/2] firmware: arm_scmi: Support 'reg-io-width' property for shared memory
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408112059.t5hPmQeS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408112059.t5hPmQeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408112059.t5hPmQeS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/scmi_transport_mailbox.c:37: warning: Function parameter or struct member 'shmem_io_width' not described in 'scmi_mailbox'


vim +37 drivers/firmware/arm_scmi/scmi_transport_mailbox.c

5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  18  
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  19  /**
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  20   * struct scmi_mailbox - Structure representing a SCMI mailbox transport
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  21   *
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  22   * @cl: Mailbox Client
9f68ff79ec2cb3 drivers/firmware/arm_scmi/mailbox.c                Cristian Marussi 2023-04-04  23   * @chan: Transmit/Receive mailbox uni/bi-directional channel
9f68ff79ec2cb3 drivers/firmware/arm_scmi/mailbox.c                Cristian Marussi 2023-04-04  24   * @chan_receiver: Optional Receiver mailbox unidirectional channel
fa8b28ba22d95b drivers/firmware/arm_scmi/mailbox.c                Peng Fan         2024-05-10  25   * @chan_platform_receiver: Optional Platform Receiver mailbox unidirectional channel
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  26   * @cinfo: SCMI channel info
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  27   * @shmem: Transmit/Receive shared memory area
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  28   */
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  29  struct scmi_mailbox {
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  30  	struct mbox_client cl;
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  31  	struct mbox_chan *chan;
9f68ff79ec2cb3 drivers/firmware/arm_scmi/mailbox.c                Cristian Marussi 2023-04-04  32  	struct mbox_chan *chan_receiver;
fa8b28ba22d95b drivers/firmware/arm_scmi/mailbox.c                Peng Fan         2024-05-10  33  	struct mbox_chan *chan_platform_receiver;
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  34  	struct scmi_chan_info *cinfo;
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  35  	struct scmi_shared_mem __iomem *shmem;
0905440d6ece25 drivers/firmware/arm_scmi/scmi_transport_mailbox.c Florian Fainelli 2024-08-10  36  	u32 shmem_io_width;
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31 @37  };
5c8a47a5a91d4d drivers/firmware/arm_scmi/mailbox.c                Viresh Kumar     2020-01-31  38  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
