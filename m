Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADA24B256
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736598302; cv=none; b=CIgRzWVVp6V8ESm/Dq4Xs0gBwMzVNTpngqSJzI3dHGdF0zGGls4wg95xgEUpVcwxKmnxdtvivxCBEDlPg+RjYku6t6QBPpGMqeEGctVJ+ol8QP+UnrEdrsLI8GaLCenoUF6ZqZebyfZPbNT2Qhy7X1/9/P/103v++HVWGlw8Fgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736598302; c=relaxed/simple;
	bh=QC0tsVxw1Vrc3UHfBFtZ8WSU48G7CiyQT5R64hxeu8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2bOdL1XL81QNa7QRl84xrU/Da9T/+7ladBFZGRcxOIO/sL46rsRS++twTjoVhn+nROpBHUJ83eJwumk7VAy8Oz+OXeRvIfrQXkuPle8zo+hj6p1pVLxbBf9Y5UwSQPl2gv5dVk/hYbOPGH5+3397NpGqoYriUK0OMbJg4yGoKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhEHnU+D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhEHnU+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736598299; x=1768134299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QC0tsVxw1Vrc3UHfBFtZ8WSU48G7CiyQT5R64hxeu8g=;
  b=YhEHnU+DyhVHI0G9LT7KlrEgrzD+i+75iO+YhMdv352aI5gRgQdKK5Kr
   UHtY/BhrWDkdYiOqJIn6jjPe1puwyyxLVpdsyqe5kJezUDxMh1tNujY3I
   H+9CcJGm+pu69YDx8j1TX8xeVn6SrZJmfVLfdZ2yrmBvKPENhxOVIBNP1
   gO33kd490lTSD4G8rfrNFWXzgTEr3TD0spUZT0U2/IDjt3g+5raBcQk20
   Ii0qwaf0EsQ873JlCU++BvC8zF1TazdGBjItGOiDd36iQJd9FFKxgl0+y
   mlYgPJPSuwwvmp3tEWzN6m3O6grIhX7IL0U4/L36SHDBnyRIXcNupbGT2
   A==;
X-CSE-ConnectionGUID: q6XOXsX9RWm2aiQqblvmlw==
X-CSE-MsgGUID: BB+6ARejRyO6/8/h2h/jhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36568760"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="36568760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 04:24:59 -0800
X-CSE-ConnectionGUID: hEWcBoU8Sxe7LxTjjy17eA==
X-CSE-MsgGUID: sAC3gbaPTLS0G6Yg8p6oKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127260896"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2025 04:24:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWaXu-000Kcr-09;
	Sat, 11 Jan 2025 12:24:54 +0000
Date: Sat, 11 Jan 2025 20:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Han <hanchunchao@inspur.com>, kees@kernel.org,
	joel.granados@kernel.org, logang@deltatee.com, mcgrof@kernel.org,
	yzaikin@google.com, gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Charles Han <hanchunchao@inspur.com>
Subject: Re: [PATCH] kernel/sysctl-test: Fix potential null dereference in
 sysctl-test
