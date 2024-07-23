Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E608647
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 03:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721706796; cv=none; b=oLo39rVXiU+7MjsPXVSEticNbvRLkd621IAEzRDDcEhWwIlFbKhocu1P79HS2hRTcNIDiKw+KmpPdBt0QpGObJiHUL87mQWGIGistdcd+Bm1qMxp7C4xXaPgJjopQJpt6Mt9U1j54rEiz2uBFdOPNYRuQRki+J481JBYgIWxTNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721706796; c=relaxed/simple;
	bh=nSVd2DLzcNaPy+UBtEIFMwE0fLoBrYTGxA79XUaigwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rtaO/PTnTYse5NBOOcC38eBvf7C7GaqmrAIpecxShy5k0t41gfx4TcNmsZQXka8aG0q7vo5Peur9xZd0FXm5dG8l2Xbc8aU4wA0rxmv75/evDbLwHW17+njp/tqS0E1MTBL7NSeel4GVx2v4WjvMlfZ4nEmnmqms8TAhMymlmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dg902WKr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dg902WKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721706795; x=1753242795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nSVd2DLzcNaPy+UBtEIFMwE0fLoBrYTGxA79XUaigwo=;
  b=dg902WKrmiRKOtIunazATas9V7Y2ThDuw2U0A/tkBTcyoCk62NN+o8HL
   9nCFGZuJjJmFwykUbiI9OfreR8262ekENozfXFQkTF1OA4k/3YJ8WsT94
   V6DZ8ohe9vcJ+HHn6U+J+jhOZSCPDphoaHPB4VBph2K3JCScZpAbugeQc
   +XEuHQTZtGe0IML/4bsoYxiMdNV1szHe6NVjvLI1jGhZlBcoCmsfLAz02
   FX75pzJ3eb/fuBcNMfAyv/Aly1NYI4JcRXlbo3kghoupOf52ziJXaJk5n
   0NbTLMuvIr/bP2N3o5P+S+ADvbX4i3Crgiy72o6Nt/B315csIy6mvyjfu
   w==;
X-CSE-ConnectionGUID: mDaKTkNmQSy+BUp62tMU1Q==
X-CSE-MsgGUID: vZ+9+GuwRH22/EbASgNfIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29926864"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="29926864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 20:53:14 -0700
X-CSE-ConnectionGUID: 4oYA8GSCQfqdyAnADVa+uw==
X-CSE-MsgGUID: sj1rur8BQwSE9MSkMEGZYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="56252023"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2024 20:53:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW6aM-000lcG-2z;
	Tue, 23 Jul 2024 03:53:10 +0000
Date: Tue, 23 Jul 2024 11:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [linux-next:master 13132/13536]
 arch/loongarch/kernel/relocate.c:212:24: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202407231154.QJTaxbpZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dee7f101b64219f512bb2f842227bd04c14efe30
commit: 2d974d2671121272dbe8142e11c6a5ec28123d21 [13132/13536] LoongArch: Use correct API to map cmdline in relocate_kernel()
config: loongarch-randconfig-r122-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231154.QJTaxbpZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240723/202407231154.QJTaxbpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231154.QJTaxbpZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/relocate.c:212:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got char *cmdline @@
   arch/loongarch/kernel/relocate.c:212:24: sparse:     expected void [noderef] __iomem *addr
   arch/loongarch/kernel/relocate.c:212:24: sparse:     got char *cmdline

vim +212 arch/loongarch/kernel/relocate.c

   194	
   195	unsigned long __init relocate_kernel(void)
   196	{
   197		unsigned long kernel_length;
   198		unsigned long random_offset = 0;
   199		void *location_new = _text; /* Default to original kernel start */
   200		char *cmdline = early_memremap_ro(fw_arg1, COMMAND_LINE_SIZE); /* Boot command line is passed in fw_arg1 */
   201	
   202		strscpy(boot_command_line, cmdline, COMMAND_LINE_SIZE);
   203	
   204	#ifdef CONFIG_RANDOMIZE_BASE
   205		location_new = determine_relocation_address();
   206	
   207		/* Sanity check relocation address */
   208		if (relocation_addr_valid(location_new))
   209			random_offset = (unsigned long)location_new - (unsigned long)(_text);
   210	#endif
   211		reloc_offset = (unsigned long)_text - VMLINUX_LOAD_ADDRESS;
 > 212		early_memunmap(cmdline, COMMAND_LINE_SIZE);
   213	
   214		if (random_offset) {
   215			kernel_length = (long)(_end) - (long)(_text);
   216	
   217			/* Copy the kernel to it's new location */
   218			memcpy(location_new, _text, kernel_length);
   219	
   220			/* Sync the caches ready for execution of new kernel */
   221			__asm__ __volatile__ (
   222				"ibar 0 \t\n"
   223				"dbar 0 \t\n"
   224				::: "memory");
   225	
   226			reloc_offset += random_offset;
   227	
   228			/* The current thread is now within the relocated kernel */
   229			__current_thread_info = RELOCATED_KASLR(__current_thread_info);
   230	
   231			update_reloc_offset(&reloc_offset, random_offset);
   232		}
   233	
   234		if (reloc_offset)
   235			relocate_relative();
   236	
   237		relocate_absolute(random_offset);
   238	
   239		return random_offset;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
