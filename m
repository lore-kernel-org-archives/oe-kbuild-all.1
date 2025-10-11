Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB61827F16A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760198293; cv=none; b=gXps6WJnhAeL5wILgynHW5ncaGM/Iel/9jmM+uNfoqWZiTp0UhacxPOL75V0a7Cuiq4nv2wk/cBhtsmdfR3Hp3EgP56Yw4PsmMkL7f4qQMi8UdfZ0QfRGcqATqGnz4/neHKXOWc8KbieVCVJ3sIstzrSoEwh3Utbu31qTfDz65w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760198293; c=relaxed/simple;
	bh=CxSv245CkaV7RyG+PXp5+tABatCcQy2L+SJbR6D84fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+YBntZassJ3DeTJYgO4nqDCNlMnChaG3MqSiTQvAbtUIFuXM2XRmDOuN0HGAAumKakuLnHiowP7GfjnW2ZVNjEYpxStpMID9LetYZtDIOhaDuPimMO1FaVMImQAFfdIDpxd9y18/xumIY9NKS1jaKOWJiiL9nyO1tJ56S3N9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeqMOMPc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeqMOMPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760198291; x=1791734291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxSv245CkaV7RyG+PXp5+tABatCcQy2L+SJbR6D84fg=;
  b=TeqMOMPcgj+xXnEHZkPc5HcYFbpncJq+pBW4BrvVGmwjNlQYxIXCmHLx
   2t0VlBcIqt9FbQiBMSH86AMMzZkiGVV67CF/x/orY6aseNextCmGi7vNm
   2XAEJd8vz1bwjPv9T6GJPNMljUw15aFqe2CA/L99fXoc0FDNp1hM+TBNS
   GWYRCSGxW3jexzfJKt1H/mzWTnrlVNRjMsr0omJ7kWcB1kb8gfYvdeorb
   ZbqOC/IGGzYeuLrIdb8obLZq736pT76p4+RG1nzfHN2lK1ZbXmqwRFuc4
   HTcgKvWAQmLN125We5OxdBzuw33r0iOpR66+/kajB9Ma1VKNE2ege+J+K
   g==;
X-CSE-ConnectionGUID: Qo5nRI1OTCO4+dmIOaqEhA==
X-CSE-MsgGUID: 2u9G9vlxRsOW9xfqk9wtXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="49948461"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="49948461"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 08:58:11 -0700
X-CSE-ConnectionGUID: L9hA4XYFSSSSaF3sbPPR6w==
X-CSE-MsgGUID: tQeoEqm6ROCaPDmnC3uXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="181223735"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2025 08:58:09 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7byw-0003qF-26;
	Sat, 11 Oct 2025 15:58:06 +0000
Date: Sat, 11 Oct 2025 23:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [davidhildenbrand:guestmemfd-preview 18/26]
 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:155:10: error: implicit
 declaration of function '__filemap_get_folio_mpol'; did you mean
 '__filemap_get_folio'?
Message-ID: <202510112316.Bx2Qh3kC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux guestmemfd-preview
head:   0c301bf7489a928d4839f3ee7477966a681543a2
commit: 0214cede5073bcc0f7cd671ca0c3ec99ef4eb164 [18/26] KVM: guest_memfd: Enforce NUMA mempolicy using shared policy
config: arm64-randconfig-001-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112316.Bx2Qh3kC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112316.Bx2Qh3kC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112316.Bx2Qh3kC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_get_folio':
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:155:10: error: implicit declaration of function '__filemap_get_folio_mpol'; did you mean '__filemap_get_folio'? [-Werror=implicit-function-declaration]
     155 |  folio = __filemap_get_folio_mpol(inode->i_mapping, index,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
         |          __filemap_get_folio
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:155:8: warning: assignment to 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     155 |  folio = __filemap_get_folio_mpol(inode->i_mapping, index,
         |        ^
   cc1: some warnings being treated as errors


vim +155 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c

   129	
   130	/*
   131	 * Returns a locked folio on success.  The caller is responsible for
   132	 * setting the up-to-date flag before the memory is mapped into the guest.
   133	 * There is no backing storage for the memory, so the folio will remain
   134	 * up-to-date until it's removed.
   135	 *
   136	 * Ignore accessed, referenced, and dirty flags.  The memory is
   137	 * unevictable and there is no storage to write back to.
   138	 */
   139	static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
   140	{
   141		/* TODO: Support huge pages. */
   142		struct mempolicy *policy;
   143		struct folio *folio;
   144	
   145		/*
   146		 * Fast-path: See if folio is already present in mapping to avoid
   147		 * policy_lookup.
   148		 */
   149		folio = __filemap_get_folio(inode->i_mapping, index,
   150					    FGP_LOCK | FGP_ACCESSED, 0);
   151		if (!IS_ERR(folio))
   152			return folio;
   153	
   154		policy = kvm_gmem_get_folio_policy(GMEM_I(inode), index);
 > 155		folio = __filemap_get_folio_mpol(inode->i_mapping, index,
   156						 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
   157						 mapping_gfp_mask(inode->i_mapping), policy);
   158		mpol_cond_put(policy);
   159	
   160		return folio;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
