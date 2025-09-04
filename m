Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C2D80B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 12:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990260; cv=none; b=Igb6XsyMOZzZqs9tC4eSpySlXGFFjbI1zV2P6R8GXl+d9wEbbVDXn9K+jx5WTgfGBD87RhxWh7i5BZfPIzG2Sn+ZJUmXbcJeb7oqmjVDfNihKBIgSEQuTRfjGFWu5Wpu5xoog+jeN1Os4lsFEl0+iS6glfuDO76rOHsBXkqpovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990260; c=relaxed/simple;
	bh=QtIxA6aybbkvE9vAvhsygMuQJ6SinAFHVZ/FoPzDUoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxZqIfO6cR3Rv7ywwvcc+La4oMMT3xsgCpn3Mk4aJYIIHkwuU51aI7oQdnC2cp0YMnqx4m6VaE3CV/tqJu7K9LpSyKagOsI56boC5i9ZHmbsLljPO0AAd7dJn17ZQJUD5WW4B5vduNOYx0vSc26loH8rpUsTw3MIAvJz82LUKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpdzzCRJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpdzzCRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756990259; x=1788526259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QtIxA6aybbkvE9vAvhsygMuQJ6SinAFHVZ/FoPzDUoM=;
  b=GpdzzCRJo+MrP1Gn3MyVDChGQqLbhW7HI+1kVXjk3O8lKIcoc0tsntu6
   ePxMi5V9LXWkv+e9es8OBBKd4DV7ouSmauKkJJLtDlJ4Rj8IMPz9+dUU8
   gWU/dEPp3sntgIOJbcz+5bASiWKZWlpzdiSd0r1SOlWgfuPEi5jsAdJnO
   QjHBbwOMYgai0i/c+0KqzbQETUvYNpJ8K+Up8df8aIkwmhypAMinxi+52
   or2G8Iz+cwncwGQ4tUtDy/4zfRQa6cQRlDalrRcbpJpuExWkBHYT6TKm6
   y6buB5b9sTVFFVdpUobkn0W/pigxJNRtbkI+hk2Scl+1MwN6e7I9liPrf
   Q==;
X-CSE-ConnectionGUID: U9pGTipqS+yCW7eN+pPDgg==
X-CSE-MsgGUID: VkZg7pb2Rh6x8G80JZhSKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76929067"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="76929067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:50:59 -0700
X-CSE-ConnectionGUID: U699eXXhTrWgEDQE88Av4Q==
X-CSE-MsgGUID: N6vVQGfMRkWXHqn8EnCwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="171827552"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Sep 2025 05:50:57 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu9QC-0005J0-31;
	Thu, 04 Sep 2025 12:50:44 +0000
Date: Thu, 4 Sep 2025 20:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Graham <ethan.w.s.graham@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 RFC 7/7] crypto: implement KFuzzTest targets for PKCS7
 and RSA parsing
Message-ID: <202509042004.aaHTGRrK-lkp@intel.com>
References: <20250901164212.460229-8-ethan.w.s.graham@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901164212.460229-8-ethan.w.s.graham@gmail.com>

Hi Ethan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-crypto-2.6/master]
[also build test WARNING on linus/master v6.17-rc4 next-20250904]
[cannot apply to akpm-mm/mm-nonmm-unstable herbert-cryptodev-2.6/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/mm-kasan-implement-kasan_poison_range/20250902-004648
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6.git master
patch link:    https://lore.kernel.org/r/20250901164212.460229-8-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v2 RFC 7/7] crypto: implement KFuzzTest targets for PKCS7 and RSA parsing
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250904/202509042004.aaHTGRrK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509042004.aaHTGRrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509042004.aaHTGRrK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> s390-linux-ld: warning: orphan section `.kfuzztest_annotation' from `crypto/asymmetric_keys/tests/pkcs7_kfuzz.o' being placed in section `.kfuzztest_annotation'
>> s390-linux-ld: warning: orphan section `.kfuzztest_constraint' from `crypto/asymmetric_keys/tests/pkcs7_kfuzz.o' being placed in section `.kfuzztest_constraint'
>> s390-linux-ld: warning: orphan section `.kfuzztest_target' from `crypto/asymmetric_keys/tests/pkcs7_kfuzz.o' being placed in section `.kfuzztest_target'
>> s390-linux-ld: warning: orphan section `.kfuzztest_annotation' from `crypto/asymmetric_keys/tests/rsa_helper_kfuzz.o' being placed in section `.kfuzztest_annotation'
>> s390-linux-ld: warning: orphan section `.kfuzztest_constraint' from `crypto/asymmetric_keys/tests/rsa_helper_kfuzz.o' being placed in section `.kfuzztest_constraint'
>> s390-linux-ld: warning: orphan section `.kfuzztest_target' from `crypto/asymmetric_keys/tests/rsa_helper_kfuzz.o' being placed in section `.kfuzztest_target'
   s390-linux-ld: warning: orphan section `.kfuzztest_annotation' from `samples/kfuzztest/overflow_on_nested_buffer.o' being placed in section `.kfuzztest_annotation'
   s390-linux-ld: warning: orphan section `.kfuzztest_constraint' from `samples/kfuzztest/overflow_on_nested_buffer.o' being placed in section `.kfuzztest_constraint'
   s390-linux-ld: warning: orphan section `.kfuzztest_target' from `samples/kfuzztest/overflow_on_nested_buffer.o' being placed in section `.kfuzztest_target'
   s390-linux-ld: warning: orphan section `.kfuzztest_annotation' from `samples/kfuzztest/underflow_on_buffer.o' being placed in section `.kfuzztest_annotation'
   s390-linux-ld: warning: orphan section `.kfuzztest_constraint' from `samples/kfuzztest/underflow_on_buffer.o' being placed in section `.kfuzztest_constraint'
   s390-linux-ld: warning: orphan section `.kfuzztest_target' from `samples/kfuzztest/underflow_on_buffer.o' being placed in section `.kfuzztest_target'
   s390-linux-ld: lib/kfuzztest/main.o: in function `kfuzztest_init':
   main.c:(.init.text+0x24): undefined reference to `__kfuzztest_targets_end'
   s390-linux-ld: main.c:(.init.text+0x2a): undefined reference to `__kfuzztest_targets_start'
   s390-linux-ld: main.c:(.init.text+0x39e): undefined reference to `__kfuzztest_targets_start'
   s390-linux-ld: main.c:(.init.text+0x3aa): undefined reference to `__kfuzztest_targets_end'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
