Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE56D312
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASI32oTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698393198; x=1729929198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P/yOqQ4Cd/IlUFgO4FrmjKk2i17lrW5rDm0XHBj/QHI=;
  b=ASI32oTSdM1Ndir94OcdaETyuJdRjaRTzIC2yPBagteklsKReADTnvO0
   QmJPxBzEnz08etfyKgKL3owD77lpItp9BoCUKWU2++bKpwogRaDL1fx0f
   AD3NY0iiHd+CegFt2Mp7c0raTP7p2wzNPQhZD1FVKOArGkZAjZQ2Btysd
   X91szPFwKx5n25Nk0kV2jY2a6rpSV8oY1HCormAdp9xET1gulTXKH7GFQ
   I2jnNi1zCtTsLTrPraMcPzoPYw4LmD7EGKndZ5nMYXLAknpfoHUdMlN1+
   04iuSsIvEGk1aj2uUaFFS5hPJ5lK3kdnBl5PWMpNVNqsCKWTK8DrQxbIw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391602948"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="391602948"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 00:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="753034176"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="753034176"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Oct 2023 00:53:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwHeb-000Abj-1H;
	Fri, 27 Oct 2023 07:53:13 +0000
Date: Fri, 27 Oct 2023 15:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] Fix: rseq uapi: Adapt header includes to follow glibc
 header changes
Message-ID: <202310271556.LunB8KLv-lkp@intel.com>
References: <20231025214811.2066376-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025214811.2066376-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/Fix-rseq-uapi-Adapt-header-includes-to-follow-glibc-header-changes/20231026-054939
base:   linus/master
patch link:    https://lore.kernel.org/r/20231025214811.2066376-1-mathieu.desnoyers%40efficios.com
patch subject: [PATCH] Fix: rseq uapi: Adapt header includes to follow glibc header changes
config: i386-randconfig-001-20231026 (https://download.01.org/0day-ci/archive/20231027/202310271556.LunB8KLv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271556.LunB8KLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271556.LunB8KLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> usr/include/linux/rseq.h:14: include of <linux/types.h> is preferred over <asm/types.h>
>> usr/include/linux/rseq.h:47: found __[us]{8,16,32,64} type without #include <linux/types.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
