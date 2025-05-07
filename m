Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033B6280CEA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623380; cv=none; b=RBKtQPBic5tesvBhN0HAfYctjYzcSoZEK7oiHFwmUGLO0AuqmeUzw2f5O0CXQDDlXz/Pq2W5IMvawjb2o2dnITiCK6YmQ9ogjbv1PRc/AalQkS4ZuEGFLlc7UzfAHH53Ee/YodEKN1CBaqbsX8yx/dzyvnH5ZEMQmfzyBKxeS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623380; c=relaxed/simple;
	bh=Mfqc4jMxhAMwRCSk6HOr5PW5yfuoYpN62mQGSoVVmjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKj4NGKymS3dPPCXnGJopqR8lZoj0r63Cj5bFsZ/i2Jiz3ZZoblK4iGbmlPoOJTXVME0wcB3z4xaIGJ0SuQrvqeLHvqlpvksCMOBjN99m8/bwzFLnU0jaPUeL71znPzUW2NOFjFU2R+tFvu9Qb7JKdnYnH3nOXzyFsPgMyp8QYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1iMSoHu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1iMSoHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746623379; x=1778159379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mfqc4jMxhAMwRCSk6HOr5PW5yfuoYpN62mQGSoVVmjE=;
  b=a1iMSoHun1xoxhi60aTKBN+b3opXQJpN0k4ukrtXvIY5IvXfDyV5GdzK
   VRKF9ow5QEdDKybL3+/8cJxCz2Pe9vOA8XJxh7CWybZYXeTVuoDzFwAUF
   0xjqBMEfT+fTxRziRVVbrXlHjTsNF8ccN9DSBJtXTrshCqLkldKMBWcPj
   zk768/jXU+72r578LbotapFUmARMB7G4FCySE4MVGxwm9CuBCstCb9VJa
   NPjjU6Y5QfXO6n3XvFJWmTRX28XbxNz9ShywxdIhCEOxbqI8sVLr4/xxi
   /VjUcVtgMTSpKkdfwDEdAE08fDICLtQWPI77zYS6e2zI8qb4GQ6fAaZyR
   Q==;
X-CSE-ConnectionGUID: N/QO0+52SeWPfUsOKLy9jw==
X-CSE-MsgGUID: vyLhhbqMQ4SRac2hjDYNnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48253252"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48253252"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:09:38 -0700
X-CSE-ConnectionGUID: tfvE2GAkT/K3vovsl1NkCA==
X-CSE-MsgGUID: T4TP86PYSbuxR4GQgs5EXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136346222"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2025 06:09:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCeWl-0007qd-12;
	Wed, 07 May 2025 13:09:35 +0000
Date: Wed, 7 May 2025 21:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: Corey Minyard <corey@minyard.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3623/7938]
 drivers/char/ipmi/ipmi_si_parisc.c:16:4: error: 'struct si_sm_io' has no
 member named 'si_type'
Message-ID: <202505072129.WUpN1tmx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 37631eee20639f05077ac41ff424d7869d5b578d [3623/7938] ipmi:si: Move SI type information into an info structure
config: parisc-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250507/202505072129.WUpN1tmx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072129.WUpN1tmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072129.WUpN1tmx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/ipmi/ipmi_si_parisc.c: In function 'ipmi_parisc_probe':
>> drivers/char/ipmi/ipmi_si_parisc.c:16:4: error: 'struct si_sm_io' has no member named 'si_type'
      16 |  io.si_type = SI_KCS;
         |    ^


vim +16 drivers/char/ipmi/ipmi_si_parisc.c

c6f85a753df858 Corey Minyard   2017-09-12   9  
c6f85a753df858 Corey Minyard   2017-09-12  10  static int __init ipmi_parisc_probe(struct parisc_device *dev)
c6f85a753df858 Corey Minyard   2017-09-12  11  {
c6f85a753df858 Corey Minyard   2017-09-12  12  	struct si_sm_io io;
c6f85a753df858 Corey Minyard   2017-09-12  13  
51614b26a02951 Mikulas Patocka 2017-12-06  14  	memset(&io, 0, sizeof(io));
51614b26a02951 Mikulas Patocka 2017-12-06  15  
c6f85a753df858 Corey Minyard   2017-09-12 @16  	io.si_type	= SI_KCS;
c6f85a753df858 Corey Minyard   2017-09-12  17  	io.addr_source	= SI_DEVICETREE;
f6296bdc49c4d3 Corey Minyard   2019-02-21  18  	io.addr_space	= IPMI_MEM_ADDR_SPACE;
c6f85a753df858 Corey Minyard   2017-09-12  19  	io.addr_data	= dev->hpa.start;
c6f85a753df858 Corey Minyard   2017-09-12  20  	io.regsize	= 1;
c6f85a753df858 Corey Minyard   2017-09-12  21  	io.regspacing	= 1;
c6f85a753df858 Corey Minyard   2017-09-12  22  	io.regshift	= 0;
c6f85a753df858 Corey Minyard   2017-09-12  23  	io.irq		= 0; /* no interrupt */
c6f85a753df858 Corey Minyard   2017-09-12  24  	io.irq_setup	= NULL;
c6f85a753df858 Corey Minyard   2017-09-12  25  	io.dev		= &dev->dev;
c6f85a753df858 Corey Minyard   2017-09-12  26  
c6f85a753df858 Corey Minyard   2017-09-12  27  	dev_dbg(&dev->dev, "addr 0x%lx\n", io.addr_data);
c6f85a753df858 Corey Minyard   2017-09-12  28  
c6f85a753df858 Corey Minyard   2017-09-12  29  	return ipmi_si_add_smi(&io);
c6f85a753df858 Corey Minyard   2017-09-12  30  }
c6f85a753df858 Corey Minyard   2017-09-12  31  

:::::: The code at line 16 was first introduced by commit
:::::: c6f85a753df858018b063f5ab89b277179c3387f ipmi_si: Move PARISC handling to another file

:::::: TO: Corey Minyard <cminyard@mvista.com>
:::::: CC: Corey Minyard <cminyard@mvista.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
