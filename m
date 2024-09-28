Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637CB1F5E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727535801; cv=none; b=GNLXFFXIQiZuyq/gOxHW+DbZ/JBcZfEJYUWDwS6aiPY9YJB9ywx2i0+XsOzwc/khSI2gwQX6EXxvwMzVHx09SDqTL2s6RmCprBP9LHlDZU0Fa1aszPrJU+JC2NPg2Jyw+KtA410CBMGzb73LW39wiq6nZIBnpNV3RmcdauiSYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727535801; c=relaxed/simple;
	bh=fUKGFYCUgtc777EWFfWIHCcBPFAuheADWb1IUfwBvBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpwYlI1GuBPVYYEb4SYLARCgm6JRS+GalHCgc29TgirJIU4AAZ9wMEp2geuCk9ty/A7I6sQA16+3ZTHKCJx1uiNNfgCWmqNP/2wWAq4QiMGFhOByeUuApBz6NAsAZXAyfO8UbdOzV5hLXpWHAh7TTnKaKSRCaYxXbsJBO24MnWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbuFDUPk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbuFDUPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727535799; x=1759071799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fUKGFYCUgtc777EWFfWIHCcBPFAuheADWb1IUfwBvBc=;
  b=PbuFDUPkTK2zAw6yGi4KccCTae9tFJoiHk8nc4lE7yenmI5i2++JwP7z
   1GXmhw0y74F+vKoeDL2eOsLO9tZMi8mp6ad2/JaFeJmdwLiSdaV97MRjn
   T899JZW048fB/l2gVPDzFO4xZKW9BeaIUpVrkUI5DPd1KFY7h2/f56tax
   sDVx+KmrnTk46tWitwWw9Zs1Y8YjR8ilB+CZQYfzFoaPe2O9/VY5CHioy
   8xC9+G+H+hZvM7VthSntqs0vdUjmMqDRktdOiI41KPPxt3SJiTj8pIknw
   jlZeNL16pzEGvUzZ6hVJuy3vloUOw+nebcPJNJFEa6RtcC43NbxQI3W4E
   g==;
X-CSE-ConnectionGUID: CBWZkVCFRoKcW7URlWUvRQ==
X-CSE-MsgGUID: scpr9LV0Q4mDN4+hJ2kjRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37344375"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37344375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 08:03:18 -0700
X-CSE-ConnectionGUID: WQVJjZIAS3q0RbJgd8Fz4A==
X-CSE-MsgGUID: WzV79fWOQ9WZwsVnczr8Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72502124"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2024 08:03:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYyZ-000NLv-2I;
	Sat, 28 Sep 2024 15:03:15 +0000
Date: Sat, 28 Sep 2024 23:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] acpi,srat: reduce memory block size if CFMWS has
 a smaller alignment
Message-ID: <202409282224.3tpJ0cIJ-lkp@intel.com>
References: <20240925045242.3735-2-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925045242.3735-2-gourry@gourry.net>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on rafael-pm/linux-next rafael-pm/bleeding-edge tip/master linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/acpi-srat-reduce-memory-block-size-if-CFMWS-has-a-smaller-alignment/20240925-233344
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/20240925045242.3735-2-gourry%40gourry.net
patch subject: [RFC PATCH 2/2] acpi,srat: reduce memory block size if CFMWS has a smaller alignment
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409282224.3tpJ0cIJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282224.3tpJ0cIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282224.3tpJ0cIJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/numa/srat.o: in function `acpi_numa_init':
>> srat.c:(.init.text+0x17c0): undefined reference to `set_memory_block_size_order'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
