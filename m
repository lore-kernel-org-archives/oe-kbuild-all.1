Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F11FB8A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874359; cv=none; b=RGn+9q64tYStGzIZ164kifUTuaAaiRn8gBgo0+kbR10J8pm1XlPhXOlML6shuPdPLnUlLuEn5AxFWmJFrSK8Q35CmOANt3bL6uu1fuGumhKDwsZP82ZZO9Ss8yckHtfEDk1rStcnK7Rdi2x/iKTCoaLnDN0fXAQ/7xXcqKKp0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874359; c=relaxed/simple;
	bh=YyP5m2BKW+pn3lACZFp6MQKErgFfX3j5PwKyiZ5kAX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooxTJSMrbLKF8GPWvGlX6cU7m4VPtrgpLaFwQ8K3WK9iW7LQpZq60jNuvDWgYQzTMyKkpX5cLEC+Pbzt7ydBuxFAm1roKwE4sq93iJHyttVaBsm1A3aUHe/dbK76S0gfnS7ydyf4Fh9Bx+pLho0z+UZLXSzHCzcUJJt+ltT7QtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVEw34r7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVEw34r7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729874357; x=1761410357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YyP5m2BKW+pn3lACZFp6MQKErgFfX3j5PwKyiZ5kAX8=;
  b=SVEw34r7yqTwIXU2n9IOfykkQKpGad0KdegmwtbwaPsqpw5b7LZnnnSM
   88FDCHSWDDLjfyXRDaeNSaJFAVAxz4At5+BeILq+2B/0PDl/kEj3XwShG
   Zl2/VZgbZ6HReA2C7hYNzrF+HQMzzFS+3dyPeTGqxY/03L5WZBCHx2PaW
   11FEUG7aPx546bW5135jNXvqZO5JQV2Ux5lR6rPbZM1Hc67G28qTAnfY1
   Tb3Hn5wLrhIiM9dNQEKsQc3EbUkxQBvEEMGnlfzdOd29OrcsWmV3HhTBE
   PN7DT25uurDUKp2TJMM8egJfEfHhOwEJJvedI7/aGtn4pUoakM7U4ooAP
   g==;
X-CSE-ConnectionGUID: tku+p7SiQN6ixRV1oH6Tew==
X-CSE-MsgGUID: 8gcG5do3Tea0iv/QeQNCxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29666478"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="29666478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 09:39:17 -0700
X-CSE-ConnectionGUID: XgkXtMqCS+a2JzbKtVE8eQ==
X-CSE-MsgGUID: CHmVb3XiRIi2jboVWVYUHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="80987133"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2024 09:39:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4NLF-000YZP-32;
	Fri, 25 Oct 2024 16:39:13 +0000
Date: Sat, 26 Oct 2024 00:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/17] include/linux/sframe.h:33:47: warning:
 'struct sframe_file' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202410260037.TKdyZiiK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   7f54f6a91246a746ba799c52c97effb41e28a88b
commit: bb962386a097a3c05361d9d8c26cf778407a96b8 [3/17] unwind: Introduce sframe userspace unwinding
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241026/202410260037.TKdyZiiK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260037.TKdyZiiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260037.TKdyZiiK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:107:
>> include/linux/sframe.h:33:47: warning: 'struct sframe_file' declared inside parameter list will not be visible outside of this definition or declaration
      33 | static inline int __sframe_add_section(struct sframe_file *file) { return -EINVAL; }
         |                                               ^~~~~~~~~~~


vim +33 include/linux/sframe.h

    32	
  > 33	static inline int __sframe_add_section(struct sframe_file *file) { return -EINVAL; }
    34	static inline int sframe_add_section(unsigned long sframe_addr, unsigned long text_start, unsigned long text_end) { return -EINVAL; }
    35	static inline int sframe_remove_section(unsigned long sframe_addr) { return -EINVAL; }
    36	static inline int sframe_find(unsigned long ip, struct unwind_user_frame *frame) { return -EINVAL; }
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
