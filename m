Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786A7241E6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299572; cv=none; b=aDATgWuLQQhaZUwLwoWCfiSBZkim/nSAEjRz20t4xtPsh4I4LB6Hs2buzdX3dLHu3cIul5KNYHjI8zRHmjdOdTE304cZTYZk1NOl6CQufBtbAWxKLOiHCdQ2s3kTXRkDA/5zkgUHmnCaQqbCq2WI7I3S9GUNFIgYncfX3sWXtDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299572; c=relaxed/simple;
	bh=A74van680EyeD8FIklTLW1SRbgI9ML5v7OIL5WnazlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JB6xeVuipSIkg2dyQ9ZY1Tb3hFa48B2Jm4HvONl12cl3Vor192HGRy4szlyJZkIshhhJeDXIvWbRpN5g+5RMLGxZBNPLz56FRO8pvnchAyOUo6xMu1Qc66y5gBneKn7Ox4kq/PJqccMJpf5qCx6dhSnMQj8/T+/tUQx765apkqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhmNdv1E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhmNdv1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707299570; x=1738835570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A74van680EyeD8FIklTLW1SRbgI9ML5v7OIL5WnazlA=;
  b=OhmNdv1EZ6h1Eal6iJ5mFipgEiYOywRPBaY+1bi+Z8RFziSPWN7Ow4Sx
   dSJNnzC8EfoVbNMGjxGqAhGafkvdoaGqbbuGTBgMfxgh5HUqD5vdO9+sX
   MZzn57ibf1Xs+1cnKtrqnWHXdtJEy5QFa36j0zPZDHEeS8XOdxoGSascj
   lLbqGXp0d8qaleqY0r2GrmgyQLXzByJ8too0t4hMmYmsbxhmmdV/7QcMH
   P6yboSCRBqSNTIWPC7fBTKfCmCuE4N5yj7odRUhJpXvsG2aNud7g3IVKu
   pl92gbYnv7uBSnevIJn9wQoPpz0bbyJlxZQba71J0S6sPm97tMwcIsiS+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12310712"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="12310712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 01:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1322651"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Feb 2024 01:52:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXebm-0002TA-26;
	Wed, 07 Feb 2024 09:52:46 +0000
Date: Wed, 7 Feb 2024 17:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Chen Ziqiang <chenziqiang1686@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21351/21625]
 drivers/mailbox/phytium_mailbox.c:116:36: warning: 'phytium_mbox_acpi_match'
 defined but not used
Message-ID: <202402071742.dc3sALg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: 1ae9436b02e93f1f2b9cfc10226812197fbfcd04 [21351/21625] mailbox: add phytium mailbox driver
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240207/202402071742.dc3sALg1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071742.dc3sALg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071742.dc3sALg1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/phytium_mailbox.c:116:36: warning: 'phytium_mbox_acpi_match' defined but not used [-Wunused-const-variable=]
     116 | static const struct acpi_device_id phytium_mbox_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_mbox_acpi_match +116 drivers/mailbox/phytium_mailbox.c

   115	
 > 116	static const struct acpi_device_id phytium_mbox_acpi_match[] = {
   117		{ "PHYT0009", 0 },
   118		{ },
   119	};
   120	MODULE_DEVICE_TABLE(acpi, phytium_mbox_acpi_match);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
