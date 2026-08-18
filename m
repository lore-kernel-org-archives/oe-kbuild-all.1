Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C6E31E852
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043092; cv=none; b=b6gmn2c5HZOimici7lFi0Z25QyMJiY65cO+YIhR1Z1AnBjTXPtWjbIpARFEi2gADBc1l8yGaUHQyKQmSWgGCS8sU5R9Fwtp++vdN8IeYYsvB+ofI6Cm1FeNw05OeQhrJc+SQROs/X5WxSRQWGwzAeKkBXsL2kfAMvndWkDpTP9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043092; c=relaxed/simple;
	bh=4CnP61+049zgvAdEjGQXHJyNjC6r3RyBTFm8BmjfYyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lor+LE1rY9WMuJEbjwvBXzi03fke3y4IjREMlI1LAUotDAkGADM5DLy4XGqbUi88/3H2XppVHnARWGD/Wf8ij+I05cu2p5Fy620wLqlgGmEDjLm6mPN1GtwnQzQYhW1vZEwiRezyE8OwCRIbZQ7V9UhnbYtXNubol9HHRRjC0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dz2YLciq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dz2YLciq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787043091; x=1818579091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4CnP61+049zgvAdEjGQXHJyNjC6r3RyBTFm8BmjfYyw=;
  b=dz2YLciqfNEoGwVwxl5SgTzQ3NnCqCUAduaJrGg0yDSmHhUMLnrrkw6X
   9nkccX4wwUHnltarD1nsx0q9JWqaGPxeL5GME1Yp82FTUt4KDr80rN31Q
   U6MiWUl3gooZOmX8XdzSYuzR7s50/tAfdXXulud1oWQXPUW7A10EtZLTX
   6djQxMcTvoIvR/vycSSaFC9stmn5LlqDxdrpSXSEZ65rLtC8U534vU+9c
   wjr/aZ0tvgIWuBjfP+FC4oxLHoaimvX3XsfRFR3Vy4B1UhxXNWUmKx6ES
   /sOtgs5aA2tcvmzicaY3kzPb+Rmu9AnIkqldD39Vf8JhIwlWPXZq3GlVv
   Q==;
X-CSE-ConnectionGUID: 1w0YeBIhRQ+WlAN+ctJtpQ==
X-CSE-MsgGUID: HOFoeXe5T1C1Quo7EZ8RZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87650663"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87650663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:51:31 -0700
X-CSE-ConnectionGUID: v9ETOGviR7+8lKZk4N5vsA==
X-CSE-MsgGUID: SUdeV4EDTzezHj4ymAX03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270384987"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Aug 2026 01:51:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwFXa-00000000eD8-1IjG;
	Tue, 18 Aug 2026 08:51:26 +0000
Date: Tue, 18 Aug 2026 16:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
Message-ID: <202608181649.yR8lLTtW-lkp@intel.com>
References: <20260403-cpuidle_ipi-v2-1-b3e44b032e2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-cpuidle_ipi-v2-1-b3e44b032e2c@oss.qualcomm.com>

Hi Maulik,

kernel test robot noticed the following build errors:

[auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Maulik-Shah/cpuidle-Deny-idle-entry-when-CPU-already-have-IPI-interrupt-pending/20260815-180554
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260403-cpuidle_ipi-v2-1-b3e44b032e2c%40oss.qualcomm.com
patch subject: [PATCH v2] cpuidle: Deny idle entry when CPU already have IPI interrupt pending
config: x86_64-randconfig-002-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181649.yR8lLTtW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181649.yR8lLTtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181649.yR8lLTtW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: cpuidle_enter_state+0x81: call to cpus_peek_for_pending_ipi() leaves .noinstr.text section

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
