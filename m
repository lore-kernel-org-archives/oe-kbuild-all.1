Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51A7D3FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713202197; cv=none; b=e7DtF1zwpVCAJ6PUgEZr2m/GA6KbvLoFDIht21i9LGOVld95u1VNyw2pNo20K4AH/Ae2cnvA3LFClCka12heNXH9Y++TjhNSGZnQwYbRMUQN7d9jqH4DRim4e5RJz1tddaNuiKWywPeo/f3NYMVSYmBBwLoBEccMxT+Z2JbF+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713202197; c=relaxed/simple;
	bh=dYvHfhawnGXjcItEWcJXmIEYHn78dN24M6KvsveJ8mY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tp8lX5gJDAhMXYuoZT9oULb/sl9hqk/QzM6NAK48Wr4Fo4c3B+JJ4/d7dQvEeU8vmx54ZxESyhSxuAHYA8lFyxd90Fk6Fwi/QA+Dvaw8CuNpWjc+bHQBzYXSB6rUd7HhZz4DIc1J5oyJ+zjATaIYdV1WSuAleHxKCFy/V07UpRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWlg1XBK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWlg1XBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713202196; x=1744738196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dYvHfhawnGXjcItEWcJXmIEYHn78dN24M6KvsveJ8mY=;
  b=dWlg1XBKnBTlK+nHjNTUfDgbVqpuZwhfMWeTv5Ck1mgxfAogCmY/YTZB
   zDikzggCR/c9Rsxgtch8Ofwt2SmDx7aKuMKls8IHOegzeGPaxPGWC86t2
   WB0H4zerd6kA1uBaC4tC+hAig7heaajFE9FjcwBZeggenpNOnysLnbGTt
   cmVuqXB6M0za57Vd7v2fyTOk/nGESm8QbUOoN5Mc1Rqi5v/bD5L1AGlY3
   PSbjNWAfMtLlEsM77foo7RAj4ZmXhEpqjG1YRouDafWX0PubFPgrH7LwG
   LbR76M2HoZj5duUE4U3wxSIlRukgliU9cWLoIkLbZIiRvYq0JU7LyUzv1
   w==;
X-CSE-ConnectionGUID: yUkxlZfrSZCXu33GnvqUnQ==
X-CSE-MsgGUID: oW3KdlCIRmCzhr3Ar7PpfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8774402"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8774402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 10:29:55 -0700
X-CSE-ConnectionGUID: 5UlBlHppT42cJHSwYzeUug==
X-CSE-MsgGUID: 6IdkV8y0TZqyyB5LEHyuJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22066828"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Apr 2024 10:29:53 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwQ9P-0004R6-0Q;
	Mon, 15 Apr 2024 17:29:51 +0000
Date: Tue, 16 Apr 2024 01:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christoffer Dall <christoffer.dall@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Jintack Lim <jintack.lim@linaro.org>
Subject: [arm-platforms:kvm-arm64/nv-mmu 2/16]
 arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
