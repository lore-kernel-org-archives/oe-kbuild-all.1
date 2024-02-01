Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD0443144
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706770914; cv=none; b=PMw4eg9b4kiC29xFONcUM6mWwNCUXzkq7G4acfdRieL3PtdaV4G7dyf4rJqNjMq092dxJubiJ8fzFFVwmrJ5BoVZEJCyxamD8Pv4EftpsPAighF2GNsP/PlwsOFVZ7yxZvUpl/gVc6NIhBqJl06191h4O1zmm/gwwRnLyf3PstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706770914; c=relaxed/simple;
	bh=ETUm2MpBvXARxOBpFgb1350lSMKIrNL6LIQtbQGZLg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVFuZp3tip7fRkp/IthgpeVJWT2LdSzZJdPrJjRpvRD9dek+ueR/P2YzttuB9bCOiuX/Kmhe3gYVydLPMXzjy97gxdLFhIjIs9nrdoqCnFZWAtp+KVmt1ld8rheortjXhxXJwj5XU8sCl+DrKhYtb4ovLdSGzSNP+k3z2oui5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isnJbFNU; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isnJbFNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706770913; x=1738306913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETUm2MpBvXARxOBpFgb1350lSMKIrNL6LIQtbQGZLg0=;
  b=isnJbFNUK0/ihKQ4DHnyNPFi7tzZdfBBgnMnbSwg4mg+3kEv81U6N4yx
   c6o3PMXCQzw1ljr6KRUIIXFw0ffS/5ElZz/8VKsrZjEHYLkBqANu97dyd
   a5RUZ7z8HQsspbChrtLPTKYy61vdzw9MWdPoQRj0E1dqMNMeLHQQsMham
   PX92KAgEkdrRpk4IdeQIY4Hpt66VJhd19cTRLq1aZtih2kWWDAlqAZW0t
   ACuivfYFhdpyC8ifyYQpcpxkhd9cfvXsn+kkhYII6HQfm+2/LJc0d2jE8
   od4M2tgt2+d72wDzGew/l65+L/Nx2yKMNFwm6AkQyMTH7l8WhgXjNSZs4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402671331"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="402671331"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 23:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738347405"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="738347405"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2024 23:01:50 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVR50-0002UM-1a;
	Thu, 01 Feb 2024 07:01:46 +0000
Date: Thu, 1 Feb 2024 15:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2336/3381] iptable_nat.c:undefined reference to
 `ipt_unregister_table_exit'
Message-ID: <202402011430.vDOuYPku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   51b70ff55ed88edd19b080a524063446bcc34b62
commit: a9525c7f6219cee9284c0031c5930e8d41384677 [2336/3381] netfilter: xtables: allow xtables-nft only builds
config: loongarch-randconfig-r004-20230730 (https://download.01.org/0day-ci/archive/20240201/202402011430.vDOuYPku-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011430.vDOuYPku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011430.vDOuYPku-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: net/ipv4/netfilter/iptable_nat.o: in function `iptable_nat_net_exit':
>> iptable_nat.c:(.text+0x8): undefined reference to `ipt_unregister_table_exit'
   loongarch64-linux-ld: net/ipv4/netfilter/iptable_nat.o: in function `iptable_nat_table_init':
>> iptable_nat.c:(.text+0x228): undefined reference to `ipt_alloc_initial_table'
   loongarch64-linux-ld: net/ipv4/netfilter/iptable_nat.o: in function `.L25':
>> iptable_nat.c:(.text+0x294): undefined reference to `ipt_register_table'
   loongarch64-linux-ld: net/ipv4/netfilter/iptable_nat.o: in function `.L27':
   iptable_nat.c:(.text+0x2ec): undefined reference to `ipt_unregister_table_exit'
   loongarch64-linux-ld: net/ipv4/netfilter/iptable_nat.o: in function `.LANCHOR1':
>> iptable_nat.c:(.rodata+0x58): undefined reference to `ipt_do_table'
>> loongarch64-linux-ld: iptable_nat.c:(.rodata+0x80): undefined reference to `ipt_do_table'
   loongarch64-linux-ld: iptable_nat.c:(.rodata+0xa8): undefined reference to `ipt_do_table'
   loongarch64-linux-ld: iptable_nat.c:(.rodata+0xd0): undefined reference to `ipt_do_table'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
