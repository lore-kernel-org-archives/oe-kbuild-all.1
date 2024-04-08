Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96D6EDF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712546889; cv=none; b=BCRhKumguA/EfLyOV8cYyDJCwoFlupsHMneina2TOrw84/88QTaqvl5zgr09vn7FTU/CJRFhcXFsiO/Z2ZFyQOyLEn23yD0pAxB2NcYyJWuUqoFQI/is8yljJvZYU+ODOnhNvyhUpfan5DuqlXfgNuDl12b3PD+wzFTyFTN4dSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712546889; c=relaxed/simple;
	bh=WZl6IytZ2H9Qlnnb23O2UAYyRPSqMTpCTLLILOLJIQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=piU0GlC9MTq5PRlZPWFXUU+WezMxNOBIK5RZr0Z4S3tMfuLT7JQnAHRMsY31LoJVoXD5+pV4BeJ5mi/vxfcEIfe0fBfDjt0swUn6wFu49TWyoYWqWqFQWbH/AO5NDG4VVsFc6bEysKjH4H7lLNujuZRyFjm0K4phn9fr95NKowk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWJ8pdUg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWJ8pdUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712546887; x=1744082887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZl6IytZ2H9Qlnnb23O2UAYyRPSqMTpCTLLILOLJIQQ=;
  b=GWJ8pdUgp+ct7D9faUwSSkNQwwOOEcQ3YAz9Zri8a4cpnQCEeUPg2z8X
   UhAq/iLghgr4w1MOG8XFoz01rVcx9EwCUMGYv5hUV9iF9RACvFVWO+BDt
   vJ3zQwUuJcRj0hwWNj8JEw/SZTXbio+jDe+a5DlPYw3ygdeNSyQbvGM8U
   4MMUXzfCTV027grYGwsaqybbhzDnSxet6kcuGweHXIAEhJMoWQAqtlM9m
   ePiYykm9veXcvn/lpeEmr+DgK0+jq3hboFHgXAqGNptp7EaYw2pW+sAIe
   D//mA6lKCJ5Q7cnqGb35rxGyGB5BbDMJ8N2RYgJpAFhJGxXkwrHIpmCWf
   Q==;
X-CSE-ConnectionGUID: h8oZWA74RzSylxTGLRvtqw==
X-CSE-MsgGUID: HNQGGSAmRV6ONaSRz1JFzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18378359"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="18378359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 20:28:07 -0700
X-CSE-ConnectionGUID: VTtOQb7DSVGJXJGa37BClA==
X-CSE-MsgGUID: pW6aR/wSTe65C480QH25AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="20306752"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2024 20:28:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtffu-0004ur-1t;
	Mon, 08 Apr 2024 03:28:02 +0000
Date: Mon, 8 Apr 2024 11:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] kismet: WARNING: unmet
 direct dependencies detected for LEDS_CLASS when selected by NETDEV_LEDS
Message-ID: <202404081104.azGH5xi1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v5
head:   db5976dcfcee45b460fc59b10fc29abcfd9adb3d
commit: 9d7e7e8493bc0393f85b88e2b3b49d4b7cd02407 [5/9] net: Add helpers for netdev LEDs
config: alpha-kismet-CONFIG_LEDS_CLASS-CONFIG_NETDEV_LEDS-0-0 (https://download.01.org/0day-ci/archive/20240408/202404081104.azGH5xi1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240408/202404081104.azGH5xi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404081104.azGH5xi1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS when selected by NETDEV_LEDS
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
