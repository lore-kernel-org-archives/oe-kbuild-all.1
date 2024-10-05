Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E3113C8F6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 19:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156631; cv=none; b=fBynAjpDyliGb6LKVYwH0lKfY1MbF1GLP6OHPWRSXpH3oynJG5dF+uvM/aVXRmmQ7i2bAEmlCtEBE0qjBH65uJicSepNcAa+MHlNSlXKtrqMiHYj2Tfietu5n+GT1f4dS+IKcVhjdzLPAADyKzVa9a91iDSUlcwESM1Uo9kwlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156631; c=relaxed/simple;
	bh=Utr0tnkgDw3ooOZJasxUkerIzc9uZ7snPo6t6h8/l10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WfqBHSgynZdjXRIV3DXJW2VLCXwFVri847V2TvKTFPS1q8ivO5iwzoNMvFmjfhSQ0NwB6GtLtiWCEHHsM5F9AYeaecxOBTtTTPNwlwwKKjm1rJQdw9nuHNkmI+P0IU8HfXA7K8e0KF08dKRIQB+u2BsbA2jk0BBAt4LPdj/L3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzbIbAiF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzbIbAiF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728156629; x=1759692629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Utr0tnkgDw3ooOZJasxUkerIzc9uZ7snPo6t6h8/l10=;
  b=NzbIbAiFN4uqbzBWmSp3Ysk12vt0ejmBFmVTI1zeAhfLasfCgoxeIjDh
   IXZH2Ur59l3YSS6PVW/iqdFHXAl3Gyuhl6ut0X45+RnNKzjRBRwB3uKVJ
   N6x5UGbJhIe7HT9sTFuP6G/LG/1ywEwR2cyDIlcQ+qeeZ9dge5ZQP4tOO
   U0Zo6DdxdQ0qlAE9AswCA/YlRwpZ3K/erm+NiNC+8deKBVKfQmzdbG1Jm
   0NoHA0sSvZf246WlYMlGexZbcF574AAE4NktBxfHrGf+x58eIT4+V6dC2
   WKeCpL4/IYvV60mwAZXtT3ZPjk2cU/CwlGoyGRJtNBjzZPdl0Yj10GN4Q
   Q==;
X-CSE-ConnectionGUID: vRvK/z/NR1q79tWDg/NmjA==
X-CSE-MsgGUID: kYZiP93DSWWzu9A9p9Y7iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27163985"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27163985"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 12:30:26 -0700
X-CSE-ConnectionGUID: +mLnUUcTRwWqvqxOkLNLWg==
X-CSE-MsgGUID: 54lGPaRoTRS24f4C7NSqiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79609828"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2024 12:30:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxATu-0003IQ-2t;
	Sat, 05 Oct 2024 19:30:22 +0000
Date: Sun, 6 Oct 2024 03:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1279/1491]
 sound/soc/intel/avs/skl.c:46:36: error: no member named 'hipc' in 'struct
 avs_spec'
