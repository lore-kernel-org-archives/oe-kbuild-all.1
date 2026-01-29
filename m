Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF037A497
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686555; cv=none; b=AuWpH4GqCjMrui2jD9u42LOkdyIolunQFrSUL999ZN1J6A37lJjF/3LYh/ILt4cDhgR0EGB5/4eIEtj91469wK+cmKGk3y+m74LqL6CQpD88901i0/N2czvm8W3OOrw1j+zQjVw6c3B/Wbv+C2aJnBP1QJ8qMjr6mYE5UlYF/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686555; c=relaxed/simple;
	bh=aHzbjfcbKq0mdI/lNmJaywCj+77SaY4tdvsE+ttA7hE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fKsylj1k8t0WjOttaT9r1mk91iezDDROq5ztZ51A/VsXIUyO8XxPCYoSWHcAmTJ7wRUzJjUKKq537NwS1YHLrFsXXajh6LcTGhPINE3RbIrvNQj8WPK5peUWYcyubumfg+bTAzsXVxv3vdbf5ElP2qpayQTmexq0e/7c0JhHxrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1wZV6nb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1wZV6nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769686554; x=1801222554;
  h=date:from:to:cc:subject:message-id;
  bh=aHzbjfcbKq0mdI/lNmJaywCj+77SaY4tdvsE+ttA7hE=;
  b=J1wZV6nb5nqyLwZJYm1Qy7vK3tgzQKM4shfxLqR6LJQyIi8A4sl7xxfQ
   zS3Zj10o2Tq11nIURkINex5KKL6rLW3n8/7W9WzhMAwXM8AOjXZKKb6gl
   rmbVMwwNYjSFfKQUVVfA6FH+uDxPK1NQyT7ptDpX2Bh8xyBGDD89E2BQ7
   D/w846JNWo4diu2WRKewrhTTdT7w2eKomGrb/SxJC8nnsMrQnZw1Ilq+I
   j370PwoAxR3aoLkMkQKM8seb8v+/2u0qlOwL2fNSnlVO1SMuyGRBevH/i
   hjp+XDaXFIN/IgflitNNa6smCINa1dNvzcOqp3AFAeX+ioWLgkLEJobBt
   g==;
X-CSE-ConnectionGUID: 7LLZBT00THO5k5gij6wOYg==
X-CSE-MsgGUID: hwu6jiJ7TJqzeAk9XqLCOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82291218"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="82291218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:35:52 -0800
X-CSE-ConnectionGUID: sR2XfQCvQVGoW3S36CUwGw==
X-CSE-MsgGUID: j1XgPVjJTXiqwAKI5JHpRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="246181525"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2026 03:35:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlQJQ-00000000bQ8-0mEh;
	Thu, 29 Jan 2026 11:35:48 +0000
Date: Thu, 29 Jan 2026 19:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/39] make[3]: *** No rule to make
 target 'arch/hexagon/boot/dts/sdm845.dtb', needed by
 'arch/hexagon/boot/dts/'.
Message-ID: <202601291938.5sbcAiiC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   64417972b86f5eb0d4a466436b1fb43da5692dd6
commit: 231618552e7c80d9c76c93ccf28a05af55b5ae39 [20/39] hexagon: update build system and Kconfig
config: hexagon-randconfig-r121-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291938.5sbcAiiC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291938.5sbcAiiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291938.5sbcAiiC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/hexagon/boot/dts/sdm845.dtb', needed by 'arch/hexagon/boot/dts/'.
   make[3]: Target 'arch/hexagon/boot/dts/' not remade because of errors.
--
>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/sdm845.dtb', needed by 'arch/hexagon/boot/dts/sdm845.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
