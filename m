Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B913BC12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 02:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735179310; cv=none; b=PvEQdqTz5PUse7DveeAoiu6E4NAurTVJL5e75E6o+n7eLjMELXotozsfV5lgqRG5GXBDiZPdEiublNkuS1jji9Mi87HPlYc8NYpjZB3WUhYriDdGnCQzwVvpXv8Yhzp7/lacACPp46FJfaoBdalFoWUu6qOVWo3jhsRvTkZoHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735179310; c=relaxed/simple;
	bh=dJGH/56oeL8W0nFbxN45rucogtRNpznHbAoKolx8xRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcC8L+pm7ejTfGfbp/PsKGZ5i0xclaA+c/d94md4+zSh3kTjvdsgICiAhDVPc73S6Eoda0W6U7MuQ3SVNp6WZqoHtSQZP1Y4boXTK7wKCWUvYFIt1LBkyphS4GMTR+J/F5s2iOqQG0Q4v624pEvscEjtYx5UfNOQZYt5tBf8B+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTYCnmqy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTYCnmqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735179299; x=1766715299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dJGH/56oeL8W0nFbxN45rucogtRNpznHbAoKolx8xRU=;
  b=gTYCnmqy2Ug/L6GxiL6ex5Pb67xqxWt8Nr4SsF7vyaCp2Vbvklt9/Xtx
   /xpj9SV8JViI15c089omMf+mU7f+hGSLpboa4XfuFg9XBe3be1A0WtsQm
   azcyxa/GlhoAl0JPfp2EMhf7T4DWzElaK8mKcxzYYUHvxRLiUhZD2/sG+
   c8x/ueODnxIVv3vQ5tUnhV1A7vlR38xBxA/IdErxvlmL39y7aJS0nJ+br
   GV1pKstp/CjM9iMUIY9NGgUIhTyL9qI+cVsx5rPAyQZzqxC7auz2rWvqf
   EA1IWfE9J3hZO64JOrLf/vezjZjL36vF4Rx2geIpy7fgzN9SCPyvdLsSr
   g==;
X-CSE-ConnectionGUID: sna0R6M9RyC3U9YCOwWDRA==
X-CSE-MsgGUID: sTs/aQk5Q6Oimz0KkMezNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35312532"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35312532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 18:14:56 -0800
X-CSE-ConnectionGUID: M4fg9gQbRHufaK6H6NWZmQ==
X-CSE-MsgGUID: lCN/SatsQLesh1x1V3gjQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="100176918"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Dec 2024 18:14:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQdOm-0002I7-0G;
	Thu, 26 Dec 2024 02:14:52 +0000
Date: Thu, 26 Dec 2024 10:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.12.23a 26/31] include/linux/srcutree.h:230:9:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202412261041.1lUaXZSl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.12.23a
head:   c4aa4bd45dbc6902d559238debd2c79d9e107814
commit: 54bd8ce1737414436322ddcda7634ad0a6f499a1 [26/31] srcu: Make SRCU readers use ->srcu_ctrs for counter selection
config: powerpc64-randconfig-r112-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261041.1lUaXZSl-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241226/202412261041.1lUaXZSl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261041.1lUaXZSl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/clk/qcom/clk-hfpll.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-x1e80100.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/mmcc-apq8084.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/common.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/apss-ipq-pll.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/reset.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-regmap-mux.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-x1e80100.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-regmap-divider.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-regmap-mux-div.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-ipq4019.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-regmap-phy-mux.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-regmap.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-apq8084.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/tcsrcc-x1e80100.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-qcm2290.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/apss-ipq6018.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-pll.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-x1e80100.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-branch.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-ipq806x.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8916.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-rcg.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-ipq8074.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gdsc.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-ipq5332.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-ipq9574.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-rcg2.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-mdm9607.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/lcc-ipq806x.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8917.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8976.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8909.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8960.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8996.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8953.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8939.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8660.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/apcs-msm8916.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-msm8998.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/mmcc-msm8996.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/lcc-msm8960.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8994.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-msm8998.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-alpha-pll.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/mmcc-msm8998.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/a53-pll.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/clk-rpmh.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/clk/qcom/clk-rpmh.c:270:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/clk/qcom/clk-rpmh.c:270:28: sparse: sparse: restricted __le32 degrades to integer
--
   drivers/clk/qcom/mmcc-msm8960.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/ecpricc-qdu1000.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-qcs404.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-qcs8300.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/q6sstop-qcs404.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sc8280xp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-qcm2290.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/turingcc-qcs404.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-qcm2290.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-qdu1000.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sa8775p.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sc7180.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sa8775p.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sa8775p.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sar2130p.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sc8280xp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sar2130p.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc1-sa8775p.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc0-sa8775p.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sc7180.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sc7180.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/lpasscc-sdm845.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sc8280xp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/lpasscc-sc7280.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sc8180x.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sdm845.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sdm660.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sdm845.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sdx65.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sc8280xp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sdm845.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sc7280.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sc7180.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sc7280.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sdx55.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sdm660.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/mmcc-sdm660.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sm8250.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sdx75.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sm4450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sm7150.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/clk/qcom/camcc-sm7150.c:1900:15: sparse: sparse: symbol 'camcc_sm7150_hws' was not declared. Should it be static?
