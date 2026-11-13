Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542085;
	b=Io/2J6JFVfiaPSEYn00ZFZBqzo54fNxfpaL6fsW7S80XsurRY+NBVY/LV2KC0HM2XbiD
	 F8eCcDS8sOe+bVj6ok37NckGTHRjB2ZRv5lu21xJzfIp7SoPJ5VJsRx0i2WDT5PJldqJC
	 N512as2hsngvTobNj2iqOtE9HHe4Nk/Ql/iQRUTlb7nrJfUzC8sbNiZGBLdahQ3whafwm
	 utTCzIbyUwaM6+wyTNdnw8//0nGnWXFUU/5YDvPtPI4wYH1Zgv+ShrQksWABUfSoxsLz2
	 7LsslNB4Kp7cU/NvErABmubAB0zT4jnb5LiWgLV+8PPb0WnE4/90s+reTKAlm6aQiKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542085;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iNoEJZMTnOq5PZCxIq2og+wpPuu7QnnNXMx++E3JeZw=;
	b=h0SuJdaZIa2i/I4LLALiAXVM6C7IGkG3l/wUfgaSgCIdVmiuUxtJicwx3aKgz7e3HXbw
	 OJYtka+8240qtCP3l2Bn1AmVzl+hsJetZG2PFpFptFNeg8n2g/V+MQZMejG0MS8xMC2TB
	 SmNWJxp6r7ROPIK0D8bnEJEatgH6MZHFUJfnpPoOetZ/KKbUzlQfBdw/PKEWIlkvxkVrX
	 +57n24RYZJea3TRSEl3Lp8a25w27HjigTHx0hinn20DjgjYK1JL1R236LfOyqBKWKoRuy
	 0P10fhqIAiCbdfoIZgBiYiqKMthhpLUFOZieME1FlWwvljMOm5aKO4zISsrEUjzoFng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ffJZ0GBJ;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A4E606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 03:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ffJZ0GBJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794542084; x=1826078084;
  h=date:from:to:cc:subject:message-id;
  bh=3DKx0h83GjuOkntMc+Ni9/J+6tiqM/POchY9gyIGexE=;
  b=ffJZ0GBJDbLAjmBC1cP7UiVlSy5/FxnYhjf4sKJ+C0mcgGPC2J5bP9E6
   ssFyTURId/y5yHmi2pj3XNceW5tcsXvDgYP5MbeguJwbHh3Y0V1RiW6xq
   GpinoKuVnLo6uuDMM2F2ipH18iiX236hNEd+ysMmq/BYG6Y1yewKFjJ6e
   +DY3k81lbklGw7wCQzMya2bEMLE5UUI3FM2aXJhoIhudQtOsGVb+W5i//
   4ONtUFWQ37RjKMc/YqQw1VxUWMBOvVzY24hyJGQI+Nv3kFQlAkJBrZddT
   Oq3JFMBEKWBxgAifDHk1bUJYa5XW4Kyw1gh4LshcIVvOERGj5EiwbYVpn
   g==;
X-CSE-ConnectionGUID: eGfXKS7LTNCUVbo9hKuBIA==
X-CSE-MsgGUID: 8CWnR5/9SAWsnvC0ByT9mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3334925"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3334925"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 19:54:44 -0800
X-CSE-ConnectionGUID: dcbia6SkQoOQ6Kcqdy5/6Q==
X-CSE-MsgGUID: gKc8SmKLQMi0icCYmPaj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9106846"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Nov 2026 19:54:43 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRiN6-000000012N3-1KaC;
	Fri, 13 Nov 2026 03:54:40 +0000
Date: Fri, 13 Nov 2026 11:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 326/326] fs/file.c:715:
 warning: Function parameter or member 'fdt' not described in 'last_fd'
Message-ID: <202611131122.sBk88uBJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Christian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   0405f3f730492e5e0d8975d263e1e7afa9c80b7f
commit: ee498814339ca96f8ca824f994f24cff537387b1 [326/326] UPSTREAM: file: fix close_range() for unshare+cloexec
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611131122.sBk88uBJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131122.sBk88uBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131122.sBk88uBJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/file.c:715: warning: Function parameter or member 'fdt' not described in 'last_fd'
>> fs/file.c:715: warning: Excess function parameter 'cur_fds' description in 'last_fd'
   fs/file.c:758: warning: Function parameter or member 'flags' not described in '__close_range'


vim +715 fs/file.c

   705	
   706	/**
   707	 * last_fd - return last valid index into fd table
   708	 * @cur_fds: files struct
   709	 *
   710	 * Context: Either rcu read lock or files_lock must be held.
   711	 *
   712	 * Returns: Last valid index into fdtable.
   713	 */
   714	static inline unsigned last_fd(struct fdtable *fdt)
 > 715	{
   716		return fdt->max_fds - 1;
   717	}
   718	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
