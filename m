Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD937494
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 02:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765765736; cv=none; b=em2VnxmvPpFi7HwOmy0igUgx6SvpXbdhKEN/IxaUt9taN4QJi/VJQHAFRhhWygHx8WnIhtJCj7IBzhi2/dZWAHG+xmnOYJ5FZzcp9TzYKMSyka1F6CgFu+tJUwfLKEQ0ram5v1PFs5l2pdTm02CnWvbuEpUeun5LeKGuNGAtp9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765765736; c=relaxed/simple;
	bh=3uET0RPCNmJUw9S3Kfjr+9NYS8u2YjbU+SJBolaHwco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StsbwhQoiWtDhyJSh4IdZ/9Qy7TkapC7VOEyyFUF2rCqm+Hl9i73GWCMxnj4z6J+0bmXt3ArRMOlLejyCu2gpKNdlnhnx989X5pupZ2vn+4CrURJ9hBSzGB3886xa3rq/TI/iYgFvCdr8TIdZiyn9pWIk/aKFLtJQcuZZJSxocI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIzlDzyT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIzlDzyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765765734; x=1797301734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3uET0RPCNmJUw9S3Kfjr+9NYS8u2YjbU+SJBolaHwco=;
  b=GIzlDzyTOjG3hjAtBf1FgSEcvCFmo+akHdHsyCMoYSzJQonxfqGfA8NH
   pFy6lbDv0H2+jCHUnhEcDuitjRYvNITu5KVSkS9W3p02/Vcd9nkbdjMay
   eFgJY2l81DcVXeGG5o4fJlQFgGGk2BNlJowMr23QwMh9nDElCLoDKX/sA
   Dg6FlyHREhW1V0vDr3qEXHan+f94JJiq+mw22ksiL3eCBtL3t+zEj2NAY
   1aRnKRkfX9Ff8Ct14fLcig5XC7+QQXBz+sHZJyOCW231OpPq9elZVV8Xt
   Kz5Lvl3IdZn7hqHKNaHUM1LqHfzWR2TgAYA/Pw/tbml8dMQeuo3nQZ9/x
   Q==;
X-CSE-ConnectionGUID: j1x1SzR0TDCckMHF315a5g==
X-CSE-MsgGUID: cJdt4a3NRRa1ic4v8YME0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66651724"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66651724"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 18:28:53 -0800
X-CSE-ConnectionGUID: jybd6YGvRVqAslqlatztcA==
X-CSE-MsgGUID: hvlWABjGSRiQlDVw3Cn96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228258721"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2025 18:28:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUyKP-000000002XQ-38Zi;
	Mon, 15 Dec 2025 02:28:49 +0000
Date: Mon, 15 Dec 2025 03:28:16 +0100
From: kernel test robot <lkp@intel.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH RFC net-next 10/13] dpll: Add reference
 count tracking support
Message-ID: <202512150306.R9AA7Oz2-lkp@intel.com>
References: <20251211194756.234043-11-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211194756.234043-11-ivecera@redhat.com>

Hi Ivan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dt-bindings-net-ethernet-controller-Add-DPLL-pin-properties/20251212-035305
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251211194756.234043-11-ivecera%40redhat.com
patch subject: [Intel-wired-lan] [PATCH RFC net-next 10/13] dpll: Add reference count tracking support
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251215/202512150306.R9AA7Oz2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150306.R9AA7Oz2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150306.R9AA7Oz2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dpll/dpll_core.c:399 function parameter 'tracker' not described in 'dpll_device_get'
>> Warning: drivers/dpll/dpll_core.c:434 function parameter 'tracker' not described in 'dpll_device_put'
>> Warning: drivers/dpll/dpll_core.c:746 function parameter 'tracker' not described in 'dpll_pin_get'
>> Warning: drivers/dpll/dpll_core.c:781 function parameter 'tracker' not described in 'dpll_pin_put'
>> Warning: drivers/dpll/dpll_core.c:802 function parameter 'tracker' not described in 'fwnode_dpll_pin_find'
>> Warning: drivers/dpll/dpll_core.c:399 function parameter 'tracker' not described in 'dpll_device_get'
>> Warning: drivers/dpll/dpll_core.c:434 function parameter 'tracker' not described in 'dpll_device_put'
>> Warning: drivers/dpll/dpll_core.c:746 function parameter 'tracker' not described in 'dpll_pin_get'
>> Warning: drivers/dpll/dpll_core.c:781 function parameter 'tracker' not described in 'dpll_pin_put'
>> Warning: drivers/dpll/dpll_core.c:802 function parameter 'tracker' not described in 'fwnode_dpll_pin_find'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
