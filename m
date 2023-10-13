Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860CD1C2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 03:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnsTVsOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697169485; x=1728705485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BTeJxU0MJMh1osPdkkRlNQq0P/Cy2NdkgY181vArV6U=;
  b=YnsTVsOpHXvVKoMoV3zuhWUf8jQG+UqDElbW2BPnOPog9T/ns+4GcgCy
   ESptXOG70jbegzvjxdvvejqsXVxLqYEHZLaxJbLkUctyPYd3OSSAFzC8b
   /94IVmJOXuEbI9X3gFrz8YnWknbD/Ywo8so7YKSv8VVynrp4uUipojuSL
   ltYI/S2qWapjUZLCqkRPmP6bqeRdxIH0gzQn1jy8GSpxBm8A+2GtQ1Y0a
   o6zVc3pdA2lknVUBhUw7eqPPUNgyVkfbAdmZbzvJOpOitbK38PqTrJQyR
   5FXNx+6xb/vKqGsY29LqY7GSXJ7FbYcFc/fwLFnv6MH/GhLM0qJ5vTyz2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387953701"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387953701"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 20:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001777248"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001777248"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 20:57:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr9J7-0004JN-25;
	Fri, 13 Oct 2023 03:57:49 +0000
Date: Fri, 13 Oct 2023 11:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] usb: dwc3: core: Fix RAM interface getting stuck during
 enumeration
Message-ID: <202310131100.kvPTYQvC-lkp@intel.com>
References: <20231011100214.25720-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011100214.25720-1-quic_kriskura@quicinc.com>

Hi Krishna,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/usb-dwc3-core-Fix-RAM-interface-getting-stuck-during-enumeration/20231011-180306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231011100214.25720-1-quic_kriskura%40quicinc.com
patch subject: [RFC] usb: dwc3: core: Fix RAM interface getting stuck during enumeration
config: arm64-randconfig-002-20231012 (https://download.01.org/0day-ci/archive/20231013/202310131100.kvPTYQvC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131100.kvPTYQvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131100.kvPTYQvC-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/usb/dwc3/core.o: in function `__dwc3_set_mode':
>> core.c:(.text+0x3ea8): undefined reference to `dwc3_gadget_soft_disconnect'
>> aarch64-linux-ld: core.c:(.text+0x3ebc): undefined reference to `dwc3_gadget_soft_connect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
