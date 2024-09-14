Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23081E871
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 20:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726344199; cv=none; b=lYWSK0qibakja1yKQVuQpagmtoOKMcJl7e+QZ0dyOxviohKIlOpZM3hw6WMNoTdK+elXJnXvqHN7BYhX3/sK3QKAn6+GZxeUaIlzyMtGGGxb8wJvOMUfiQAEKhDrr8vOfuLEKGXhWo11qh6DFgPqU9usjQ1msvM4bsxIXdN+rSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726344199; c=relaxed/simple;
	bh=dSXe2zK5hvnxlvqydyxGpdghEzQRJUa8pKFmT6La3w4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S06LFMSLvhP1d69z7AOL0+InueCE+J39fas8MHgnJINXOkSMVDd4Gkj5EY604kdAFbmgfeNYcWNuNje2usAeY5aYn56rE5eAB23Am+DT6xtRoHWfRd0QOiyqtwKrcadliH8KnBKUsvXZxdf66PQ816CPDbBgRU8Kjeq4Zo4wew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBYdbCwO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBYdbCwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726344198; x=1757880198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSXe2zK5hvnxlvqydyxGpdghEzQRJUa8pKFmT6La3w4=;
  b=hBYdbCwOFdkpu7bKSBe3YUvqJGGZwQLGtmFNBFJzz/T9KiHV6SFeZjD8
   fIErd0rAqfAUcYRRxBmWqK2VyBiZbPWXSgLTEp9qLSH0xmwdIAo3BcGXY
   VObrg57Wth5ZCJ1cp80WnjRnmOjjzm5PiWLHBUot+GHVlzpYGUg4PXB20
   M7+RERQahM89hjnryMxvmTMBb/PBSzoxpmdlls11HyvhQKlHVfQtvBM+c
   wFDuld9VkCX3LJgxbe2xcIc3ZvWvhDnhyICxpD092yhpaE0akFo6qi7UN
   eyjLSex3Ahyzu+eBwpeYBAO8E9gx/0Q4ukUNjl32mitMbmEp+tncHZqr6
   w==;
X-CSE-ConnectionGUID: OWzTa/1URD2VfR0AMPBYnw==
X-CSE-MsgGUID: O5KG8m5XTl6l4fLBzJ5nDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36606174"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="36606174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 13:03:17 -0700
X-CSE-ConnectionGUID: HiSDpaB0RSugx8814BR3kA==
X-CSE-MsgGUID: jECWtT8WS/+smJ2dQL8QFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="91732203"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2024 13:03:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spYzC-00086g-0z;
	Sat, 14 Sep 2024 20:03:14 +0000
Date: Sun, 15 Sep 2024 04:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20076/23714] arch/x86/power/.tmp_cpu.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202409150309.lli3IYFh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 27dd57ae7b305c8c1bcf55eab82c45d85b605149 [20076/23714] x86/cpu: Load microcode during restore_processor_state()
config: x86_64-buildonly-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240915/202409150309.lli3IYFh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150309.lli3IYFh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150309.lli3IYFh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/power/cpu.c:27:
   In file included from arch/x86/include/asm/mmu_context.h:12:
   In file included from arch/x86/include/asm/pgalloc.h:7:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   arch/x86/power/cpu.c:78: warning: Function parameter or member 'ctxt' not described in '__save_processor_state'
   arch/x86/power/cpu.c:200: warning: Function parameter or member 'ctxt' not described in '__restore_processor_state'
>> arch/x86/power/.tmp_cpu.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
