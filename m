Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589FB1EE014
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203021; cv=none; b=ZBqjFTdvIQZEqVa2wpUmQjpsTPiQpPIdwvfCBFXBR3ULbWtQNgNRytG+MxJkv7XK12sjxbJm7NeViOE9bdj4gdZ/6K3g8JbhgdoBlwxHsiDj4IF9baYjMy7OCSMLUehK5dr947OD3L8TzzLlYBuSq+gZmVSAcB7/9jTOOxDg/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203021; c=relaxed/simple;
	bh=/DXORmeE6JOpDSurjgXs3A6P18frbj5D/fYLhgARnTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XU+Qp8WFDcuZV1MRElrKT0KSJ/fcy1kIjRjQJsg5/IEexS7uvxD2fRS35R/6GEoHXgMvB1l/i4XFNT1WnKrBx4EHgrDGkoZPVl/GwmXzs7/tLlmmN/cCxnz7oLj6TJG+ftY+vXFCyUIE0p9lFSKAXmTSVgSSC2DEdZogdG8FZSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/0kG/9l; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/0kG/9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730203019; x=1761739019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/DXORmeE6JOpDSurjgXs3A6P18frbj5D/fYLhgARnTU=;
  b=G/0kG/9l4p4Kez179brM85hBnYwCfhg7uWDlF3m0I1WDGIdz77KK8sqV
   FoVQY5JcPO/mLSn+ROhGNBX+/mFaz2EnX2FviCs+jet6zBcRQ79QTRsNw
   DWmFMrADbJoaZ33skYjDZQfkTSTHaGian2obHCNXu2gtsXMnJTRdPD+36
   FIZpxI/osJoVbC3KX+KPcVe6GcWUbCfOscFSRCCSwkMuJRoMFE26y1Yxv
   OP/c0CCAudZT8lOr4RI1IZ6TeqkhCBGsztkshkDO1jB8G8MiAsATx95ro
   g1gafNh27yt9R0K/0cYOvgLtkjT8h99qgw+W9ChqbzzpQo1OejLK8PtAO
   g==;
X-CSE-ConnectionGUID: 8+dFsBJYRiipOD5CiJtklw==
X-CSE-MsgGUID: I5uf9NJNTC6E7lshpEdZUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29944714"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="29944714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 04:56:59 -0700
X-CSE-ConnectionGUID: xlyQkIThRTmPfu48JxweCQ==
X-CSE-MsgGUID: s2kgMVAMSdaWFsgWmJVZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="87072015"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2024 04:56:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5kqF-000dbu-0b;
	Tue, 29 Oct 2024 11:56:55 +0000
Date: Tue, 29 Oct 2024 19:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15383/23901] fs/proc/etmem_scan.c:823:
 undefined reference to `kvm_flush_remote_tlbs'
Message-ID: <202410291925.OMbLBBuG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7b2baa68ab7f9f7fc4023e8121ddb050b2e45f30
commit: bad4d8833739acc8eef306e7ad5c7877f9f4f0fb [15383/23901] etmem: add etmem-scan feature
config: x86_64-randconfig-072-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291925.OMbLBBuG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291925.OMbLBBuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291925.OMbLBBuG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: fs/proc/etmem_scan.o: in function `page_scan_release':
>> fs/proc/etmem_scan.c:823: undefined reference to `kvm_flush_remote_tlbs'


vim +823 fs/proc/etmem_scan.c

   804	
   805	static int page_scan_release(struct inode *inode, struct file *file)
   806	{
   807		struct mm_struct *mm = file->private_data;
   808		struct kvm *kvm;
   809		int ret = 0;
   810	
   811		if (!mm) {
   812			ret = -EBADF;
   813			goto out;
   814		}
   815	
   816		kvm = mm_kvm(mm);
   817		if (!kvm) {
   818			ret = -EINVAL;
   819			goto out;
   820		}
   821	#ifdef CONFIG_X86_64
   822		spin_lock(&kvm->mmu_lock);
 > 823		kvm_flush_remote_tlbs(kvm);
   824		spin_unlock(&kvm->mmu_lock);
   825	#endif
   826	
   827	out:
   828		module_put(THIS_MODULE);
   829		return ret;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