Message-ID: <202404160133.OfGHRRXX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-mmu
head:   8a2681f4b19e77eaf4e1ce113ae48969a210e251
commit: 2cc094b7839f70fde4ff92b9bfde3a7c2fbe4ecd [2/16] KVM: arm64: nv: Implement nested Stage-2 page table walk logic
config: arm64-randconfig-r121-20240415 (https://download.01.org/0day-ci/archive/20240416/202404160133.OfGHRRXX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404160133.OfGHRRXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160133.OfGHRRXX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:225:32: sparse: sparse: cast to restricted __be64
>> arch/arm64/kvm/nested.c:227:32: sparse: sparse: cast to restricted __le64

vim +225 arch/arm64/kvm/nested.c

   157	
   158	/*
   159	 * This is essentially a C-version of the pseudo code from the ARM ARM
   160	 * AArch64.TranslationTableWalk  function.  I strongly recommend looking at
   161	 * that pseudocode in trying to understand this.
   162	 *
   163	 * Must be called with the kvm->srcu read lock held
   164	 */
   165	static int walk_nested_s2_pgd(phys_addr_t ipa,
   166				      struct s2_walk_info *wi, struct kvm_s2_trans *out)
   167	{
   168		int first_block_level, level, stride, input_size, base_lower_bound;
   169		phys_addr_t base_addr;
   170		unsigned int addr_top, addr_bottom;
   171		u64 desc;  /* page table entry */
   172		int ret;
   173		phys_addr_t paddr;
   174	
   175		switch (wi->pgsize) {
   176		default:
   177		case SZ_64K:
   178		case SZ_16K:
   179			level = 3 - wi->sl;
   180			first_block_level = 2;
   181			break;
   182		case SZ_4K:
   183			level = 2 - wi->sl;
   184			first_block_level = 1;
   185			break;
   186		}
   187	
   188		stride = wi->pgshift - 3;
   189		input_size = 64 - wi->t0sz;
   190		if (input_size > 48 || input_size < 25)
   191			return -EFAULT;
   192	
   193		ret = check_base_s2_limits(wi, level, input_size, stride);
   194		if (WARN_ON(ret))
   195			return ret;
   196	
   197		base_lower_bound = 3 + input_size - ((3 - level) * stride +
   198				   wi->pgshift);
   199		base_addr = wi->baddr & GENMASK_ULL(47, base_lower_bound);
   200	
   201		if (check_output_size(wi, base_addr)) {
   202			out->esr = compute_fsc(level, ESR_ELx_FSC_ADDRSZ);
   203			return 1;
   204		}
   205	
   206		addr_top = input_size - 1;
   207	
   208		while (1) {
   209			phys_addr_t index;
   210	
   211			addr_bottom = (3 - level) * stride + wi->pgshift;
   212			index = (ipa & GENMASK_ULL(addr_top, addr_bottom))
   213				>> (addr_bottom - 3);
   214	
   215			paddr = base_addr | index;
   216			ret = wi->read_desc(paddr, &desc, wi->data);
   217			if (ret < 0)
   218				return ret;
   219	
   220			/*
   221			 * Handle reversedescriptors if endianness differs between the
   222			 * host and the guest hypervisor.
   223			 */
   224			if (wi->be)
 > 225				desc = be64_to_cpu(desc);
   226			else
 > 227				desc = le64_to_cpu(desc);
   228	
   229			/* Check for valid descriptor at this point */
   230			if (!(desc & 1) || ((desc & 3) == 1 && level == 3)) {
   231				out->esr = compute_fsc(level, ESR_ELx_FSC_FAULT);
   232				out->upper_attr = desc;
   233				return 1;
   234			}
   235	
   236			/* We're at the final level or block translation level */
   237			if ((desc & 3) == 1 || level == 3)
   238				break;
   239	
   240			if (check_output_size(wi, desc)) {
   241				out->esr = compute_fsc(level, ESR_ELx_FSC_ADDRSZ);
   242				out->upper_attr = desc;
   243				return 1;
   244			}
   245	
   246			base_addr = desc & GENMASK_ULL(47, wi->pgshift);
   247	
   248			level += 1;
   249			addr_top = addr_bottom - 1;
   250		}
   251	
   252		if (level < first_block_level) {
   253			out->esr = compute_fsc(level, ESR_ELx_FSC_FAULT);
   254			out->upper_attr = desc;
   255			return 1;
   256		}
   257	
   258		/*
   259		 * We don't use the contiguous bit in the stage-2 ptes, so skip check
   260		 * for misprogramming of the contiguous bit.
   261		 */
   262	
   263		if (check_output_size(wi, desc)) {
   264			out->esr = compute_fsc(level, ESR_ELx_FSC_ADDRSZ);
   265			out->upper_attr = desc;
   266			return 1;
   267		}
   268	
   269		if (!(desc & BIT(10))) {
   270			out->esr = compute_fsc(level, ESR_ELx_FSC_ACCESS);
   271			out->upper_attr = desc;
   272			return 1;
   273		}
   274	
   275		/* Calculate and return the result */
   276		paddr = (desc & GENMASK_ULL(47, addr_bottom)) |
   277			(ipa & GENMASK_ULL(addr_bottom - 1, 0));
   278		out->output = paddr;
   279		out->block_size = 1UL << ((3 - level) * stride + wi->pgshift);
   280		out->readable = desc & (0b01 << 6);
   281		out->writable = desc & (0b10 << 6);
   282		out->level = level;
   283		out->upper_attr = desc & GENMASK_ULL(63, 52);
   284		return 0;
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
