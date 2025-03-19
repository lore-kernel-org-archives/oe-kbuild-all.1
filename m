Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98F120C47B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742416215; cv=none; b=IKs79fi47gWkwUgaVtdyJpT03jWUUGhCkuNvXXRJhJlsCtnBbMmPqkCU89IkV0jaDtMMgziDhAfRKb+kqufmqr8AF6qZbtu0BuAC8/rDurePVJWAoWrPHJBdu+ihxifcg8BRNkCbw6iOWjNGmVzp6kPQw0iaWW7/0RaWw7bj3OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742416215; c=relaxed/simple;
	bh=t4k5WT5vBnK+I6cEqLK8+1xScHpPytV8UxP8b0ZoR/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/mUJYQ1DuwFzF9dO5iq+oJQxHk2ply/M3GZ7voCYePqi0OUe5XjHhc1PPjglobLkMxTMcMulBmuZXpQc3z8KX+a5DG6RzCKHrht1kcUda5OA8ORQ5/E7FNEcyuaLIl0shFbr+J37uqQYUzianhLFUIFAimzwo3nPTZv5v1qXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P29jMGQB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P29jMGQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742416213; x=1773952213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4k5WT5vBnK+I6cEqLK8+1xScHpPytV8UxP8b0ZoR/M=;
  b=P29jMGQB69ADFxLkY9hcEjKNuYHCNOnDJeHEgtmR5AvFy/v11yNYDSL6
   yjSfvIKEG55ND9RAJBNC6WSBkrDMSbVD1f1u8j3n3aGnYD2rMn1AlBbS4
   Gi3X7HKxMS9LEmzOpII8YH3PpDU8x4icshBM/Azk69CBp34fDPJZWIIJf
   4ndfpv6WX1Ce07ueGGERDY+K1jArEXzJBLalRPoap85dHOCJOUOHKEjSw
   r7x1tIB93TwpM38c5Bdnv00Rn+Db0TuKV6JBLIKWgLpC3RbCCWULbRt+4
   W6PLjoKSZbMdMhO1Jox++nf6QM66dH80IwQ+GH5AVNJ6L+6WOsLZjC6e2
   w==;
X-CSE-ConnectionGUID: 2aq8bEigRFCXEDCeryASYw==
X-CSE-MsgGUID: N54dFgFUTVqKMTjSp3xX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43798639"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43798639"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 13:30:12 -0700
X-CSE-ConnectionGUID: CO0l10WlT8aN4CPrZFD2dA==
X-CSE-MsgGUID: 8WDHIGhjSX2RZL1YR0F4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="159984672"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2025 13:30:11 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv03E-000FeE-31;
	Wed, 19 Mar 2025 20:30:08 +0000
Date: Thu, 20 Mar 2025 04:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC -next 04/10] splice: Add SPLICE_F_ZC and attach ubuf
Message-ID: <202503200305.LY39uh3a-lkp@intel.com>
References: <20250319001521.53249-5-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319001521.53249-5-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 2e72b1e0aac24a12f3bf3eec620efaca7ab7d4de]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/splice-Add-ubuf_info-to-prepare-for-ZC/20250319-082153
base:   2e72b1e0aac24a12f3bf3eec620efaca7ab7d4de
patch link:    https://lore.kernel.org/r/20250319001521.53249-5-jdamato%40fastly.com
patch subject: [RFC -next 04/10] splice: Add SPLICE_F_ZC and attach ubuf
config: s390-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200305.LY39uh3a-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200305.LY39uh3a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200305.LY39uh3a-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: s390-linux-ld: DWARF error: could not find abbrev number 116
   fs/splice.o: in function `do_splice_direct_actor':
>> splice.c:(.text+0x11cc): undefined reference to `sock_from_file'
>> s390-linux-ld: splice.c:(.text+0x11e0): undefined reference to `msg_zerocopy_realloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
