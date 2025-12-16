Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CF2AD00
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 00:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765843267; cv=none; b=PVpGtpW7+hNEco/lfv/njHJbBFLj2x3KHskKfTwxxOLCtF7lwGY6VZ29rxbuS8mk2J2FOQ8aMr03nYDUhZgglaq5UYJfZZU0qz+HZpg/MDIec7egfu4fB9mrLI3w1dR+8Tnwj1ut4czmNpFB5uWD7RHUH9JSON7q1tkgk3LKTCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765843267; c=relaxed/simple;
	bh=vzWB8httcBdPksn5JqLaLSeWIpsZXAx27bDvWUMDM9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OV41ur0dCy+VoF1/o+mAsht7U6HpBOQu47hdPGIgHQMRdFU7QnQKMIH7LmDTO5ZJFuWP4HkCD+oi7t/Au8mWD9fJLDNnYmuMbtNYKI810iQP8V9tIUMrOg/RJcWJO0DSanBLN9bKRdJ2groWQx+OJNgCegkiUPtW26uB0vU8QGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZ+dogP9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZ+dogP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765843266; x=1797379266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vzWB8httcBdPksn5JqLaLSeWIpsZXAx27bDvWUMDM9c=;
  b=SZ+dogP9J0cjqERXFdeTb9eN2SyVEpwQTNKvINF/zakmRcVqofeSR6FR
   1oSICq8uqZGhWDgxLIP7GGyM6obdmsdyzJDrp1IRS6k+MoaJ2KRR0Dwxn
   a7X5r5GnozVbvjtpGcH68y+5CojQr8wmhB9ek3n7m3ugs6xea6PbHPigv
   bEyv7rNwfXsBMxVWj8SJYL1H4a9tuaKAY1wyFgEWqcq0QXNpLTcQomd/f
   NJBNOsV0MIXIQJjNxnQDAM1YtAZqc4r6SDQgDZUEm1i8fGqGo0uipnNxS
   0Uur54okbhJfKszxH8AJjRhhoDFQcB2yW0IalTMI3Nqw/rxmyMsz9xjtJ
   w==;
X-CSE-ConnectionGUID: g5Y9R8xkTrC8RfJHbaph/w==
X-CSE-MsgGUID: 9b32egk+TQiOKGXQ4VAfBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67639900"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67639900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 16:01:04 -0800
X-CSE-ConnectionGUID: g+ZXeQXOQuugG5w9O4okQg==
X-CSE-MsgGUID: qsR2wK0ARoO7sTQ6Qu645Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197753944"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 16:01:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVIUv-000000002my-03Gk;
	Tue, 16 Dec 2025 00:01:01 +0000
Date: Tue, 16 Dec 2025 01:00:55 +0100
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH v2] ima: Add support for staging measurements for
 deletion and trimming
Message-ID: <202512160117.Red5AbKw-lkp@intel.com>
References: <20251212171932.316676-1-roberto.sassu@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212171932.316676-1-roberto.sassu@huaweicloud.com>

Hi Roberto,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on zohar-integrity/next-integrity]
[also build test ERROR on next-20251215]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roberto-Sassu/ima-Add-support-for-staging-measurements-for-deletion-and-trimming/20251213-012318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity
patch link:    https://lore.kernel.org/r/20251212171932.316676-1-roberto.sassu%40huaweicloud.com
patch subject: [RFC][PATCH v2] ima: Add support for staging measurements for deletion and trimming
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251216/202512160117.Red5AbKw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160117.Red5AbKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160117.Red5AbKw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/rculist.h:10,
                    from security/integrity/ima/ima_queue.c:18:
>> include/vdso/limits.h:13:25: error: invalid initializer
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   security/integrity/ima/ima_queue.c:43:57: note: in expansion of macro 'ULONG_MAX'
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                                                         ^~~~~~~~~
>> security/integrity/ima/ima_queue.c:44:22: error: conflicting types for 'binary_runtime_size'; have 'long unsigned int[2]'
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:43:22: note: previous definition of 'binary_runtime_size' with type 'long unsigned int[0]'
      43 | static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
>> include/vdso/limits.h:13:25: error: invalid initializer
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   security/integrity/ima/ima_queue.c:44:62: note: in expansion of macro 'ULONG_MAX'
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                                                              ^~~~~~~~~
   security/integrity/ima/ima_queue.c:45:22: error: conflicting types for 'binary_runtime_size'; have 'long unsigned int[1]'
      45 | static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_queue.c:44:22: note: previous definition of 'binary_runtime_size' with type 'long unsigned int[2]'
      44 | static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
         |                      ^~~~~~~~~~~~~~~~~~~
>> include/vdso/limits.h:13:25: error: invalid initializer
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   security/integrity/ima/ima_queue.c:45:64: note: in expansion of macro 'ULONG_MAX'
      45 | static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
         |                                                                ^~~~~~~~~


vim +44 security/integrity/ima/ima_queue.c

    35	
    36	LIST_HEAD(ima_measurements);	/* list of all measurements */
    37	LIST_HEAD(ima_measurements_staged); /* list of staged measurements */
    38	static LIST_HEAD(ima_measurements_trim); /* list of measurements to trim */
    39	bool ima_measurements_staged_exist; /* If there are staged measurements */
    40	#ifdef CONFIG_IMA_KEXEC
    41	static unsigned long binary_runtime_size[BINARY__LAST];
    42	#else
    43	static unsigned long binary_runtime_size[BINARY_SIZE] = ULONG_MAX;
  > 44	static unsigned long binary_runtime_size[BINARY_SIZE_FULL] = ULONG_MAX;
    45	static unsigned long binary_runtime_size[BINARY_SIZE_STAGED] = ULONG_MAX;
    46	#endif
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
