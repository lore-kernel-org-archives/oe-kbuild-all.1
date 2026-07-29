Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CCE4F5E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 01:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286816; cv=none; b=f5RnshT7aOimcFFw4FJUUbJPhauru3cK03siH8aWsSioLOA0wirlIoZiWcCYnPjfT89K0U1cUe0iwl2a9tfJCBUxM6JmndLYJHiy8jcd2bWIx4c/YXC8ps9I8NG1SsacKTuwxk/rntM+kVaqNc10n9R5oqoZcpgQwxLMzgQ1Lvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286816; c=relaxed/simple;
	bh=rYpFeEi80VIMUSd1BDxRzWIBfvg0LwSfGE+5L1xtn8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NfzShz/UgSZW5OGZlnXXfqdiYJwUGqATtH5kh3qTHophrJEmuWOeEc6XzL9eCK8TLZg3LNImvq7RolcITT5gFlZg7dPFKaOwEYvrIZN90lf2ABDieBFPMhAJcqOTS8Epg55aQGxQdci1suokNP4HM1iIb0f2REqF8NCa2ZGfweo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvFxtCnr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvFxtCnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785286815; x=1816822815;
  h=date:from:to:cc:subject:message-id;
  bh=rYpFeEi80VIMUSd1BDxRzWIBfvg0LwSfGE+5L1xtn8c=;
  b=jvFxtCnrvC/AC5AK4qx4Yqa3BbnUnjNy1hl3VUTvBppT/yATiK1xxLed
   UayT0HCZ5eauVJhLNpEF8HN8kxwHmpuxeKDQY6dYfLQwMG+1nsPjFxIDP
   L9G05R2Y8GVf3XvpDSSagsncEbcDtJwul7oCTgXy8aqdJxiyziitiSULh
   xH24eleaf75GbWT/RN37FOueEVwqDbkEpaGwY5Zcuwg7J4xaopSbQmSUl
   xfhSib8fa7BnopuDAFse+9mn/ZbizWzSWj1mvQiRAhe/y0SYg3yZ8BURd
   Bbaf0DcSrhVLZQZXkxaSv5zFjr3/W1nxqpebiu3fSqX8MncbmXWZywhVo
   w==;
X-CSE-ConnectionGUID: IW/wdR9MSxi4qrQw0GiknA==
X-CSE-MsgGUID: e9LqNFnhRi2lM0URxqpIAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103426413"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="103426413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 18:00:14 -0700
X-CSE-ConnectionGUID: qXFH57HMTf6lV+TnMsZMAA==
X-CSE-MsgGUID: Nhhf5Xt9Tfu2UHKhltr7Mw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 18:00:12 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woseY-0000000023a-2xrk;
	Wed, 29 Jul 2026 01:00:10 +0000
Date: Wed, 29 Jul 2026 02:59:35 +0200
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v4 7/14] error[E0063]: missing field
 `init_dma_buf_io_ctx` in initializer of `bindings::block_device_operations`
Message-ID: <202607290232.DkVlPTEc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v4
head:   26dcd0ae5c87a3ada5710b14b6894ef343cec6fe
commit: e0cc82a15419ba7b38eb0bb00ae34cf3d0c3a938 [7/14] block: forward init_dma_buf_io_ctx to drivers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260729/202607290232.DkVlPTEc-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607290232.DkVlPTEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290232.DkVlPTEc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `init_dma_buf_io_ctx` in initializer of `bindings::block_device_operations`
   --> rust/kernel/block/mq/gen_disk.rs:128:58
   |
   128 |         const TABLE: bindings::block_device_operations = bindings::block_device_operations {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `init_dma_buf_io_ctx`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
