Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65736D2FE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 03:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IroyuXSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701834759; x=1733370759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=I91arqGb2NIDiG0HXpCGE71D7hbiVbZCx1+Tfb95mzo=;
  b=IroyuXSiZTGxw3EXOw9CxuEHc3IhtD+0jC9B/qCdj+Jeft4CrsZebO6A
   tSDHts8lSJB6bizdJzXRJoWO0ljzxuyqrbMxdr5dwNFTNufVGZ2K1iY4R
   lYu8QqSh1d8lwbxesgL4yztvEWXBIm1L1lcq8ZVSYdGea1aWfFa13YKh4
   gcfR/7muBXt8Fkt3pUNfQDhu5CWK1+EDcw4KmdfCaNkeBBFMneQzysY4q
   v4seqJ4W0zvShypQTyh88fVLpk3rhKc7bADH3tq72/CuLgC3XBZ7PEGQ8
   sPlZNTp6e13iHo8rzhAwrqIqrqvwje4rx1pVIhsZ1IwsxUsDqJ5NiBsN1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460490638"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="460490638"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="837180470"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="837180470"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2023 19:52:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAixZ-000ADC-3D;
	Wed, 06 Dec 2023 03:52:30 +0000
Date: Wed, 6 Dec 2023 11:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 10/15] dyndbg: add open and close commands for trace
Message-ID: <202312061150.naAOE6Ms-lkp@intel.com>
References: <20231130234048.157509-11-lb@semihalf.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231130234048.157509-11-lb@semihalf.com>

Hi Łukasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ukasz-Bartosik/dyndbg-add-_DPRINTK_FLAGS_TRACE/20231201-084054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231130234048.157509-11-lb%40semihalf.com
patch subject: [PATCH v2 10/15] dyndbg: add open and close commands for trace
config: arc-kismet-CONFIG_DYNAMIC_DEBUG_CORE-CONFIG_DYNAMIC_DEBUG-0-0 (https://download.01.org/0day-ci/archive/20231206/202312061150.naAOE6Ms-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061150.naAOE6Ms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061150.naAOE6Ms-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DYNAMIC_DEBUG_CORE when selected by DYNAMIC_DEBUG
   
   WARNING: unmet direct dependencies detected for DYNAMIC_DEBUG_CORE
     Depends on [n]: PRINTK [=y] && (DEBUG_FS [=y] || PROC_FS [=n]) && TRACING [=n]
     Selected by [y]:
     - DYNAMIC_DEBUG [=y] && PRINTK [=y] && (DEBUG_FS [=y] || PROC_FS [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
