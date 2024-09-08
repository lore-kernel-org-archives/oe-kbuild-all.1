Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAD320322
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725783819; cv=none; b=r2ExWGNgse2d1mE2aA3DBfNYZQYMM2qI+N93GAj6X0vqW/6R1EN0GhA6ZrwPjyV9X5qipjJSkAN0x2WIBUnqu4NP/hPWxww70kYwOhjpLMpn/ff9geEFSK/Pkc8iayh5s8jdlcAuvux4z7l70d10vwOnhV0srtM1rcfpXbKg71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725783819; c=relaxed/simple;
	bh=cITh7sH4OS+4EIH8ylsMN6J6tEy1nne/1EzoZRCbVdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D0CHF5y0cqR8hb128uEZ+iJZOQN/ea0LKl7ucJosYeMO3SiDcdl+BRggFkGKSKMWgGv6aoRiUKAw8nR2iDKJxsbXcopzZTHzdTjq09c2tl00RZKN1VQ6QQzWgeU+VWJ2+GL0EjsK158uv5+OCcrjrftilFIsPYu9/YiYuxchemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5SUtuOS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5SUtuOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725783818; x=1757319818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cITh7sH4OS+4EIH8ylsMN6J6tEy1nne/1EzoZRCbVdI=;
  b=H5SUtuOSMOWteSB0WS/T3MAevkVtMQERh+SQj+amoLnr5N464sE/6iec
   yyahn9YqauDwOc0JDOqo3EyEe8SiitZYe+7wOvCuhkqN4lp04lvyBLgz/
   C9eSHrTN2Doy3+tzSajCXLyC1qrI4dUZnKMZlSNRa6HSYBAs8BMEHh9KG
   v5ijw4UHB59ACvu2pVtiGkJsgfR6fmH9fRAClNLh0XLOADl6nKePwofm9
   Syyf9RUVhYWqOCOevpSB1NCusI6tO3A0gGttmN3By5VubFVsNO7D+frQO
   85wou3AfxwXNGahEE8yNb056Tpilrm57b0Rrv/soPCZm8kgZRLGAvsfmK
   Q==;
X-CSE-ConnectionGUID: Y9tr/jGuSiyQ44nRVJZOiQ==
X-CSE-MsgGUID: qtUfu9JyTdmqz0WJ46tQzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="47014265"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="47014265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 01:23:37 -0700
X-CSE-ConnectionGUID: axM4DKGYRyexC+raB+wPKQ==
X-CSE-MsgGUID: LhklpmWpSgaL4XkVxqKHKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="103822394"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2024 01:23:35 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snDCn-000DKb-02;
	Sun, 08 Sep 2024 08:23:33 +0000
Date: Sun, 8 Sep 2024 16:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [oracle-dtrace:v2/6.6 7/11] /bin/bash: line 1: 3234294 Aborted
                 s390-linux-ld -m elf64_s390 -z noexecstack
 --no-warn-rwx-segments -r -o vmlinux.o -T .tmp_remove-ctf.lds
 --whole-archive vmlinux.a --no-whole-archive --start-group lib/lib.a
 arch/s390/lib/lib.a --end-group
Message-ID: <202409081512.MjxEBBBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.6
head:   e9f619670a014215533eda6ae2003e81898b0950
commit: 31f9ac854b10569bf09153d7757efb17468df8bb [7/11] ctf: generate CTF information for the kernel
config: s390-randconfig-001-20240908 (https://download.01.org/0day-ci/archive/20240908/202409081512.MjxEBBBm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081512.MjxEBBBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081512.MjxEBBBm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: relocatable linking with relocations from format elf64-s390 (arch/s390/kernel/head64.o) to format elf32-s390 (vmlinux.o) is not supported
   double free or corruption (out)
>> /bin/bash: line 1: 3234294 Aborted                 s390-linux-ld -m elf64_s390 -z noexecstack --no-warn-rwx-segments -r -o vmlinux.o -T .tmp_remove-ctf.lds --whole-archive vmlinux.a --no-whole-archive --start-group lib/lib.a arch/s390/lib/lib.a --end-group

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
