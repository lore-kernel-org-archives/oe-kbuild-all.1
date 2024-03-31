Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB11474B5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711902335; cv=none; b=llF8smYCodvBqzd9/Dingq80lDh7jl7kUjDFN8gBc75VrQdlXx+Efw3RpZx0UMzjg9rwf3N4wt/NNUvcxGQBwvFXknNqYZNAi1iaRU1Kg/h6JEbCveTFG5M/LpFM3Bt3oGJbPb7XrZ1/DCi/UwNWGRrak/c1NBuNIhXKwBo6pUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711902335; c=relaxed/simple;
	bh=yWxg0NPWCUaDRQKZ19fRdO/Bh+/hLL/nrcOMu6m0FKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKtQ/n9FzAj/a6KSVmT9vxl3s1iNfxsVLmzKvJSJ75KP7t/RlnmzenhoribxNGIRK0oPTPyfXg1ADQ5SGp1APxigFHbl/YoUPCVbwGP0f91vhqOoixl7+e/t26qq/wYtFdUqbVCbTMxK3bTeYUf9Sz3a+p/doPivO0EJRz+79h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB5N4rDP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB5N4rDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711902333; x=1743438333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWxg0NPWCUaDRQKZ19fRdO/Bh+/hLL/nrcOMu6m0FKs=;
  b=iB5N4rDPwVlP2lUQL68DFNllVpDSMZ4m23B/wHDg5q+acMqh2vTCkVKu
   ADRPJzdphUmqOroc7UKRxkQXFL4jocZGrhibgOBVvLbW5wxO90podyYSJ
   wRR0JZwqBzsARCmkM0uRMeq0vfzgGwHWEJ1q/wTia5PU14BZnY3PcsPpV
   Rjdve7riy9AokRdXudPJ9qvok6MTEc+TMb41bMsYf8Lh0dqIvom6T6VXp
   blk3zvjbhFOnj5+l8pS9uCGeWnH9ezdGJviJ2xBwiSrvBTXnYKBGF9Xbh
   6fsZjtOb0UOY7wdZl3oKDfEowmri+sgKWNBd7sX7GUlldwz213mkOUaX5
   Q==;
X-CSE-ConnectionGUID: 8JtGqkeKQaCITjDwb9Yp1g==
X-CSE-MsgGUID: zXk0Lj/2T/ur9eMDe/15XQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7626730"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="7626730"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 09:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="40648037"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Mar 2024 09:25:31 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqxzt-0001Fe-0z;
	Sun, 31 Mar 2024 16:25:29 +0000
Date: Mon, 1 Apr 2024 00:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/6] cxl/core: introduce cxl_mem_report_poison()
Message-ID: <202404010004.KIzupsyI-lkp@intel.com>
References: <20240329063614.362763-3-ruansy.fnst@fujitsu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329063614.362763-3-ruansy.fnst@fujitsu.com>

Hi Shiyang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on linus/master cxl/pending v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shiyang-Ruan/cxl-core-correct-length-of-DPA-field-masks/20240329-144850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20240329063614.362763-3-ruansy.fnst%40fujitsu.com
patch subject: [RFC PATCH v2 2/6] cxl/core: introduce cxl_mem_report_poison()
config: arm64-randconfig-001-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010004.KIzupsyI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010004.KIzupsyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010004.KIzupsyI-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/cxl/core/mbox.o: in function `cxl_mem_report_poison':
>> mbox.c:(.text+0x83c): undefined reference to `cxl_trace_hpa'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
