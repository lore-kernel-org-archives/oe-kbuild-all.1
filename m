Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0812D20D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728809564; cv=none; b=IVb/TAv9wk/mf3Zh269z6oz7xkfDKDkAA83sR5kQgNEXSCn/pl2dYEMdenGhLcLmcKRYsIXgXBWzlOReIe8Z53ftSCqInZYg2TmhtPI9UPahiuDTaPwAHVLQ3fgQd/1hWQrXRJ/8pOBwmMTEnkSDgOxX7XmK1BnU2nyUrGwb9QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728809564; c=relaxed/simple;
	bh=UD1YqoqLreHhFyS6vfSFUekwTj19fHkIF7YoEsutagU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDJev1ELdkD3ikwb0nuSsuXSfqwfNGeVeo0m7JM3mwOUfTEovVbjOQBI+iMUoWfGxb3Sy01ZF+eLN7BrYsdjY4IM4A0u6zDkK8An2xQLdSo5K9P+xPyiWj9B0Q1iJBHG7y4eoLTnwQdyksn7q554TlBlEQ/x+6Gf39KObq1kK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDWN/lL0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDWN/lL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728809562; x=1760345562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UD1YqoqLreHhFyS6vfSFUekwTj19fHkIF7YoEsutagU=;
  b=UDWN/lL0whQS4esajX6gtQqCZ7anHFo2xbn+rKhtuSWGJ1lytBb6cNfX
   upEWtIDLCnKmrmeAO5sQ+FV/NPW76kHWWkRBJ1BFEMiKoTH43JYGAlkLJ
   SqXDh4rakiDUXXtfZvL50R0BTIOjOAbFoKfaS9b7ZPLw9DJ3jiFEzqSvA
   9nlikRao0CVORfqJqq7oLgv6t3N/Z5KhuxR1ARXxAJ5qbrX9r7IkAsDzF
   BzzefsteXVW+q/wwx4gVx8xuK9reRi6Nv6hhLmQwGnyIqlA0Jy2hTf2kc
   kacL4Y6y3v2J0h3rCNuHufE/WJ/9N3b49oqbJ7n2u6shJohls5ls7eLxn
   g==;
X-CSE-ConnectionGUID: yjBNtMIaSnG7pO2iWCfHAg==
X-CSE-MsgGUID: CyQV+9rXRoWU6vdSDhZTjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39286048"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39286048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 01:52:42 -0700
X-CSE-ConnectionGUID: d8Ms5SUTQ3CLDWNJqd11eA==
X-CSE-MsgGUID: XUuHBGDETSqEQiu3Hs9Xxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="77221890"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Oct 2024 01:52:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szuL8-000EEB-31;
	Sun, 13 Oct 2024 08:52:38 +0000
Date: Sun, 13 Oct 2024 16:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Gerhard Engleder <gerhard@engleder-embedded.com>
Subject: Re: [PATCH 3/6] misc: keba: Support EEPROM sections as separate
 devices
Message-ID: <202410131655.SZLsBJYD-lkp@intel.com>
References: <20241009202949.20164-4-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009202949.20164-4-gerhard@engleder-embedded.com>

Hi Gerhard,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gerhard-Engleder/misc-keba-Add-SPI-controller-device/20241010-051016
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241009202949.20164-4-gerhard%40engleder-embedded.com
patch subject: [PATCH 3/6] misc: keba: Support EEPROM sections as separate devices
config: csky-randconfig-r123-20241012 (https://download.01.org/0day-ci/archive/20241013/202410131655.SZLsBJYD-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410131655.SZLsBJYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131655.SZLsBJYD-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/misc/keba/cp500.o: in function `cp500_nvmem_match':
   drivers/misc/keba/cp500.c:481:(.text+0x19a): undefined reference to `i2c_verify_client'
>> csky-linux-ld: drivers/misc/keba/cp500.c:489:(.text+0x1f4): undefined reference to `i2c_verify_client'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
