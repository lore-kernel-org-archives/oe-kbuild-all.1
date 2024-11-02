Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A713EA930
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730546316; cv=none; b=gyixBWvNlbh6JbH+X6j4+nHBTaOl/uT8e/AXh0pbLex/YYFfuo+D2bs/Z9xBAMNjkFu1vZ4DNEHS3ADJkqpohNBkcJMg1Y7tNHoh7C8bdc+EwQDWInBbmppYbNl/R7u4wp44pXcyHDFOelX1RupxZX2Nv5lIkQ7PAQyye7mP1g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730546316; c=relaxed/simple;
	bh=g1c8A4ELjOPNUK9Qx0rI3AlL/k7bt+1igUAdGS2fSBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLzZ7qGIlpMybJCXqJJye2ov/UV3dE27ZbnVF4gfmGCDEox9IDdqR1L3iv6+P8t3RGK5Pk7Es7Ma/ZRRCXHoQYSX5sVbuGetZZJjM94nqoBZ3yqMlqnZV3ZGa0EfiJW35h1SFEUaCA3209z9VS6mCiIe5UP/xlyL9aat8a8ebb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKM5VP2Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKM5VP2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730546315; x=1762082315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g1c8A4ELjOPNUK9Qx0rI3AlL/k7bt+1igUAdGS2fSBE=;
  b=oKM5VP2YUmf24EOah0VafR/lft4+QfJiGQ/s1Dh/hZdQxKnU0YndObi/
   Pp0HWQiiHheCpvZdaGZvxbSzscfoHdk/Ld+/5FOVBIgPYwHDzGOqqivUc
   Hj0ju68+lbLSO/Aol9OI6b9uAUGoOLcPQYV2YfFiQsv9W/bWVzRKJ6UM/
   nPu+EfuJikaZYHglYd8U6JdkMKBPDTKjbqZax5PCS2eSJGOVlXu5yBUlX
   RSgalvbl1Ra8UeIQeLMBKx7Bje7rLG0/tXjCTen2kKvMw9/L9/GMF4Whf
   WJ8+S/ifXjMimFxv6ef3MqnBiJxug3fbdf+cllyNuSBVWZwOFr7v5HH2q
   w==;
X-CSE-ConnectionGUID: 0tLGC6hvQ9mmjCcaYmS+Dg==
X-CSE-MsgGUID: 52aL25DVSaKcjjQCB/RWSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30068492"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30068492"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 04:18:34 -0700
X-CSE-ConnectionGUID: /4+AovStTVKZy+vtdldnQQ==
X-CSE-MsgGUID: 6SwcR0/oTBO/iL1HTdN6ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="83115982"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Nov 2024 04:18:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7C9G-000ipd-19;
	Sat, 02 Nov 2024 11:18:30 +0000
Date: Sat, 2 Nov 2024 19:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] kasan: use EXPORT_SYMBOL_IF_KUNIT to export symbols
Message-ID: <202411021938.t9ib5DAw-lkp@intel.com>
References: <20241101184011.3369247-2-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101184011.3369247-2-snovitoll@gmail.com>

Hi Sabyrzhan,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.12-rc5]
[also build test ERROR on linus/master]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sabyrzhan-Tasbolatov/kasan-use-EXPORT_SYMBOL_IF_KUNIT-to-export-symbols/20241102-024138
base:   v6.12-rc5
patch link:    https://lore.kernel.org/r/20241101184011.3369247-2-snovitoll%40gmail.com
patch subject: [PATCH 1/2] kasan: use EXPORT_SYMBOL_IF_KUNIT to export symbols
config: x86_64-randconfig-102-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021938.t9ib5DAw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021938.t9ib5DAw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021938.t9ib5DAw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: module kasan_test_module uses symbol kasan_save_enable_multi_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
>> ERROR: modpost: module kasan_test_module uses symbol kasan_restore_multi_shot from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
