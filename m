Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655411C9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tn3AKFeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698317419; x=1729853419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NUDYE8mk5GGR0XyOuEvywgXSW1np/HYY4GhQSiXtaYQ=;
  b=Tn3AKFeCWyuFEvqEw3wcMnNtI5kRonjeETAt+kwzbY29sX3lak2+msfO
   pNhsqf5ZStfrKW+0rZj3nuh9zeq+69roV5YddGCtG87T/7ONVRu5K6zP3
   9kF9rbRYSa2Z41cr41jL55Bqm2qta3N/Ynk3kB9objOqjcLZC3JrWYCs8
   9HJMlk/XLknun5QPrVG4CFBTN5ZBdwP+hViuTBoLol3HAdrFoKoH2kvz3
   43qd+mwZvmepEIeoDuLP01/dZDQMd2pHKGMptNbX2r3+NE+0BlhuLB+Qu
   DGjrtG96QvxTxUKMnphcz93Vzofo/f+/JSCli05n5kCumUoHnfwxmlkeb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451749536"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="451749536"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 03:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932691129"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="932691129"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2023 03:50:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvxwM-0009ix-1u;
	Thu, 26 Oct 2023 10:50:14 +0000
Date: Thu, 26 Oct 2023 18:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 10/10] wifi: remove ipw2100/ipw2200 drivers
Message-ID: <202310261858.eHICZBHt-lkp@intel.com>
References: <20231023131953.2876682-12-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023131953.2876682-12-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless/main]
[also build test WARNING on soc/for-next linus/master v6.6-rc7]
[cannot apply to wireless-next/main next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/wifi-libertas-drop-16-bit-PCMCIA-support/20231023-213053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
patch link:    https://lore.kernel.org/r/20231023131953.2876682-12-arnd%40kernel.org
patch subject: [PATCH 10/10] wifi: remove ipw2100/ipw2200 drivers
reproduce: (https://download.01.org/0day-ci/archive/20231026/202310261858.eHICZBHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261858.eHICZBHt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/device_drivers/index.rst:8: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/wifi/index'

vim +8 Documentation/networking/device_drivers/index.rst

b0d8d4363e523e Jakub Kicinski 2019-05-21   5  
b0d8d4363e523e Jakub Kicinski 2019-05-21   6  Contents:
b0d8d4363e523e Jakub Kicinski 2019-05-21   7  
b0d8d4363e523e Jakub Kicinski 2019-05-21  @8  .. toctree::
b0d8d4363e523e Jakub Kicinski 2019-05-21   9     :maxdepth: 2
b0d8d4363e523e Jakub Kicinski 2019-05-21  10  
4daedf7abb41aa Jakub Kicinski 2020-06-26  11     appletalk/index
9633a0e959174e Jakub Kicinski 2020-06-26  12     atm/index
132db93572821e Jakub Kicinski 2020-06-26  13     cable/index
32db1660ee01ac Dario Binacchi 2022-01-07  14     can/index
132db93572821e Jakub Kicinski 2020-06-26  15     cellular/index
132db93572821e Jakub Kicinski 2020-06-26  16     ethernet/index
55f35cf79d6813 Jakub Kicinski 2020-06-26  17     fddi/index
14474950252cbb Jakub Kicinski 2020-06-26  18     hamradio/index
02bd88b4834d22 Coiby Xu       2021-01-23  19     qlogic/index
132db93572821e Jakub Kicinski 2020-06-26  20     wifi/index
f7af616c632ee2 M Chetan Kumar 2021-06-13  21     wwan/index
b0d8d4363e523e Jakub Kicinski 2019-05-21  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
