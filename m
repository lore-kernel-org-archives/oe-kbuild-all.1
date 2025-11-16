Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524221507F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763289101; cv=none; b=l/8zNbMyP+zkso/umnNo6u81vNTYSAO11xgUeYV9/THQ3Gx3BVSxt1RiNiS/VbdlpVf4zyads+JnFC3zDmB4tECsCL8WbtNjPLMU7l0j3z2rKjret+MB9RespR7GdDhayWU20ZgQ5e4+ttqicxWcuWbvgCi5S7JghP7p6ICeRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763289101; c=relaxed/simple;
	bh=bWqvKEnwGRDSpy8WnG8jATnfQahj0dlXlPVzBMfnFZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L22S8ZcDCod1T95kNBQP2vLF7awj+p4WzCn+H9ewY8fL/sTovJ6RiZ4xZV0uOza9eADUSkNxCI01Y7j3w5Kwx+EtHnhalVNI8ml9u2mpjZJBay+ZJ5m84BodPL5d+DgKV8mIAQ4u6eMZqFOAvWN0FIEL9QiDtrAiK6tB3liUiI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgp+22HS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgp+22HS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763289099; x=1794825099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWqvKEnwGRDSpy8WnG8jATnfQahj0dlXlPVzBMfnFZg=;
  b=jgp+22HSf2IqT+Zt+pb3B76/YqZKrnowslaHcA1Eo49ExjFrSZtvWTM8
   Mb+KZw9J1N+GnTku3JYYQXnKZfBVem0XS5eD3hwI6IkxSOYv+cNWbKkIl
   h4tpqAMJ6mOMgX6NNsauc2gk7XbdKPp4Na9Dpgda3uHA8cgkxOQzoQF2y
   xbi3QFmdV3t/ppAn/otUPFFDEwMC3icdL5K7iLN6VH+jFbDHG3nEhIum7
   29os1a6rrnokMNqRQNomoz2QQVrD7Z15xXQnvYxqDDHEQRL1MhNjwGDbA
   Tf65svcXeMpgJUS3mZ4gbck5TqzbJ6SmAqlW2rGPZ/8OPLAiv5fwwlWjK
   w==;
X-CSE-ConnectionGUID: qhqS0HJmSEWTiuzRKWvoTQ==
X-CSE-MsgGUID: QJJ+CRcpQk2DOcN4wRMDIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="90790399"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="90790399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 02:31:39 -0800
X-CSE-ConnectionGUID: b0RpjnHCQhaMWqk2JxbVqQ==
X-CSE-MsgGUID: +NNQTqodRIOhPPGoLTcTLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="227538489"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2025 02:31:38 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKa2h-0008hL-1u;
	Sun, 16 Nov 2025 10:31:35 +0000
Date: Sun, 16 Nov 2025 18:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 11/14] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk
Message-ID: <202511161827.NghSAF4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   df5520ea7e635c1cf8dd6620c2ece567ada21c26
commit: 7a98647d5f5badfa99588a7f64cd39be668fc283 [11/14] x86: Use PIE codegen for the core kernel
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251116/202511161827.NghSAF4O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161827.NghSAF4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161827.NghSAF4O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk
   vmlinux.o: warning: objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x4: relocation to !ENDBR: .text+0x71420

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
