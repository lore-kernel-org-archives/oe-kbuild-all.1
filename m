Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66983C2762
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707311; cv=none; b=M1Xy43jAOuZVICbe1UZh4Jxyu3lGjOt1D51fW2y/fLrxwUFSvkU2nXnV0mR/HHAEQCS4KmyW066UfhXmNHKhM2Eq2bjKXdBWEtZX9qzCSriDHRoUx/ulcJ0bT8A4trYlAAQq5kz5SLdh9wGEU6REaPORMH9lqNPXkcqtmUKeof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707311; c=relaxed/simple;
	bh=2fBI0Ly53JTXn5n+lW6dLXbRA5WF0tHscWV5nrX3gnw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dPcAyU8Lk0AqKVKuu+6K2BYpqgV75/SOmQ8JWtwzv6K0+iOdZaRRkxvxc2zNqX2AmomUSzgi3piIxgz7eBPwK1s+dsfwraewMnt9BIg9bcOG8HBs8mXkmsk67YoUuk0YV94+do3XLtKK3+ATNWpFFKR2l2HBMZ7QEZySolxzI4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhtyVynC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhtyVynC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781707308; x=1813243308;
  h=date:from:to:cc:subject:message-id;
  bh=2fBI0Ly53JTXn5n+lW6dLXbRA5WF0tHscWV5nrX3gnw=;
  b=UhtyVynCQ+zBLXsesQLqqbWxVMqX1UYNjFN0WHMHPRk/VzLIxK4OP4VN
   Qshe/AZUxFK9ZRJS51RbLssttWCToIo7rCvjLkfPgXGaQ3sgXlrV9mgj4
   HduQtbhi0H1W5uNjFLaq08JWACQfJEvwhk+8wTfBJIA830lQRRZlPrvQY
   Ahk910kdDFfUwq9new9d+8GQRGHIQddH8gOSJq6paydGeMuai8kGSNt4r
   LTtc3DrjTwge4vqHc5kRd2bPht/046Rm786X1o+ejZmc7evR1D1+Mskvn
   wd4ZWpVjtybkSdTz5DeeF1aCBWf+lBdRSo0Vsqj4qTQdELju/Kenj+apf
   g==;
X-CSE-ConnectionGUID: bJjjrG9ESZ26aaOqJcKYqQ==
X-CSE-MsgGUID: 3NgEobk6SuSZ8h2O2qAuoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="81629141"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="81629141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 07:41:47 -0700
X-CSE-ConnectionGUID: dK+L80qIRo20eaYzgVO3NQ==
X-CSE-MsgGUID: 0qNhHfhhRrKXvG1dedLZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="247948951"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jun 2026 07:41:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZrSY-00000000Ud0-1W3c;
	Wed, 17 Jun 2026 14:41:42 +0000
Date: Wed, 17 Jun 2026 22:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
Subject: drivers/md/dm.c:601: Warning: missing closing `"'
Message-ID: <202606172233.AWg2Pzin-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66affa37cfac0aec061cc4bcf4a065b0c52f7e19
commit: 18ec6c5d7ec6c73ccff616041d75b6ea30a9a36e s390/percpu: Use new percpu code section for arch_this_cpu_add()
date:   2 weeks ago
config: s390-randconfig-r072-20260617 (https://download.01.org/0day-ci/archive/20260617/202606172233.AWg2Pzin-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606172233.AWg2Pzin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 18ec6c5d7ec6 ("s390/percpu: Use new percpu code section for arch_this_cpu_add()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606172233.AWg2Pzin-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm.c: Assembler messages:
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
>> drivers/md/dm.c:601: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:606: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:976: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
   drivers/md/dm.c:981: Warning: missing closing `"'
--
   fs/nfsd/filecache.c: Assembler messages:
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
>> fs/nfsd/filecache.c:291: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:296: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:292: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:297: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:541: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:546: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
   fs/nfsd/filecache.c:229: Warning: missing closing `"'
--
   include/net/sock.h: Assembler messages:
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
--
   net/can/raw.c: Assembler messages:
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
>> net/can/raw.c:181: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   net/can/raw.c:186: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4457: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
   include/linux/netdevice.h:4462: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
>> include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1495: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/net/sock.h:1500: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4468: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
   include/linux/netdevice.h:4473: Warning: missing closing `"'
