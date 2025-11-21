Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BCE1DDC28
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763763416; cv=none; b=iJr8dA5dwkQu4QlUe0YzRINp70Souw3P0+d83SxElYoURRxUnmuD0J8Sirh86hAyxRDvgR+Zl/7e7dZ20bUCtQg2yuVO4iVbijG0fWgjRZ1H7K0AqkE2vrLIFJHU80ZvmL5IputdJ1+1CLongnioVEDkeWobESitS/Gy7N/BO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763763416; c=relaxed/simple;
	bh=IZWfBJDaHCe7l541lCMHfRRvdDcJ9cS7vOHixV9h5tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv0c5weW4w/D0iXKMsjbpyMqkpZaMIY7lf1cvUYOt0zYtmd1IfNe3PJtNXqig8c0Bq3FLrymImRxFNPALxCxBbDVVsmAu7P27ITk+XPcZkln5seHzaJ6SfZezPfiljb3WcbDjQfedv9uYOi2VfeMceWlAS7eibuW583Nc5qyeC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvyJieDi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvyJieDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763763415; x=1795299415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IZWfBJDaHCe7l541lCMHfRRvdDcJ9cS7vOHixV9h5tc=;
  b=IvyJieDiLFnhLwRsCQENJlc6ENlxR25cvZVbq+29D//NR3DAssMSkUDl
   NWDDh6BLny5uotdv4T/mm2fHnXGP1jpL8oMFA66ZQnzZord88ZtHVbk1M
   QyzWnSiWJUAjN5zr/7/14L9Mg+J9xsxHtHsuvRruvzTFmvbKXnFFgOTzm
   iUzTGL08KjlaubGKPWaRX5raxKU9F/+vX2MJP1VqZRbRB8uNBbnrpCEYL
   mUNAkL0Dn5G0cd+M7kD7l7Sz8jjl+UVaLoPf87NSyjIEBiJn0Xn2moWJP
   EB2kGykGx/IzOcZHPjInKZ4s80IZBUKSGIoU3kRzqAXtNL+KvBIeMyr52
   w==;
X-CSE-ConnectionGUID: Uv2RXPXdQxSy8OeulESj7A==
X-CSE-MsgGUID: rv01X+gRSNai3g+ek4G4zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88515021"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="88515021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 14:16:55 -0800
X-CSE-ConnectionGUID: TOehty9pSyCfviE3bYiNSw==
X-CSE-MsgGUID: BIxr2Fa8QbCS5hbxVrvkJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="192265938"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2025 14:16:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMZQs-0006vH-32;
	Fri, 21 Nov 2025 22:16:46 +0000
Date: Sat, 22 Nov 2025 06:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	tglx@linutronix.de, andersson@kernel.org, pmladek@suse.com,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com
Cc: oe-kbuild-all@lists.linux.dev, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH 12/26] kernel/configs: Register dynamic information into
 meminspect
Message-ID: <202511220511.nMJSuw8H-lkp@intel.com>
References: <20251119154427.1033475-13-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-13-eugen.hristev@linaro.org>

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on rppt-memblock/fixes]
[also build test ERROR on linus/master v6.18-rc6]
[cannot apply to akpm-mm/mm-everything rppt-memblock/for-next next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/kernel-Introduce-meminspect/20251119-235912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
patch link:    https://lore.kernel.org/r/20251119154427.1033475-13-eugen.hristev%40linaro.org
patch subject: [PATCH 12/26] kernel/configs: Register dynamic information into meminspect
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251122/202511220511.nMJSuw8H-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220511.nMJSuw8H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220511.nMJSuw8H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/configs.c:18:
   kernel/configs.c: In function 'ikconfig_init':
>> include/linux/meminspect.h:144:39: error: implicit declaration of function 'virt_to_phys'; did you mean 'virt_to_page'? [-Wimplicit-function-declaration]
     144 |         meminspect_register_id_pa(id, virt_to_phys(va), size, MEMINSPECT_TYPE_REGULAR)
         |                                       ^~~~~~~~~~~~
   include/linux/meminspect.h:170:17: note: in expansion of macro 'meminspect_register_id_va'
     170 |                 meminspect_register_id_va(__VA_ARGS__); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/configs.c:69:9: note: in expansion of macro 'meminspect_lock_register_id_va'
      69 |         meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +144 include/linux/meminspect.h

184ddf27f54a0b Eugen Hristev 2025-11-19  139  
184ddf27f54a0b Eugen Hristev 2025-11-19  140  #define meminspect_register_pa(...) \
184ddf27f54a0b Eugen Hristev 2025-11-19  141  	meminspect_register_id_pa(MEMINSPECT_ID_DYNAMIC, __VA_ARGS__, MEMINSPECT_TYPE_REGULAR)
184ddf27f54a0b Eugen Hristev 2025-11-19  142  
184ddf27f54a0b Eugen Hristev 2025-11-19  143  #define meminspect_register_id_va(id, va, size) \
184ddf27f54a0b Eugen Hristev 2025-11-19 @144  	meminspect_register_id_pa(id, virt_to_phys(va), size, MEMINSPECT_TYPE_REGULAR)
184ddf27f54a0b Eugen Hristev 2025-11-19  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
