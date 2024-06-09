Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F3C36B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 00:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717893277; cv=none; b=rzPnpDyzauaVJq2TGXosdiPoKUl7XEI2Gt5yCAsbuKV8UpjEVk0Coekw8FpuUBQmVh9KeESjWi1YoVhuOPNzxz6xh5PcL6iuTk7ldfe7mjwal0Bl6e9yadqaIHV4WHr2e5lvw7Fk0U7eaXsyoMyHf6QlqguSnD4HOhN4Uf4/aXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717893277; c=relaxed/simple;
	bh=BCKlVm8/DiZKVglLn1MX/r86W6xR9pWiCTw8RPPmjWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myFShVio22iVl7+mauYcQroaDVcsekqx8/jGD3P49N06zz+QAnaFYpdKCoZpk4+FZu1vs5VzUo1oKAGYN4HvVYjm2tSJvn6Yskf7xlgfKvCcKKIq281dAShUnVHgNF7KmtIIRLIc1aDSQ8EQC7uXSLJwAlMY2ZfN3EpyzdpXrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtcEOPLe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtcEOPLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717893275; x=1749429275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BCKlVm8/DiZKVglLn1MX/r86W6xR9pWiCTw8RPPmjWo=;
  b=GtcEOPLeALhuDtbrlXjkhQIx71kNZ69JUSBwxy6Fv2ps2adk+qtl0CK2
   ooyNnQ2t8j/lTAAWKJJg5vuE+vgS22wtaOviavlk0OtoSn+tPVzGYdRW1
   u8K9kl918ouR8GjCj76CAA+J3swb+oj42OfqfcTcuhHcn6k6YD6kaqgWR
   xXxIwx/s8bfHxX905lh7vzOrSNmezDHmRahMW0cx7Dg+cGy0z5AeP6Rl/
   pxkhVc84GOkfd0hlVy7zFk1yjLO6d/odYYOlpwdSy9fMFBoNHcpoNgYzQ
   3ib8t6yHshVNCJh/IKPOuS3cLZVekJ4rAgGgVRmaAdWe6TiILyzCwA+P9
   w==;
X-CSE-ConnectionGUID: ZswO9GXIQ2mUfx9KDSvHrQ==
X-CSE-MsgGUID: SKb/Lh+CRc+/I8KNpnesKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14542149"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14542149"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 17:34:35 -0700
X-CSE-ConnectionGUID: +d18c6CWTBSVdsR302KCpw==
X-CSE-MsgGUID: G8h4zu9tQB6BC4g1TD6PkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="39249834"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Jun 2024 17:34:34 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG6W0-0000hI-0P;
	Sun, 09 Jun 2024 00:34:32 +0000
Date: Sun, 9 Jun 2024 08:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v8 2/3] xen/pvh: Setup gsi for passthrough
 device
Message-ID: <202406090859.KW3eeESv-lkp@intel.com>
References: <20240607075109.126277-3-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607075109.126277-3-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on pci/next pci/for-linus rafael-pm/linux-next rafael-pm/bleeding-edge tip/x86/core linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pvh-Setup-gsi-for-passthrough-device/20240607-165312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20240607075109.126277-3-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v8 2/3] xen/pvh: Setup gsi for passthrough device
config: x86_64-buildonly-randconfig-006-20240609 (https://download.01.org/0day-ci/archive/20240609/202406090859.KW3eeESv-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090859.KW3eeESv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090859.KW3eeESv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/xen/xen-pciback/pci_stub.o: in function `pcistub_init_device':
>> pci_stub.c:(.text+0x1289): undefined reference to `xen_acpi_get_gsi_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
