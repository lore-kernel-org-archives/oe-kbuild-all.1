Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8948429D0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 01:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728522641; cv=none; b=D6ZaKvmdpz1mA4CaLlqNxQMauYw3GJooYJOSsbamXeOFpm88bv4RREEs2LhkNf8N2INhmuaZOp95BIx3bNq848JKBiko+qpXy3+N++51BpQVPOfqk64u4wJ4K7edMWSkqFf+QidYKLxQTfSJqbts8yk2jxSoUA9bb+UuetXSxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728522641; c=relaxed/simple;
	bh=QjnnT8qD5CJxrUcMqflmXBinQNUSsxC4xxvySNkAk7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qlZv2mM/WipgFgfMRdmrnbAYwVtUwkTfYiA9bSo6Wah4jDVGoujE+741IZ+7/BVJo8/e1TGuVzgj31kIo47rkkaR3ovrQDBv5fMMInV9agO2OG+JXUUov9Fn7sBC3nB0hNGxquPJwFV4Y8cowGHeuTUKE1yWMdEhjqqlOVeRSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heBQbgpw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heBQbgpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728522640; x=1760058640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QjnnT8qD5CJxrUcMqflmXBinQNUSsxC4xxvySNkAk7I=;
  b=heBQbgpw7v7gDKyZjpeY76RsapxVw6hnueQZ1/TV9doBZcsweThmwpVd
   1miVsvEe3yJVZgmsWSn8XdELNf66It9KhvdYJMvO1tv3RTL8cRHaBZNpR
   2lf8JVDJT6wqqQ11K9e4FgsZ8+j4kkhTx4q6EgkEdGW210Cbie1/bkFnC
   /6K8Rfcb6dNYvjMKlS+0TwnOpddF1r0ylMPCpLDM8yQ58HG1J2JOx0EtQ
   y4JmD2kLf8GVmufzhIap/2h2jXepSrUjq3GoVVtyI3Dx3MQNrH8PnIe1l
   8wEfMhy4kh1NBWKG0X4A8CTp6KCS7G7oddIthfrI8Qg/hmuQSbixcxmxi
   g==;
X-CSE-ConnectionGUID: XPQrTMUpS0CJJaAjv1I1Cw==
X-CSE-MsgGUID: J35VUa1dS4i5vo0e+Y17Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28015186"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="28015186"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 18:10:39 -0700
X-CSE-ConnectionGUID: UY7u/ZExRzCbWTYxor40MQ==
X-CSE-MsgGUID: S0YMXiYAST+jbgoIFyhvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="80951729"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 18:10:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syhhL-000A0K-0S;
	Thu, 10 Oct 2024 01:10:35 +0000
Date: Thu, 10 Oct 2024 09:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/core 25/25] kernel/time/clocksource.c:1258:13: warning:
 '__clocksource_change_rating' defined but not used
Message-ID: <202410100903.emvWh4LZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
head:   5ce9bb4d5af2f5ef38f134e3cb400c873d357de7
commit: 5ce9bb4d5af2f5ef38f134e3cb400c873d357de7 [25/25] clocksource: Remove unused clocksource_change_rating
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241010/202410100903.emvWh4LZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100903.emvWh4LZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100903.emvWh4LZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/clocksource.c:1258:13: warning: '__clocksource_change_rating' defined but not used [-Wunused-function]
    1258 | static void __clocksource_change_rating(struct clocksource *cs, int rating)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__clocksource_change_rating +1258 kernel/time/clocksource.c

d7e81c269db899 John Stultz     2010-05-07  1257  
d0981a1b21a038 Thomas Gleixner 2009-08-19 @1258  static void __clocksource_change_rating(struct clocksource *cs, int rating)
d0981a1b21a038 Thomas Gleixner 2009-08-19  1259  {
d0981a1b21a038 Thomas Gleixner 2009-08-19  1260  	list_del(&cs->list);
d0981a1b21a038 Thomas Gleixner 2009-08-19  1261  	cs->rating = rating;
d0981a1b21a038 Thomas Gleixner 2009-08-19  1262  	clocksource_enqueue(cs);
d0981a1b21a038 Thomas Gleixner 2009-08-19  1263  }
d0981a1b21a038 Thomas Gleixner 2009-08-19  1264  

:::::: The code at line 1258 was first introduced by commit
:::::: d0981a1b21a03866c8da7f44e35e389c2e0d6061 clocksource: Protect the watchdog rating changes with clocksource_mutex

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
