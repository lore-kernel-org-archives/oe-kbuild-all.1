Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE42189F48
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 02:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729823994; cv=none; b=TwlVqNl96kM8kKj4sv8thqfWD3vX16DgUwnwKtWxtj3Eh69P7xNj2cQocPMvIkwOkLb1NtkV3f2cLqvsedW/yJ3BP9k8L4k+WvpUZUXYFSOVWOg8BQFCAa3HWdxHvE9P/1dpSuuWwl2N7TGmfXIoZDbls3ix1ZSJhH3wrGKGBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729823994; c=relaxed/simple;
	bh=0rgjKKaUqF9027FmdEr06c+TWFP1x6x7GSdQWYGOOUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APCJJV2mfjNRgmSf2KzW7Dg2R3zjZfScXT09dH9Fj8XGOZoQE/csccnCIF+h9WENFN//bW38u3m3FdN6R/4YlDLW+yC+zWKE1QjqTTKwlP86KZW/+KXOehNWm+jUA0UIJpgBn3LLEuWcR0HLcyzk8GeJwL+SUMnnXJ6Q8F56plM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7yo6TT6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7yo6TT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729823993; x=1761359993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0rgjKKaUqF9027FmdEr06c+TWFP1x6x7GSdQWYGOOUA=;
  b=D7yo6TT6YLjmAF8H5wNj1VxLa9vkgfpehGlGSZAozfJHZ883oQRhoYMW
   +abiVQABps3rI49QmHuMla3/UnZzyDbUpFlc0WorDLDtXOdZ+bK/GxKDK
   9QVBDFyPl7hYsEafMYMi4SvmIozPF860xgNffIGFU11cio8PTLvKwkR6P
   tdOWC/42jLqnZtxQQndJE+VAHIoQ0sEzRBAcMpLFVWIxxdF7jMu/9DjFW
   y0SejXWHg30ybfgGkJ/l8SB+YhBzO7mtsANY+ffZHFj7rQ31Wr/IkTT6v
   W/QV4E2maUuQXIgo6Llg3WEwERvh7GHDUzKdJKb4Yi5cRbZ5HrqtqHL9F
   w==;
X-CSE-ConnectionGUID: OhAkgyhtRnKHtsrVRBQs9w==
X-CSE-MsgGUID: T+qpL58OSL288+9aiU1gpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40592214"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40592214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 19:39:38 -0700
X-CSE-ConnectionGUID: KYqPsm6mS6ayqzVgz9Ieag==
X-CSE-MsgGUID: 9dX2NKZ0THCXvYcjcG2brA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80444698"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2024 19:39:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4AEg-000XTu-17;
	Fri, 25 Oct 2024 02:39:34 +0000
Date: Fri, 25 Oct 2024 10:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/6] alloc_tag: populate memory for module tags as
 needed
Message-ID: <202410251045.H4iemu04-lkp@intel.com>
References: <20241023170759.999909-5-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023170759.999909-5-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on b5d43fad926a3f542cd06f3c9d286f6f489f7129]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/maple_tree-add-mas_for_each_rev-helper/20241024-010916
base:   b5d43fad926a3f542cd06f3c9d286f6f489f7129
patch link:    https://lore.kernel.org/r/20241023170759.999909-5-surenb%40google.com
patch subject: [PATCH v4 4/6] alloc_tag: populate memory for module tags as needed
config: sh-se7206_defconfig (https://download.01.org/0day-ci/archive/20241025/202410251045.H4iemu04-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251045.H4iemu04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251045.H4iemu04-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/execmem.o: in function `execmem_vmap':
>> execmem.c:(.text+0xf4): undefined reference to `__get_vm_area_node'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