--
   drivers/clk/qcom/camcc-sm6350.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sm6350.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sm6375.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sm8550.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sm8650.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sm4450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sm6115.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/camcc-sm8450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sm7150.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sm8350.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm4450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sm4450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm6350.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sm8550.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sm8450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm6375.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm6115.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm6125.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm8550.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm8350.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm8650.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm8250.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/dispcc-sm8550.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm8450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm7150.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gcc-sm8150.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sm6125.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sm8150.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sm6115.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/tcsrcc-sm8650.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sm7150.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sm8250.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/gpucc-sm8450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sm8250.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/tcsrcc-sm8550.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sm8450.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sm8350.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/clk/qcom/videocc-sm8550.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   kernel/rcu/rcu_segcblist.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   kernel/rcu/srcutree.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/srcutree.c:747:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   kernel/rcu/srcutree.c:747:32: sparse:     expected struct srcu_ctr *scp
   kernel/rcu/srcutree.c:747:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
   kernel/rcu/srcutree.c:751:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/srcutree.c:372:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_sdp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:390:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_ssp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:1002:9: sparse: sparse: context imbalance in 'srcu_funnel_exp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1091:9: sparse: sparse: context imbalance in 'srcu_funnel_gp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1342:35: sparse: sparse: context imbalance in 'srcu_gp_start_if_needed' - unexpected unlock
--
   kernel/rcu/rcuscale.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   kernel/rcu/refscale.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/refscale.c:715:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/rcu/refscale.c:715:24: sparse:    struct refscale_typesafe [noderef] __rcu *
   kernel/rcu/refscale.c:715:24: sparse:    struct refscale_typesafe *
   kernel/rcu/refscale.c:670:13: sparse: sparse: context imbalance in 'typesafe_lock_acquire' - wrong count at exit
   kernel/rcu/refscale.c:677:13: sparse: sparse: context imbalance in 'typesafe_lock_release' - unexpected unlock
--
   kernel/rcu/update.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/update.c: note: in included file:
   kernel/rcu/tasks.h:2057:5: sparse: sparse: symbol 'rcu_tasks_trace_lazy_ms' was not declared. Should it be static?
--
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/rcutorture.c:439:22: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:707:9: sparse: sparse: context imbalance in 'srcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c:733:38: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:2036:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
   kernel/rcu/rcutorture.c:3989:49: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock
--
   kernel/rcu/tree.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/tree.c:1064:9: sparse: sparse: context imbalance in 'rcu_start_this_gp' - different lock contexts for basic block
   kernel/rcu/tree.c:1440:9: sparse: sparse: context imbalance in 'rcu_poll_gp_seq_start_unlocked' - different lock contexts for basic block
   kernel/rcu/tree.c:1457:9: sparse: sparse: context imbalance in 'rcu_poll_gp_seq_end_unlocked' - different lock contexts for basic block
   kernel/rcu/tree.c:1908:9: sparse: sparse: context imbalance in 'rcu_gp_init' - different lock contexts for basic block
   kernel/rcu/tree.c:2680:9: sparse: sparse: context imbalance in 'force_qs_rnp' - different lock contexts for basic block
   kernel/rcu/tree.c:2746:25: sparse: sparse: context imbalance in 'rcu_force_quiescent_state' - unexpected unlock
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_stall.h:986:17: sparse: sparse: context imbalance in 'rcu_check_gp_start_stall' - different lock contexts for basic block
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_exp.h:192:9: sparse: sparse: context imbalance in '__rcu_report_exp_rnp' - different lock contexts for basic block
   kernel/rcu/tree_exp.h:1081:9: sparse: sparse: context imbalance in 'start_poll_synchronize_rcu_expedited' - different lock contexts for basic block

vim +230 include/linux/srcutree.h

   214	
   215	/*
   216	 * Counts the new reader in the appropriate per-CPU element of the
   217	 * srcu_struct.  Returns an index that must be passed to the matching
   218	 * srcu_read_unlock_lite().
   219	 *
   220	 * Note that this_cpu_inc() is an RCU read-side critical section either
   221	 * because it disables interrupts, because it is a single instruction,
   222	 * or because it is a read-modify-write atomic operation, depending on
   223	 * the whims of the architecture.
   224	 */
   225	static inline int __srcu_read_lock_lite(struct srcu_struct *ssp)
   226	{
 > 227		struct srcu_ctr *scp = READ_ONCE(ssp->srcu_ctrp);
   228	
   229		RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_lite().");
 > 230		this_cpu_inc(scp->srcu_locks.counter); /* Y */
   231		barrier(); /* Avoid leaking the critical section. */
   232		return scp - &ssp->sda->srcu_ctrs[0];
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
