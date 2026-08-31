Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCDC3E5A2C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 08:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164787; cv=none; b=kXMYehDRkUx4+Gl85C1+DT+ijEB/ve3esi/Fy6gr+5P1ca/yh9o7eNrVJm5XxeGl6bcF9RbCyoxBsotK24EGIWQAZy+dPpPCXw3kqTqG5SZEDBNUtsEqL0k9dAqgQtvh+0Z5qWfE8QAzx+R4g4OMVqxWoSF1I2gfQU6F+RKC11o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164787; c=relaxed/simple;
	bh=0nFR0IxnfRW1OFta78r40wXKaZnNzueer9b6dTa7sG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EsrVkX80nEmpqXby68cIQHbwtzVOuI9i52EdMAdZwOVcUOTm9qaOA2egv/f5Jj3tR/hB5B9NYyQjuaAT4d+cndI0uuKMegmpfKe4pSCdMFHZvWD1Q2iLv4luzzNrFQHpUCUJoc6OQsRA2JzamDG0p/z3vExmLbT2+rOCMNiex/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIJw3iV2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIJw3iV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788164786; x=1819700786;
  h=date:from:to:cc:subject:message-id;
  bh=0nFR0IxnfRW1OFta78r40wXKaZnNzueer9b6dTa7sG0=;
  b=MIJw3iV2+MZVIMC00FzX/Ce95yMLuicZoEIG5hXs40X3K4nIGFC3Akbl
   uVLMBJANu+/s7fBCD85lVojlFurQxlYaHGJycn9+XNZQF5cpUJhJdm5NM
   nvd71IGkl/3mgRT1Q2rrPblE8pH51WCy2Zkk9do1GxDyXBt/XGzJbDn7s
   CBsyl0thDg1hpuIFCxAMZMlP3eE2hPbR+m5YBASKz8Mjz6scTuwrHE0XT
   O76wSynNdu/eUg+VCG5jC30BUqlh4Tued3zrk0FYa/x1eIshjTgy6/l/l
   S+WdXe0wDeUCtXnEENaE8bk5hvc4TE7OsCtNf5otlcDb2WTutjgNR+zzw
   Q==;
X-CSE-ConnectionGUID: 7cYe0CBGR+yM5H8ZwHn4xQ==
X-CSE-MsgGUID: LkHXDT42RjS2ug7TSgLc+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99227262"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99227262"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:26:20 -0700
X-CSE-ConnectionGUID: mZlSBCV7QmqyxuT1GEm32A==
X-CSE-MsgGUID: Pasp0UjHQACuaBwfIUGcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268177985"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Aug 2026 01:26:20 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0xLN-000000000A7-0Fl2;
	Mon, 31 Aug 2026 08:26:17 +0000
Date: Mon, 31 Aug 2026 16:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 213/213]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202608311316.Jjc3vIBC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   8f1ae3a99f8f4bbde9c6a17df87b4585fc4eb674
commit: b4f36e791b05f368a838ea83b520a8d881bc6b63 [213/213] firmware: add r3mini phy firmware
config: x86_64-randconfig-r073-20260831 (https://download.01.org/0day-ci/archive/20260831/202608311316.Jjc3vIBC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311316.Jjc3vIBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608311316.Jjc3vIBC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
