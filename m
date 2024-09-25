Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1534946F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 02:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727231214; cv=none; b=bDjMsk92Z6RPVY6KBVGHpUOpbFkguxmpjY6EjqLRI72aF0aLo9S6jURVgMXUFqZHTFo1zOzjfhzdiSKtWO1eJPsHX7vrpkAvQfFa0033a5guWVF4DPxO+Jr2NvR32BQ7wqJYtNtJuBpUHpFD+XOaiC6quNfCrrIqdKEu+MnxMFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727231214; c=relaxed/simple;
	bh=7cZPv/O89dPLwN0pkz4FajriVooxUWcT3JZNdgjBxJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekpzA90VfKI/4X80RYtGLmbaZ0zh8hbT0KwSUxXY9QabsO5NX1rDT4+50xmaRYwYWhHtGzJxRxEBXpLQVJ7h7C6dLRe5vKO7Y1wWlaE62qHLUpJLWKJm/DO0EV2wNSvTyixCYAD2Aa/DlePSVUht3Gla1cT4VKlrldkNUjsi4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=driRAPJC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="driRAPJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727231213; x=1758767213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7cZPv/O89dPLwN0pkz4FajriVooxUWcT3JZNdgjBxJo=;
  b=driRAPJCq6k1HuvJcJ72zs3sDYce3dTBfrU6RX98LsOCVyYbCpa3sjn6
   K4Vs/R8Wr/+zNU1O3lvbrqusHnCjCrD3TB/k4Z0P5dRRTh3les0V83APn
   G3IER9TAO0xAj4Rj2W+aSr/vIiEnf6PN3xcN/A5myp+5+c6HHbbWH+uqc
   NZUn0AbQMijb2dNgmt9AnwSx5mnU82hBD7EzXP81GkY36LIr3umre5o8R
   1d9GsDCtf0cvunniQ9q0JEYguI6PD1ILlwNvOzvfUlIeGmcOO5eJG6ka/
   FeYLe1c+WfikyBvbvYZcp2IAsE6Rcw6U1kE4IeX4auctPdIxSORSH8LUX
   A==;
X-CSE-ConnectionGUID: hmb4nnhjSK6AzSWM9Xsq2w==
X-CSE-MsgGUID: d6w7eB2xQbq87LXC0xkBuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26352970"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="26352970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 19:26:52 -0700
X-CSE-ConnectionGUID: bj27k+7FRyG3H4gqddB8oQ==
X-CSE-MsgGUID: V6699RzmRce4Og2P0FxLDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="102437843"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Sep 2024 19:26:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stHjs-000J39-2o;
	Wed, 25 Sep 2024 02:26:48 +0000
Date: Wed, 25 Sep 2024 10:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2431/14103] vmlinux.o: warning: objtool:
 .text+0x0: unreachable instruction
Message-ID: <202409251001.lPFg9jzv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d25e57f47750555950b12145f98d5168319e6712
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2431/14103] make OPTIMIZE_INLINING config editable
config: x86_64-buildonly-randconfig-001-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251001.lPFg9jzv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251001.lPFg9jzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251001.lPFg9jzv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text+0x0: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x40: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x44: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x49: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x50: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x57: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x5c: unreachable instruction
   vmlinux.o: warning: objtool: .text+0x63: unreachable instruction
   vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata


objdump-func vmlinux.o .text:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
