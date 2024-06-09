Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304CA46441
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 16:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717950200; cv=none; b=Rj7gt65Y5w/4xpix6aAam4dCTZrh9lStPnIGlmQD0PH+3QnX8SdbsI1YJuSAN14vd2dqvUdsnaohEAM/nD9NmMgUN3IQK+y0Jtv4EWermaE4wIoKB3wZ1gfRMr9Ru8tU52L7LcoB2k1EHqflq2h/y0iGJfvGiyMhjge1LlrjgDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717950200; c=relaxed/simple;
	bh=E3V+7EUDMjDy1q+uUA6YUhZEjoYZt9ltcXaU/NPI6Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPcKgJ9EefaLSxr2VsS+hbIz3CorOvZLOklT1W39/m6pzaN1qcH4h39W98UMPiN1626Qv+FjWT7IMfCFgEyJ7iN/y0jDSJvjwgtUi4l3WCoYSvcVtIHp5HByILm51YTDOL8NVGXSCIg1cfwF9mc5iKAIUV3j4kXAhecrOAwp15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dU9InYcB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dU9InYcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717950198; x=1749486198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3V+7EUDMjDy1q+uUA6YUhZEjoYZt9ltcXaU/NPI6Wk=;
  b=dU9InYcB77ViYhyg0UY+hdaNdwZXSRfRW2sXqF/uHPvP5XesOcppGk7y
   mYYFz2Pm/7eepZuvgpkKLFurrdNv15cTHErqhpK7XeVd4tYjs7QTLrnor
   H8hTVXju7tRuUSPxruVMQJ/+cSqxT/YFbypL9yTQoLorZTA0vkfAkdckt
   q9xTrSm906ajuEGoiRUhn0m4XHX+0dk82HauLErFmPjU4tc3lhiU0D10r
   uqEr7WZAqiPOpLslVMVVcKqpbk5WBTJgGjLPiQT31lz9BzzftV8kfovac
   94ZsbpoF92y9YWKZYhFw+C3Fn69sRYYGTZpDIXtmFQeO+JIYD+r++EDVT
   Q==;
X-CSE-ConnectionGUID: ikrIjPj7TiOoAQape+Kp0Q==
X-CSE-MsgGUID: j09KV7cgRLOVNY1buGE+XQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11986920"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="11986920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 09:23:17 -0700
X-CSE-ConnectionGUID: FzdaE6lwQZy4enMQNMQMkA==
X-CSE-MsgGUID: MGoQN+qVTRKouqcI0K6MZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="43395651"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2024 09:23:17 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGLK6-0001Pm-2R;
	Sun, 09 Jun 2024 16:23:14 +0000
Date: Mon, 10 Jun 2024 00:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:nxp/v6.10/compulab 3/4] dtbs_check:
 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb:
 interrupt-controller@32fc2000: 'power-domains' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202406100012.eP5TBQ04-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.10/compulab
head:   19e286ef0384a44b8d3320bca2bb46f54188235c
commit: 17d66bd52cc0227dfb057c5ece3060d509184b1b [3/4] arm64: dts: freescale: Add device tree for Compulab SB-UCM-iMX8MPLUS
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100012.eP5TBQ04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100012.eP5TBQ04-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