..


vim +601 drivers/md/dm.c

978e51ba38e00e Mike Snitzer      2017-12-09  570  
6f25dd1c57b8ba Mike Snitzer      2023-10-25  571  static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio, gfp_t gfp_mask)
^1da177e4c3f41 Linus Torvalds    2005-04-16  572  {
64f52b0e31489b Mike Snitzer      2017-12-11  573  	struct dm_io *io;
64f52b0e31489b Mike Snitzer      2017-12-11  574  	struct dm_target_io *tio;
64f52b0e31489b Mike Snitzer      2017-12-11  575  	struct bio *clone;
64f52b0e31489b Mike Snitzer      2017-12-11  576  
6f25dd1c57b8ba Mike Snitzer      2023-10-25  577  	clone = bio_alloc_clone(NULL, bio, gfp_mask, &md->mempools->io_bs);
6f25dd1c57b8ba Mike Snitzer      2023-10-25  578  	if (unlikely(!clone))
6f25dd1c57b8ba Mike Snitzer      2023-10-25  579  		return NULL;
6c23f0bd7f16d8 Christoph Hellwig 2022-02-02  580  	tio = clone_to_tio(clone);
655f3aad7aa485 Mike Snitzer      2022-03-19  581  	tio->flags = 0;
655f3aad7aa485 Mike Snitzer      2022-03-19  582  	dm_tio_set_flag(tio, DM_TIO_INSIDE_DM_IO);
64f52b0e31489b Mike Snitzer      2017-12-11  583  	tio->io = NULL;
64f52b0e31489b Mike Snitzer      2017-12-11  584  
64f52b0e31489b Mike Snitzer      2017-12-11  585  	io = container_of(tio, struct dm_io, tio);
64f52b0e31489b Mike Snitzer      2017-12-11  586  	io->magic = DM_IO_MAGIC;
84b98f4ce4d1d1 Mike Snitzer      2022-03-17  587  	io->status = BLK_STS_OK;
2b1c6d7a890aea Mikulas Patocka   2025-09-15  588  	io->requeue_flush_with_data = false;
0f14d60a023cc4 Ming Lei          2022-04-12  589  
0f14d60a023cc4 Ming Lei          2022-04-12  590  	/* one ref is for submission, the other is for completion */
0f14d60a023cc4 Ming Lei          2022-04-12  591  	atomic_set(&io->io_count, 2);
9f6dc633761006 Mike Snitzer      2022-02-17  592  	this_cpu_inc(*md->pending_io);
7dd76d1feec70a Ming Lei          2022-04-12  593  	io->orig_bio = bio;
978e51ba38e00e Mike Snitzer      2017-12-09  594  	io->md = md;
4d7bca13dd9a50 Mike Snitzer      2022-03-19  595  	spin_lock_init(&io->lock);
b879f915bc48a1 Mike Snitzer      2022-01-28  596  	io->start_time = jiffies;
82f6cdcc3676c6 Mike Snitzer      2022-03-18  597  	io->flags = 0;
526d10061bc29b Li Nan            2023-06-13  598  	if (blk_queue_io_stat(md->queue))
526d10061bc29b Li Nan            2023-06-13  599  		dm_io_set_flag(io, DM_IO_BLK_STAT);
64f52b0e31489b Mike Snitzer      2017-12-11  600  
c4f512d255e3c4 Mike Snitzer      2023-06-13 @601  	if (static_branch_unlikely(&stats_enabled) &&
c4f512d255e3c4 Mike Snitzer      2023-06-13  602  	    unlikely(dm_stats_used(&md->stats)))
0cdb90f0f30638 Mike Snitzer      2022-02-17  603  		dm_stats_record_start(&md->stats, &io->stats_aux);
64f52b0e31489b Mike Snitzer      2017-12-11  604  
64f52b0e31489b Mike Snitzer      2017-12-11  605  	return io;
^1da177e4c3f41 Linus Torvalds    2005-04-16  606  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  607  

:::::: The code at line 601 was first introduced by commit
:::::: c4f512d255e3c4ade80a1d68ca816c1b11556a13 dm: skip dm-stats work in alloc_io() unless needed

:::::: TO: Mike Snitzer <snitzer@kernel.org>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
