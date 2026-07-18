Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5698B4CB5B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784335029; cv=none; b=NQN56YDmf2cTyjDC40unrsw8GViRn7aHBGrxxQMLY/ebovi73CdoWOjkgmU5QArZVtDRz87M1MtTgRQY2wVwA1N81EFJBrj7rHkpmSLvSpmmcX4neyJxjwC/nfpZANgazrxYGe8UUknvt81/Re3rapmLlk+n/zPQo1js0yNWW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784335029; c=relaxed/simple;
	bh=sADHP/GhTgBBPwC+c+beCGEpjOyqkvZHfwjAOn0rhbw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CJ/TjLelFoGCn2vCL8lDTYNJ6OdmpYbwt+Jt/TKZbEZOEUvRtwdBT9ZBydwg+keZBFz4MNb9pRh0bD0dl4L+Q9TGrIwx4POv/ufYeI0MpL+jtAPiTBTa6EbU+aT9KVuHFad4kTm1vWIzTxZlsiK7m0uuwUMUUjqF1GW9rIikKec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMKJVggO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMKJVggO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784335026; x=1815871026;
  h=date:from:to:cc:subject:message-id;
  bh=sADHP/GhTgBBPwC+c+beCGEpjOyqkvZHfwjAOn0rhbw=;
  b=nMKJVggO2psTZiY+ksaBpYrtPhBLdiOoHCx6mWVuyqgYYax7O5v7r/XV
   t9e82dmHdxGv3h/0VM1EI6bKcPYc6U01fAf8Y6OJr79V2uMP5AUFg4Pi1
   MYN7wlYQAuLaseQKe360Zo/9ftfw3isQBqPUTinWe7lv3puJVksf3pob+
   8lNxjBpmcKhI91tAc34Kbpbp/pqU8Ms4OdNQtDT/5pLuEo4LOszPq5zb4
   5RXX1M5uNahrhjJPdqPrlTjPCnen2PIxrSbpeUvzZD3j0a7SzH00gBNzJ
   SbJJaO3N49AhfoeHIFu7zJCLzZho28mrS2ZRLdcvYaB4klKXXfWmm1+ez
   A==;
X-CSE-ConnectionGUID: Wu3BFCpJQXeanm2QRKyapg==
X-CSE-MsgGUID: Vxf6uKCHQBe6A7ngEEFvpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="110559527"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="110559527"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 17:37:05 -0700
X-CSE-ConnectionGUID: sCozS3X3Qj6SlKOBROBp7Q==
X-CSE-MsgGUID: bIBJudtYQcGtS8UzA4e+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="253507276"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jul 2026 17:37:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkt38-00000000TJe-13ZJ;
	Sat, 18 Jul 2026 00:37:02 +0000
Date: Sat, 18 Jul 2026 08:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [samba-ksmbd:ksmbd-for-next-next 89/102] Warning:
 fs/smb/server/oplock.c:1465 function parameter 'replay' not described in
 'smb_grant_oplock'
Message-ID: <202607180833.quJej9HH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   b0532660f76e08c75143d9d030a9e8c4f2e2bb1e
commit: 7e793b824cc8ea07b7b269ffa69ffa564daf9651 [89/102] ksmbd: add SMB3 request replay support
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607180833.quJej9HH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180833.quJej9HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180833.quJej9HH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/oplock.c:1465 function parameter 'replay' not described in 'smb_grant_oplock'
>> Warning: fs/smb/server/oplock.c:1465 function parameter 'replay' not described in 'smb_grant_oplock'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
