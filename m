Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FCD194C62
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727904821; cv=none; b=nq/MKXPFqp+8uF8VcOvjeU14Lk2JxzdneeD39wEpSVsSVvQbDmI52QgRwMDr3b13/Cx200b0QzhkkzzR1GZPeMUXclRq+QR5YHLU6pPdQZ3hIqU0OKqx0/l2bZeygVjEeqjb2X6vfoKS4slClgr2qKNdSu8kFkfPTGVC7C7KrF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727904821; c=relaxed/simple;
	bh=9NfdpXr2jVHeZRUf1WxrjSh3MUVXuMm9Kppq7qIsk3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPHj1o6iXmD+AZ/RVWsXWYS9iyGCW2G1uM4GmJY7Yt+mQKhqcJeYV/Cx1sxCeOSJYRnH94ut8FcYvDnIW0mL7yC4ednvKKq5o0f2YVztaS2HwCIawWH4lc7SZWD6cQ5i2bHx0NkAyOqTp6J8g6DBJsBZK1j0kaAPGXkQebwPY+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQabeFOv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQabeFOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727904819; x=1759440819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9NfdpXr2jVHeZRUf1WxrjSh3MUVXuMm9Kppq7qIsk3s=;
  b=XQabeFOvKZEmdnxWV3cOxqPkiuHvzcWP1YZ451jyAr3LEdfEi1RqxnGN
   YKJThP7Ub3HCmvJ5iNfwwl0q2rwj08mIBZUC90ORlHUX/6k5EnCVoIWpD
   eJyoSPR5b8zyI+qYsip+XsvuBB2O+RLjjdVNYXtHnki5nkRj7LVD8ayEQ
   6uSI/QF+EXkT2vtI3xOuFR/IhqlQmfSWsay7xgKomi5TmyLOHkoGmpnQw
   AS/erxwvzbzDJWVntKC05rGqsUL9f5sfxobwQ8sAsRnvG0lechAmi9mXF
   z3UXr3u/TWyIZCX5MCfegFLaFyenFcBHqdaEP7eXeFnBRocpWC3dGDUjX
   w==;
X-CSE-ConnectionGUID: IX/UEVYzROSAVDhBCMeavg==
X-CSE-MsgGUID: MZguLAC+Q2Kb+0lemliiEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27259714"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="27259714"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 14:33:38 -0700
X-CSE-ConnectionGUID: 6qg9ZYXGRGqldzUqIUtfYw==
X-CSE-MsgGUID: 2x/0d4lbQrOQeEwwAUjNaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="78664564"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Oct 2024 14:33:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw6yV-000UaV-1W;
	Wed, 02 Oct 2024 21:33:35 +0000
Date: Thu, 3 Oct 2024 05:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1279/1491]
 sound/soc/intel/avs/skl.c:46:41: error: 'const struct avs_spec' has no
 member named 'hipc'
Message-ID: <202410030542.3TTTXFuE-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241003/202410030542.3TTTXFuE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030542.3TTTXFuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030542.3TTTXFuE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/sound/hdaudio_ext.h:7,
                    from sound/soc/intel/avs/skl.c:11:
   sound/soc/intel/avs/skl.c: In function 'avs_skl_ipc_interrupt':
