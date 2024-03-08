Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E8328B6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 06:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709879323; cv=none; b=TkdUtCnfrew/u6Gm6houL7s4iA85M0hXa/76DCOHuHci7gJvE+gNejZAttuWgRCDEd0HE+lRs9MfpLuRvdiHFb2WSXCyI1GyhcfGs0kudcCLh/B34tlyqkOjo+gso7JZ4reVmMQ0dE7bbqmzmM+mxshBQzqI5z03a+DGlNVVZMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709879323; c=relaxed/simple;
	bh=XK3wFfiu0yulW767u6ZrjE95JV3iKMCiIA3osLLOLrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvIdhuRcV08lfETUON46sWmQSIEVZDMh161texZlVGX7BGwnMxwwWh256O66kWzjRLJarrMAqMwmQB3MBDGTuApSUsr7GjKv4jG/DbyGkTzerbQmDq5FRqElul6k2/KwVelOJ02IknA8Vrmg0HxxKxAflYbjPZtVK8/tuzfKQfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2LqfKvW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2LqfKvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709879321; x=1741415321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XK3wFfiu0yulW767u6ZrjE95JV3iKMCiIA3osLLOLrk=;
  b=H2LqfKvWQzqYSTlkqYahXUCTiYKZ/ZtLUqbpTA3xPSteqtWX/6yXWYkB
   i6tJlAv/FZcEy+NAZVwNzhRmXhRJXy+EGwwPAhFNWg3cYWuqTGmGpFLMf
   4AbxCSrW6PBRDmgC8rYijyMm8Ag2VZrjJUvTghL1feOcX+z686MugiQxE
   KexgjuSmdTI6uSIG0kM9Zw+/TmqlbGF5Rd3pYAHQPUMaqmU4JpFUzD1zC
   sMsPJjZ/+FzHlCVDFKx7yJkxKBjBI3oOaJBQceloJjVNLsj8Cu7f6ynvb
   L75zDJ93oHSxI4jTljsSKOspksAOr3wy7ifET5RkJBdE96eOXkUgx8087
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15155907"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="15155907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 22:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="47845482"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2024 22:28:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riTif-00066R-18;
	Fri, 08 Mar 2024 06:28:37 +0000
Date: Fri, 8 Mar 2024 14:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sriram Dash <quic_sriramd@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] arm64: dts: qcom: sa8775p-ride: Enable support for
 firmware managed resources
Message-ID: <202403081417.ig5zSk4u-lkp@intel.com>
References: <1709657858-8563-4-git-send-email-quic_sriramd@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1709657858-8563-4-git-send-email-quic_sriramd@quicinc.com>

Hi Sriram,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240305]
[cannot apply to robh/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.8-rc7 v6.8-rc6 v6.8-rc5 v6.8-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sriram-Dash/dt-bindings-usb-qcom-dwc3-Add-support-for-multiple-power-domains/20240306-010051
base:   next-20240305
patch link:    https://lore.kernel.org/r/1709657858-8563-4-git-send-email-quic_sriramd%40quicinc.com
patch subject: [RFC 3/3] arm64: dts: qcom: sa8775p-ride: Enable support for firmware managed resources
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240308/202403081417.ig5zSk4u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081417.ig5zSk4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081417.ig5zSk4u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sa8775p-ride.dts:776.19-20 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
