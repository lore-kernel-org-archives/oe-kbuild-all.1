Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0B81724
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 06:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770965061; cv=none; b=LCIkjkrmpbL3stRU98ZvX00paGwTOp0c3vH2rXRkqkLQC+saOtNh3P3IpX0LSmC8xR1vaOA6NfONkszXscfH/RfuGyIPlVLhz/dDOifbz3+Xz819QbPmKfObNaohZXGH+Fs/8kue3jd11v8x5C0wV7nGITS0zVpSpTmrM+lR5uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770965061; c=relaxed/simple;
	bh=c26enx0LG+6Dq+KMYWoeJUFqETKdVBxT4NaQagJoD3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPvvU5OVCc017nw4yrL1po3PjxH/te8KSo4mOzYoizvZmm0IC1gpsMLkPxcEYgQwMT/oqxXVqUiTeUvbevkKgr8i5+/1u/aBch4npdz7nxMXO7t6ivtYRW1z30LJua+wCqr7rHrGZkIDpSZKIbWqnj4kBO/hLbIEh7bT5G7XZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEzSRdzd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEzSRdzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770965059; x=1802501059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c26enx0LG+6Dq+KMYWoeJUFqETKdVBxT4NaQagJoD3M=;
  b=KEzSRdzdj5Wwn9czHC8rbMpHcQnNkFsrqnvSMGFvjzYsF1S0h/okqo6J
   lMHMBMdt2IvZa1eqLAUr2sgFpuX81OdTlw7wNz0dXqUTGSeGh9ISESL+U
   X3hFwDPCLF6jYs4daY46flWh1A+TTddxlHdaLH6Ab04RpNu9WxP65+fav
   RhMDXPedt8X7yDifswB1Furwofxfx0XU47G1UjQca+6bE3FLof92hMV8H
   eXtSyFu1B9gpoIkX/P3Zk4GKbXgUbZSXURom/yEKfljHaK/N3rgcDXlFP
   q78YQ5ptDnrMWO8d2BBpyZJ2nLKvkENrjlxtO89d34xVM4ZaWY8464pF3
   g==;
X-CSE-ConnectionGUID: 9ZFmZMY+QOWObx6DvuFqjw==
X-CSE-MsgGUID: t+Dh3wY2RQSDF6K/h9FW2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94785427"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="94785427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 22:44:19 -0800
X-CSE-ConnectionGUID: wp5Qgw4jQiqBrdq5tS6/OA==
X-CSE-MsgGUID: 4uGZQAvTR4yYk+xgCF37pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="216983880"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Feb 2026 22:44:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqmuU-00000000vAG-4B4E;
	Fri, 13 Feb 2026 06:44:15 +0000
Date: Fri, 13 Feb 2026 14:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Silicon Labs Kernel Team <linux-devel@silabs.com>,
	Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH v3 10/14] greybus: cpc: use holding queue instead of
 sending out immediately
Message-ID: <202602131458.8YjgR17Z-lkp@intel.com>
References: <20260212144352.93043-11-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212144352.93043-11-damien.riegel@silabs.com>

Hi Damien,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20260212-232259
base:   linus/master
patch link:    https://lore.kernel.org/r/20260212144352.93043-11-damien.riegel%40silabs.com
patch subject: [PATCH v3 10/14] greybus: cpc: use holding queue instead of sending out immediately
config: arm-randconfig-r133-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131458.8YjgR17Z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131458.8YjgR17Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131458.8YjgR17Z-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "skb_put" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_queue_purge_reason" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "__alloc_skb" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_pull" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "sk_skb_reason_drop" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_push" [drivers/greybus/cpc/gb-cpc.ko] undefined!
>> ERROR: modpost: "skb_unlink" [drivers/greybus/cpc/gb-cpc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
