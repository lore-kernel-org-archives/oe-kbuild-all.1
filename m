Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E49B33066D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 22:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780785907; cv=none; b=Aa3saKqJ7N4hT8eLGVpeDHW/u5rfDjqfVcfiWCZPQngI4MLNJcxAJq+Nl19cnagCMILBxV2M+bKHmydMhJHUo/EJmbYSBzN9laKu/v4Z08GNs6sYdcKgH+Ay+ZfaSenHvGXYZckpr0mlXKlnp2Cyd2XyczyRr/6CU6jLxqIL6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780785907; c=relaxed/simple;
	bh=pJtZ2DGXUCg+8is2zN4scBQxOtM2wOgiN+P0iUNt53Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qoszYNgVtJUJge8Dnlfehdc8dxhm/8w5hJRE81geTcen8inwvt/V3QXQfzegQfBQ0qU0bUmkt+Tc830vjUhLh3q0OAIO3qKnsOGRG9lZNMAyu2z9eDPCC+pBYzgOmvr4K8EeHrdZsIzJ0ThjzlbiX7JmNp9HNYCy/YJKi+Xfs7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ue+U6OP5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ue+U6OP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780785904; x=1812321904;
  h=date:from:to:cc:subject:message-id;
  bh=pJtZ2DGXUCg+8is2zN4scBQxOtM2wOgiN+P0iUNt53Y=;
  b=Ue+U6OP5ux7kSEKZRt6zSvpbvqo2hF4rLMm4Qs1JqpcH1lfpSn4nWTfp
   ubbWY8JT45TBXrl/0MUmGkjhi9/70OmuMOIdm4nNbKJwy8VlP70Kc9UfR
   mnubdWk6CZ56WvC13l/oODg7nGoOTxQEfEY3uwJZu/kWUJq+7ECsh114P
   Xt6FkbFcpUpqqbw4JG1VEYiu1NFDW8wrqdw4Y374t5ifWA4ByzljBzDcl
   mZL6LBw/TuTdPXhvz4MFI9iuZlz5wqUqzBpeS9K2XO6miw/c1pFeMD7DL
   WjKud9DpVOxBSWoMW1D3qE6Pwc5vawfgwu3EuIq2CIserwK65EGFyNvKo
   Q==;
X-CSE-ConnectionGUID: iILA9sQQRkeYmds8Rfe1gQ==
X-CSE-MsgGUID: 3gfRPTGyS1aQky0ypY7dLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81613867"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="81613867"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 15:45:03 -0700
X-CSE-ConnectionGUID: 1dwlgd9DThCkcQSB61mvcQ==
X-CSE-MsgGUID: 83e6JybPRHyhj0bTsaSLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="238804612"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jun 2026 15:45:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVzlD-00000000HQQ-1QDp;
	Sat, 06 Jun 2026 22:44:59 +0000
Date: Sun, 07 Jun 2026 06:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [linux-next:master 10339/11755]
 include/linux/srcutree.h:304: Warning: missing closing `"'
Message-ID: <202606070610.1OVCKIgq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: 18ec6c5d7ec6c73ccff616041d75b6ea30a9a36e [10339/11755] s390/percpu: Use new percpu code section for arch_this_cpu_add()
config: s390-randconfig-002-20260606 (https://download.01.org/0day-ci/archive/20260607/202606070610.1OVCKIgq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606070610.1OVCKIgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606070610.1OVCKIgq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/srcutree.h: Assembler messages:
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
--
   include/linux/srcutree.h: Assembler messages:
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
>> include/linux/percpu-rwsem.h:74: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:79: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:104: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:109: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:128: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:133: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:140: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
   include/linux/percpu-rwsem.h:145: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
--
   include/linux/srcutree.h: Assembler messages:
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:328: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
   include/linux/srcutree.h:333: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
>> include/linux/srcutree.h:304: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
   include/linux/srcutree.h:309: Warning: missing closing `"'
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +304 include/linux/srcutree.h

c4020620528e4e Paul E. McKenney 2025-01-09  302  
c4020620528e4e Paul E. McKenney 2025-01-09  303  /*
c4020620528e4e Paul E. McKenney 2025-01-09 @304   * Removes the count for the old reader from the appropriate
c4020620528e4e Paul E. McKenney 2025-01-09  305   * per-CPU element of the srcu_struct.  Note that this may well be a
c4020620528e4e Paul E. McKenney 2025-01-09  306   * different CPU than that which was incremented by the corresponding
c4020620528e4e Paul E. McKenney 2025-01-09  307   * srcu_read_lock_fast(), but it must be within the same task.
c4020620528e4e Paul E. McKenney 2025-01-09  308   *
be975448a45cd0 Paul E. McKenney 2025-07-22  309   * Please see the __srcu_read_lock_fast() function's header comment for
be975448a45cd0 Paul E. McKenney 2025-07-22  310   * information on implicit RCU readers and NMI safety.
c4020620528e4e Paul E. McKenney 2025-01-09  311   */
7e2a2d060da486 Paul E. McKenney 2025-07-16  312  static inline void notrace
7e2a2d060da486 Paul E. McKenney 2025-07-16  313  __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
f0b7ce22d71810 Marco Elver      2025-12-19  314  	__releases_shared(ssp)
c4020620528e4e Paul E. McKenney 2025-01-09  315  {
f0b7ce22d71810 Marco Elver      2025-12-19  316  	__release_shared(ssp);
c4020620528e4e Paul E. McKenney 2025-01-09  317  	barrier();  /* Avoid leaking the critical section. */
3cec27453db49a Paul E. McKenney 2025-01-28  318  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
be975448a45cd0 Paul E. McKenney 2025-07-22  319  		this_cpu_inc(scp->srcu_unlocks.counter);  // Z, and implicit RCU reader.
3cec27453db49a Paul E. McKenney 2025-01-28  320  	else
be975448a45cd0 Paul E. McKenney 2025-07-22  321  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_unlocks));  // Z, and implicit RCU reader.
c4020620528e4e Paul E. McKenney 2025-01-09  322  }
c4020620528e4e Paul E. McKenney 2025-01-09  323  

:::::: The code at line 304 was first introduced by commit
:::::: c4020620528e4e22a051900654a70dcff0ab218d srcu: Add SRCU-fast readers

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Boqun Feng <boqun.feng@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
