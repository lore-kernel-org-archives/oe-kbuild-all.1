Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB91B5337
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 19:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732131754; cv=none; b=NPlddZoMugD8zyoct71bVI8m0jcS8ltcdKcMmTbQTP/Yn0baevGGopkLQPBAuKxaVj0lGWtQQy1mjhS+ta8xjHquA4V8MNWFYX/wvpC8W1lq2BgSu0yQzpwKiFqq8Wd0mvosB8MLs12uNq0jon538n/gtqXqjqCheT855GoFYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732131754; c=relaxed/simple;
	bh=gOl9+tvIwgoYoBiQkaQMhJ8nRKJHPOrYTuADFf354lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hmHCcGeLwe3Rmw1LSAGUmEZP/6cKpSMSblTUzLokvb52bTwP60VgliChdRzS03/x+nLdzdAXUQXI+sJxHjFV9VqqBRR8r9WchULwLd18WULebNGzSeeEnazExZLoWPaldiruW/h75CtVZohD4iU4k8L9TLSkZ8xdoYT4lZV05Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OEkISHeu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OEkISHeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732131752; x=1763667752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gOl9+tvIwgoYoBiQkaQMhJ8nRKJHPOrYTuADFf354lI=;
  b=OEkISHeuhw41/lVdBPtFHL5CJ3uPdnL3BHtHxcZ651KYMd8JUwqkcp8I
   5KKrZ//WPMmtQlK3Re0itix0h76quoBBXRfNoGNgE2PLkxZgP0w9xV4kk
   ezA5ZKJS0UXNxTrm0KfAE00neMJlk0ZS0Vl2uEo57XDeimAup4uzQ/Gmt
   0uJ8KzHxaCbLvqeFXk6IljDUldOL0ITZu+IZbOkZLOhLzeh6kPWFnEp+0
   402PBHB63XYnYaACIw5hpRrFoSqVg+mvp5kCwoWtgIo9o3u5mp21GkjZ0
   71CsR/j9WN/h40vESuOgM57A4dlc9s67OY0JH+sWTIBiuiZnlAjf3t6r1
   Q==;
X-CSE-ConnectionGUID: vTTkcKPmTGO0MGicBgYCtg==
X-CSE-MsgGUID: 9PcT5aC4RxSmYPX5YWoeLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31607035"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="31607035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 11:42:30 -0800
X-CSE-ConnectionGUID: 7yboNddzR6Oj5/2coXGSQw==
X-CSE-MsgGUID: Nu6H2bmuTGqQ6RW0DjKlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="127550441"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2024 11:42:30 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDqap-000177-13;
	Wed, 20 Nov 2024 19:42:27 +0000
Date: Thu, 21 Nov 2024 03:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/ntsync5 18/28] ntsync.c:659:24: warning: passing '__u32 *'
 (aka 'unsigned int *') to parameter of type 'const int *' converts between
 pointers to integer types with different sign
Message-ID: <202411210343.3930QwJA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/ntsync5
head:   2a928305f9f05314494227eef1b52cbdf78c7722
commit: dc4e3e63538d51b8adc868b401be163e4932884a [18/28] selftests: ntsync: Add some tests for wakeup signaling with WINESYNC_IOC_WAIT_ANY.
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210343.3930QwJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210343.3930QwJA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ntsync.c:659:24: warning: passing '__u32 *' (aka 'unsigned int *') to parameter of type 'const int *' converts between pointers to integer types with different sign [-Wpointer-sign]
     659 |         ret = wait_any(fd, 1, &mutex_args.mutex, 123, &index);
         |                               ^~~~~~~~~~~~~~~~~
   ntsync.c:95:53: note: passing argument to parameter 'objs' here
      95 | static int wait_any(int fd, __u32 count, const int *objs, __u32 owner, __u32 *index)
         |                                                     ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
