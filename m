Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E64188CB1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272116; cv=none; b=T7Ih4o+1e5UqDoTJucHKoeMAjZ8hsN4TIJKMPQ0jdDc78u7vjhcHsiOkncEcr65SEJH3/N3zx8zcXtcP02n2x0uHxwOgQzyEVZ+xyAFcMgTarr8sCPMdfnmmWEs4yKFLJ8sVPcKsfSA1Ssw00rzpcEe7eNSq+DkppC7Pc5ihVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272116; c=relaxed/simple;
	bh=fLMmJVBW6bftUPkX0nnMMzxLB7D84sC7+Jtip3BlQzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVLVrzzCkrERGqMdmj2GFidzip4P1tbTT2lXp7ZEfGZZgxHCqHgDXApE3pYEJ4XyK8SDVuibwGw505nosjT4goaOgH34guUOD1MKdbaYWlodWia2PDRr/Elqq0FPf44BUxzPkczdMDvWGyoKmtGR6rHXR00FyTZ6wIZshLcBTrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKxd/NyA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKxd/NyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729272115; x=1760808115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fLMmJVBW6bftUPkX0nnMMzxLB7D84sC7+Jtip3BlQzw=;
  b=QKxd/NyA5t0n/cQDdVyzy826+5ull9L99qSNWmyLaPtc0yS72IpaK7Jl
   87SSWkL42XAjV3gkNlksazaX8E4dO5a8UsrH3QjMYZDso+Hkzl1qwx8di
   +XxSej0h7Q8zg4miCajf4Y/6USX4y5n7ozDEfL9odIB5oV7OOd9JSx/p8
   oO5KceYwV5xqNhZ4ca5CAtR4MABUyNU9UPQfiPKq6YAwiczds0Ej0oVBE
   2vK9ODNLL/+4S63YHNBmIF4h3iXYvriuXn1YqzPPVkcWfkC1NXKIz4QSZ
   sUZW3r4sW1CaPWJN8YhoP/q+/KfPkURTcHDmyraYEUkvtuHBJ4x466Wtx
   Q==;
X-CSE-ConnectionGUID: /ZjXIpi0Qmez0QL+PWtTGw==
X-CSE-MsgGUID: wFIuI0QrQMaZJ9KH8WCSBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39359553"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39359553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:21:54 -0700
X-CSE-ConnectionGUID: yZ9nYVtYRViY5nVKqVzH9Q==
X-CSE-MsgGUID: 8wMwP0LxSzete3cBkdPt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79262184"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2024 10:21:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1qff-000O7X-0G;
	Fri, 18 Oct 2024 17:21:51 +0000
Date: Sat, 19 Oct 2024 01:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] kasan: migrate copy_user_test to kunit
Message-ID: <202410190112.GgJtD8oL-lkp@intel.com>
References: <20241011071657.3032690-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011071657.3032690-1-snovitoll@gmail.com>

Hi Sabyrzhan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.12-rc3]
[cannot apply to next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sabyrzhan-Tasbolatov/kasan-migrate-copy_user_test-to-kunit/20241014-062132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241011071657.3032690-1-snovitoll%40gmail.com
patch subject: [PATCH] kasan: migrate copy_user_test to kunit
config: x86_64-randconfig-102-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190112.GgJtD8oL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190112.GgJtD8oL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190112.GgJtD8oL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'mm/kasan/kasan_test_module.o', needed by 'mm/kasan/'.
   make[5]: Target 'mm/kasan/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
