Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C772C859
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770464864; cv=none; b=oXX7GoXOrJ8Hfcwkp1ZxhEz/NTqR3GhbB3uKWXDXtV/97SwyCQ6SahW8cHrXDleTv4f7twSDEbKJ3GDVqs8Y6VkH9DhZEsPdy7oxCZIuJpx7GIAns/6pIrgsEyrgnXlc7jC14/7vv62BfrdKxm/iL1OJygSjWrxq0FFOWm8YAFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770464864; c=relaxed/simple;
	bh=QmS23Rf4JG7riEkn9GGqFwjQo7aBs1WH9bgL0gKlobc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZSQDpgfu92r2BeWvKPG0Nyq7GYvf/nqERFMaVF+iQexnA4siwO9EE3kCYWoFACt8o13npsTdBSdV38QQup9t3XfoiaBmlmZc61kySqvKymJpnTezE+gNIAQSd7LAxemIzgMlSKCDy30cGsN7OJbezw1qdGTscIyIgPwj/uie6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhX4qXmL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhX4qXmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770464863; x=1802000863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QmS23Rf4JG7riEkn9GGqFwjQo7aBs1WH9bgL0gKlobc=;
  b=WhX4qXmLUmjz/T+BAix7xoX5/mzQmj6AU9+0275qT3yKBkEL1JiGczW2
   C+Ul5dLRh7zyuL83287ove09/9CvVvd0NEH9nMXDVUj537NNseP/9wdRS
   MxSMXm25F8QGmp3xKY80nlcMsXAbSOJAjNcm6LrFi/eBNbOTME1HXTs95
   +3gZnQ+YpJBm3HaDpjz8miQ2Uuywm9/A7uUSR7VbT2Nf8JTTy17+DMbnJ
   6zEByBQ2Y+v3WSqFOgZ4qCYHXgMqxGzt7unl5C/rVY71BS7KECxEqgGAo
   2ICkf3C+F56xCppNV6/GrmZxypYWLnJm9JfDnYcmGflmhaSDLDXayW8WS
   Q==;
X-CSE-ConnectionGUID: dV/7UbtqRQi6XVfHUT0ZYg==
X-CSE-MsgGUID: mbi5ooUwQueUHH4tTXQeIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71553506"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71553506"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 03:47:43 -0800
X-CSE-ConnectionGUID: uBUO3g4tSl6lZQxDPyOLvQ==
X-CSE-MsgGUID: LhBqDtepT5GG3Ms9xDx2+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210417634"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2026 03:47:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vogmp-00000000lca-2iWa;
	Sat, 07 Feb 2026 11:47:39 +0000
Date: Sat, 7 Feb 2026 19:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to
 output
Message-ID: <202602071900.fhjggo24-lkp@intel.com>
References: <20260206002349.96740-11-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206002349.96740-11-andrew.jones@oss.qualcomm.com>

Hi Andrew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/fixes]
[also build test ERROR on linus/master v6.19-rc8]
[cannot apply to shuah-kselftest/next next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Jones/riscv-hwprobe-add-support-for-RISCV_HWPROBE_KEY_IMA_EXT_1/20260206-082824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git fixes
patch link:    https://lore.kernel.org/r/20260206002349.96740-11-andrew.jones%40oss.qualcomm.com
patch subject: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to output
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260207/202602071900.fhjggo24-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071900.fhjggo24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071900.fhjggo24-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `riscv_ext_vector_crypto_validate':
>> cpufeature.c:(.text+0x632): undefined reference to `riscv_have_user_pmlen_7'
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `hwprobe_isa_ext1':
   sys_hwprobe.c:(.text+0xb1a): undefined reference to `riscv_have_user_pmlen_7'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
