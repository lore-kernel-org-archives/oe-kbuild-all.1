Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A771F9DA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726522893; cv=none; b=PrQZqMZvjhppB6RbCLEglBLt7MWV2kKfnYmC+IteDM0hnlLRyGgf67KkZXkwQQGobrcnO9LzNYaYUBrGJ9D2+p8BZUQniKpUUOPUVDGluGJn87TjFil5+5rSyrKs+CtEiFWF6IFuPibYKEU9M+uJTiVCA3GAfWSrT4AHJGBAj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726522893; c=relaxed/simple;
	bh=tnIh8c2PkU3/O54+XZsMtwfN3KvkpLku5RSPt7L58TE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q2x/NbvXGBkS7hoozSxU7D0eJVGUbr4IIIwDd6NYX0tXXJs6NGHGP3E2cVYYFUd1V5fvzXiW1fljcswTHJfNWShkCOB+KXHjzgLMrIEQx4z6ozKlKktOzN1DcM2i5/zh6L1MHgHvYYY7WCbkAbbskfH05FO6uj1NASwUAzETCJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2t7dNIa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2t7dNIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726522891; x=1758058891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnIh8c2PkU3/O54+XZsMtwfN3KvkpLku5RSPt7L58TE=;
  b=H2t7dNIaBL/ckwu95RvzLPEoCHhCTA7vpUls00rqT/LVyja+7UtsYa01
   MWX9G+5CELLiaLnBJ1u+9juvJcaCePl4mQvVyY5OxiXMAUibOC+d6Vq+8
   7TQHFKwUlGrgc8V6TM+e4lm5rEj88K1KnAr4WTOabx2TLDzhQVjhLOgoG
   wNo2IkxjSiIIcAb5C0NHZAcpQss5oHZ20ijUtbZW+4OsFJ3YamRFae8HB
   Fr+M7SSZgvly3a3gFwrPUjyqCkUXj/PORENMSdTYPXaLIcYYTRB6t1cxO
   Lu+AXKzOCyD2x0jbNGZPV4HWje1NfChrW7eaYtG972O/ElY1ddVJQPGKJ
   w==;
X-CSE-ConnectionGUID: bMf5n5QuTCGZ79DsEO506w==
X-CSE-MsgGUID: gz7p80jySpWiPDEBOuYKrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="28278900"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="28278900"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 14:41:30 -0700
X-CSE-ConnectionGUID: mD6kuhQwSi2REPmPTuV6vg==
X-CSE-MsgGUID: rub38qKNRrqeJRL4VX6dlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="106456490"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Sep 2024 14:41:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqJTK-000AWT-2C;
	Mon, 16 Sep 2024 21:41:26 +0000
Date: Tue, 17 Sep 2024 05:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: [linux-next:master 10289/12187] eeh_pseries.c:undefined reference to
 `eeh_pe_inject_mmio_error'
Message-ID: <202409170509.VWC6jadC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7083504315d64199a329de322fce989e1e10f4f7
commit: b0e2b828dfca645a228f8c89d12fbc2baecfb7ea [10289/12187] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
config: powerpc64-randconfig-003-20231031 (https://download.01.org/0day-ci/archive/20240917/202409170509.VWC6jadC-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170509.VWC6jadC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170509.VWC6jadC-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: arch/powerpc/platforms/pseries/eeh_pseries.o: in function `pseries_eeh_err_inject':
>> eeh_pseries.c:(.text+0x9d0): undefined reference to `eeh_pe_inject_mmio_error'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
