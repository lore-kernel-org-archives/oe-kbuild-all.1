Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8AABE40
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 00:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737246266; cv=none; b=JVJPyA9WmXhDNG8ycJ7ydShSbOjgWtpmDUnDbS41VAxx0qS+re/8o5jA4wnWrUwAYNjRSHB0g3kI+GTP/aLrMABS97Z7jUFbBGWAiB+eoUF6A4W18Yw5FNs92vT8oEuPQV7pG44OGpmRuEFYUqTtjN9s8wZxTgshaVNJUF3YwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737246266; c=relaxed/simple;
	bh=ZzyMbQA/mXtN2S2xQRWb8l/MC4bJrX6Yf6KOvIeRKwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGdFOcj8IECr3z5oTLO+HUELhoTo7Do3Qa5qZK82dsHq/bEWNVPFbRZdRX8bja4CpoVRDGoM0XFn5dCHX8CE3vUjRJamXelRsUB52ta7s50aQgq8F4Q3QHT2vxYOH1rdD4olvZ057cQJ7WlP/nb+GjX5uZ6byehwZRf3cEwGbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWkIwfy9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWkIwfy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737246263; x=1768782263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZzyMbQA/mXtN2S2xQRWb8l/MC4bJrX6Yf6KOvIeRKwU=;
  b=UWkIwfy9Jn5QPJNyGZ9lmubsu58o/2szdm6LH8AMc+tFhqgkkaLEkVRe
   /ilUgak0cS7tKKKSPHGppFXhvLjGdPz0177CuLhbMp/yMjLTP5IQP7lDU
   iQT0VKZ51sSJ3NbQIwDKBEObUqP5UIdn9utSLq3/uEIUqyatFC03abar3
   3GJI5EHS54YQdXZL8DK6tclNnBdPDZOInUcHf3wsWmDnmL6WwEsjci3Nc
   LeNv8zyM/pNvkVKNMjdR+USIp1789BNJbk45G9eB3ivDg7ybK08VHVFGO
   D0Yzhyt1KbrBysZG27rQ7klGHSmndG9wyNWpVeDC8qXuMMfb7rjNxbTt6
   g==;
X-CSE-ConnectionGUID: C9J6WEWmTROPvNznDHUOgA==
X-CSE-MsgGUID: uw3/8BFqR2Ww8VwUXNYI4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37525775"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="37525775"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 16:24:23 -0800
X-CSE-ConnectionGUID: /QefDfIMQ4eGky7kbuSmaA==
X-CSE-MsgGUID: eigdkbVeRLaotnMtC0CcpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111243452"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jan 2025 16:24:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZJ6w-000Uxb-1u;
	Sun, 19 Jan 2025 00:24:18 +0000
Date: Sun, 19 Jan 2025 08:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Michael Kelley <mhklinux@outlook.com>, Wei Liu <wei.liu@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drivers/hv: introduce vmbus_channel_set_cpu()
Message-ID: <202501190802.DKAgQNvk-lkp@intel.com>
References: <20250115214306.154853-1-hamzamahfooz@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115214306.154853-1-hamzamahfooz@linux.microsoft.com>

Hi Hamza,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/drivers-hv-add-CPU-offlining-support/20250116-054519
base:   linus/master
patch link:    https://lore.kernel.org/r/20250115214306.154853-1-hamzamahfooz%40linux.microsoft.com
patch subject: [PATCH v3 1/2] drivers/hv: introduce vmbus_channel_set_cpu()
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190802.DKAgQNvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190802.DKAgQNvk-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
>> Makefile:47: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +47 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  46  
3812b8c5c5d527 Masahiro Yamada 2019-02-22 @47  # Do not use make's built-in rules and variables
3812b8c5c5d527 Masahiro Yamada 2019-02-22  48  # (this increases performance and avoids hard-to-debug behaviour)
3812b8c5c5d527 Masahiro Yamada 2019-02-22  49  MAKEFLAGS += -rR
3812b8c5c5d527 Masahiro Yamada 2019-02-22  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
