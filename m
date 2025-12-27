Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D90227B83
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766820374; cv=none; b=le/JLG3CXRAuBQZYK2MIaDavxZkiY1vj1drtKZjNrgxoct2k2u3NoMdg+0FVB/sSTpnjhXrMxYZ8g+WV/qbTRxIvrxFFb9gLfpAPpS8qw1BCM2uz1Z0YjVpddJi76lIs65wjM1xwrBKkIax0wa1E9D1IIbM9NKKglUZkDpZD8VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766820374; c=relaxed/simple;
	bh=7akfkFFHZg49hgdfZSDKfZerhMm+dHIbhyZKDPCx1G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgmWrXlE2kb5nHJQy2Cyepwl5CohsjYazoFIZ79AGh5w1MPIDa1Zuc1ZbsbNjPY63JY4/QI1gDaICrj1OswG+VQ76UZYLDQrZ8o9kX8WlhEMzat0lVHIe22bWo6cbGfXgKB2Aq4UlAW5NoqTeeGyeV4M4gDyOMgAWhIR4O6NYzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDVnhftA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDVnhftA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766820371; x=1798356371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7akfkFFHZg49hgdfZSDKfZerhMm+dHIbhyZKDPCx1G4=;
  b=eDVnhftApH5lfmrQQV2FqzfAV6/P0dPBKbGid6T7BEL5lE9MUMOs4rjy
   5WxqAgZ1Cd0kbjZJEnp0pgQSdVG025jNW1O08JUnJypDFWQh3k7qz0DMB
   XE8G2Pg0pgwecskmUgU+cnLqvBtvaNbetMmtnNwbZD1EfqrC3Ntrgf1yy
   mZ2FAAQR1dTEV2jZn8kJhyFtlM4foM0izSZxnyIU1EojC/R2OjG/XY3YS
   0EkRiAjFPn4ItRNUvKejVpeQ1LTsmXDIqxQApTXTVoj4ggrtfNFhV2VQQ
   DFlXugnfWwNLyX9F5pgXvXwJt9Jj3ZB/1N7FT7AHOm71IYs+aIXDocF/r
   A==;
X-CSE-ConnectionGUID: AU1wGhmCSwKgcPNpHTe99w==
X-CSE-MsgGUID: cMQvP5jeQKSziOMJ+l626g==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79987903"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79987903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 23:26:11 -0800
X-CSE-ConnectionGUID: /KGYgB5dQ5ex1eXle1TA7Q==
X-CSE-MsgGUID: Lc9ZMFxAS++YbfWiCR87Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205044583"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Dec 2025 23:26:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZOgi-000000005dp-0KAn;
	Sat, 27 Dec 2025 07:26:08 +0000
Date: Sat, 27 Dec 2025 15:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 3/8] acpi/x86: s2idle: add runtime standby transition
 function
Message-ID: <202512271509.KmqeFdS6-lkp@intel.com>
References: <20251226102656.6296-4-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226102656.6296-4-lkml@antheas.dev>

Hi Antheas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/Documentation-PM-Add-documentation-for-Runtime-Standby-States/20251226-183746
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251226102656.6296-4-lkml%40antheas.dev
patch subject: [RFC v1 3/8] acpi/x86: s2idle: add runtime standby transition function
config: x86_64-randconfig-161-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271509.KmqeFdS6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271509.KmqeFdS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271509.KmqeFdS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/power/suspend.c:389 function parameter 'state' not described in 'pm_standby_transition'
>> Warning: kernel/power/suspend.c:469 function parameter 'state' not described in 'pm_standby_set_state'
>> Warning: kernel/power/suspend.c:389 function parameter 'state' not described in 'pm_standby_transition'
>> Warning: kernel/power/suspend.c:469 function parameter 'state' not described in 'pm_standby_set_state'

smatch warnings:
kernel/power/suspend.c:400 pm_standby_transition() error: buffer overflow 'standby_states' 4 <= 4
kernel/power/suspend.c:434 pm_standby_transition() error: uninitialized symbol 'error'.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
