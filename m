Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A4020B20
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 04:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712203890; cv=none; b=MfyX5asNBPLP+TAiHG1fKnL1mR8eOpkH+uQ3sDXnQZoCGRgKaujbGCznmoKFwCmOqTnDNmUSHXiqegvMnQX8Jpy5kgzrP5tXoZ32ay52Zl8rUvhz2ML0h+ICqRr31mmKCTbWwX5XS8M9DxeZ/ITabE3zY8quD2dbPcZDf8A6ELs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712203890; c=relaxed/simple;
	bh=S4Q/BzJgyHAgENNsgYDbUXNGVctjoYf6EmeA8uDmtCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=feFTc2ObM+VThg47nmKlWSjiGXs4RfegmdkV5unsl1Fhep4dSs3OafOMf3qfFZZFpR9gqFdhmFClt13bhhlWQpBhHo9yaGP1OkHBlUQ7Fd8hhN04Mu97PJkwIQiPDhldExN+0W5NZZymKRrbV/aFoMFjb16n2pB+2a5gKZS//NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgVirx63; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgVirx63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712203889; x=1743739889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S4Q/BzJgyHAgENNsgYDbUXNGVctjoYf6EmeA8uDmtCQ=;
  b=FgVirx63/NNl7cRgcGluE4NX7csQijL9ZASTV4o8qk1Cv/n06c1R0ktq
   8Uik4XD6k/tiRAZQPZPn7f+Sfn67tT/E7k+BVyYPWbIQULVhXboJGbFqc
   UJIaBlfanQh0+4vWYGJYf6hq9tLAktRYpL32Tekkes9zXN6WgANdQ5yEV
   JjE7QIu4cRwSaMO7YEQkFj7yWmuqzHpCyf8Ai/PRw5OkO5owWnnRMjdzh
   kA7F2N3XiFB8Vt2iYvoJKf1q6ZOxLSlfO3NqAkjWIEsroHlZwUHtK26FF
   pRDNRjtV4cWxxrIf6/k0wlWOoDwtQE8gaqHR6Zs2XRaBMr/BUgt29gYv1
   w==;
X-CSE-ConnectionGUID: 4Lbat7CmQ42pOaJHpBJWHQ==
X-CSE-MsgGUID: OPPhad0URuuaqX43uasOiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7335690"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7335690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 21:11:28 -0700
X-CSE-ConnectionGUID: C5YwyhLQTpqSYPk6dXZibQ==
X-CSE-MsgGUID: kC1WoRjoT8qWCZojw5QTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18585744"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2024 21:11:27 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsERh-0000bV-03;
	Thu, 04 Apr 2024 04:11:25 +0000
Date: Thu, 4 Apr 2024 12:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 15/15] kernel/trace/trace.c:5020:16: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404041218.3yLadHJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f42048f21805f77541ea738ce4a902a8a9e331a4
commit: f42048f21805f77541ea738ce4a902a8a9e331a4 [15/15] kernel: convert to read/write iterators
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240404/202404041218.3yLadHJ2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041218.3yLadHJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041218.3yLadHJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'tracing_write_stub':
>> kernel/trace/trace.c:5020:16: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    5020 |         return iov_iter_count(to);
         |                ^~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'tracing_trace_options_write':
>> kernel/trace/trace.c:5360:14: error: implicit declaration of function 'copy_from_iter'; did you mean 'copy_from_user'? [-Werror=implicit-function-declaration]
    5360 |         if (!copy_from_iter(buf, cnt, from))
         |              ^~~~~~~~~~~~~~
         |              copy_from_user
   cc1: some warnings being treated as errors


vim +/iov_iter_count +5020 kernel/trace/trace.c

  5017	
  5018	static ssize_t tracing_write_stub(struct kiocb *iocb, struct iov_iter *to)
  5019	{
> 5020		return iov_iter_count(to);
  5021	}
  5022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
