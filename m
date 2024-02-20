Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5122030B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 05:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708408568; cv=none; b=kg9gwvoMxxp4YrLiSDJV/cTx95Pd1ay1YtlP2aEGrNw8fs+n3WMAkpIabYjNEFBYyp1abKb9EKtjTA23mM9kyfUtOqV2MHkuQuDMMQkozEoQXpN7sH1Zz/+II0VPs2tn3CRlntQ6ZrGwiZ8OlJZQ0avigeUWSbX0WKLW5lEyCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708408568; c=relaxed/simple;
	bh=KyDsecKBxEEYsexbNqMMPxEunVVsD56Al+76ECv4onI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXOey6+p8C8K5d0v3E7j9hvTluiKbSesWSxHrP/GIOFPqfysDV9L/DeLGKRweBUtFWtPveMN5a9eeMY++Dr2OWLxnO3ALFbsy0vKrsm1fxTStoWHMNTpI73S1E0uqsqfmgpbyyUxO/XuhUVoFm19CIl5Alj7jrwVIWbqadH/LQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lM5jQrf7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lM5jQrf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708408567; x=1739944567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyDsecKBxEEYsexbNqMMPxEunVVsD56Al+76ECv4onI=;
  b=lM5jQrf7pZd7KIi5JK3cQwQEuFKqR6x4/9mrFMh1NlRbH9x2GnHyJuPn
   hqBJ71gCIfDxcV0XKqlazAWmgAmXh3yZaRyA++7hoNpNR4cT3LiwFh4Pn
   sVv/cUWDtRvtcPqvOoUcGQn4OGn5jIG3qqJJuYHvHoNtXwPVD84j/ytkZ
   PHaVQkmnUWzjzJJe1nmLyOOZzTgXy4liFdwZ4q81c86KP1HasXfnUpGKM
   q9NHLGCwDQz/ZfJ6DNPAk4xF5/845yJtFUltSBAkh/zlrGc7g9RFi+ocr
   z2jcbIzdexe969NLaKuO4V4EYrc78Ib900MbUYg9m/ZTQFyh+q71BzGca
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13050853"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="13050853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 21:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="4708206"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2024 21:56:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcJ6I-0004Gu-0J;
	Tue, 20 Feb 2024 05:55:58 +0000
Date: Tue, 20 Feb 2024 13:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 39/45] WARNING: modpost:
 vmlinux: section mismatch in reference: thermal_read_mode_check+0xb2
 (section: .text) -> thermal_quirk_table (section: .init.rodata)
Message-ID: <202402201336.STHSvxUh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   b27bb403e136b12cafeff4467d495bbc8c9b7441
commit: 58f218d0969dd395402da9b05b2dad3662d9d0c7 [39/45] platform/x86: thinkpad_acpi: Fix to correct wrong temp reporting on some ThinkPads
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240220/202402201336.STHSvxUh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201336.STHSvxUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201336.STHSvxUh-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: thermal_read_mode_check+0xb2 (section: .text) -> thermal_quirk_table (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: thermal_read_mode_check+0xc9 (section: .text) -> beep_quirk_table (section: .init.rodata)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kmod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_ccmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_tkip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/rtl8192e/rtllib_crypt_wep.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/fprobe/fprobe_example.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
