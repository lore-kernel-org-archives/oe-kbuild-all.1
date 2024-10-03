Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7121D017C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 23:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999281; cv=none; b=sUNiaSoMWf8SA3UNuqgEhPeWm3kvL3Ojfw+YF3s4LSg+PF2Q5PjsyI5ScN0yItcIP4Ai520RD3ItHxWpb/lHq4f9ZlpK84FEZiZPJ44Vv6wPNYKNvjJalzQGRBd4Z8sF47ukViDB9OBYU6wKNGu4YEWKIos6Cz3+591yzkD6laE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999281; c=relaxed/simple;
	bh=XU9/KB9WgKjILp2iA6/ydrsXXhYP+TN6HrXpZCtK6CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSvT8MH9rhC2zzkQZXnENWsKOMWH7s/szqbRWF199+p5wLwXSkd/LDG97n8NJJFNKDYMtT88r6Epjss39OTvk/djrplHwWY8W6YbbXjrWi4empXCOeOiMVtbSP+CJiMuYVClc5++zAWPeq/CYOdX5kVNXW31HTMtxjTwbe0IldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeVuQfbQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeVuQfbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727999279; x=1759535279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XU9/KB9WgKjILp2iA6/ydrsXXhYP+TN6HrXpZCtK6CE=;
  b=IeVuQfbQPt9IQGPr3AEyvsNo+TpguuJV4skRdn0atmAMjDO+BkVwEZar
   Qmh1HbvxAicRrARoFcX2qVdIgziwyxViDJXqM3Maz6nqQw4sZMOA3GR+2
   qlAVNokhhwMBp26umfJoo/XbD5TG4AGGkJO/hmguQdSJP4gjJHT/ytDPR
   dZZ0USuk+6MOqB6DyE1+Dra/EjXiF17gA0LjOgD2pmmS3IE3/OzPGpw5U
   V4bIdo3gkjgd0o0hFPyic2wtcCe+cDRdVG6KCropyMG44IcLAFfaETDaY
   Kcp4hPyv4/MdBP8GE7QapOE88j07c4I8nHeLL2Z7Rv9EKTDpGSQ8JGEns
   Q==;
X-CSE-ConnectionGUID: VxAuhm6xR8+1VZkEfl/DHQ==
X-CSE-MsgGUID: 5smfOEegQEmCYrtdsSms5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44683357"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="44683357"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 16:47:57 -0700
X-CSE-ConnectionGUID: RfncysIfTpSqc6RAUvtCyg==
X-CSE-MsgGUID: Ha+Q8KddRcyg8zJ5lN6F+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74832313"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 16:47:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swVY1-00011u-37;
	Thu, 03 Oct 2024 23:47:53 +0000
Date: Fri, 4 Oct 2024 07:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3471/16788]
 drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
Message-ID: <202410040735.tAcmigwO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 220f1fbcb09940ff094f36d170ca7af348c152c0 [3471/16788] phy: Add Mixel LVDS combo PHY support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410040735.tAcmigwO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040735.tAcmigwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040735.tAcmigwO-lkp@intel.com/

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
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
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
