Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCA624
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OG+zp4CE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698550429; x=1730086429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q5r3QX5yDoHO7Q/Oaaz9rmyEf2hzTinfWhc89Vue7vY=;
  b=OG+zp4CEkFyKoHpD+RtxVaB3Nr7n65KvlNXa2NZWrlfi2JnyKEJCEIe4
   up73Kezskogs1HDRrxmriDfzv5KjiGsu7S+DhahU+YIvAm30Lms048ky6
   sGz9j5Rja2JwvuYA/y2dn114xwGQgnXldblpRrCRbvfV7qEolDCUYx2l3
   reJiVF4Qf8wyTgorwfSF4XVfSWK5J4K9mQSYHKUWFfZ1DDMGoOAeXv17y
   6Q6aM8OPKQcw9nmO8NXWULLcnQqion4gNUsm9ltoF5rEbrTi0YmbufJji
   zPKOGaFli0sr1DRUFFuw7gJtT8NfNKvnAVPDnHQiv7cS68AIFsgwsxqXm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="391793775"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="391793775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 20:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="8014603"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Oct 2023 20:33:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwwYb-000CIl-20;
	Sun, 29 Oct 2023 03:33:45 +0000
Date: Sun, 29 Oct 2023 11:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/2] kbuild: Build Rust crates as libraries
Message-ID: <202310291142.LW6eZd8v-lkp@intel.com>
References: <20231027003504.146703-2-yakoyoku@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027003504.146703-2-yakoyoku@gmail.com>

Hi Martin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/fixes]
[also build test ERROR on usb/usb-testing usb/usb-next usb/usb-linus rust/rust-next linus/master v6.6-rc7 next-20231027]
[cannot apply to masahiroy-kbuild/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Rodriguez-Reboredo/kbuild-Build-Rust-crates-as-libraries/20231027-083627
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git fixes
patch link:    https://lore.kernel.org/r/20231027003504.146703-2-yakoyoku%40gmail.com
patch subject: [RFC PATCH v2 1/2] kbuild: Build Rust crates as libraries
config: um-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231029/202310291142.LW6eZd8v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310291142.LW6eZd8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291142.LW6eZd8v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: cannot find drivers/nvdimm/../../tools/testing/nvdimm/test/exports_iomap_generated.o: No such file or directory
>> ld: cannot find drivers/nvdimm/../../tools/testing/nvdimm/test/exports_iomap_generated.o: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
