Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865FD3FE44
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711700447; cv=none; b=Kfa8vhiJ7kU/Do8IxLinhAOHcqpdesGO1/qNIuTYSF+h3c0wvxlz8jkBzQ3QGmq/CbfPQLbSpyWdo1z0RYtuWcPHovsBxIr5xm6x4Z70vG7XZ+Qe8AicefZmritxqMuvio0+XbyLprX+K8ByeWbeuP+J1AL7LAK1WTGr6DuH+Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711700447; c=relaxed/simple;
	bh=euIDv/bMlAG8q7AVNBouQvwowUNC5bhdLSI7uMJKXkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibcQIbeVkpHvKfl5FnPEG3WEqQIUgN9OXrd2CEofGiuxZx96A1Uu5Mb4086ZQgh8KWDyqnwaZwQ7NJaMEUDFWW5VXu9hm53LHhcjlKXQX7XNCGQRVyyxg40dzZ8K4Wpzbjh2Znb9X/24+r2VKAhU0IYE06rk2Uw0cdmYZgUWCi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzTuR6+2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzTuR6+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711700445; x=1743236445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=euIDv/bMlAG8q7AVNBouQvwowUNC5bhdLSI7uMJKXkY=;
  b=YzTuR6+2d5bxeifZBFgF/ZAD6PLLTfLPXQ+2Y6in4wJxsT5r100PULGn
   Pb/qAuHnbi2xh/r4Uz3NX+uMTDeej9Snl3d8W0W7btVpgDo/Xm/Hotzdl
   23OT+ZlagUhV2qRJ6WYI2o7cKfMMtKW/PbfHCaTIlSyfGmgxR4vbqw/cv
   5gL9I+v8GycQKFH53fORkL4J2rXtboACFyy2Fb0dur6il7ByU2MCh7RjF
   L9kATAenCM//KnJvIYIJ1dKUYbmt6K8llBr+3xCRJwWsTiSsjG9cpvCA/
   yfEM8w4JIpHBjQ97pjn9yFVgMvW2IAcroQ4NpfgNG4IM+QDWPJlDsBVH6
   w==;
X-CSE-ConnectionGUID: P5qm1cW5Rzym6nqWwH9GoA==
X-CSE-MsgGUID: 5+CNC+6pRC6jSpYimBYPxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10698884"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="10698884"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 01:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="17369022"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Mar 2024 01:20:41 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq7Tb-0002ze-0G;
	Fri, 29 Mar 2024 08:20:39 +0000
Date: Fri, 29 Mar 2024 16:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, rafael@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lukasz.luba@arm.com,
	dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org,
	sboyd@kernel.org, nm@ti.com, linux-samsung-soc@vger.kernel.org,
	daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
	m.szyprowski@samsung.com, mhiramat@kernel.org
Subject: Re: [PATCH v3 3/4] PM: EM: Add em_dev_update_chip_binning()
Message-ID: <202403291602.UyrrrpzO-lkp@intel.com>
References: <20240328085112.3873050-4-lukasz.luba@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328085112.3873050-4-lukasz.luba@arm.com>

Hi Lukasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on krzk/for-next clk/clk-next linus/master v6.9-rc1 next-20240328]
[cannot apply to soc/for-next rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Luba/OPP-OF-Export-dev_opp_pm_calc_power-for-usage-from-EM/20240328-165357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240328085112.3873050-4-lukasz.luba%40arm.com
patch subject: [PATCH v3 3/4] PM: EM: Add em_dev_update_chip_binning()
config: i386-buildonly-randconfig-002-20240328 (https://download.01.org/0day-ci/archive/20240329/202403291602.UyrrrpzO-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291602.UyrrrpzO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291602.UyrrrpzO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/energy_model.c:814: warning: bad line:                                 information is present in the OPPs.


vim +814 kernel/power/energy_model.c

   811	
   812	/**
   813	 * em_dev_update_chip_binning() - Update Energy Model after the new voltage
 > 814					information is present in the OPPs.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
