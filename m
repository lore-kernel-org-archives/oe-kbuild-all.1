Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92772F5A22
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771019813; cv=none; b=jWizTF7yqQhmb2ePfIxE2QjXU9cN5SluDLbTZXGdUD0KRlNQQEbtq+0VV0x14s1Ek/ZdiC1MjiOtPqlPgACx39VknqO/s0XR3kae9bSXuRJfVryHLtukj//q54taHbWtqMSdbgzf4WLLTgD0wXPj5r8AI9Z6JsX6il//merjLfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771019813; c=relaxed/simple;
	bh=DaxEy4iyjk0jfiJmRq1yvRj20q5NJhlOW4ZnyL7kN9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dM5JE8clAfSJIri8Y36NQ2PJbb11TPDJKpI0P7Exxm0PWxb1WLJFKyYLs5mcUay1+DP+EakLMJwaBngr8HQczvEgFALsQtFQ+wxjvmt6PAREdlg21Nysk8U8kTNn6r2njWrozivC6rqBny3JTZfm52FMNpX2nMH6/4t3/L6Fb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsY8Zx5G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsY8Zx5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771019809; x=1802555809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DaxEy4iyjk0jfiJmRq1yvRj20q5NJhlOW4ZnyL7kN9U=;
  b=BsY8Zx5GC+1vwRrJkzQkMG19FXwRWEKBM4H4EPLSN5//02Q2PRGxM91V
   eHAkH81eV+xawf0IRSuAng09sWSTcGoOlus43kxsFw6T7Qb3Scwi8Y7+a
   9BaIbWhUAfaFLaCR5eDYWoTiulRjvLqrJ1jldY9sz/vTAWOR9accmSoez
   DNey5Cz195B6T2uOIGXaB727fP5aVRS/ycBFO/u+IMAuYW9kRObpXVFwH
   0xkLaS6DiZbZBengqrJIdbeNTLi9UmFcidytmRysbNJgN0XSpolOHvaKM
   Nv9e1saJMKVYdxN2iGU45tWgW8LrCkV3XmC1Kvc8wcpcLkD7CcJCJOqNM
   g==;
X-CSE-ConnectionGUID: U4rgJYnfQYWbszOxeUOavQ==
X-CSE-MsgGUID: /Py4a8mMQQOVMaCgi7y/rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="97669744"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="97669744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 13:56:49 -0800
X-CSE-ConnectionGUID: p7TBokh2SOSbaUTcGYdRqw==
X-CSE-MsgGUID: FqhAyRx1TR+BKKqJrK4RAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="236016007"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2026 13:56:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr19Y-00000000vqm-472T;
	Fri, 13 Feb 2026 21:56:44 +0000
Date: Sat, 14 Feb 2026 05:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Silicon Labs Kernel Team <linux-devel@silabs.com>,
	Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH v3 11/14] greybus: cpc: honour remote's RX window
Message-ID: <202602140508.Xj7ai7J1-lkp@intel.com>
References: <20260212144352.93043-12-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212144352.93043-12-damien.riegel@silabs.com>

Hi Damien,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20260212-232259
base:   linus/master
patch link:    https://lore.kernel.org/r/20260212144352.93043-12-damien.riegel%40silabs.com
patch subject: [PATCH v3 11/14] greybus: cpc: honour remote's RX window
config: arm-randconfig-r133-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140508.Xj7ai7J1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140508.Xj7ai7J1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140508.Xj7ai7J1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "skb_put" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_dequeue" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_queue_purge_reason" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "__alloc_skb" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_queue_tail" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_pull" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "sk_skb_reason_drop" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_push" [drivers/greybus/cpc/gb-cpc.ko] undefined!
ERROR: modpost: "skb_unlink" [drivers/greybus/cpc/gb-cpc.ko] undefined!
>> ERROR: modpost: "skb_clone" [drivers/greybus/cpc/gb-cpc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
