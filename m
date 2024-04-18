Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5740C165FD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 21:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474020; cv=none; b=Ahr7rJEv7jPajBiYQ/UtqNeqGyZkrCorijl4oBtHv6echVLl+j0lSnymIzM8mgLmu9SD+PLqJJ/rsr4ww6QuRjZ80Y1/O7vgy6GIuClgPCBevqUTv5aFwK86c387ueZ3/TRRLLPu4JX9C3K2riUVLO2c0P+jTbfWFX9J3pOYE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474020; c=relaxed/simple;
	bh=ZgUWrrCfA/j3QOV4Z69kgHRLJzcC0EDg5XhqjKXakS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9t/f3dKy6kdiAxOfWrPLztvvMcrLqYdkWHVRse5gW/DnrS/uF6C+zbVRYU2I4Yh3n3LpAJZTKf820RWrlT8FZRPVPLBpXZ1jPzuvMPD6E3nuFBryVXitCswoKfYupxRE+occuPni2pEAHQoH4RTg7C8Aw2mK8WD/QHqHA7TDcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWSlDIlG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWSlDIlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713474018; x=1745010018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZgUWrrCfA/j3QOV4Z69kgHRLJzcC0EDg5XhqjKXakS8=;
  b=ZWSlDIlG3wsAq5/M94qwKnuxH6P+GqecWlMWjBGUu9t8cNGhh1rTK3pM
   k3XGtvh6dXSOHjehZf3hg3e0pWBXxCcDn06Lf59QF2ZeN1mIlnJnaeXrL
   v+QFyhGIjmlIaI9esW0ID8Hb9LAKB8DzTDKKlFfs/SoyIf5zvqJAFmzFo
   ytLeMvnN2ihFQFhSXVAjGPgKM2swQ5F4sjZMWY5lJZfF6n2qDaJ9XY0YU
   +PTjtqigkqtlvG4LItvloVYpOXnINi0l6SEUNoAPTISVi8vvzGsSHjXM/
   8wIBkB9Ueb5scZUO/7LNab848HO8zuA5K5tyX+zgMY5esZMPIA11quqnG
   g==;
X-CSE-ConnectionGUID: +kAUG5VwTGu96T7R339FHQ==
X-CSE-MsgGUID: r2C03/TkS7ybXOU3WKYLqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20476078"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20476078"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:00:17 -0700
X-CSE-ConnectionGUID: hgqBAXbYT0SW+KUmfy1vIg==
X-CSE-MsgGUID: kkw/yl5XRY6EfLwB0l6/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23175676"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Apr 2024 14:00:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxYre-0009EC-0L;
	Thu, 18 Apr 2024 21:00:14 +0000
Date: Fri, 19 Apr 2024 05:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4851/18115] clang: warning: argument
 unused during compilation: '-mtune=cortex-a9'
Message-ID: <202404190427.284VT3jt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/18115] Merge branch 'mxc/next' into next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404190427.284VT3jt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190427.284VT3jt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190427.284VT3jt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-mtune=cortex-a9' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-mfpu=neon' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-mfloat-abi=softfp' [-Wunused-command-line-argument]
   sound/soc/fsl/hdmi_pcm.S:46:2: error: unrecognized instruction
    mov r12, #1
    ^
   sound/soc/fsl/hdmi_pcm.S:47:2: error: unrecognized instruction
    vdup.8 d6, r12
    ^
   sound/soc/fsl/hdmi_pcm.S:57:2: error: unrecognized instruction
    vcnt.8 q1, q0
    ^
   sound/soc/fsl/hdmi_pcm.S:58:2: error: unrecognized instruction
    vpadd.i8 d2, d2, d3
    ^
   sound/soc/fsl/hdmi_pcm.S:59:2: error: unrecognized instruction
    vand d2, d2, d6
    ^
   sound/soc/fsl/hdmi_pcm.S:60:2: error: unrecognized instruction
    vshl.u8 d2, d2, #3
    ^
   sound/soc/fsl/hdmi_pcm.S:64:2: error: unrecognized instruction
    veor d4, d5, d2
    ^
   sound/soc/fsl/hdmi_pcm.S:67:2: error: unrecognized instruction
    vmovl.u8 q2, d4
    ^
   sound/soc/fsl/hdmi_pcm.S:68:2: error: unrecognized instruction
    vzip.16 q0, q2
    ^
   sound/soc/fsl/hdmi_pcm.S:69:2: error: unrecognized instruction
    vshl.u32 q0, q0, #8
    ^
   sound/soc/fsl/hdmi_pcm.S:70:2: error: unrecognized instruction
    vshl.u32 q1, q2, #8
    ^
   sound/soc/fsl/hdmi_pcm.S:74:2: error: unrecognized instruction
    subs r2, r2, #8
    ^
   sound/soc/fsl/hdmi_pcm.S:75:2: error: unrecognized instruction
    bne hdmi_dma_copy_16_neon_lut_start
    ^
   sound/soc/fsl/hdmi_pcm.S:77:2: error: unrecognized instruction
    mov pc, lr
    ^
   sound/soc/fsl/hdmi_pcm.S:80:2: error: unrecognized instruction
    mov r12, #1
    ^
   sound/soc/fsl/hdmi_pcm.S:81:2: error: unrecognized instruction
    vdup.8 d6, r12
    ^
   sound/soc/fsl/hdmi_pcm.S:90:2: error: unrecognized instruction
    vcnt.8 q1, q0
    ^
   sound/soc/fsl/hdmi_pcm.S:91:2: error: unrecognized instruction
    vpadd.i8 d2, d2, d3
    ^
   sound/soc/fsl/hdmi_pcm.S:92:2: error: unrecognized instruction
    vand d2, d2, d6
    ^
   sound/soc/fsl/hdmi_pcm.S:94:2: error: unrecognized instruction
    vshl.u8 d4, d2, #3
    ^
   sound/soc/fsl/hdmi_pcm.S:99:2: error: unrecognized instruction
    vmovl.u8 q2, d4
    ^
   sound/soc/fsl/hdmi_pcm.S:100:2: error: unrecognized instruction
    vzip.16 q0, q2
    ^
   sound/soc/fsl/hdmi_pcm.S:101:2: error: unrecognized instruction
    vshl.u32 q0, q0, #8
    ^
   sound/soc/fsl/hdmi_pcm.S:102:2: error: unrecognized instruction
    vshl.u32 q1, q2, #8
    ^
   sound/soc/fsl/hdmi_pcm.S:106:2: error: unrecognized instruction
    subs r2, r2, #8
    ^
   sound/soc/fsl/hdmi_pcm.S:107:2: error: unrecognized instruction
    bne hdmi_dma_copy_16_neon_fast_start
    ^
   sound/soc/fsl/hdmi_pcm.S:109:2: error: unrecognized instruction
    mov pc, lr
    ^
   sound/soc/fsl/hdmi_pcm.S:114:2: error: unrecognized instruction
    mov r12, #1
    ^
   sound/soc/fsl/hdmi_pcm.S:115:2: error: unrecognized instruction
    vdup.8 d8, r12
    ^
   sound/soc/fsl/hdmi_pcm.S:125:2: error: unrecognized instruction
    vcnt.8 q2, q0
    ^
   sound/soc/fsl/hdmi_pcm.S:126:2: error: unrecognized instruction
    vpadd.i8 d4, d4, d5
    ^
   sound/soc/fsl/hdmi_pcm.S:127:2: error: unrecognized instruction
    vcnt.8 q3, q1
    ^
   sound/soc/fsl/hdmi_pcm.S:128:2: error: unrecognized instruction
    vpadd.i8 d6, d6, d7

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
