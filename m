Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD6C34D3BE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 23:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762127366; cv=none; b=uieLx45t490JHFc0GfWjhwxOsfP+etueAokS+FtLJazct9CdUFhZm0kYgirYKYAHyphBkf2LmEUUBBrYy/1jd+U+NODezc76qpzZvv0KBHvsoggJpEBGTgsvMreAN5sry3uoyGDuIIqc11aic+1Xd5M3Gno8KXdwcvc/Cm8mo5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762127366; c=relaxed/simple;
	bh=IT/ndUR6wbjNO1ZCincGMuqhjNahedVZzv/nwY/ztIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alOMh1Un2XRjpRGDLOYjtWPAF7/sZtnXT9Bm5r0xJmom1+fSFT3pBh/bPDlf4Keh61WcZL923Thkrpzfx8UPaxmRvfVeuOpzqKA4prhmsdsPesweP//c39rQEOtjPC8jjtJbfHSWWZ8EzYQfhOJe1by0llT9ucGgyRkr2fGfhRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiWWT4G7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiWWT4G7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762127365; x=1793663365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IT/ndUR6wbjNO1ZCincGMuqhjNahedVZzv/nwY/ztIc=;
  b=FiWWT4G7kLLbvcY9qrQemKaSOUIs1JvRnUaz8D6XOcu5YRPBkJWdGsEj
   Ga2OdlIORfX6CSdIx1F73hq0sGeBKkw1ufltem2NSwwbwcSZ+MGPaf8Pt
   qH6f5Wlyu1B+q/+7YqVQwtfpvkhAY9Rw1bXaen6oMh//80Vgk9EKutecf
   MI+1LQKQXX1149m3o7gdVBBnnJsVtBeaZzgYZdhdzAOnrKv8RYp5pNBn5
   gv/bknUqnjCE4HbzTvtZJLO0gIhRMz40zM8VJ79IQZsA705DMz/dT+Y/s
   f2LwR4RnP4L1Edy0qPUqHt8i8NQKyivgK8iSvrHhEJRlmQIUK8KXkEDXi
   g==;
X-CSE-ConnectionGUID: ndeAEFVWTgKTsDeSBy4S0g==
X-CSE-MsgGUID: F21XAm+EQg68MO4yvlEY6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68042395"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68042395"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 15:49:24 -0800
X-CSE-ConnectionGUID: VUFmSe/yRdCJDFOk6a3/Jw==
X-CSE-MsgGUID: lHdKGijEQ5SSrQLIee2Ftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187171387"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2025 15:49:23 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFho0-000Peq-2x;
	Sun, 02 Nov 2025 23:48:54 +0000
Date: Mon, 3 Nov 2025 07:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>
Subject: [david:guestmemfd-preview 21/22]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:491:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202511030736.k9s66rKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/david/linux.git guestmemfd-preview
head:   dc9e22d99bb7c8b1ecaf526dfa5b6452f50ee982
commit: 67723794142d332a8dc8ed6a8b5348b97703979f [21/22] KVM: guest_memfd: add generic population via write
config: x86_64-randconfig-122-20251102 (https://download.01.org/0day-ci/archive/20251103/202511030736.k9s66rKL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030736.k9s66rKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030736.k9s66rKL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:192:17: sparse: sparse: context imbalance in '__kvm_gmem_invalidate_begin' - different lock contexts for basic block
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:491:10: sparse: sparse: Initializer entry defined twice
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:492:10: sparse:   also defined here

vim +491 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   487	
   488	static struct file_operations kvm_gmem_fops = {
   489		.mmap		= kvm_gmem_mmap,
   490		.write_iter     = generic_perform_write,
 > 491		.open		= generic_file_open,
   492		.open		= generic_file_open,
   493		.release	= kvm_gmem_release,
   494		.fallocate	= kvm_gmem_fallocate,
   495	};
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
