Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E592D1BC068
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723656274; cv=none; b=lq7pphcOjskjgVGq71/kHRLTeqkp3egFv2SVeVvddOBCBDcb08oQJ7qK8+iSKPSJlNeEiT/2svPbJGjZucvS2toQxBpqhRiblvtELfESJPXAGyy8VYBvNsykMQh1QiVKjCppiV3lAiZXSVPvLn67lKHVihHuRTatBPRFxl94eR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723656274; c=relaxed/simple;
	bh=lA+xgV+iDgHq0xbaiiQy3rlhIvSZnsZQd5TAPMVjzso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WppdOIz44x7xU3T5+h+SKF4VlK8KGQHDQKexqE+ABUbdDQRtK4/mboS1yborFNtvbpQ7Xay788hYKX4KewCCIhLs4FCYSyZnxPEAzjW6Pi7xy8oL10ZDyMh+9j0g9y2nmj8lUWyRyoPi4jE6Sv1+DMUtNgO7mr5dZaEPJHJPl1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LouQSiwm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LouQSiwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723656273; x=1755192273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lA+xgV+iDgHq0xbaiiQy3rlhIvSZnsZQd5TAPMVjzso=;
  b=LouQSiwmolmlCd1bkcz7EHvCHLWyaJo7j46EUkfGnurrVbwKKjFZ4wMy
   nQ/UK+2MBSsj7CiyvEPhzfbW8CPB1+yAFxon3UVaF66PVV27m1ihdIlPr
   ufEQ3edZp3SJcenqiGTWOgKs3DGI01kS1mbatPf8blIvAj5/GvRIgCjzy
   1D372MyIQFsfwyRG+XWqAI2Q7fuY0MrHjDRqoMTkvJN1vL1WgjNtqpMIE
   l2VNBWqEwcBd4bU8haVfgDxUXv5CubErtG8b4IhMxmNexG6PvVf5GTMUi
   12cTsOLwUMDND2N7w7vr7KAPKMH8jh13t136EunkQnldwz1AjMdL9AQp8
   g==;
X-CSE-ConnectionGUID: NQpslhRgSbq7Wxc+ZB0Haw==
X-CSE-MsgGUID: UYJEWvN3Rbaxdq30gd3Pgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32564558"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="32564558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 10:24:29 -0700
X-CSE-ConnectionGUID: wffD7kcEScaJXp8C+mn8Ag==
X-CSE-MsgGUID: jJzill+7TK+s2hclhmnJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="89790982"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2024 10:24:24 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seHjS-0002bs-1C;
	Wed, 14 Aug 2024 17:24:22 +0000
Date: Thu, 15 Aug 2024 01:24:22 +0800
From: kernel test robot <lkp@intel.com>
To: Li Li <dualli@chromium.org>, dualli@google.com,
	gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org,
	cmllamas@google.com, surenb@google.com, arnd@arndb.de,
	masahiroy@kernel.org, devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org, hridya@google.com,
	smoreland@google.com
Cc: oe-kbuild-all@lists.linux.dev, kernel-team@android.com
Subject: Re: [PATCH v1] add binder genl for txn report
Message-ID: <202408150142.elc854F6-lkp@intel.com>
References: <20240812211844.4107494-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812211844.4107494-1-dualli@chromium.org>

Hi Li,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Li/add-binder-genl-for-txn-report/20240814-150338
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20240812211844.4107494-1-dualli%40chromium.org
patch subject: [PATCH v1] add binder genl for txn report
config: x86_64-buildonly-randconfig-005-20240814 (https://download.01.org/0day-ci/archive/20240815/202408150142.elc854F6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150142.elc854F6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150142.elc854F6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `binder_genl_cmd_doit':
   binder_genl.c:(.text+0x1284e00): undefined reference to `__alloc_skb'
   ld: binder_genl.c:(.text+0x1284e2f): undefined reference to `genlmsg_put'
   ld: binder_genl.c:(.text+0x1284e5c): undefined reference to `nla_put'
   ld: binder_genl.c:(.text+0x1284e94): undefined reference to `init_net'
   ld: binder_genl.c:(.text+0x1284e9d): undefined reference to `netlink_unicast'
   ld: binder_genl.c:(.text+0x1284f04): undefined reference to `skb_trim'
   ld: binder_genl.c:(.text+0x1284f18): undefined reference to `sk_skb_reason_drop'
   ld: binder_genl.c:(.text+0x1284f72): undefined reference to `sk_skb_reason_drop'
   ld: vmlinux.o: in function `binder_genl_send_report':
>> (.text+0x12850d9): undefined reference to `__alloc_skb'
>> ld: (.text+0x128510a): undefined reference to `genlmsg_put'
>> ld: (.text+0x1285131): undefined reference to `nla_put'
>> ld: (.text+0x128516e): undefined reference to `init_net'
>> ld: (.text+0x1285173): undefined reference to `netlink_unicast'
>> ld: (.text+0x12851c2): undefined reference to `skb_trim'
>> ld: (.text+0x12851d6): undefined reference to `sk_skb_reason_drop'
   ld: (.text+0x128527a): undefined reference to `sk_skb_reason_drop'
   ld: vmlinux.o: in function `binder_genl_init':
>> (.init.text+0xa5bd7): undefined reference to `genl_register_family'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
