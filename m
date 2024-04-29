Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649F1762DA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399605; cv=none; b=smEz2Bx9Fi2qUwh5o5VV5Zw9fBR9bxJh8SJIf+dreGI9Eke+45f+5PICcS5HNoexODSE5fQ+99rnp7H3g/+q6vyjidBkXXrkY4Zn0Q2cbBEE7/WEeXifIvQn79Ph9xkSzYzfke2ybu6st7r4ciuRmgHpxnijgSrPw2JIiOEhoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399605; c=relaxed/simple;
	bh=5X8EzvcYWSilIpNF7h02l5HzidjzT5Hx5rumVT2QzzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFjmRx8QgF2xkThcJy/1ALqLwR19Usj7LyqN41tWrNtg3rW7snWMQtQ5dFUmRWORSnIt7rWvCTyRzKBSrUTcl3c8mj/Kq7v/yP9ESN1kxwVgRWseSalcpAYosjiN4YYOq7eXTIijo4OLAC6iwKcjo6vlYHM1B30b5QcsaPQAn3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLuCbrfm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLuCbrfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714399603; x=1745935603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5X8EzvcYWSilIpNF7h02l5HzidjzT5Hx5rumVT2QzzQ=;
  b=OLuCbrfml0iDLLMFqH1Kmbu1fp/TM2QW/uuoM3YGWBfU3r5R1gRFVDbG
   gklS6wfhQ1OCOwfJzNxJ44S+ngUsuy6ff6j0cuRnEX4rTrAUF47mCn1jC
   zvwPRiXs31GM62OxEj/n9muhvw4xvyFCBql1BZPBj+48o7PXffbAtDJvn
   g1G8w4itAiCYZhMxFZ9o4SD34H/sHzREcHYuGxf0KLyvaQHIDSnVhKOxX
   ckYBwT0t7Ecle8Ffl2YTwWniQ703Z9Eaz8LbcdTaUBvMFKISf08uyCKZW
   i5fWdT71K3zuDYHqgK6QH2O88fvp4Ptj8SxusUmecsCdDzcccDrZPhAev
   w==;
X-CSE-ConnectionGUID: +Ocp1aTGT1eVYXivdm4uCw==
X-CSE-MsgGUID: Yoa9th04QqOWdOUnElZiwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21475995"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="21475995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP; 29 Apr 2024 07:06:42 -0700
X-CSE-ConnectionGUID: gjGEOVCKTN2vo1qM6v+4hQ==
X-CSE-MsgGUID: IdIbETMYSiOQJrCCYK/hDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26107386"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2024 07:06:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1ReR-0007DW-1k;
	Mon, 29 Apr 2024 14:06:39 +0000
Date: Mon, 29 Apr 2024 22:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3984/29983]
 drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
Message-ID: <202404292235.Km6iMNiZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: 27e9b835ef416f1f11f2944be449bda6577585a7 [3984/29983] phy: Add Mixel LVDS combo PHY support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404292235.Km6iMNiZ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292235.Km6iMNiZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292235.Km6iMNiZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
      34 | #define SS              0x20
         | 
   In file included from arch/x86/include/uapi/asm/ptrace.h:6,
                    from arch/x86/include/asm/ptrace.h:7,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/smp.h:110,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/phy/phy-mixel-lvds-combo.c:15:
   arch/x86/include/uapi/asm/ptrace-abi.h:23: note: this is the location of the previous definition
      23 | #define SS   16
         | 


vim +/SS +34 drivers/phy/phy-mixel-lvds-combo.c

    33	
  > 34	#define SS		0x20
    35	#define CH_HSYNC_M(id)	BIT(0 + ((id) * 2))
    36	#define CH_VSYNC_M(id)	BIT(1 + ((id) * 2))
    37	#define CH_PHSYNC(id)	BIT(0 + ((id) * 2))
    38	#define CH_PVSYNC(id)	BIT(1 + ((id) * 2))
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
