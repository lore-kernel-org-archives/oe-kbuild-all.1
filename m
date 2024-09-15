Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83017BA3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726369111; cv=none; b=sMCpXp1aAacb+vaIfCl0g4OameJXvkiDBGgwHpk6Iyfu2So0eBt7CQR1fx/8CQ9UJMBF9F/2wzBcQ1b+2A9n+Jk5mm0UcujUtfvkZ1/AWK2flyTso5zbxPzXtEhWChDAWMkQzUfhXVuPgUQbxHLRNNowIgGS7htBq/DWrK4hfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726369111; c=relaxed/simple;
	bh=4CwV2kreeBfNg1f9C9W1BjPDIKZc3jIem0zilwNNTVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFmdjZTn+yabX8Z6/hfFknWQbvp8gbYJJ/O3Hv3/mhJqdwBt5RbKNZGjzgxEPat6hqyD4SSo7XnCt5K06k06ctAvwkSOglpiP03yeNBbrts3U1tIgrG+iGdtMZcNBOOD7eFua1RWjNo9JvGnljDfYfbfj4ZdLPAI5Oc7HI/0ylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byWyOlJU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byWyOlJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726369110; x=1757905110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4CwV2kreeBfNg1f9C9W1BjPDIKZc3jIem0zilwNNTVw=;
  b=byWyOlJUdSHQNccysrOYACJIEqsUr0YaB2he2S1xrW5jPXxAsDt7L1Cx
   r5BEohOPJg8pYFmRoAJmVMhrNnFMBDEnqTJa+AZ9wo3lOi59XJwc9CQH8
   QSsZUZf7mZNSm7a0FmO9FZx4EZ+9B6e05aOMf9aIQJbQ32I1DTOcy/DX2
   oWVF/LdR5OeApaQ1ueHfHjuQF1PiKnEFcY315tvjT8NJLbc9vzGoafH1f
   bZWvb88QlmIOfU0dIyu7FlmuF3a6boFu+uvYTGLHXKoQO5+fL5Ban6Szy
   TZfrwQLFgojUlh5xv9/6+A90/UNcs1R3SM81hvMXD87qgivKtXGbhC7Q8
   w==;
X-CSE-ConnectionGUID: 7zfRztBAQtaEAis7pfUkIA==
X-CSE-MsgGUID: Zthu74vpSTCBW+I074F5cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25122002"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="25122002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 19:58:29 -0700
X-CSE-ConnectionGUID: LxdIk35VS2aS1kDJFS0rMw==
X-CSE-MsgGUID: cxD5dTzqTGii0zGp0rNfXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="73526262"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Sep 2024 19:58:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spfSz-0008MA-2T;
	Sun, 15 Sep 2024 02:58:25 +0000
Date: Sun, 15 Sep 2024 10:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 05/14] riscv: vector: Use vlenb from DT for thead
Message-ID: <202409151033.te7A7BaA-lkp@intel.com>
References: <20240911-xtheadvector-v10-5-8d3930091246@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-xtheadvector-v10-5-8d3930091246@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0e3f3649d44bf1b388a7613ade14c29cbdedf075]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/dt-bindings-riscv-Add-xtheadvector-ISA-extension-description/20240912-140100
base:   0e3f3649d44bf1b388a7613ade14c29cbdedf075
patch link:    https://lore.kernel.org/r/20240911-xtheadvector-v10-5-8d3930091246%40rivosinc.com
patch subject: [PATCH v10 05/14] riscv: vector: Use vlenb from DT for thead
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240915/202409151033.te7A7BaA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151033.te7A7BaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151033.te7A7BaA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/cpufeature.c:28:
>> arch/riscv/include/asm/vendor_extensions/thead.h:19:6: warning: no previous prototype for 'disable_xtheadvector' [-Wmissing-prototypes]
      19 | void disable_xtheadvector(void) { }
         |      ^~~~~~~~~~~~~~~~~~~~
--
   riscv64-linux-ld: arch/riscv/kernel/vendor_extensions.o: in function `disable_xtheadvector':
>> vendor_extensions.c:(.text+0x4): multiple definition of `disable_xtheadvector'; arch/riscv/kernel/cpufeature.o:cpufeature.c:(.text+0x11a): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
