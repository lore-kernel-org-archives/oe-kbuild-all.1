Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D992C3266
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 04:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173940; cv=none; b=pPDDg4nVBcZrlLVzY+pFduvFOZ0ugLlz2FaxQ87kUIKOkdo5VO1G9Kgdm2EL5B2CHY2w8zj8eZpHRvZeEczKZRiqLNodF5iOknMUAfWdg/kflJG7nMtGVn4gW3xLYmSxFWnk2PIKSZXKiwCkmLlwUi7jkIMCKerHCwjPm2TLG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173940; c=relaxed/simple;
	bh=kL3lAgSKKBP8YtA5qreoQ1PV8CF+TxJgXnNBQGefyaI=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4hwaaLwltiBNDs9nCTJPkeSw502KhQp7aE1kLPea/Q//kqe352ciOe6+LROHYRIyK4/WBnxKvn2NzihQ16Sfg8xc8zLBCzBn1UQTRzOhCz9BPnrfAO2d7ZqgmrrJU3sytoLZ8XVYwQ1QJM/nBRbj+cTiBjNnLxwTRV51fIcmUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POhlOJCs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POhlOJCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791173939; x=1822709939;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=kL3lAgSKKBP8YtA5qreoQ1PV8CF+TxJgXnNBQGefyaI=;
  b=POhlOJCsEB9OAwmFlTXeWEvpvyxZDAXJUfN8A1UqdzV4NuFwF/NejVPg
   aY9ETkWZPigDrjVOyjXT1/Oa1JeZCrXGVeNR0Yr1FEjjUwxiYPM/5eGaU
   zL1iyC23n+tDxtD98BpBDQtb4gUTqVPptgNOg9dNYVc+PtGWtNXXLaetc
   yAs3DaylF9uhzidS6I7UNe9YYgwORMZaYNVlRlaqvlOS37FBriKmnmcMv
   VI4Y22attGZhP+kMReh5Fd65pOA8cW498SE8UyUPA1etQmBSBfIKl8SJD
   asQ/WD7mgYnqYyjt6RU+lwCneToNcse6tLmnBDwbnjVOaWsIEf4nTunYg
   A==;
X-CSE-ConnectionGUID: 6EfmfkprSdaXy59/gAGHgQ==
X-CSE-MsgGUID: MmwCOM70QTS9D3GGKMCpjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91943805"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91943805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 21:18:58 -0700
X-CSE-ConnectionGUID: F6zotr3vS1qgTxIWshALng==
X-CSE-MsgGUID: CARONiF1TVOpkj59ZROLYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="284797717"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2026 21:18:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDaAB-00000000VKl-1MhC
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Oct 2026 04:18:55 +0000
Date: Mon, 5 Oct 2026 12:18:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: mm: Add KUNIT test for ptval_bytes_to_hex_str()
Message-ID: <202610051221.qUs3iwkO-lkp@intel.com>
References: <202610051221.qUs3iwkO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610051221.qUs3iwkO-lkp@intel.com>

Hi Anshuman,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-Add-KUNIT-test-for-ptval_bytes_to_hex_str/20260929-173530
base:   
patch link:    https://lore.kernel.org/r/202610051221.qUs3iwkO-lkp%40intel.com
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261005/202610051221.qUs3iwkO-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051221.qUs3iwkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051221.qUs3iwkO-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `__kunit_do_failed_assertion'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: mm/tests/ptval_hex_string_kunit.o: in function `ptval_hex_str_u128':
>> ptval_hex_string_kunit.c:(.text+0x1f8): undefined reference to `__kunit_do_failed_assertion'
   powerpc64-linux-ld: mm/tests/ptval_hex_string_kunit.o: in function `ptval_hex_str_u64':
   ptval_hex_string_kunit.c:(.text+0x4f8): undefined reference to `__kunit_do_failed_assertion'
   powerpc64-linux-ld: mm/tests/ptval_hex_string_kunit.o: in function `ptval_hex_str_u32':
   ptval_hex_string_kunit.c:(.text+0x7f8): undefined reference to `__kunit_do_failed_assertion'
>> powerpc64-linux-ld: mm/tests/ptval_hex_string_kunit.o:(.toc+0x0): undefined reference to `kunit_binary_str_assert_format'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
