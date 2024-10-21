Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC143440C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 07:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496812; cv=none; b=FEt3GX8UOrpLaYKBpH54ODaVNJypKMvIFVE9XTXEQrCWmLK1mE6HtEJBxfiC64qiZ1WDYF7ezTSw5bDy+9m2kQLzqBrtdXpr2QQJtUJPm0SPSiIv0zfCOU2SFnGAIM98LHmcKHArK2Zh+sjvPBt8eOJhJgLlgt3HneDfMOeUpNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496812; c=relaxed/simple;
	bh=KvicUFATqbvxXb5I6feoSqkjU7j1BNPyBj/voNsGU10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSgiBee3uN9uw7+Z+b+N9WELdNk3gFW4N2UvIaW3X+kSHmpAIYaKgpu/NLcqpfvy41tTnST2OHC/ITqjXaYYGaDF32MgBECUkyrSJx7y2H+4eqBTt8ZCX5KSBU5cYJPjU2ZuQm8Kigh/8DRs69oMUdyP09O1jY6ub9Ip5Y+T32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+75KHSZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+75KHSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729496810; x=1761032810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KvicUFATqbvxXb5I6feoSqkjU7j1BNPyBj/voNsGU10=;
  b=E+75KHSZhIpXcR2PORC/SYgw93MOqaLJ7o4E9C2UrdmkSH5hTtvcN5YO
   POzFfmkPezyNaVkoMjRxBKMze0opeSvECTjrGQbrzKXCpkMWl5GQUnE9j
   cAagRRqP5JjKpnCCqDMA4QOwv06OesOrEE9CXrqKWoFDfaQ/8AqFCG2fX
   d3V7ICV5fB4NgJvWbOM4XpuE+siYK4CMg58jLAKuVLcWMpY2w53J0JZYJ
   A9zg7Tpypd7rxdSQBAEw7+Z2FH/E1/B2Ua0wm+VSET/Yl+CPLP4qemZ7u
   ErNlyllTHM7ZmssozK3UVPQIqm2k87o/hsAsW3+szOZPJAyo7euc3sIhQ
   w==;
X-CSE-ConnectionGUID: 0UrdvwoaQHKJgknLmOquUQ==
X-CSE-MsgGUID: B+1yEW/aTbeGbrLDIr//QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="54377221"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="54377221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 00:46:49 -0700
X-CSE-ConnectionGUID: 4HuDJwksRja+mHCKrnPddA==
X-CSE-MsgGUID: vqWBcZ/sSiOL2fycSAgang==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79452176"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2024 00:46:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2n7l-000RLJ-2S;
	Mon, 21 Oct 2024 07:46:45 +0000
Date: Mon, 21 Oct 2024 15:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 13/13] clavis: Kunit support
Message-ID: <202410211534.1A4QwrVu-lkp@intel.com>
References: <20241017155516.2582369-14-eric.snowberg@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017155516.2582369-14-eric.snowberg@oracle.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8e929cb546ee42c9a61d24fae60605e9e3192354]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Snowberg/certs-Remove-CONFIG_INTEGRITY_PLATFORM_KEYRING-check/20241018-000510
base:   8e929cb546ee42c9a61d24fae60605e9e3192354
patch link:    https://lore.kernel.org/r/20241017155516.2582369-14-eric.snowberg%40oracle.com
patch subject: [RFC PATCH v3 13/13] clavis: Kunit support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241021/202410211534.1A4QwrVu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211534.1A4QwrVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211534.1A4QwrVu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: security/clavis/clavis_test.o: in function `clavis_parse_boot_param_tests':
>> clavis_test.c:(.text+0x287): undefined reference to `kunit_binary_ptr_assert_format'
>> ld: clavis_test.c:(.text+0x295): undefined reference to `__kunit_do_failed_assertion'
>> ld: clavis_test.c:(.text+0x2bf): undefined reference to `kunit_binary_ptr_assert_format'
   ld: clavis_test.c:(.text+0x2cd): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x2f7): undefined reference to `kunit_binary_ptr_assert_format'
   ld: clavis_test.c:(.text+0x305): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x32f): undefined reference to `kunit_binary_ptr_assert_format'
   ld: clavis_test.c:(.text+0x33d): undefined reference to `__kunit_do_failed_assertion'
>> ld: clavis_test.c:(.text+0x375): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x383): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x3b5): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x3c3): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x3f5): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x403): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x435): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x443): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x475): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x483): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `clavis_test_keyring_init':
>> clavis_test.c:(.text+0x580): undefined reference to `kunit_ptr_not_err_assert_format'
   ld: clavis_test.c:(.text+0x58e): undefined reference to `__kunit_do_failed_assertion'
