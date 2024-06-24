Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1C13D628
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244095; cv=none; b=hCnnRM8lzHesTo4ZmewJUyTD9NHhrMs5sZ+ZD4enzGk737tgEHsBBLO5jVbH/8auFceAHz0ZbC+U4iq1JuPevIX7pvdrbxqmGQ92KmdnBpY0++Htx6BDEBL39SJaL2VbGPoxU8zYCQUt40W+RWdWEmPadBTs7EPxCbti/y8RtPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244095; c=relaxed/simple;
	bh=xy1MD/9o6LjTNT5/FCJK4604cdRBwEB1yVWSqDbqHMI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqz/Q5V+SzZ2UzBzwQLX3QDPoIEB1z8OCAK3mEF2Yx51YEZETHCHmcOBf2lOBFzNvF0Scp/nUTXMmSOR6vfI/OszTNy5WbfWzmpqXCKFmbpoUlTECIkqwu85LFK5iBD3R/EcDhOY4TcMkUV6mRWW40J/oJgb6UyuOtF1ruMFPCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM4pryoI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM4pryoI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719244094; x=1750780094;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xy1MD/9o6LjTNT5/FCJK4604cdRBwEB1yVWSqDbqHMI=;
  b=aM4pryoIQmi/YsLs7qWmpPWDWkfxtMsLJfk6lCG/NeEy4Fm92Q3kPuZ/
   Zq7yOpovqLORr+xnmanLzWUVI+6hVwbRNOGvoGxwa8BdCFULAmU9+lLX5
   P4PBnR+9VrUWltLldOHyBqXZmVlMswTSlLgvPj3nzrv9FczNiMf6Xr8fK
   JdMBMxEOlTqv+JxfS2hcbIbEYMJS7vmdYfTjgbDq81UAnU/fRD2Qr97fh
   bsJgtH2p3L8iKznJHGQ0if1qZ4E0t21zx7pT8T6tzwwMN/ivZTYnjYVAs
   NY2opbAbpL27N2T/NpwHfxOE8f2uV8FaUauCfVYkmCmU03B40MQDkPADl
   A==;
X-CSE-ConnectionGUID: cNQdiYVQTYC6rD5hYPRguQ==
X-CSE-MsgGUID: mcC320oDQK6pQanV3pVcKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26907441"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="26907441"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:48:13 -0700
X-CSE-ConnectionGUID: us28kUL7SPK+4Vd8ci5Scg==
X-CSE-MsgGUID: wa2/jQGTS3i6/aqahAae1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="44007751"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2024 08:48:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLlvN-000DTI-2f;
	Mon, 24 Jun 2024 15:48:09 +0000
Date: Mon, 24 Jun 2024 23:48:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 10/15] Error:
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:906.1-11 syntax error
Message-ID: <202406242333.HfCG0iKM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   e48ce466dd3265472e21c1242f9bb55ad6b5a2ac
commit: 2efae4a20c3e102dabef9fb5d48b9f09af5e4432 [10/15] arch: arm64: dts: ti: k3-am62p5-sk: Add TPS65224 PMIC support in AM62P dts
config: arm64-randconfig-051-20240624 (https://download.01.org/0day-ci/archive/20240624/202406242333.HfCG0iKM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406242333.HfCG0iKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406242333.HfCG0iKM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:906.1-11 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
