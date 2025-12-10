Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76916248F69
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765378647; cv=none; b=LjSlosBRS8kPFG1gqxGxnvbLRAzVuya+8JTS9AJuM680yNSHE3n6RqjGXcNKn3cPwtSNJh2OaNhlz8DNuKClXg/WIZQBOHBFaMk9ewamRbmlDkqnheI2NedvUfNQJLwPyOoLSAPblw4hMU52p+Ky7Gr65Ok1Akdm5hErF9Z+kwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765378647; c=relaxed/simple;
	bh=KKUBTvciOckem/esns9/7wmXj+VeduqlXOe6AAiPFcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URr2K1cSiKYgKerzuyr/bhUB2luy1IdaCOvYTAlJZH6KctNw5UdXzX+xlRT/x9eAu+hMJbNA+ngzv5VGAEEXYDC3N8XNGDJdSMe0h95hZmdxWos5niJGpkNsuflKkgbjzmczZxY6TlQd+ZPbP3+8Pm+7C0dIbuOzk9ovPtNZc7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BW7tom+f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW7tom+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765378645; x=1796914645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KKUBTvciOckem/esns9/7wmXj+VeduqlXOe6AAiPFcQ=;
  b=BW7tom+frIQ8bow9o+frlMjKDKElTF6RWGjzGCnvQz9RoznsYBIjTTf0
   XWD3wciFJcoOUunF7zBiGSQq4Pw53je/kJFXr7iE/Ow2xnB9vmod+MwjJ
   rHjuBnWWLnnXziyUrLx4BR8eiP0U8ewkM03aIS+zZvOWCQneEw7S4e9UA
   vc6IGQfRCSDHGxgxJY05pOD96EWN5xUiAlDX1dUDFD/DvVtv4jh3K3eH+
   D+LGgQaFpLuVGpiwFsjokKTQEN5XSfnqBS6FEisxhnfqW6EwznXyu1Mzw
   V5ooeEE01jDVDQUg9PGsc2lWqZTjOx8fnHdHCHipK/3gMlv/9jxqlYGo4
   w==;
X-CSE-ConnectionGUID: pl93LtjtQuyLZo+uFo4YGg==
X-CSE-MsgGUID: FUSSPjSXTcmGAn+QWAsJ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67425686"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67425686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 06:57:25 -0800
X-CSE-ConnectionGUID: qYXTPD3WQM6TQ4nxwv3RJg==
X-CSE-MsgGUID: 9yPDEePCRoGBCAdf5sf0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="200963848"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Dec 2025 06:57:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTLd1-000000003IH-2BpZ;
	Wed, 10 Dec 2025 14:57:19 +0000
Date: Wed, 10 Dec 2025 22:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Jens Remus <jremus@linux.ibm.com>,
	Stefan Schulze Frielinghaus <stefansf@linux.ibm.com>,
	Juergen Christ <jchrist@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH 6/9] s390/bug: Implement __WARN_printf()
Message-ID: <202512102243.DTSqDkfQ-lkp@intel.com>
References: <20251209121701.1856271-7-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209121701.1856271-7-hca@linux.ibm.com>

Hi Heiko,

kernel test robot noticed the following build errors:

[auto build test ERROR on 70075e3d0ca0b72cc983d03f7cd9796e43492980]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Carstens/kbuild-Require-gcc-9-for-s390/20251209-202647
base:   70075e3d0ca0b72cc983d03f7cd9796e43492980
patch link:    https://lore.kernel.org/r/20251209121701.1856271-7-hca%40linux.ibm.com
patch subject: [PATCH 6/9] s390/bug: Implement __WARN_printf()
config: s390-randconfig-r062-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102243.DTSqDkfQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102243.DTSqDkfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102243.DTSqDkfQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kernel/traps.c:224:26: warning: 'struct arch_va_list' declared inside parameter list will not be visible outside of this definition or declaration
     224 | void *__warn_args(struct arch_va_list *args, struct pt_regs *regs)
         |                          ^~~~~~~~~~~~
   arch/s390/kernel/traps.c:224:7: warning: no previous prototype for '__warn_args' [-Wmissing-prototypes]
     224 | void *__warn_args(struct arch_va_list *args, struct pt_regs *regs)
         |       ^~~~~~~~~~~
   arch/s390/kernel/traps.c: In function '__warn_args':
>> arch/s390/kernel/traps.c:243:13: error: invalid use of undefined type 'struct arch_va_list'
     243 |         args->__overflow_arg_area = stack_frame + 1;
         |             ^~
   arch/s390/kernel/traps.c:244:13: error: invalid use of undefined type 'struct arch_va_list'
     244 |         args->__reg_save_area = regs->gprs;
         |             ^~
   arch/s390/kernel/traps.c:245:13: error: invalid use of undefined type 'struct arch_va_list'
     245 |         args->__gpr = 1;
         |             ^~


vim +243 arch/s390/kernel/traps.c

   223	
 > 224	void *__warn_args(struct arch_va_list *args, struct pt_regs *regs)
   225	{
   226		struct stack_frame *stack_frame;
   227	
   228		/*
   229		 * Generate va_list from pt_regs. See ELF Application Binary Interface
   230		 * s390x Supplement documentation for details.
   231		 *
   232		 * - __overflow_arg_area needs to point to the parameter area, which
   233		 *   is right above the standard stack frame (160 bytes)
   234		 *
   235		 * - __reg_save_area needs to point to a register save area where
   236		 *   general registers (%r2 - %r6) can be found at offset 16. Which
   237		 *   means that the gprs save area of pt_regs can be used
   238		 *
   239		 * - __gpr must be set to one, since the first parameter has been
   240		 *   processed (pointer to bug_entry)
   241		 */
   242		stack_frame = (struct stack_frame *)regs->gprs[15];
 > 243		args->__overflow_arg_area = stack_frame + 1;
   244		args->__reg_save_area = regs->gprs;
   245		args->__gpr = 1;
   246		return args;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