Message-ID: <202501112024.fU1FgDDE-lkp@intel.com>
References: <20250110100748.63470-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100748.63470-1-hanchunchao@inspur.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on mcgrof/sysctl-next sysctl/sysctl-next v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Han/kernel-sysctl-test-Fix-potential-null-dereference-in-sysctl-test/20250110-181004
base:   linus/master
patch link:    https://lore.kernel.org/r/20250110100748.63470-1-hanchunchao%40inspur.com
patch subject: [PATCH] kernel/sysctl-test: Fix potential null dereference in sysctl-test
config: i386-randconfig-063-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112024.fU1FgDDE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112024.fU1FgDDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112024.fU1FgDDE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl-test.c:38:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *value @@     got void [noderef] __user *const __ptr @@
   kernel/sysctl-test.c:38:9: sparse:     expected void const *value
   kernel/sysctl-test.c:38:9: sparse:     got void [noderef] __user *const __ptr
   kernel/sysctl-test.c:47:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:47:9: sparse:     expected void *
   kernel/sysctl-test.c:47:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:47:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:47:9: sparse:     expected void *
   kernel/sysctl-test.c:47:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:56:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:56:9: sparse:     expected void *
   kernel/sysctl-test.c:56:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:56:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:56:9: sparse:     expected void *
   kernel/sysctl-test.c:56:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:85:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *value @@     got void [noderef] __user *const __ptr @@
   kernel/sysctl-test.c:85:9: sparse:     expected void const *value
   kernel/sysctl-test.c:85:9: sparse:     got void [noderef] __user *const __ptr
   kernel/sysctl-test.c:94:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:94:9: sparse:     expected void *
   kernel/sysctl-test.c:94:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:94:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:94:9: sparse:     expected void *
   kernel/sysctl-test.c:94:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:103:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:103:9: sparse:     expected void *
   kernel/sysctl-test.c:103:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:103:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:103:9: sparse:     expected void *
   kernel/sysctl-test.c:103:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:129:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *value @@     got void [noderef] __user *const __ptr @@
   kernel/sysctl-test.c:129:9: sparse:     expected void const *value
   kernel/sysctl-test.c:129:9: sparse:     got void [noderef] __user *const __ptr
   kernel/sysctl-test.c:136:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:136:9: sparse:     expected void *
   kernel/sysctl-test.c:136:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:136:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:136:9: sparse:     expected void *
   kernel/sysctl-test.c:136:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:140:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:140:9: sparse:     expected void *
   kernel/sysctl-test.c:140:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:140:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:140:9: sparse:     expected void *
   kernel/sysctl-test.c:140:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:164:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *value @@     got void [noderef] __user *const __ptr @@
   kernel/sysctl-test.c:164:9: sparse:     expected void const *value
   kernel/sysctl-test.c:164:9: sparse:     got void [noderef] __user *const __ptr
   kernel/sysctl-test.c:176:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:176:9: sparse:     expected void *
   kernel/sysctl-test.c:176:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:176:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sysctl-test.c:176:9: sparse:     expected void *
   kernel/sysctl-test.c:176:9: sparse:     got void [noderef] __user *buffer
   kernel/sysctl-test.c:206:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:206:9: sparse:     expected void *
   kernel/sysctl-test.c:206:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:206:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:206:9: sparse:     expected void *
   kernel/sysctl-test.c:206:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:237:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:237:9: sparse:     expected void *
   kernel/sysctl-test.c:237:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:237:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:237:9: sparse:     expected void *
   kernel/sysctl-test.c:237:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:269:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:269:9: sparse:     expected void *
   kernel/sysctl-test.c:269:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:269:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:269:9: sparse:     expected void *
   kernel/sysctl-test.c:269:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:300:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:300:9: sparse:     expected void *
   kernel/sysctl-test.c:300:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:300:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:300:9: sparse:     expected void *
   kernel/sysctl-test.c:300:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:341:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:341:9: sparse:     expected void *
   kernel/sysctl-test.c:341:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:341:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:341:9: sparse:     expected void *
   kernel/sysctl-test.c:341:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:374:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:374:9: sparse:     expected void *
   kernel/sysctl-test.c:374:9: sparse:     got char [noderef] __user *user_buffer
   kernel/sysctl-test.c:374:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got char [noderef] __user *user_buffer @@
   kernel/sysctl-test.c:374:9: sparse:     expected void *
   kernel/sysctl-test.c:374:9: sparse:     got char [noderef] __user *user_buffer

vim +38 kernel/sysctl-test.c

    11	
    12	/*
    13	 * Test that proc_dointvec will not try to use a NULL .data field even when the
    14	 * length is non-zero.
    15	 */
    16	static void sysctl_test_api_dointvec_null_tbl_data(struct kunit *test)
    17	{
    18		struct ctl_table null_data_table = {
    19			.procname = "foo",
    20			/*
    21			 * Here we are testing that proc_dointvec behaves correctly when
    22			 * we give it a NULL .data field. Normally this would point to a
    23			 * piece of memory where the value would be stored.
    24			 */
    25			.data		= NULL,
    26			.maxlen		= sizeof(int),
    27			.mode		= 0644,
    28			.proc_handler	= proc_dointvec,
    29			.extra1		= SYSCTL_ZERO,
    30			.extra2         = SYSCTL_ONE_HUNDRED,
    31		};
    32		/*
    33		 * proc_dointvec expects a buffer in user space, so we allocate one. We
    34		 * also need to cast it to __user so sparse doesn't get mad.
    35		 */
    36		void __user *buffer = (void __user *)kunit_kzalloc(test, sizeof(int),
    37								   GFP_USER);
  > 38		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buffer);
    39		size_t len;
    40		loff_t pos;
    41	
    42		/*
    43		 * We don't care what the starting length is since proc_dointvec should
    44		 * not try to read because .data is NULL.
    45		 */
    46		len = 1234;
    47		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
    48						       KUNIT_PROC_READ, buffer, &len,
    49						       &pos));
    50		KUNIT_EXPECT_EQ(test, 0, len);
    51	
    52		/*
    53		 * See above.
    54		 */
    55		len = 1234;
    56		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
    57						       KUNIT_PROC_WRITE, buffer, &len,
    58						       &pos));
    59		KUNIT_EXPECT_EQ(test, 0, len);
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