Message-ID: <202410060316.wE2Hbcnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 327f6cbdf71e251baf78792a3c13b0c6b83d0ed6 [1279/1491] UPSTREAM: ASoC: Intel: avs: New IRQ handling implementation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410060316.wE2Hbcnx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060316.wE2Hbcnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060316.wE2Hbcnx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/skl.c:46:36: error: no member named 'hipc' in 'struct avs_spec'
      46 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                     ~~~~  ^
   include/sound/hdaudio_ext.h:144:31: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                    ^~~
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
>> sound/soc/intel/avs/skl.c:46:36: error: no member named 'hipc' in 'struct avs_spec'
      46 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                     ~~~~  ^
   include/sound/hdaudio_ext.h:143:29: note: expanded from macro 'snd_hdac_adsp_updatel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |                                    ^~~
   include/sound/hdaudio_ext.h:128:46: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                     ^~~
   include/sound/hdaudio.h:456:57: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   sound/soc/intel/avs/skl.c:49:45: error: no member named 'hipc' in 'struct avs_spec'
      49 |         hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
         |                                              ~~~~  ^
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/skl.c:50:45: error: no member named 'hipc' in 'struct avs_spec'
      50 |         hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
         |                                              ~~~~  ^
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/skl.c:53:23: error: no member named 'hipc' in 'struct avs_spec'
      53 |         if (hipc_ack & spec->hipc->ack_done_mask) {
         |                        ~~~~  ^
   sound/soc/intel/avs/skl.c:57:37: error: no member named 'hipc' in 'struct avs_spec'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                             ~~~~  ^
   include/sound/hdaudio_ext.h:144:31: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                    ^~~
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   sound/soc/intel/avs/skl.c:57:61: error: no member named 'hipc' in 'struct avs_spec'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                                     ~~~~  ^
   include/sound/hdaudio_ext.h:144:40: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                             ^~~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   sound/soc/intel/avs/skl.c:58:17: error: no member named 'hipc' in 'struct avs_spec'
      58 |                                       spec->hipc->ack_done_mask);
         |                                       ~~~~  ^
   include/sound/hdaudio_ext.h:144:50: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                                       ^~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   sound/soc/intel/avs/skl.c:57:37: error: no member named 'hipc' in 'struct avs_spec'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                             ~~~~  ^
   include/sound/hdaudio_ext.h:143:29: note: expanded from macro 'snd_hdac_adsp_updatel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |                                    ^~~
   include/sound/hdaudio_ext.h:128:46: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                     ^~~
   include/sound/hdaudio.h:456:57: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   sound/soc/intel/avs/skl.c:62:23: error: no member named 'hipc' in 'struct avs_spec'
      62 |         if (hipc_rsp & spec->hipc->rsp_busy_mask) {
         |                        ~~~~  ^
   sound/soc/intel/avs/skl.c:75:36: error: no member named 'hipc' in 'struct avs_spec'
      75 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                     ~~~~  ^
   include/sound/hdaudio_ext.h:144:31: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                    ^~~
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
--
>> sound/soc/intel/avs/cnl.c:50:36: error: no member named 'hipc' in 'struct avs_spec'
      50 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                     ~~~~  ^
   include/sound/hdaudio_ext.h:144:31: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                    ^~~
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
>> sound/soc/intel/avs/cnl.c:50:36: error: no member named 'hipc' in 'struct avs_spec'
      50 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                     ~~~~  ^
   include/sound/hdaudio_ext.h:143:29: note: expanded from macro 'snd_hdac_adsp_updatel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |                                    ^~~
   include/sound/hdaudio_ext.h:128:46: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                     ^~~
   include/sound/hdaudio.h:456:57: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   sound/soc/intel/avs/cnl.c:53:45: error: no member named 'hipc' in 'struct avs_spec'
      53 |         hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
         |                                              ~~~~  ^
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/cnl.c:54:45: error: no member named 'hipc' in 'struct avs_spec'
      54 |         hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
         |                                              ~~~~  ^
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/cnl.c:57:23: error: no member named 'hipc' in 'struct avs_spec'
      57 |         if (hipc_ack & spec->hipc->ack_done_mask) {
         |                        ~~~~  ^
   sound/soc/intel/avs/cnl.c:61:37: error: no member named 'hipc' in 'struct avs_spec'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                             ~~~~  ^
   include/sound/hdaudio_ext.h:144:31: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                    ^~~
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   sound/soc/intel/avs/cnl.c:61:61: error: no member named 'hipc' in 'struct avs_spec'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                                     ~~~~  ^
   include/sound/hdaudio_ext.h:144:40: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                             ^~~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   sound/soc/intel/avs/cnl.c:62:17: error: no member named 'hipc' in 'struct avs_spec'
      62 |                                       spec->hipc->ack_done_mask);
         |                                       ~~~~  ^
   include/sound/hdaudio_ext.h:144:50: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                                       ^~~
   include/sound/hdaudio_ext.h:128:52: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                           ^~~~~
   include/sound/hdaudio.h:456:52: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   sound/soc/intel/avs/cnl.c:61:37: error: no member named 'hipc' in 'struct avs_spec'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                             ~~~~  ^
   include/sound/hdaudio_ext.h:143:29: note: expanded from macro 'snd_hdac_adsp_updatel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |                                    ^~~
   include/sound/hdaudio_ext.h:128:46: note: expanded from macro 'snd_hdac_adsp_writel'
     128 |         snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
         |                                                     ^~~
   include/sound/hdaudio.h:456:57: note: expanded from macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   sound/soc/intel/avs/cnl.c:66:23: error: no member named 'hipc' in 'struct avs_spec'
      66 |         if (hipc_rsp & spec->hipc->rsp_busy_mask) {
         |                        ~~~~  ^
   sound/soc/intel/avs/cnl.c:86:36: error: no member named 'hipc' in 'struct avs_spec'
      86 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                     ~~~~  ^
   include/sound/hdaudio_ext.h:144:31: note: expanded from macro 'snd_hdac_adsp_updatel'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                                                    ^~~
   include/sound/hdaudio_ext.h:130:45: note: expanded from macro 'snd_hdac_adsp_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |                                                    ^~~
   include/sound/hdaudio.h:457:45: note: expanded from macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)


vim +46 sound/soc/intel/avs/skl.c

    40	
    41	void avs_skl_ipc_interrupt(struct avs_dev *adev)
    42	{
    43		const struct avs_spec *spec = adev->spec;
    44		u32 hipc_ack, hipc_rsp;
    45	
  > 46		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
    47				      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY, 0);
    48	
    49		hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
    50		hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
    51	
    52		/* DSP acked host's request. */
    53		if (hipc_ack & spec->hipc->ack_done_mask) {
    54			complete(&adev->ipc->done_completion);
    55	
    56			/* Tell DSP it has our attention. */
    57			snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
    58					      spec->hipc->ack_done_mask);
    59		}
    60	
    61		/* DSP sent new response to process */
    62		if (hipc_rsp & spec->hipc->rsp_busy_mask) {
    63			union avs_reply_msg msg;
    64	
    65			msg.primary = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
    66			msg.ext.val = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
    67	
    68			avs_dsp_process_response(adev, msg.val);
    69	
    70			/* Tell DSP we accepted its message. */
    71			snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT, SKL_ADSP_HIPCT_BUSY,
    72					      SKL_ADSP_HIPCT_BUSY);
    73		}
    74	
    75		snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
    76				      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY,
    77				      AVS_ADSP_HIPCCTL_DONE | AVS_ADSP_HIPCCTL_BUSY);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
