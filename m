Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564338BBC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 23:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695166894; x=1726702894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNBWr9foiNfXhebnoHHh6GT05WQjH4UOl5viBJ9NIic=;
  b=PwaHur22Efp8TeBloOy3KpGu4RP2zxzuiLTtWLqr+v5mhPfpTKKU76fX
   PEg86tnk2UGiPKDrJnZEjcELSEOsoC5aAjS+ehunf+vdkSI2O7krQtYFH
   kiPiH0mjS08I0wNtiSQropqy/MWdH9hpVpF9HnJdi4781v9Gcn3snIzCT
   X3td0lsAqleK2imp4gSNR6McxO5diX2lPIQ3vvKHPYdy2zLQRU3Xa9bhw
   LEKOD6u7fA+Nvfms/S8K/R7a2wwBcVECCJgBDLkEqlOZhjywJwsrUhKMs
   reGBVfdqbuHYZ4Se7e4hNaQj9bMr8djh9QhsrvsAraP4igK43EIa4bli5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359467957"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="359467957"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749668991"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="749668991"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 16:41:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qikLS-00084S-1i;
	Tue, 19 Sep 2023 23:41:30 +0000
Date: Wed, 20 Sep 2023 07:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-next 213/323] htmldocs:
 Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected
 indentation.
Message-ID: <202309200746.BuqC05iz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f879e04c0619fde5c8eecb51a64da52a5ad4908e
commit: 3ace9076b7188b245eaad0691ea5d8efcbcaae9a [213/323] x86/virt/tdx: Export TD config params of TDX module via sysfs
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309200746.BuqC05iz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200746.BuqC05iz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected indentation.

vim +2 Documentation/ABI/testing/sysfs-firmware-tdx

   > 2	Date:           March 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
