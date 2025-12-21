Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC0410F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 02:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766283058; cv=none; b=XSMzt+c52w3T8qJ0BVqfDJB5wOsYrjzmSj5uJ3FCizvpTi+a7uK8ewv6PUdlN19YMKlfU465u6LU4WeYqB5Og86PzD6idZgPCb78Hxy0G8rshn/0gn5D30NUgWtUUQrW6qymjZSaLT5yJc4Fqv86BeG3GFiox0nhfRd2uUcSpuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766283058; c=relaxed/simple;
	bh=56kGoDHWLGE+H+rnmh/Ft03FSl8vKIz5buC2Xe0Y3i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3dkv9c5tCGoyYFviuYVl3yG8bz+zzHgCL+kqS/sS5RUiHCUfUfeuq+2Dy6SzoOl3+vfy1CJzZktpE9AK4+Z6jthJapCDN3Fs0K2BRXDOG2HCA+EBS4zhq0K20lvxXLfGJLo7KDNyxRfD6GB166dCmZ5e7VDFUvFaivtuPCGySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KypwrjNB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KypwrjNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766283055; x=1797819055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=56kGoDHWLGE+H+rnmh/Ft03FSl8vKIz5buC2Xe0Y3i4=;
  b=KypwrjNBs2VbIIVHoR5un4Cc5LlnqFaJzpRfgbIqAjoaD7CPyrFAVX/f
   AfdlC2IML2CHOz1DaiUVsatdyeKUix0hWo7hdYtehPpM1/+bnn3p8kww4
   MRphrAevJHCppRTXga/DXnZd5Vrmv9lhphSB27DGbcL3yO7+fcYS/+hjq
   CiKkE/PYid4nN7IVwwrObzSdbtTYCUnPqE17zGvStjpxEJHhIyWEDBTYj
   w55HiAIR6TLqQySLXFFPvjZC+62SIozT9PtiNAkVZ/aY11MqQLM8YuyGX
   /s2nYHYUd6uDomIPbijF2qgvHZk7HckfVctBoPp+FCwxPjOEklLGezI5U
   g==;
X-CSE-ConnectionGUID: Mxg9PFufTjeNdN8AIAtmdA==
X-CSE-MsgGUID: qkI5y8FgTEWqhdj3Bva8Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78510137"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78510137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 18:10:55 -0800
X-CSE-ConnectionGUID: S922zZlZSh6/mF2nVJBrxg==
X-CSE-MsgGUID: BI+sPBhTSb+C+b1wGwVy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200089274"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 18:10:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX8uI-000000004tg-2lXI;
	Sun, 21 Dec 2025 02:10:50 +0000
Date: Sun, 21 Dec 2025 03:10:22 +0100
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>, miklos@szeredi.hu,
	axboe@kernel.dk
Cc: oe-kbuild-all@lists.linux.dev, bschubert@ddn.com,
	asml.silence@gmail.com, io-uring@vger.kernel.org,
	csander@purestorage.com, xiaobing.li@samsung.com,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 19/25] fuse: add io-uring kernel-managed buffer ring
Message-ID: <202512210325.13rE0qzj-lkp@intel.com>
References: <20251218083319.3485503-20-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218083319.3485503-20-joannelkoong@gmail.com>

Hi Joanne,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on linus/master v6.19-rc1 next-20251219]
[cannot apply to mszeredi-fuse/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/io_uring-kbuf-refactor-io_buf_pbuf_register-logic-into-generic-helpers/20251218-165107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20251218083319.3485503-20-joannelkoong%40gmail.com
patch subject: [PATCH v2 19/25] fuse: add io-uring kernel-managed buffer ring
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251221/202512210325.13rE0qzj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210325.13rE0qzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210325.13rE0qzj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/fuse.h:1310:25: error: unknown type name 'bool'
    1310 |                         bool use_bufring;
         |                         ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
