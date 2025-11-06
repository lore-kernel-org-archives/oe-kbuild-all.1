Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006C530C636
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440569; cv=none; b=kverxYgggFTQemV8yrv3x1CN3EE9h0nGW7+YgfO8C4xXwEq8cLu9dhl2Unx0am+o6FvV+nW8GBTdtBFAu0CiwfvTUHfxZBMnVjnyCXRC9ZHHGlBI9B6h0OkVQR8kzF+2bTXYLyGQlKtL34Or5GH3wGZSEc9conIUON8ij9W4qw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440569; c=relaxed/simple;
	bh=Wx6jk2RNotFRB0Zml6/FPzdXbi1XBn0dlei8Uwtop5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QITVR6qqwAetkyBa5Wi8bPXeg7tWdm5nw0yCvnksy07/hoHQSmZ6lNEx9T8OW6Z7l/nC6GxR1YxmFN15PGmfAttfFIPyUOi25K2Nnu5+/JYuH1NQ6cCuOwEdIAYB/VwV9s79RFLMlN5vLiVoL0PFXnZA30Dltvd3nc0iC8LYWzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AndMEcw5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AndMEcw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762440567; x=1793976567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wx6jk2RNotFRB0Zml6/FPzdXbi1XBn0dlei8Uwtop5M=;
  b=AndMEcw5oFuPmDMDBBAprZCnB85dhOcYN0Bsd8FoKYtP5QfDviNkzdUV
   xoKAi5PY3WuwhTpomATinSGd93PYIRk//iaTmGOs417uRhiEZ+5FNTZ6x
   0XvlsOZXRsBnh52iMTGwWF1eAuFdH/A1eQugyhZfJyehAg9XosXIKq6cD
   0Vwvpg3SCWunPlZmns3ixrx4DqSBTrAdnhHcnyrEX+9C3lbGkFTBJrnXH
   FTbAMkn4FZLLFtu/NY6+SFADrcFTqk8aAaMbVs3SYksOMRSF/3pYSlmG0
   s/C+w9fnBO5SK9EZPc4cWJey2Pb3sxcBV7z1jDOfGWBP9otuwfQgZMQsA
   A==;
X-CSE-ConnectionGUID: bKZZyvgASCK0vjSj8BwnzA==
X-CSE-MsgGUID: TLBNqAzWSBmFNcqLxWVeSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74868411"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="74868411"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 06:49:26 -0800
X-CSE-ConnectionGUID: +rPuxGKFSh2HJUN+gULeDw==
X-CSE-MsgGUID: oz2gX6w4QRa2Y6J85UBFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="211232826"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2025 06:49:25 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH1Ih-000U1o-0i;
	Thu, 06 Nov 2025 14:49:23 +0000
Date: Thu, 6 Nov 2025 22:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] blk-integrity: support arbitrary buffer alignment
Message-ID: <202511062217.2bN31Olr-lkp@intel.com>
References: <20251104224045.3396384-1-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104224045.3396384-1-kbusch@meta.com>

Hi Keith,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc4]
[cannot apply to axboe-block/for-next hch-configfs/for-next next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/blk-integrity-support-arbitrary-buffer-alignment/20251105-064500
base:   linus/master
patch link:    https://lore.kernel.org/r/20251104224045.3396384-1-kbusch%40meta.com
patch subject: [RFC PATCH] blk-integrity: support arbitrary buffer alignment
config: sh-randconfig-001-20251106 (https://download.01.org/0day-ci/archive/20251106/202511062217.2bN31Olr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062217.2bN31Olr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062217.2bN31Olr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: block/t10-pi.c:56 function parameter 'iter' not described in 'blk_integrity_crc_offset'
>> Warning: block/t10-pi.c:93 function parameter 'iter' not described in 'blk_integrity_copy_from_tuple'
>> Warning: block/t10-pi.c:93 function parameter 'tuple' not described in 'blk_integrity_copy_from_tuple'
>> Warning: block/t10-pi.c:118 function parameter 'iter' not described in 'blk_integrity_copy_to_tuple'
>> Warning: block/t10-pi.c:118 function parameter 'tuple' not described in 'blk_integrity_copy_to_tuple'
>> Warning: block/t10-pi.c:406 function parameter 'bi' not described in 'blk_pi_advance_offset'
>> Warning: block/t10-pi.c:406 function parameter 'bip' not described in 'blk_pi_advance_offset'
>> Warning: block/t10-pi.c:406 function parameter 'iter' not described in 'blk_pi_advance_offset'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