>> sound/soc/intel/avs/skl.c:46:41: error: 'const struct avs_spec' has no member named 'hipc'
      46 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                         ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:130:9: note: in expansion of macro 'snd_hdac_reg_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |         ^~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:144:26: note: in expansion of macro 'snd_hdac_adsp_readl'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                          ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:46:9: note: in expansion of macro 'snd_hdac_adsp_updatel'
      46 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |         ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/intel/avs/skl.c:46:41: error: 'const struct avs_spec' has no member named 'hipc'
      46 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                         ^~
   include/sound/hdaudio.h:456:61: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:46:9: note: in expansion of macro 'snd_hdac_adsp_updatel'
      46 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:49:50: error: 'const struct avs_spec' has no member named 'hipc'
      49 |         hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
         |                                                  ^~
   include/sound/hdaudio.h:457:47: note: in definition of macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/skl.c:49:20: note: in expansion of macro 'snd_hdac_adsp_readl'
      49 |         hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
         |                    ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:50:50: error: 'const struct avs_spec' has no member named 'hipc'
      50 |         hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
         |                                                  ^~
   include/sound/hdaudio.h:457:47: note: in definition of macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/skl.c:50:20: note: in expansion of macro 'snd_hdac_adsp_readl'
      50 |         hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
         |                    ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:53:28: error: 'const struct avs_spec' has no member named 'hipc'
      53 |         if (hipc_ack & spec->hipc->ack_done_mask) {
         |                            ^~
   sound/soc/intel/avs/skl.c:57:49: error: 'const struct avs_spec' has no member named 'hipc'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                 ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:130:9: note: in expansion of macro 'snd_hdac_reg_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |         ^~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:144:26: note: in expansion of macro 'snd_hdac_adsp_readl'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                          ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:57:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:57:73: error: 'const struct avs_spec' has no member named 'hipc'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                                         ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:57:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:58:43: error: 'const struct avs_spec' has no member named 'hipc'
      58 |                                       spec->hipc->ack_done_mask);
         |                                           ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:57:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:57:49: error: 'const struct avs_spec' has no member named 'hipc'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                 ^~
   include/sound/hdaudio.h:456:61: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:57:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      57 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/skl.c:62:28: error: 'const struct avs_spec' has no member named 'hipc'
      62 |         if (hipc_rsp & spec->hipc->rsp_busy_mask) {
         |                            ^~
   sound/soc/intel/avs/skl.c:75:41: error: 'const struct avs_spec' has no member named 'hipc'
      75 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                         ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:130:9: note: in expansion of macro 'snd_hdac_reg_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
--
   In file included from include/sound/hdaudio_ext.h:7,
                    from sound/soc/intel/avs/cnl.c:9:
   sound/soc/intel/avs/cnl.c: In function 'avs_cnl_ipc_interrupt':
>> sound/soc/intel/avs/cnl.c:50:41: error: 'const struct avs_spec' has no member named 'hipc'
      50 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                         ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:130:9: note: in expansion of macro 'snd_hdac_reg_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |         ^~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:144:26: note: in expansion of macro 'snd_hdac_adsp_readl'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                          ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:50:9: note: in expansion of macro 'snd_hdac_adsp_updatel'
      50 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |         ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/intel/avs/cnl.c:50:41: error: 'const struct avs_spec' has no member named 'hipc'
      50 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                         ^~
   include/sound/hdaudio.h:456:61: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:50:9: note: in expansion of macro 'snd_hdac_adsp_updatel'
      50 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:53:50: error: 'const struct avs_spec' has no member named 'hipc'
      53 |         hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
         |                                                  ^~
   include/sound/hdaudio.h:457:47: note: in definition of macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/cnl.c:53:20: note: in expansion of macro 'snd_hdac_adsp_readl'
      53 |         hipc_ack = snd_hdac_adsp_readl(adev, spec->hipc->ack_offset);
         |                    ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:54:50: error: 'const struct avs_spec' has no member named 'hipc'
      54 |         hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
         |                                                  ^~
   include/sound/hdaudio.h:457:47: note: in definition of macro 'snd_hdac_reg_readl'
     457 | #define snd_hdac_reg_readl(bus, addr)   readl(addr)
         |                                               ^~~~
   sound/soc/intel/avs/cnl.c:54:20: note: in expansion of macro 'snd_hdac_adsp_readl'
      54 |         hipc_rsp = snd_hdac_adsp_readl(adev, spec->hipc->rsp_offset);
         |                    ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:57:28: error: 'const struct avs_spec' has no member named 'hipc'
      57 |         if (hipc_ack & spec->hipc->ack_done_mask) {
         |                            ^~
   sound/soc/intel/avs/cnl.c:61:49: error: 'const struct avs_spec' has no member named 'hipc'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                 ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:130:9: note: in expansion of macro 'snd_hdac_reg_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
         |         ^~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:144:26: note: in expansion of macro 'snd_hdac_adsp_readl'
     144 |                         (snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
         |                          ^~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:61:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:61:73: error: 'const struct avs_spec' has no member named 'hipc'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                                         ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:61:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:62:43: error: 'const struct avs_spec' has no member named 'hipc'
      62 |                                       spec->hipc->ack_done_mask);
         |                                           ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:61:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:61:49: error: 'const struct avs_spec' has no member named 'hipc'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                                                 ^~
   include/sound/hdaudio.h:456:61: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                             ^~~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:61:17: note: in expansion of macro 'snd_hdac_adsp_updatel'
      61 |                 snd_hdac_adsp_updatel(adev, spec->hipc->ack_offset, spec->hipc->ack_done_mask,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/cnl.c:66:28: error: 'const struct avs_spec' has no member named 'hipc'
      66 |         if (hipc_rsp & spec->hipc->rsp_busy_mask) {
         |                            ^~
   sound/soc/intel/avs/cnl.c:86:41: error: 'const struct avs_spec' has no member named 'hipc'
      86 |         snd_hdac_adsp_updatel(adev, spec->hipc->ctl_offset,
         |                                         ^~
   include/sound/hdaudio.h:456:56: note: in definition of macro 'snd_hdac_reg_writel'
     456 | #define snd_hdac_reg_writel(bus, addr, val)     writel(val, addr)
         |                                                        ^~~
   include/sound/hdaudio_ext.h:143:9: note: in expansion of macro 'snd_hdac_adsp_writel'
     143 |         snd_hdac_adsp_writel(chip, reg, \
         |         ^~~~~~~~~~~~~~~~~~~~
   include/sound/hdaudio_ext.h:130:9: note: in expansion of macro 'snd_hdac_reg_readl'
     130 |         snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))


vim +46 sound/soc/intel/avs/skl.c

     8	
     9	#include <linux/devcoredump.h>
    10	#include <linux/slab.h>
  > 11	#include <sound/hdaudio_ext.h>
    12	#include "avs.h"
    13	#include "cldma.h"
    14	#include "messages.h"
    15	
    16	irqreturn_t avs_skl_irq_thread(struct avs_dev *adev)
    17	{
    18		union avs_reply_msg msg;
    19		u32 hipct, hipcte;
    20	
    21		hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
    22		hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
    23	
    24		/* Ensure DSP sent new response to process. */
    25		if (!(hipct & SKL_ADSP_HIPCT_BUSY))
    26			return IRQ_NONE;
    27	
    28		msg.primary = hipct;
    29		msg.ext.val = hipcte;
    30		avs_dsp_process_response(adev, msg.val);
    31	
    32		/* Tell DSP we accepted its message. */
    33		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT, SKL_ADSP_HIPCT_BUSY, SKL_ADSP_HIPCT_BUSY);
    34		/* Unmask busy interrupt. */
    35		snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL, AVS_ADSP_HIPCCTL_BUSY,
    36				      AVS_ADSP_HIPCCTL_BUSY);
    37	
    38		return IRQ_HANDLED;
    39	}
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
