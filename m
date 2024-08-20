Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E59166F3D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187056; cv=none; b=b306Oy8C6Y2cVCrgG36jIxkqUHEjKkKvIdhNZPa3iDcW0UOkrSHlrdYrMBLg2+xsN8Yytof1JDCNCaCgJyctsXiyZ8W31RMq88f3Y9biz9bUEDyt++eN5bHYottt1Td0aCIJ8PcHNu+zJx8rmKsrENQ9UyhLncBGcoOwZCAz1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187056; c=relaxed/simple;
	bh=zwq8CQuLYUtZaWmNJNGM4GT8Zhg+MJesPnv+vNUT2yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWYmEn4k5swKNO+UWaI+WIPxm97bZjOpw9ouOllmjtCYgXWvscO2nRnuVbYSgw1/aFOT8TUXN8CzskQUun8+NfHrPQcFmuF56RZPdL5Xiqbh81lQ3bVLQtCmFDhSDwiDzlW9AB6efIb16TNcTjiNyMyPwBr7/8CZFVWIS32FwhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baMd/PeX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baMd/PeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724187055; x=1755723055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwq8CQuLYUtZaWmNJNGM4GT8Zhg+MJesPnv+vNUT2yw=;
  b=baMd/PeXh4YWTnMBn+lfwac5G2wKAqPJe/f0W22ARQqpWrQrr8uPs6K4
   NVhYVzb981mh5wYaJh3LILKxjL6ev0qy5NTWpGBKko+nb14UHFS6PuVZz
   7htwo/DUeFWI+xbKXaqelr9ZnZahaVk9qROgT4BMCqdzFDJeB5pYVPN0q
   WqiXqVIX6bZhpfbDEA20pm7CB96+NksucnUkdcD020dKkBDf+QehzVIno
   TWlz8AYBDPkvTu7YfN3IqkFEETOu93Yo6qzzbXkEiWnKqdxBFLqh5KoUV
   srs2F7URCh/zP1WAwn8r4p19k+2+MxFkWB1ll7xLjaBkiskdYCfbRBH++
   A==;
X-CSE-ConnectionGUID: GOxuusTzQT2qlS7fsdpX5Q==
X-CSE-MsgGUID: dYg8rt3uRUqbTX3swSmO3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26384675"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="26384675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 13:50:55 -0700
X-CSE-ConnectionGUID: mzgJoD+6QZ6X8B55Oge1pQ==
X-CSE-MsgGUID: 8CpjVA2cSwSfXOpp3ceN/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60824690"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2024 13:50:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgVoZ-000Abm-17;
	Tue, 20 Aug 2024 20:50:51 +0000
Date: Wed, 21 Aug 2024 04:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13309/13457] ld.lld: error: duplicate symbol:
 psp_register_cmd_notifier
Message-ID: <202408210406.xQBoe5bW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a768b922343d9cab29e2e0aaef1d4bdee47cfbb5
commit: d0b3a770d8e20d953fe2a74ea8c4b5f4767c4add [13309/13457] crypto: command co-processor: Add another mailbox interrupt support for PSP sending command to X86
config: x86_64-buildonly-randconfig-002-20240821 (https://download.01.org/0day-ci/archive/20240821/202408210406.xQBoe5bW-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408210406.xQBoe5bW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408210406.xQBoe5bW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: psp_register_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_register_cmd_notifier) in archive vmlinux.a
   >>> defined at csv-dev.c
   >>>            drivers/crypto/ccp/hygon/csv-dev.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psp_unregister_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_unregister_cmd_notifier) in archive vmlinux.a
   >>> defined at csv-dev.c
   >>>            drivers/crypto/ccp/hygon/csv-dev.o:(.text+0x20) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psp_register_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_register_cmd_notifier) in archive vmlinux.a
   >>> defined at ring-buffer.c
   >>>            drivers/crypto/ccp/hygon/ring-buffer.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psp_register_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_register_cmd_notifier) in archive vmlinux.a
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/hygon/psp-dev.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psp_unregister_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_unregister_cmd_notifier) in archive vmlinux.a
   >>> defined at ring-buffer.c
   >>>            drivers/crypto/ccp/hygon/ring-buffer.o:(.text+0x20) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psp_unregister_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_unregister_cmd_notifier) in archive vmlinux.a
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/hygon/psp-dev.o:(.text+0x20) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psp_register_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_register_cmd_notifier) in archive vmlinux.a
   >>> defined at sev-dev.c
   >>>            drivers/crypto/ccp/sev-dev.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: psp_unregister_cmd_notifier
   >>> defined at psp-dev.c
   >>>            drivers/crypto/ccp/psp-dev.o:(psp_unregister_cmd_notifier) in archive vmlinux.a
   >>> defined at sev-dev.c
   >>>            drivers/crypto/ccp/sev-dev.o:(.text+0x20) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
