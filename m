Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D62A1D12F7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727898759; cv=none; b=kdEjCLAn42jcViAv9A3Kvlkwbd8ToTSJ/fFnPkeztL7v/A0ODxb4XUJroZNMKJ4fUkOruBTGKxzYnBI2MAOpB7N5BH07RY2abI0bcB1Y5IM0RxFfhCL89QhPzrTn60VY7MO2LZ6IlYEM40YGAX5syKWpJ37yIkr7YzUYAtVmDPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727898759; c=relaxed/simple;
	bh=Ara46FLalp/H46yHVudEVrpt2Jn6NEo1/AnSLHwei40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDci5CCjprEPnnwaUbHFUp0c+dggO44rP5hlZv9lv5cJSNDefV0HCB8tyEz1ALirXdj4lCiIIBLwZAlCxKbcV/RFh8JJ28vU+9PQUBuX0fntW3UGkCXXS0K3Urb5HphLPEE5h6RO6W8AHGx/wDJNeGLVEWuLB7V3kVX8L4uOyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXl07QAb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXl07QAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727898757; x=1759434757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ara46FLalp/H46yHVudEVrpt2Jn6NEo1/AnSLHwei40=;
  b=NXl07QAbAk7xMfVpG9gLHUFvIymNL9NIiEavjM0wNpYp2xQyZQMvJv/T
   HV5G/uZQBuEg8sEKpYcIMrXq731iJnBIuspVuL/ftoHtBirGSdeN5Wbrq
   qYaP844N1htP88Q7yp5Q/Q8vkn5fl/Koo6akZwi+Bf3/QEPxv/jkLmShl
   vEviOm76LoPjyWOGGK35720PlHeJJi1uz5pvkoKzD31qym9OqM7RQUKqd
   Czv9YW4I8ZBuDwKbaSsmr9IRjcmTSik+e3IqSD/p2veeBGjTTcm5YoAP+
   DDXjgyIus3yhbCDFR7duRQEzFecqP2xBpAOgGcR1qLs5uLPzslSXkwlCE
   Q==;
X-CSE-ConnectionGUID: jRN0p6dsQ2qXBicYQHrN6w==
X-CSE-MsgGUID: LSA3eyHMThuoPO0sLkMm3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30963161"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="30963161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 12:52:35 -0700
X-CSE-ConnectionGUID: w7v+n8HHQ4uHJU7EliG5bA==
X-CSE-MsgGUID: +oWUD8MDTEexpf2PSi3myQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="78858482"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2024 12:52:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw5Oi-000UVT-0F;
	Wed, 02 Oct 2024 19:52:32 +0000
Date: Thu, 3 Oct 2024 03:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1259/1491]
 sound/soc/intel/avs/apl.c:244:23: error: use of undeclared identifier
 'skl_log_buffer_offset'; did you mean 'avs_skl_log_buffer_offset'?
Message-ID: <202410030337.pJt8DM9p-lkp@intel.com>
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
commit: 7a0ad4bad1c6b21f2858d9321c81f0370dce225a [1259/1491] UPSTREAM: ASoC: Intel: avs: Abstract IRQ handling
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241003/202410030337.pJt8DM9p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030337.pJt8DM9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030337.pJt8DM9p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/apl.c:244:23: error: use of undeclared identifier 'skl_log_buffer_offset'; did you mean 'avs_skl_log_buffer_offset'?
     244 |         .log_buffer_offset = skl_log_buffer_offset,
         |                              ^~~~~~~~~~~~~~~~~~~~~
         |                              avs_skl_log_buffer_offset
   sound/soc/intel/avs/avs.h:251:5: note: 'avs_skl_log_buffer_offset' declared here
     251 | int avs_skl_log_buffer_offset(struct avs_dev *adev, u32 core);
         |     ^
   1 error generated.


vim +244 sound/soc/intel/avs/apl.c

c8c960c109716d Cezary Rojewski 2022-05-16  233  
b397f142f47498 Debi sahoo      2024-04-25  234  const struct avs_dsp_ops apl_dsp_ops = {
c8c960c109716d Cezary Rojewski 2022-05-16  235  	.power = avs_dsp_core_power,
c8c960c109716d Cezary Rojewski 2022-05-16  236  	.reset = avs_dsp_core_reset,
c8c960c109716d Cezary Rojewski 2022-05-16  237  	.stall = avs_dsp_core_stall,
7a0ad4bad1c6b2 Cezary Rojewski 2024-02-20  238  	.irq_handler = avs_irq_handler,
7a0ad4bad1c6b2 Cezary Rojewski 2024-02-20  239  	.irq_thread = avs_skl_irq_thread,
c8c960c109716d Cezary Rojewski 2022-05-16  240  	.int_control = avs_dsp_interrupt_control,
c8c960c109716d Cezary Rojewski 2022-05-16  241  	.load_basefw = avs_hda_load_basefw,
c8c960c109716d Cezary Rojewski 2022-05-16  242  	.load_lib = avs_hda_load_library,
c8c960c109716d Cezary Rojewski 2022-05-16  243  	.transfer_mods = avs_hda_transfer_modules,
b397f142f47498 Debi sahoo      2024-04-25 @244  	.log_buffer_offset = skl_log_buffer_offset,

:::::: The code at line 244 was first introduced by commit
:::::: b397f142f4749886f861dab3a3cf60174ec547b4 Revert "UPSTREAM: ASoC: Intel: avs: Prefix SKL/APL-specific members"

:::::: TO: Debi sahoo <debix.prasad.sahoo@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
