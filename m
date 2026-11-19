Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060463;
	b=SZwpQcUvzonniB85RwIMLWcZNiNueTpNjLg3Gcblxw7sFpdMQDlu452IbT/Sz4+HG1dx
	 thLr+2pQDVwby5okBQT/DfD3961TSleOhRje3By3Uc7QV2nznIRZiIFdPaU5rUi0bRyvC
	 h5j6jYs8SvwQC4Iv0aLgYoZdZ7Fvcdq2VRt9unRE/LMikZ6QfV8hxN9TvWYVafiyWt+NL
	 YVmqqQA+6HYUtFQ/iD8rVYot0C3dyxfZRYC/IzlOjJVIIR/DU3Z373yE/5C4o7A3xeNMb
	 ucYPcBhn21IWP84wgSEZXffPTBGgkidIBVJkh6nj2c9qTHYk0JEU0weyr8hubJlZoqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060463;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pxZIQ5xgwD8rAO1EmbYJx813Q5ZbSRBW6tSHMA+qwFY=;
	b=H3bFiYwn7AZ0ERY2zuugCw+4si+6M2H6WFtF4nuHMbt9CBeOzYu2ml6k+zpUGpTASGci
	 5SETbm16UCxfvAaDGV0hZ+yhmBGO1EC3Jvs9BTi7GHlv20dw64DRJ6VCBbysTUhHjt7xa
	 fIuitb2vr6WftKuCddqyVZoUkraCsU4OzJdlf6YWStlbbjefnXmgOUgx1zIpV0wvo+L+U
	 7X24THiJ/S0cA/p3I5RI0CTMEed9egBOLXSoEW3ScSZD3c1iHmAJwa+UtGIfKylKaaBK2
	 Q7gOP+oMFRxhLd03v5uWs0vs1DxdhmdVujLYqQQyU9+a7dgTF/gM41M+9oI0iVdT9/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lHywC3Jd;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8881D606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 03:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8881D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lHywC3Jd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795060462; x=1826596462;
  h=date:from:to:cc:subject:message-id;
  bh=3iBIinYxcfujzJWq9U8pfSdMtbJzb+IAiSM+IL7rYls=;
  b=lHywC3JduAn4QxN6ULqQMLen0gqx42YhN/rj77i7c17c/zHgPGS1zUUl
   Y6XM/kIS7StHqPAF9ao0kFNsE/q8iDxM9Qe/fIsi+F0zvLNqSmH30wXto
   fV6s2xJ6fsYWHiuYTnnENr4X61eX71yqsA0E1RBousFX7CkOS+ljU4Yi5
   113ibHbgXPca09sGz4BlPj9dN1wm0h0vgvJPlmfH27jHnibP055WC8HKe
   RY+3koIw5PesTEfi5qdaQskrn0EMYyHbiE17ibrnhUZVqOu+LX7XoESdR
   gcqlVUuMlzD/xtoA0gOGvl6ye+iRciFCEaIoJ4hWPEJdKIBWyiR+c9HNe
   g==;
X-CSE-ConnectionGUID: sgvhDm2ZRiKX/GG/X46iBQ==
X-CSE-MsgGUID: M/URoKYqT6WBcupkXMsgyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3784825"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3784825"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:54:21 -0800
X-CSE-ConnectionGUID: uXqqQJpVTFGNzMYTtuHfIw==
X-CSE-MsgGUID: pJ3ehPTwR9KS499HEC5xEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="12067009"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Nov 2026 19:54:21 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTtE2-000000003eP-2QhE;
	Thu, 19 Nov 2026 03:54:18 +0000
Date: Thu, 19 Nov 2026 04:53:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 3/3]
 arch/x86/coco/pkvm/pkvm.c:130:12: warning: 'pkvm_wakeup_secondary_cpu'
 defined but not used
Message-ID: <20261119044923.fUbTuLCw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Dmytro,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   27f779baaddd321c63f19185111710213af49961
commit: 171a0f6163b37c35a8ef394153bce28ba6206f71 [3/3] ANDROID: x86/pkvm: Use hypercall to start CPUs
config: i386-randconfig-r2308-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119044923.fUbTuLCw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119044923.fUbTuLCw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119044923.fUbTuLCw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/pkvm/pkvm.c:130:12: warning: 'pkvm_wakeup_secondary_cpu' defined but not used [-Wunused-function]
     130 | static int pkvm_wakeup_secondary_cpu(u32 apic_id, unsigned long start_ip, unsigned int cpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/coco/pkvm/pkvm.c:123:13: warning: 'pkvm_mmio_writeq' defined but not used [-Wunused-function]
     123 | static void pkvm_mmio_writeq(u64 v, volatile void __iomem *addr)
         |             ^~~~~~~~~~~~~~~~
   arch/x86/coco/pkvm/pkvm.c:93:12: warning: 'pkvm_mmio_readq' defined but not used [-Wunused-function]
      93 | static u64 pkvm_mmio_readq(const volatile void __iomem *addr)
         |            ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/pkvm_wakeup_secondary_cpu +130 arch/x86/coco/pkvm/pkvm.c

   129	
 > 130	static int pkvm_wakeup_secondary_cpu(u32 apic_id, unsigned long start_ip, unsigned int cpu)
   131	{
   132		return kvm_hypercall2(PKVM_GHC_START_CPU, apic_id, start_ip);
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
