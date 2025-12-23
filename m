Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B77F338917
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496205; cv=none; b=gHDCeAMxB5QdgHOyQDsi8Qaqeb5FLb0YoETLG6WpFZ3lEFJVVyR4W2dkLNXz+CBWbu2o84cBuYAMtrZ63UjUvY03eLmSBOMy4dYz8buSUfeARVY4GFq3pbtGKhl2xrxlq89ilz1v+5hYd5/dOUSmLscZA+06vKUoSH91tBCdaoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496205; c=relaxed/simple;
	bh=rqjKymunayEwPeDVegrNhyGlPplhOK5dBWljWTlzY08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gF+GBbcKC1M5nHTGfSnTKf/KXczepn90vfw14wPNIRnsyzxie3ylvQnRuIh4pJUHFQhiZQPp+lngdRkS851hkO2tHgYoXcdBHPgpJCJNUTzcmCHXfcvrLc8Zsm4Q/iMQ8x7acxrv1Ff2SxuuRcAXkFm9irAI+n9TqUeGICHSHTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6T0Rm7x; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6T0Rm7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496204; x=1798032204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rqjKymunayEwPeDVegrNhyGlPplhOK5dBWljWTlzY08=;
  b=e6T0Rm7xRwh3rzglj4T3gPjsv6e7CEVXNL0/Zlao/Eo0XNnMZcmustOZ
   0MsOTxMmxdpbTOITM0VcYckeLWnn+91K5H/GrloqrnZyKCJMg7Rx5h5Y/
   UFd9DXcTBU990n+QRJEUdiqAyhGG0Y82L999Tk49G+0YjAKMoAlShiGdr
   kQBcvSJgBK3VMXF0u97AzJ595kYikGmPH4HU6rJ5wuOAnXBKuJuc/xYFD
   P7yY+TcV1BjvyAbBaLg8H8rdPac+EfkpbBiMvxIiCUs8YnAR5Mof0suaC
   ihnStzvZdjJFJgcJgcfvtagchTUKAXU4fE6c0dTAZIQQouJI8DK7GB/z7
   Q==;
X-CSE-ConnectionGUID: EqJ87HjVRSKJdIo4KW4Q2Q==
X-CSE-MsgGUID: EZpDCuJBQQS0QoxcFrmp3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68226160"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68226160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:23:22 -0800
X-CSE-ConnectionGUID: MglQWePLRHij/XYMpZ4S+w==
X-CSE-MsgGUID: UiQRl1yoQZOfG/sl/2q93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199691760"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2025 05:23:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2MA-000000001xf-2OQE;
	Tue, 23 Dec 2025 13:23:18 +0000
Date: Tue, 23 Dec 2025 21:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Osose Itua <osose.itua@savoirfairelinux.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
	jerome.oufella@savoirfairelinux.com,
	Osose Itua <osose.itua@savoirfairelinux.com>
Subject: Re: [PATCH v2 1/2] net: phy: adin: enable configuration of the LP
 Termination Register
Message-ID: <202512232150.85cDPKrJ-lkp@intel.com>
References: <20251222222210.3651577-2-osose.itua@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222222210.3651577-2-osose.itua@savoirfairelinux.com>

Hi Osose,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master horms-ipvs/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Osose-Itua/net-phy-adin-enable-configuration-of-the-LP-Termination-Register/20251223-064926
base:   net/main
patch link:    https://lore.kernel.org/r/20251222222210.3651577-2-osose.itua%40savoirfairelinux.com
patch subject: [PATCH v2 1/2] net: phy: adin: enable configuration of the LP Termination Register
config: parisc-randconfig-001-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232150.85cDPKrJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232150.85cDPKrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232150.85cDPKrJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/adin.c:7:10: fatal error: cerrno: No such file or directory
    #include <cerrno>
             ^~~~~~~~
   compilation terminated.


vim +7 drivers/net/phy/adin.c

   > 7	#include <cerrno>
     8	#include <linux/kernel.h>
     9	#include <linux/bitfield.h>
    10	#include <linux/delay.h>
    11	#include <linux/errno.h>
    12	#include <linux/ethtool_netlink.h>
    13	#include <linux/init.h>
    14	#include <linux/module.h>
    15	#include <linux/mii.h>
    16	#include <linux/phy.h>
    17	#include <linux/property.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
