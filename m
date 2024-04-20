Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2EC127
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713615496; cv=none; b=GOxTB3CWthmAJCe3dT4XMvYMgs0F+f+8K6mUiyPCe6Mq5WZ6NOOC3kPM92JzQ3tFf5OQC1yeLNvA1of5cAUlGD5C1U/dArPXkdiFmSdqdt+tlBYEhS1hY5OhBLl49CW5/2VwEKDmYH7mtuKJRYG5Nb6eov2MjN0v53/rfjdp+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713615496; c=relaxed/simple;
	bh=AyjE8aF4bYtPrnKkPH+ksQeptKNcnSi4Dx+xrjPoYLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAyEcQffCS0qGeMgBzdzchQUHrcgu9nWrf4RqLpwUj79Rs3C2j/gXXwoZTBr9ENKu4//CSx5NofKWxj+f2dYSSIYc6VxfbpC8RjEHPfRaVKdZeyWTxNHpCVcM0HmVpmGvA+bvShZTWCkRV+2vmXc0j8ZNv07ev0IFtGNo27W1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyG1D21K; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyG1D21K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713615495; x=1745151495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AyjE8aF4bYtPrnKkPH+ksQeptKNcnSi4Dx+xrjPoYLM=;
  b=PyG1D21Kls5F8bdeptfCTm0doIhb/pLUfzTFr8HH6HWuO2u7ArW2JsZZ
   xA8hTdBk72mJ1SQcvcu6mu5eytpwnbZM/l/ZZTNAFIjkt0Uf0TY6IpN6z
   x2F1EH2oJqvxQSZcGEeDEgExeAuWScgQ0JhWNyY6ykeB2YbLOkKFspKvX
   lbsc+q0OwyERU9BqntxDa29HScga+C1Clroe20TzQy8GDTFGuEj7aoKi+
   2Sj/CFaxUzeE5hggQDQbSPo979mgLgY1qiUTsM87WbChk/satV0xUIuKT
   fRhJDeBkkjbGrJjTHjODwdcfX1eL8gHeYypAAdkk8Am6ImSL/BBymdY/A
   A==;
X-CSE-ConnectionGUID: DoxZ8OPmTPKGhYwpHRpdVw==
X-CSE-MsgGUID: gcwyaYkxSmiMxHoCkJmrGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="19766732"
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="19766732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 05:18:14 -0700
X-CSE-ConnectionGUID: AikPl7gMSyqfvvid45i0jA==
X-CSE-MsgGUID: RyYUOy1NRcmD7y+lqjrYyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,216,1708416000"; 
   d="scan'208";a="28395652"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Apr 2024 05:18:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry9fV-000B3M-1v;
	Sat, 20 Apr 2024 12:18:09 +0000
Date: Sat, 20 Apr 2024 20:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4851/18115]
 sound/soc/fsl/hdmi_pcm.S:46:2: error: unrecognized instruction
Message-ID: <202404202011.97L6cBHA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/18115] Merge branch 'mxc/next' into next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240420/202404202011.97L6cBHA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404202011.97L6cBHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404202011.97L6cBHA-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: argument unused during compilation: '-march=armv7-a' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-mtune=cortex-a9' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-mfpu=neon' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-mfloat-abi=softfp' [-Wunused-command-line-argument]
>> sound/soc/fsl/hdmi_pcm.S:46:2: error: unrecognized instruction
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
    ^
   sound/soc/fsl/hdmi_pcm.S:129:2: error: unrecognized instruction
    vpadd.i8 d4, d4, d6


vim +46 sound/soc/fsl/hdmi_pcm.S

32ecbcfdff46d0 Shengjiu Wang 2014-08-27  25  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  26  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  27  /**
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  28   * hdmi_dma_copy_16_neon_lut
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  29   * Convert pcm sample to iec sample. Pcm sample is 16 bits.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  30   * Frame index's between 0 and 47 inclusively. Channel count can be 1, 2, 4, 8.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  31   * Frame count should be multipliable by 4, and Sample count by 8.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  32   *
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  33   * C Prototype
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  34   *   void hdmi_dma_copy_16_neon_lut(unsigned short *src, unsigned int *dst,
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  35   *			int samples, unsigned char *lookup_table);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  36   * Return value
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  37   *   None
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  38   * Parameters
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  39   *   src		Source PCM16 samples
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  40   *   dst		Dest buffer to store pcm with header
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  41   *   samples		Contains sample count (=frame_count * channel_count)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  42   *   lookup_table	Preconstructed header table. Channels interleaved.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  43   */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  44  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  45  hdmi_dma_copy_16_neon_lut:
32ecbcfdff46d0 Shengjiu Wang 2014-08-27 @46  	mov     r12, #1		/* construct vector(1) */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  47  	vdup.8 d6, r12
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  48  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  49  hdmi_dma_copy_16_neon_lut_start:
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  50  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  51  	/* get 8 samples to q0 */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  52  	vld1.16 {d0, d1}, [r0]!	/* TODO: aligned */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  53  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  54  	/* pld [r1, #(64*4)] */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  55  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  56  	/* xor every bit */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  57  	vcnt.8     q1, q0	/* count of 1s */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  58  	vpadd.i8 d2, d2, d3	/* only care about the LST in every element */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  59  	vand       d2, d2, d6	/* clear other bits while keep the least bit */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  60  	vshl.u8    d2, d2, #3	/* bit p: d2 = d2 << 3 */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  61  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  62  	/* get packet header */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  63  	vld1.8       {d5}, [r3]!
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  64  	veor        d4, d5, d2	/* xor bit c */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  65  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  66  	/* store: (d4 << 16 | q0) << 8 */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  67  	vmovl.u8  q2, d4	/* expand from char to short */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  68  	vzip.16     q0, q2
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  69  	vshl.u32   q0, q0, #8
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  70  	vshl.u32   q1, q2, #8
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  71  	vst1.32     {d0, d1, d2, d3}, [r1]!
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  72  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  73  	/* decrease sample count */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  74  	subs  r2, r2, #8
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  75  	bne   hdmi_dma_copy_16_neon_lut_start
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  76  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  77  	mov pc, lr
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  78  

:::::: The code at line 46 was first introduced by commit
:::::: 32ecbcfdff46d0b03744d82aee4a12948226fe37 ASoC: fsl_hdmi: hdmi audio driver for imx6

:::::: TO: Shengjiu Wang <shengjiu.wang@freescale.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
