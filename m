Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB0538E5E9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 01:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978233; cv=none; b=Piy6tcoNsVjk0MC9SkDRX656IHLvlqdUoswSwY/jZ22B7xrHHJtkSSaiQJvJwUrjYDKt0b/URFmYK0brUo19pnLYA/fqf53pxEspaxJMr2uV5QIJ3/0kdfNCIpYcDUtwmar9C6XJKXcHtWXDst90gXvGKFTdErNTxfwTDgFT0Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978233; c=relaxed/simple;
	bh=5wLWO7GHSrJnlVRKvTEUvVuLMX8wkiCBVbAVt1ocNWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DvPqRG4KtgjSAGVYYiJjLKigZfey2Nk16doYGlMF5hYrsCiQHvSNOboNtBrO++Y77ZlU97kswZchvFBjyVlM2c2nBomX47LanoPzwiFPUvjGxQnv62rd/NZCXykQS7m7uFtA70M+nzHZDN+gcYUT93ZDXIMZCgubamc1GHydtGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJ0bpGlQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJ0bpGlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785978231; x=1817514231;
  h=date:from:to:cc:subject:message-id;
  bh=5wLWO7GHSrJnlVRKvTEUvVuLMX8wkiCBVbAVt1ocNWw=;
  b=jJ0bpGlQLXksST21ixINQdlSYL1uYx6BU+si9HloAhye8pAJ/Uws7J0V
   1no1MjHw19gQm3jhvG0GEJSQzLOXSBdM4KVM0/rKHRl5XldPfHaFxN1u5
   0o6gb3wkQyXalSRhxOAEe4Ayt7G6+r6R3+xDlzd4L1fcf6qcaegi6Ux6T
   eglvN0Lv93Yz8CsT+R/QMpnqdn/wOda0bX7e/BUJxbFUyWtb9FZtCAL+2
   8ENkxZ3Zz4OD6BDbLIfYqR4uWRctodUb8Gzz7y85Lj/RQ6r5T3FtTmkw9
   EN95qdVcQIMKMIN7bEcQ2V5m52fDNQAFm5KrHfYLK1Fy5z6SIhp96/ABp
   w==;
X-CSE-ConnectionGUID: ozlETuiXSwaJQ/peAW4dhA==
X-CSE-MsgGUID: CN+gxCYSQoy182IpUW2/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86592603"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="86592603"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 18:03:50 -0700
X-CSE-ConnectionGUID: T56btbbjSdSW3ZdICrwS/g==
X-CSE-MsgGUID: 57JmKJY1R/mWJVFUL2Djgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="257659697"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2026 18:03:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrmWQ-00000000Dqr-2Lx1;
	Thu, 06 Aug 2026 01:03:46 +0000
Date: Thu, 06 Aug 2026 09:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/15]
 sound/core/seq/seq_ump_convert.o: warning: objtool: cc_ev_to_ump_midi2+0x56d:
 return with modified stack frame
Message-ID: <202608060836.GL48htkU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Takashi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   b297e61913e2b43ce795d4b9e64d3ce526e67430
commit: a4ff92ff0bdd731eca9f0b50b1cbb5aba89be4b2 [0/15] ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
config: x86_64-randconfig-075-20260806 (https://download.01.org/0day-ci/archive/20260806/202608060836.GL48htkU-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060836.GL48htkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a4ff92ff0bdd ("ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060836.GL48htkU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/core/seq/seq_ump_convert.c:8:
   In file included from include/linux/string.h:374:
   include/linux/fortify-string.h:580:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     580 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   1 warning generated.
>> sound/core/seq/seq_ump_convert.o: warning: objtool: cc_ev_to_ump_midi2+0x56d: return with modified stack frame

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
