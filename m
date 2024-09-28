Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D14125B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727513830; cv=none; b=HsyqYJ0gmH9AiS7NJK4qi9qJy37rDG+KedkEfGzK/X4AgygLMbj2BHeB4QymigGndcusRLVM6mNQhOC2dGXNpMeKUjqQjXIVBu+gbYGl2dyZhDrw2vW+hvZ9Mct5IUyAufbC4imP1AZjEPnvyIv3xaJU9BU23hsF9Sbi0c1mCl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727513830; c=relaxed/simple;
	bh=3DLbZ8Cf5LDIaxMtdUV1A2faCV/39A4Oz5WerezCehE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2PyvnO70svbfL6gGvkqoFK243NT7fbmdg9E8I5MrnAawkd1ieA0UMuQWTmkFb2fXGOhZ0JFerJQNp6LTupqBoDIPC0PKtky6Tz0Qh2qO/iw4LrgDjszwtrBmFuiYRcFgfmrUVQpvPGBw7PJu5Y6Z5EFy4h5sFEspMLt8sD1+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8gLA0Qz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8gLA0Qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727513828; x=1759049828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3DLbZ8Cf5LDIaxMtdUV1A2faCV/39A4Oz5WerezCehE=;
  b=W8gLA0Qzzc0UuPpvQS3vmCXdFDuL5sYMKmHfwfOfybjmpbmfMjKEVWb1
   x5+WJ3LCDWXLqPHvggL2wglQe0x0UaKeMxPBYoAFXq66KdXGuCQlOyFH7
   JFaN3llYZSe2nvV2BLW2IC3FRZHRlf/KB8u9iYMUjtWRlphrWCNh9I6R9
   PxmHgbS/D3A/8ggs7ZAEsNO1FrfILQbSI0796UoEDj0SNpnVAX/5NqeVl
   N9i58jc65G/zuANX7HinbXw7u5j08CFUah2MCROhpacAUoVe+5sz6JAW2
   17gJ7dHdfnmUwdG/MNds34PYr8VWYyNhnIXVH+aAegw2GdaCCZEaNPOd7
   Q==;
X-CSE-ConnectionGUID: KtAZsGDORS+HNBlQMO8a8g==
X-CSE-MsgGUID: CGqOsLK9QbW13gc6pa4xxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26531042"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26531042"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 01:57:07 -0700
X-CSE-ConnectionGUID: Y4AfvQ/fQv+OVjB9DvRpxw==
X-CSE-MsgGUID: wMATRaIKSvWnWnDtaz8Xjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73090752"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 01:57:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suTGB-000N3z-2a;
	Sat, 28 Sep 2024 08:57:03 +0000
Date: Sat, 28 Sep 2024 16:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] acpi,srat: reduce memory block size if CFMWS has
 a smaller alignment
Message-ID: <202409281606.glkz6Z8f-lkp@intel.com>
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
[also build test ERROR on rafael-pm/linux-next rafael-pm/bleeding-edge tip/master tip/auto-latest linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/acpi-srat-reduce-memory-block-size-if-CFMWS-has-a-smaller-alignment/20240925-233344
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/20240925045242.3735-2-gourry%40gourry.net
patch subject: [RFC PATCH 2/2] acpi,srat: reduce memory block size if CFMWS has a smaller alignment
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281606.glkz6Z8f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281606.glkz6Z8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281606.glkz6Z8f-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/acpi/numa/srat.o: in function `acpi_numa_init':
   srat.c:(.init.text+0xc10): undefined reference to `set_memory_block_size_order'
>> srat.c:(.init.text+0xc10): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `set_memory_block_size_order'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
