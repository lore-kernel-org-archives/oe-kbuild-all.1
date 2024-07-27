Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19DF39FD8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 22:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722120825; cv=none; b=aYThkSgwENbj/cBFmK+D12FOGDbVvK2pC/wMee6dEkADQyv+MHQM9mkK/uzdu2kXfjjveotFwc95ERfs975S1vNkNHrkvOVTY2dgbwyVgu/v6JU9WB2RLTx5x8ZrrX3MI1J7jk4SgPYhNWL/OR4CSzSNM2l/NTtRP6sk8vvpSik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722120825; c=relaxed/simple;
	bh=9A98GOxG5p4n99dascxmTyutoe3Y4ngYmUf3Zaj6a0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3unmMuvwvlmEw2zgA2tsfRO655xkD/O7NBrIiI6LT5lhp1DPyxUG4zK6MYVe5BA089eJ4OhNCnhMYaQSWTrgU1e+5Jh0KONuiea0xdMP7ZlSpS7yec+0082m/8bhltaKTXb/h/fMYpS4UKspUyw3tCPnFkNkJIOJWO1eOFL3/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2SJk3PJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2SJk3PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722120824; x=1753656824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9A98GOxG5p4n99dascxmTyutoe3Y4ngYmUf3Zaj6a0c=;
  b=T2SJk3PJ8tobX/+/A2qyprel+k+BKznDQA7AH1vIhoNLFIxKqRRbj1zx
   yqR1Rs78BBxepHosd8rMRVwomUk3T2yTX0ImxeQ/MJdpsAqZc0L0XJOhe
   NyU5XZSns4X4mIT29JAHar/cB/ZRl/ayBQRrdwD4OTAqeKwoyZBnsSBRy
   8seCvpJz0Q8KlGy8cag/OsCCZcQz0bpwfMqk2uWouR2/ByX8GdvW0IMPj
   fWrQtodeCY8Gr0V+ynY3jzKhH/t4lAfqlQbJi9UoUGPfSXug8c5QxEmxW
   JNI/hZlInMBQOeVkUmHjLpGRV/XmN0DHQd3tg8/O1y35pvfg8PERuvGfc
   w==;
X-CSE-ConnectionGUID: NgMKftqFRbWmfbLoX4kkXQ==
X-CSE-MsgGUID: rKGBp0ggQwSc1kfbE4QD0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="23644026"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="23644026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 15:53:44 -0700
X-CSE-ConnectionGUID: ht70xOgUQk6cx3f3QU9gDQ==
X-CSE-MsgGUID: ZntPVTyKTG63CulUVL/cVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="53583866"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jul 2024 15:53:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXqIG-000qJU-0Z;
	Sat, 27 Jul 2024 22:53:40 +0000
Date: Sun, 28 Jul 2024 06:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:for-next 7/8] fs/smb/client/compress/lz77.h:127:9:
 error: call to undeclared function 'copy_from_kernel_nofault'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202407280659.6A5hQYmG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git for-next
head:   da98218c9ac5ff1f00b649b07cf56f93ef0902d3
commit: 7db9a00c4d9bf4996177e4946241885234afb5c0 [7/8] smb3: mark compression as CONFIG_EXPERIMENTAL and fix missing compression operation
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240728/202407280659.6A5hQYmG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280659.6A5hQYmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280659.6A5hQYmG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/smb/client/compress/lz77.c:10:
>> fs/smb/client/compress/lz77.h:127:9: error: call to undeclared function 'copy_from_kernel_nofault'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         return copy_from_kernel_nofault(dst, src, count);
         |                ^
   1 error generated.


vim +/copy_from_kernel_nofault +127 fs/smb/client/compress/lz77.h

   124	
   125	static __always_inline long lz77_copy(u8 *dst, const u8 *src, size_t count)
   126	{
 > 127		return copy_from_kernel_nofault(dst, src, count);
   128	}
   129	#else /* CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS */
   130	static __always_inline u8 lz77_read8(const void *ptr)
   131	{
   132		return get_unaligned((u8 *)ptr);
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
