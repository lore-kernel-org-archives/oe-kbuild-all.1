Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A843E47B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720074726; cv=none; b=Dr6PBJd+oNgYgUURt//kTGj1ZGttcMkxZlnzVw+xUt8qSaILctQPO1x6xJC8LLMsUl+ZWxgVPUPEtiTmPlK3ZxDTGdqiARKk8TKLRKnO/RXb+dlNOFhafuYSLhuDKhggNcjclTqahcQyy4D9/TFZlTXGS7qXYeNjzVR1Qc3lNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720074726; c=relaxed/simple;
	bh=nB9aZvNyayCjhushwfLcqfz7slocWn98DaEg4SKkQ2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YeOZ8EfJ/U2XEkKUJnOz+FutPL1zAYPVLYZtI8QQoFdTO5uE0xiSTEeukDHweuugSpJhJyMFW4BQIYdpXid11pk2XgOsPXySmSiaFAJVx8dT6KgYIcOG7SgvC8IqtfEP6/osz6abkW5is/qb+ybdhfXItPEC2EDRSujPSPNy/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmkN53mH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmkN53mH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720074725; x=1751610725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nB9aZvNyayCjhushwfLcqfz7slocWn98DaEg4SKkQ2U=;
  b=HmkN53mHTFyj5flBmD27T5IVbDULkx9CT7+nsavoyM4o2Sr0SW3fQHWJ
   Q3RkFyklyxlQiwCFIApLbCPrZTmxLE8rMgd9nOP7yHXSwlEBM2xlvXNYA
   Eu9iYApC2alew4rU0R8k3fF3HhgmN3RjP0YY8IwQl+dKIr/c+zF8jNeNy
   KfJwgx6Lr6D59YOJMLdLeU42HI9pva+bHJVkQuJrOGpxboh0Bo9g5MS/1
   spz0jxpX/047Vl05cyaUMH8UmLBBL25KuswWVFgffDHDWQRNznLkuEmyb
   Sn8LjrAuskcXmsPTnfQe5qkdkGFLuDfxVaUPbzP+dtfdfrzy6nVty3ed+
   g==;
X-CSE-ConnectionGUID: Q/X/TrJORZm78QhKkOA7Nw==
X-CSE-MsgGUID: yT8lvzgGRp6LP51CSrzI8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17546051"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17546051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 23:32:04 -0700
X-CSE-ConnectionGUID: eQfZMSh/Rx6mjlQFT4pGVA==
X-CSE-MsgGUID: tcnsjlQNSoCG3eIlGFP9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46460126"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2024 23:32:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPG0e-000QfD-2i;
	Thu, 04 Jul 2024 06:32:00 +0000
Date: Thu, 4 Jul 2024 14:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [linux-next:master 4347/10451]
 arch/loongarch/include/asm/uprobes.h:12:33: error: initializer element is
 not constant
Message-ID: <202407041440.PhFCml1P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: ff474a78cef5cb5f32be52fe25b78441327a2e7c [4347/10451] uprobe: Add uretprobe syscall to speed up return probe
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240704/202407041440.PhFCml1P-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041440.PhFCml1P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041440.PhFCml1P-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/uprobes.h:49,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from kernel/events/uprobes.c:13:
   kernel/events/uprobes.c: In function 'arch_uprobe_trampoline':
>> arch/loongarch/include/asm/uprobes.h:12:33: error: initializer element is not constant
      12 | #define UPROBE_SWBP_INSN        larch_insn_gen_break(BRK_UPROBE_BP)
         |                                 ^~~~~~~~~~~~~~~~~~~~
   kernel/events/uprobes.c:1479:39: note: in expansion of macro 'UPROBE_SWBP_INSN'
    1479 |         static uprobe_opcode_t insn = UPROBE_SWBP_INSN;
         |                                       ^~~~~~~~~~~~~~~~


vim +12 arch/loongarch/include/asm/uprobes.h

19bc6cb6409289 Tiezhu Yang 2023-06-29  11  
19bc6cb6409289 Tiezhu Yang 2023-06-29 @12  #define UPROBE_SWBP_INSN	larch_insn_gen_break(BRK_UPROBE_BP)
19bc6cb6409289 Tiezhu Yang 2023-06-29  13  #define UPROBE_SWBP_INSN_SIZE	LOONGARCH_INSN_SIZE
19bc6cb6409289 Tiezhu Yang 2023-06-29  14  

:::::: The code at line 12 was first introduced by commit
:::::: 19bc6cb6409289106d38f9ad1b2ecf73980df6b5 LoongArch: Add uprobes support

:::::: TO: Tiezhu Yang <yangtiezhu@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
