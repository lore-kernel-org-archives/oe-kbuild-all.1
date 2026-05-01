Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0143803F0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627135; cv=none; b=Q10Kqg0WQVgVHklKEjq12aGjK+BjBuMoP/Jm16voD7TCmyH09LJc05oRMgyAykflOUdznV9WHKu4I1Mp1Wm9VH1vP7lMcLom63Jq6t92QRQN+J6ZTiXnaZnrHa1aoHDzDuP8AwwIye4olZholZYsug4kngv4uEaNrzMkYiV32PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627135; c=relaxed/simple;
	bh=zIvqD1yV8ep9p6qUMY+JDiZAmrBs8N2mPHwIJQ2R4CI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovul+h277r2FmvAFYh2X+777RG6p7w3FhOV/eFkizOei4yJuGOIxkVZHksnOJ0A8KawnpFI25vuTjYiQKJXfB6xxs3zaZzrYax26GQaf/O+tQmkv5CS/t7X+B8c1kGDQ0gCIKc+PGIgdCSFApkyUGJCtqhN2cOmXJnLhL/0yuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImPmyfGK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImPmyfGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777627133; x=1809163133;
  h=date:from:to:cc:subject:message-id;
  bh=zIvqD1yV8ep9p6qUMY+JDiZAmrBs8N2mPHwIJQ2R4CI=;
  b=ImPmyfGKnk65yvszZ0E9ygLSQl8jNcSDG7Aw5WrwbWoIN9hKD38kUXUH
   FL+ChjAPcwbC+SVQ0SEm/CP69wmHxtvIT9PmAnMqZKIGL6CUu5pvVKYS7
   vZK8G3ZHCzJjgPgMmYi3r7k0lQbbZanJ/RuLzoAcmccUNUz3A/d4K/IEd
   I4CW/y/xlad952KviQVuCX1nYv8T2JDukFqJtUQxjxoUuMUfMlnmTmzix
   UGk7nD28mSaehW4XXw7w3pfkz3+3NFwc5kOKNuJXr7ZFCxkSWXQ+ZNxTr
   aBnJMAAB0qxgRv3UYDPM4Fx7kUMXMECRa+B8yaaroj0RFWJwFePP5qI0r
   w==;
X-CSE-ConnectionGUID: cIbe52VaRJmAHT3Nbm3RpA==
X-CSE-MsgGUID: ho+TomhnRx6G6w5kLR4loQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66121507"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="66121507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 02:18:52 -0700
X-CSE-ConnectionGUID: f26Tbh6VSRWt5w3qxmrJ4A==
X-CSE-MsgGUID: M119VBhXT8eLHiVBstfflA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="238800536"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2026 02:18:51 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIk1I-000000000Ot-1QOb;
	Fri, 01 May 2026 09:18:48 +0000
Date: Fri, 01 May 2026 17:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v7.0.0-net-next-driver-removal-v1 14/18]
 scripts/Makefile.clean:12: drivers/net/ethernet/xircom/Makefile: No such file
 or directory
Message-ID: <202605011727.EABt2Onn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://github.com/lunn/linux.git v7.0.0-net-next-driver-removal-v1
head:   75e17109856eb8e407a19759d3ad750fe3854b63
commit: ec673537eb22468be20a6ef3b1a30f7f45ca1e35 [14/18] drivers: net: xircom: xirc2ps: Remove this driver
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260501/202605011727.EABt2Onn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011727.EABt2Onn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011727.EABt2Onn-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/Makefile.clean:12: drivers/net/ethernet/fujitsu/Makefile: No such file or directory
   make[7]: *** No rule to make target 'drivers/net/ethernet/fujitsu/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/ethernet/fujitsu/Makefile'.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/ethernet/fujitsu] Error 2
>> scripts/Makefile.clean:12: drivers/net/ethernet/xircom/Makefile: No such file or directory
>> make[7]: *** No rule to make target 'drivers/net/ethernet/xircom/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'drivers/net/ethernet/xircom/Makefile'.
   make[6]: *** [scripts/Makefile.clean:61: drivers/net/ethernet/xircom] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [scripts/Makefile.clean:61: drivers/net/ethernet] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [Makefile:2144: _clean_.] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +12 scripts/Makefile.clean

^1da177e4c3f41 Linus Torvalds  2005-04-16   7  
4f1933620f5714 Paul Smith      2006-03-05   8  PHONY := __clean
^1da177e4c3f41 Linus Torvalds  2005-04-16   9  __clean:
^1da177e4c3f41 Linus Torvalds  2005-04-16  10  
3204a7fb98a3bc Masahiro Yamada 2021-02-28  11  include $(srctree)/scripts/Kbuild.include
a2430b25c31840 Masahiro Yamada 2022-11-19 @12  include $(kbuild-file)
^1da177e4c3f41 Linus Torvalds  2005-04-16  13  

:::::: The code at line 12 was first introduced by commit
:::::: a2430b25c31840a6dcbf95c65415d5fee2984dbc kbuild: add kbuild-file macro

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
