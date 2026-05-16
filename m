Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEFF353EDF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927791; cv=none; b=LC+SvkLBZx1F+Ur1Nj9xHgoBIkvei0kWyUGkeSBa85K1xGA1qH95aWeJvoOTE3lRGbziEkRoSnKmC2DjsOimZBXaryglYOcnjqSBUwzJWg9VBc/NOaXQchzjQtkGGj+d+qungRQyKSzh59dzQnhChxa/qt8I0y27RY2m0Nt3A00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927791; c=relaxed/simple;
	bh=VrdSHWvtI6mUj57YvCCeqobNCGTgCUxboZaQAm4ZDXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V90PUAZX0bdB++TAsG43suovTxJYG+6Oq+R/OWIE+X1ylTvRw2beAEgHbD9pNoir35q7qkOUT3+qtvDGtl/ne2RtjeC08yEYqt32Mv936TheSJlFTKa4zVDAHonZxHB0vgRxpuQpVgYuROvV3qVPcJ514m8oDbGXMMQYAO/cTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGdT0ASj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGdT0ASj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778927789; x=1810463789;
  h=date:from:to:cc:subject:message-id;
  bh=VrdSHWvtI6mUj57YvCCeqobNCGTgCUxboZaQAm4ZDXQ=;
  b=cGdT0ASjwam2BN9hk6C7KZRtK1CjF/WHBrq6KKyEvkyD4sNwoTKmN+2i
   Ec/7DxeIy41wJGz5J4QlWXhml3iofKsIg8ttIGesMtF3hynidB8eKzHGf
   4vgQiHYkeVtYdHLXDLf+HUMI14BTWbWBLxRA2tgpgkFMcI2+lnamA5izS
   Er+LmIMPQv2lgiZgHegY3Kktwh82mNeAY2ZJcEYPQfrXPr6A3sMmbUMD5
   8xcALfQc2wcj/cvGzPJcdiZHLsei+5CbnTfKXtSiCIGQGTN8rQpQ/mrpT
   rIjlqPUQXp3NorsaAAUxrMHlE6bMzgE1sk3LwHfvVW9akqBKnwpHGDHmO
   w==;
X-CSE-ConnectionGUID: DfbIfg+mTgKNvhuml7hrkQ==
X-CSE-MsgGUID: mI/616EZQ6idRNYFywCZnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="67392737"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="67392737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 03:36:29 -0700
X-CSE-ConnectionGUID: PAnCVBXkRmioCKSrSy8MbQ==
X-CSE-MsgGUID: K/CSE7xuQ1KmxuHgMFlxRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="243910473"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 03:36:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOCNd-000000009JB-20HJ;
	Sat, 16 May 2026 10:36:25 +0000
Date: Sat, 16 May 2026 12:36:00 +0200
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:cgrp.struct_ops.v8 9/12]
 kernel/bpf/cgroup.c:31:6: warning: conflicting types for
 'bpf_cgroup_struct_ops_register' due to enum/integer mismatch; have
 'void(enum cgroup_bpf_attach_type,  u32,  void *, bool)' {aka 'void(enum
 cgroup_bpf_attach_type,  unsigned int,  void *, _Bool)'}
Message-ID: <202605161233.DhfFJe3u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git cgrp.struct_ops.v8
head:   1ae5eccb04d5d8c62c310b206b5e5dc4ff1d9c71
commit: 32e27daf9a1563276f88eb17d076f61f8cc8b502 [9/12] bpf: Add infrastructure to support attaching struct_ops to cgroups
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260516/202605161233.DhfFJe3u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161233.DhfFJe3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161233.DhfFJe3u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/cgroup.c:31:6: warning: conflicting types for 'bpf_cgroup_struct_ops_register' due to enum/integer mismatch; have 'void(enum cgroup_bpf_attach_type,  u32,  void *, bool)' {aka 'void(enum cgroup_bpf_attach_type,  unsigned int,  void *, _Bool)'} [-Wenum-int-mismatch]
      31 | void bpf_cgroup_struct_ops_register(enum cgroup_bpf_attach_type atype, u32 type_id,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/cgroup.c:16:
   include/linux/bpf-cgroup.h:115:6: note: previous declaration of 'bpf_cgroup_struct_ops_register' with type 'void(int,  u32,  void *, bool)' {aka 'void(int,  unsigned int,  void *, _Bool)'}
     115 | void bpf_cgroup_struct_ops_register(int atype, u32 type_id, void *cfi_stubs, bool tasks_trace);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +31 kernel/bpf/cgroup.c

    30	
  > 31	void bpf_cgroup_struct_ops_register(enum cgroup_bpf_attach_type atype, u32 type_id,
    32					    void *cfi_stubs, bool mult_rcu)
    33	{
    34		struct_ops_type_id[atype] = type_id;
    35		struct_ops_cfi_stubs[atype] = cfi_stubs;
    36		struct_ops_mult_rcu[atype] = mult_rcu;
    37	}
    38	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
