Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F8148833
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 12:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726317302; cv=none; b=CbClqq7ceQx04vIa2r8XkbSl0fUCQxuuVbkrZPfF+qFy0OyfCaYsY5WiBawS8NUsPV6C9Ls6JaR3eE3jhPmsY8KQaZpZbugKeT8yWwblWT9di5TcDqaetrMjLZ2Wk51ntTrZ59aB0mdCpx35SoubxbburszPi6LKCIsSr2KLCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726317302; c=relaxed/simple;
	bh=A6j29p59Oxt5Lsgz2SXb2zVLcCsALfUq0ZescJ+8nX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8LVxf8utiZZEhLAuJGbkaTHMUMKq5n9jUcyGD+tJVbSmzUc6G+DR5UoqusbDGe0DIrrC+ttKqh+r7QskLayzxn9NnmN9yPNP1HQr6uTwabx5H8kqM5cucMtFd0IJTmuAcEYpXpBJkLwUCqo1av+SnZ0bLSn5k8tIbRGXyY3Xb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+9B1+By; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+9B1+By"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726317300; x=1757853300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A6j29p59Oxt5Lsgz2SXb2zVLcCsALfUq0ZescJ+8nX8=;
  b=Y+9B1+By1wOmlEGmWboFebPwXpB4TdXhe5NbsUCDNccN5Cvv5HvisqkQ
   5kbjwl9gBnNl1heqWNxYvAdNnrg0CS9X8RZfzM0WVPx80QOX6PjzZ9LcK
   9vu4VOEHpfFnmT7ksb7CqziMRquk+wwpt3xd7E0NDDqmkwwS3EMmIRDVv
   YIHOVUUekSwvgSdlrp4CNKBmf689o+21BQ8RvufOKRxeGPJUaPJcoXEj9
   Q7haafBUqO5MDynKniyRv5k4ioROG9icssFcpvfe/Gae74cTyIgs6Xz1r
   5nlpxhFnUaTDslmTXcgnFm6nftZP1KJ5z9TI00xKIG5PCjZHviXkPGmpP
   Q==;
X-CSE-ConnectionGUID: EDjUURC9TKOOfxa5eBuvpQ==
X-CSE-MsgGUID: ktT/z1WiThaIyjupFZkzkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="13526854"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="13526854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 05:34:59 -0700
X-CSE-ConnectionGUID: E5iDoJwbSByvEWEPkuxahw==
X-CSE-MsgGUID: nLDvj+KUSxuyBDNMScGGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72776302"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2024 05:34:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spRzM-0007jO-0m;
	Sat, 14 Sep 2024 12:34:56 +0000
Date: Sat, 14 Sep 2024 20:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/7] s390/vdso: Wire up getrandom() vdso implementation
Message-ID: <202409142043.JMyQrX2G-lkp@intel.com>
References: <20240913130544.2398678-8-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913130544.2398678-8-hca@linux.ibm.com>

Hi Heiko,

kernel test robot noticed the following build errors:

[auto build test ERROR on crng-random/master]
[cannot apply to s390/features shuah-kselftest/next shuah-kselftest/fixes linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Carstens/s390-facility-Disable-compile-time-optimization-for-decompressor-code/20240913-210923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master
patch link:    https://lore.kernel.org/r/20240913130544.2398678-8-hca%40linux.ibm.com
patch subject: [PATCH 7/7] s390/vdso: Wire up getrandom() vdso implementation
config: s390-randconfig-r063-20240914 (https://download.01.org/0day-ci/archive/20240914/202409142043.JMyQrX2G-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142043.JMyQrX2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142043.JMyQrX2G-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kernel/vdso64/vgetrandom-chacha.S: Assembler messages:
>> arch/s390/kernel/vdso64/vgetrandom-chacha.S:147: Error: Unrecognized opcode: `alsih'
   make[3]: *** [arch/s390/kernel/vdso64/Makefile:62: arch/s390/kernel/vdso64/vgetrandom-chacha.o] Error 1
   make[3]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:157: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +147 arch/s390/kernel/vdso64/vgetrandom-chacha.S

   145	
   146		/* ++COPY3.COUNTER */
 > 147		alsih	%r3,1
   148		alcr	%r3,%r1
   149		VLVGG	COPY3,%r3,0
   150	
   151		/* OUTPUT += 64, --NBLOCKS */
   152		aghi	%r2,64
   153		brctg	%r5,.Lblock
   154	
   155		/* COUNTER = COPY3.COUNTER */
   156		stg	%r3,0(%r4)
   157	
   158		/* Zero out potentially sensitive regs */
   159		VZERO	STATE0
   160		VZERO	STATE1
   161		VZERO	STATE2
   162		VZERO	STATE3
   163		VZERO	COPY1
   164		VZERO	COPY2
   165	
   166		/* Early exit if TMP0-TMP3 have not been used */
   167		ALTERNATIVE "nopr", "br %r14", ALT_FACILITY(148)
   168	
   169		VZERO	TMP0
   170		VZERO	TMP1
   171		VZERO	TMP2
   172		VZERO	TMP3
   173	
   174		br	%r14
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
