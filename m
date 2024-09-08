Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7A158A13
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725796754; cv=none; b=urODMi69D5zKARLV1qz0KJ63UK9l4fcrbtlVWuGk7aMScM5oQ2D6aOIO48ly9mijPepbEtebNXsB0lk059eUfgLLjzEUzcdAKsJ+bCnR4EqMpT66aM8PTcqjqi0kDGjjrkxZDVJju84pAPqP8fmCHvLdwIeDssysvpsU38vNsHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725796754; c=relaxed/simple;
	bh=KJxuooZ2mH6iDB13HB/yiN26KYHUK4xeJXSPXlN7xkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cXgn6Q5anuS8vwExA8oGboRHbNVi0lVEwoTQVI9Hufvsw4i/Xy53CYjM7t6l+3Fdn7jhlEwAjWnJILb1nh9VJUKx50xQo33WEu03QR3zBkeGl9bwzUadauha5z4jwycYKL83z0pgtIb0gWnLf4npf+bZqjnP7JMFVTeslCh2q9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBrAjZ4S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBrAjZ4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725796751; x=1757332751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJxuooZ2mH6iDB13HB/yiN26KYHUK4xeJXSPXlN7xkc=;
  b=aBrAjZ4SDvtk5bMvPTQML2Olcoa1vJ+5TmOmiB4wehwbUD5xhwXOm57U
   c3mfK1GEYBmudMHXSxX/kJz8vzGuxy9aShuAa4MXfNpE2vrs1APnCohPZ
   WCMftBe7nxs+9dhi6yRlqvbh7kgtq57wT7aqsTUNoeyYSm9sajWsvnF2X
   CGnY3qLakbywSCOCg+4CO2K4jdSGNo25U3CBZFJsEr8DiIkNxlsiv317K
   vq6zHBuvk97S6zueSFi7HJDJ7cQ/QSskuILkNyzZDylq9fn2mBFbHByra
   wwwltopjWYqIHyVUgx+CvDw4k3bVz+cDoVA7UPyOivHPL8CVafgflWiwi
   Q==;
X-CSE-ConnectionGUID: /obm4IM3QraUJOqBDpbksg==
X-CSE-MsgGUID: h4GERLm6Qv+M/AaL05RMTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35090711"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35090711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 04:59:10 -0700
X-CSE-ConnectionGUID: g55y0l+ORfCdyfwUHGYhtg==
X-CSE-MsgGUID: EtsJdoE1QgOAAg71bVIceQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="97191672"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2024 04:59:09 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snGZP-000DUx-0m;
	Sun, 08 Sep 2024 11:59:07 +0000
Date: Sun, 8 Sep 2024 19:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [oracle-dtrace:v2/6.6 7/11] /bin/bash: line 1: 3160336 Aborted
                 s390-linux-ld -m elf64_s390 --compress-debug-sections=zlib
 -z noexecstack --no-warn-rwx-segments -r -o vmlinux.o -T .tmp_remove-ctf.lds
 --whole-archive vmlinux.a --no-whole-archive --start-group --end-gro...
Message-ID: <202409081931.U2A3cfXk-lkp@intel.com>
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
config: s390-randconfig-002-20240908 (https://download.01.org/0day-ci/archive/20240908/202409081931.U2A3cfXk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081931.U2A3cfXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081931.U2A3cfXk-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: relocatable linking with relocations from format elf64-s390 (arch/s390/kernel/head64.o) to format elf32-s390 (vmlinux.o) is not supported
   double free or corruption (out)
>> /bin/bash: line 1: 3160336 Aborted                 s390-linux-ld -m elf64_s390 --compress-debug-sections=zlib -z noexecstack --no-warn-rwx-segments -r -o vmlinux.o -T .tmp_remove-ctf.lds --whole-archive vmlinux.a --no-whole-archive --start-group --end-group

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
