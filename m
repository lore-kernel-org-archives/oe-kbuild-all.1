Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F97C17A30F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753824194; cv=none; b=fF9Q27OUiHnzl1xC/wFgxSS61HsLtHX4CwhKQ8RfJ4kgPyFr1mVF5Cg3uykBm5px77oqFi6McAVH6VHfT5QoDoZdHw8dH38Va6t3+Ak1vYt/na7rFCkdNu9uS6vqp4tbNwLGD6OeKQII+ibr2MM8dOKrz7JLES/0EHMRCsafVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753824194; c=relaxed/simple;
	bh=A+Yk155OydTFun8QQUU9la0/ZnT16dV/ZO6uBa6Tbrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ez0ruDoUpA30asyn9FfA9KSus8m3n3NtoM/bh7nYUQfb+wq8gIV7ERII2FF/sfJlPqW2yWahDuiXksgFqTnAPNd+3aCWY50i3PUDloCvGSEM9M3PCnjxMwSXU49qOOYYmLkpM460wHayHpuj0cnSCB8vgOHRQASbzeAnMb+ZaMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvG6I2gY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvG6I2gY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753824192; x=1785360192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+Yk155OydTFun8QQUU9la0/ZnT16dV/ZO6uBa6Tbrw=;
  b=bvG6I2gYGSho4yKy/uES0+ZW7kfLc9IBiEWfIDIRvaBCj2GpTKCOjo62
   PdIEn8UPEJxC1ejNsm2SBBnFlkb7Gq1l1t1QYADfdbjogJjbgaMSZPzSc
   QXqBfsfGrgKdh3eYhGJGI2guxVm1DOLPitA6eghVL4Uv+YJJFlWD7QHcw
   42tsTTpEfSqG3huOnWaF/nWxTl+WH5+uo8gfsMP5MKsMIe+EMjL+Fls1T
   gfvab2tDRV14GKT/x+wP57qQJFl5cbyw3xh7Vlxuu49viyNCM3qvbpssn
   LEaqAZiafJcK6VJkJQHchN5g5YkzFXLNO1dCBfYzynHYnItj2PIFjPe/q
   g==;
X-CSE-ConnectionGUID: +dhvL9+QT/q+MqSiv1R2cw==
X-CSE-MsgGUID: XMhM8CCjS4Gg9kLpcjXSSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56049817"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56049817"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 14:23:11 -0700
X-CSE-ConnectionGUID: NnyANZdmTNm3b5unYjfHfQ==
X-CSE-MsgGUID: VgZFIC2hQoOOsBB3SpeaPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167023550"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2025 14:23:10 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugrmt-0001hz-2m;
	Tue, 29 Jul 2025 21:23:07 +0000
Date: Wed, 30 Jul 2025 05:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:nvme-mpath-bpf 5/6]
 drivers/nvme/host/bpf_ops.c:36:39: warning: variable 'nit' set but not used
Message-ID: <202507300512.inemb73W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git nvme-mpath-bpf
head:   7e438588a7436fb1145593e81e9cd827bde45af9
commit: 85207b99a33685a9fde16be6d130fe5fd8442545 [5/6] nvme-bpf: eBPF struct_ops path selectors
config: x86_64-randconfig-004-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300512.inemb73W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300512.inemb73W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300512.inemb73W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/bpf_ops.c: In function 'nvme_bpf_ops_btf_struct_access':
>> drivers/nvme/host/bpf_ops.c:36:39: warning: variable 'nit' set but not used [-Wunused-but-set-variable]
      36 |         const struct btf_type *nhit, *nit, *niter, *t;
         |                                       ^~~
   In file included from include/linux/bpf_verifier.h:7,
                    from drivers/nvme/host/bpf_ops.c:4:
   drivers/nvme/host/bpf_ops.c: In function 'nvme_bpf_struct_ops_init':
>> include/linux/bpf.h:1966:50: warning: statement with no effect [-Wunused-value]
    1966 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/nvme/host/bpf_ops.c:341:15: note: in expansion of macro 'register_bpf_struct_ops'
     341 |         ret = register_bpf_struct_ops(&bpf_nvme_bpf_ops, nvme_bpf_ops);
         |               ^~~~~~~~~~~~~~~~~~~~~~~


vim +/nit +36 drivers/nvme/host/bpf_ops.c

    31	
    32	static int nvme_bpf_ops_btf_struct_access(struct bpf_verifier_log *log,
    33						  const struct bpf_reg_state *reg,
    34						  int off, int size)
    35	{
  > 36		const struct btf_type *nhit, *nit, *niter, *t;
    37	
    38		nhit = btf_type_by_id(reg->btf, nvme_bpf_ops_args_ids[0]);
    39		nit = btf_type_by_id(reg->btf, nvme_bpf_ops_args_ids[1]);
    40		niter = btf_type_by_id(reg->btf, nvme_bpf_ops_args_ids[2]);
    41	
    42		t = btf_type_by_id(reg->btf, reg->btf_id);
    43		if (t != nhit && t != niter) {
    44			bpf_log(log, "write access to struct %d is not supported\n", reg->btf_id);
    45			return -EACCES;
    46		}
    47		if (t == niter) {
    48			/* Allow writes to the 'head' element */
    49			if (off >= offsetof(struct nvme_bpf_iter, head) &&
    50			    off + size < offsetofend(struct nvme_bpf_iter, head))
    51				return NOT_INIT;
    52		} else {
    53			/* Allow writes to the 'bpf_ops' element */
    54			if (off >= offsetof(struct nvme_ns_head, bpf_ops) &&
    55			    off + size < offsetofend(struct nvme_ns_head, bpf_ops)) {
    56				return NOT_INIT;
    57			}
    58		}
    59		bpf_log(log, "write access for struct %s at off %d with size %d\n",
    60			nvme_bpf_ops_name, off, size);
    61		return -EACCES;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
