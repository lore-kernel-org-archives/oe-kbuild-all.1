Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B7B27EE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeqCLJPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697116865; x=1728652865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fDH4Ac7cUNJKk+kUiso6kN3Fr/bzFj0qYLZIgdWKEzc=;
  b=DeqCLJPkaW6c8zeimG+ch7zjc4G+V3DXXbdKihHTqY9LngSOoMfTmyRs
   Xv9ZYlR7FPUwoxSzip60PCBBdrPrQQZE+bMTdhSPZgtDIrFDZgrMNE+LL
   gwtFPUHQJOnvxjQ1XpcHikawloSmr1zE8QtzxSGNuuorpwLjJEz6FKexJ
   jRBA5JyFFZyUkqgqjvZ7RLFB7BrI4aZZk76XKYXWi8FBEl1zT63PRUPIb
   4z4jlCHsYuOK+bM/dZv7td7XfA6Wkx7DaWlsEjCjwiUb2H1gGFavztXlX
   g/3LYUdC+95vQFH0g8h0DJ6dXNhldrWC+8nFZcq714HuGVm7AsWUGHLL0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382153591"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="382153591"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 06:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="820145053"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="820145053"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Oct 2023 06:21:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqvca-0003Tc-36;
	Thu, 12 Oct 2023 13:21:00 +0000
Date: Thu, 12 Oct 2023 21:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] usb: dwc3: core: Fix RAM interface getting stuck during
 enumeration
Message-ID: <202310122144.5A1JKmRP-lkp@intel.com>
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
config: arm-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231012/202310122144.5A1JKmRP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122144.5A1JKmRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122144.5A1JKmRP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/usb/dwc3/core.o: in function `__dwc3_set_mode':
   core.c:(.text+0x1b32): undefined reference to `dwc3_gadget_soft_disconnect'
>> arm-linux-gnueabi-ld: core.c:(.text+0x1b40): undefined reference to `dwc3_gadget_soft_connect'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