>> ld: clavis_test.c:(.text+0x5b0): undefined reference to `kunit_ptr_not_err_assert_format'
   ld: clavis_test.c:(.text+0x5be): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x5f5): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x603): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `unspecified_signed_tests':
>> clavis_test.c:(.text+0x63f): undefined reference to `__kunit_activate_static_stub'
>> ld: clavis_test.c:(.text+0x653): undefined reference to `__kunit_activate_static_stub'
>> ld: clavis_test.c:(.text+0x7d9): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0x7e2): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0x834): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x842): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x874): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x882): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x8b4): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x8c2): undefined reference to `__kunit_do_failed_assertion'
>> ld: clavis_test.c:(.text+0x8e4): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x8f2): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x924): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x932): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x964): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x972): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `module_revocation_tests':
   clavis_test.c:(.text+0x9af): undefined reference to `__kunit_activate_static_stub'
   ld: clavis_test.c:(.text+0x9c3): undefined reference to `__kunit_activate_static_stub'
   ld: clavis_test.c:(.text+0xa86): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0xa8f): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0xadc): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0xaea): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0xb24): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0xb32): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `module_invalid_signed_tests':
   clavis_test.c:(.text+0xb6f): undefined reference to `__kunit_activate_static_stub'
   ld: clavis_test.c:(.text+0xb83): undefined reference to `__kunit_activate_static_stub'
   ld: clavis_test.c:(.text+0xd06): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0xd0f): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0xd5c): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0xd6a): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0xda4): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0xdb2): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0xde4): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0xdf2): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0xe14): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0xe22): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0xe54): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0xe62): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `module_signed_tests':
   clavis_test.c:(.text+0xe9f): undefined reference to `__kunit_activate_static_stub'
   ld: clavis_test.c:(.text+0xeb3): undefined reference to `__kunit_activate_static_stub'
   ld: clavis_test.c:(.text+0x1033): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0x103c): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0x108c): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x109a): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x10d4): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x10e2): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1114): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x1122): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1144): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1152): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1184): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x1192): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `signed_acl_tests':
   clavis_test.c:(.text+0x13a1): undefined reference to `__kunit_activate_static_stub'
   ld: clavis_test.c:(.text+0x14d9): undefined reference to `kunit_deactivate_static_stub'
   ld: clavis_test.c:(.text+0x1519): undefined reference to `kunit_ptr_not_err_assert_format'
   ld: clavis_test.c:(.text+0x1527): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1551): undefined reference to `kunit_ptr_not_err_assert_format'
   ld: clavis_test.c:(.text+0x155f): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x158d): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x159b): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x15cd): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x15db): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x160d): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x161b): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1666): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x1674): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `register_key_type_tests':
   clavis_test.c:(.text+0x178e): undefined reference to `kunit_binary_ptr_assert_format'
   ld: clavis_test.c:(.text+0x179c): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x17e3): undefined reference to `kunit_binary_ptr_assert_format'
   ld: clavis_test.c:(.text+0x17f1): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `builtin_acl_tests':
>> clavis_test.c:(.text+0x1955): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x1963): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1994): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x19a2): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x19d4): undefined reference to `kunit_binary_assert_format'
   ld: clavis_test.c:(.text+0x19e2): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1a04): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1a12): undefined reference to `__kunit_do_failed_assertion'
   ld: security/clavis/clavis_test.o: in function `clavis_suite_init':
>> clavis_test.c:(.text+0x1a8f): undefined reference to `kunit_log_append'
   ld: security/clavis/clavis_test.o: in function `key_acl_vet_description_tests':
>> clavis_test.c:(.text+0x1d1f): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1d2d): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1d88): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1d96): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1df1): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1dff): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1e5a): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1e68): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1ec3): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1ed1): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x1f6f): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x1f7d): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x2020): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x202e): undefined reference to `__kunit_do_failed_assertion'
   ld: clavis_test.c:(.text+0x204e): undefined reference to `kunit_unary_assert_format'
   ld: clavis_test.c:(.text+0x205c): undefined reference to `__kunit_do_failed_assertion'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
