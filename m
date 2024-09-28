Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366C7175D32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727521338; cv=none; b=Aor5ofbJjz9xTK8hFBYWmmSncC0pEsf0MRl6532wJG8jwtGgdpppra5iqFNgGeXiL7/qJ1mowY7E7czDW6rH+LHbMynqN2htqpVJa4EWNA0uK78WO9XLE9dY9JoAKEUyZuPGHPlHrKavlJOeUqxAs4MdTOoHuo1E2rS6THCh+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727521338; c=relaxed/simple;
	bh=8vX/FexqQrU54V/LJwNqJH1P9C4n1tgqge0ORo624ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDpbAAVHbG8W1Ln+z0isyAV4nJnVsHQmAoidNf/m7l7QNTmmMhf8HXrXjpn9n/z4p32nqAAd26Xx7jAU0mfpasuJGC0nPiPGMbtHK0/UghRr3OewqYaCjS6sZ14MZRYrCqITfIrOiSW8jTauHGxLLrSb+piHp+dzsSwauWqiBWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HG2k7+u3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HG2k7+u3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727521336; x=1759057336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8vX/FexqQrU54V/LJwNqJH1P9C4n1tgqge0ORo624ww=;
  b=HG2k7+u3x+4TPkj1f3vF/GjcZArfcY4setRVrCQmCXh4nfjpHCcL5wY7
   U92d6AEAwKF5FQPQllITPF8FGJ37Bs+K/vENv1FI2Jo0aLOW0JWiTOcEc
   Vvi5R5k/ZO8tP62ZO7CBy/9chzkNkGMZxQrrNPqQ/1SWtgbim2Mkvshvm
   S2ZIC8YWvtLEbsNMNgprbnpmvauSHeYOf+hpsVsiBWD5ah7McASrRebvH
   u1qoQaYBrnTKCQh/mNgz54u2yYngWkfRpbEePD8w7XyIyi76p1c4WH+/L
   p7qq9a8Bi9Iwcbkym10hZUDi9aQbZj9iTOLFEx2LwBJK87U+pY+zPJw+e
   Q==;
X-CSE-ConnectionGUID: jGPfyGe+TL+pYNbUPUIbXg==
X-CSE-MsgGUID: gNWmTsjKSz2G2IBIXBxBoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="52076574"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="52076574"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:02:14 -0700
X-CSE-ConnectionGUID: kpwziXCEQdWLVEpccSJn8A==
X-CSE-MsgGUID: hck5sL5pR3aTjy56C+s/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73107923"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 04:02:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVDG-000NCW-1j;
	Sat, 28 Sep 2024 11:02:10 +0000
Date: Sat, 28 Sep 2024 19:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 9/10] arch/x86/um/../kernel/module.c:289:
 undefined reference to `apply_direct_call_offset'
Message-ID: <202409281901.N6emlpOm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   4e155f6fbba48ed677042026d7732c6256ffa166
commit: 76743359658d730ecba565019069d870d30fe3b8 [9/10] x86/ibt: Implement IBT+
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240928/202409281901.N6emlpOm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281901.N6emlpOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281901.N6emlpOm-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: arch/x86/kernel/module.o: in function `module_finalize':
>> arch/x86/um/../kernel/module.c:289: undefined reference to `apply_direct_call_offset'
>> /usr/bin/ld: arch/x86/um/../kernel/module.c:293: undefined reference to `apply_direct_call_offset'
   collect2: error: ld returned 1 exit status


vim +289 arch/x86/um/../kernel/module.c

   222	
   223	int module_finalize(const Elf_Ehdr *hdr,
   224			    const Elf_Shdr *sechdrs,
   225			    struct module *me)
   226	{
   227		const Elf_Shdr *s, *alt = NULL, *locks = NULL,
   228			*orc = NULL, *orc_ip = NULL,
   229			*retpolines = NULL, *returns = NULL, *ibt_endbr = NULL,
   230			*calls = NULL, *tails = NULL, *cfi = NULL;
   231		char *secstrings = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
   232	
   233		for (s = sechdrs; s < sechdrs + hdr->e_shnum; s++) {
   234			if (!strcmp(".altinstructions", secstrings + s->sh_name))
   235				alt = s;
   236			if (!strcmp(".smp_locks", secstrings + s->sh_name))
   237				locks = s;
   238			if (!strcmp(".orc_unwind", secstrings + s->sh_name))
   239				orc = s;
   240			if (!strcmp(".orc_unwind_ip", secstrings + s->sh_name))
   241				orc_ip = s;
   242			if (!strcmp(".retpoline_sites", secstrings + s->sh_name))
   243				retpolines = s;
   244			if (!strcmp(".return_sites", secstrings + s->sh_name))
   245				returns = s;
   246			if (!strcmp(".call_sites", secstrings + s->sh_name))
   247				calls = s;
   248			if (!strcmp(".tail_call_sites", secstrings + s->sh_name))
   249				tails = s;
   250			if (!strcmp(".cfi_sites", secstrings + s->sh_name))
   251				cfi = s;
   252			if (!strcmp(".ibt_endbr_seal", secstrings + s->sh_name))
   253				ibt_endbr = s;
   254		}
   255	
   256		if (retpolines || cfi) {
   257			void *rseg = NULL, *cseg = NULL;
   258			unsigned int rsize = 0, csize = 0;
   259	
   260			if (retpolines) {
   261				rseg = (void *)retpolines->sh_addr;
   262				rsize = retpolines->sh_size;
   263			}
   264	
   265			if (cfi) {
   266				cseg = (void *)cfi->sh_addr;
   267				csize = cfi->sh_size;
   268			}
   269	
   270			apply_fineibt(rseg, rseg + rsize, cseg, cseg + csize);
   271		}
   272		if (retpolines) {
   273			void *rseg = (void *)retpolines->sh_addr;
   274			apply_retpolines(rseg, rseg + retpolines->sh_size);
   275		}
   276		if (returns) {
   277			void *rseg = (void *)returns->sh_addr;
   278			apply_returns(rseg, rseg + returns->sh_size);
   279		}
   280		if (calls) {
   281			struct callthunk_sites cs = {};
   282	
   283			if (calls) {
   284				cs.call_start = (void *)calls->sh_addr;
   285				cs.call_end = (void *)calls->sh_addr + calls->sh_size;
   286			}
   287	
   288			callthunks_patch_module_calls(&cs, me);
 > 289			apply_direct_call_offset(cs.call_start, cs.call_end);
   290		}
   291		if (tails) {
   292			void *tseg = (void *)tails->sh_addr;
 > 293			apply_direct_call_offset(tseg, tseg + tails->sh_size);
   294		}
   295		if (alt) {
   296			/* patch .altinstructions */
   297			void *aseg = (void *)alt->sh_addr;
   298			apply_alternatives(aseg, aseg + alt->sh_size);
   299		}
   300		if (ibt_endbr) {
   301			void *iseg = (void *)ibt_endbr->sh_addr;
   302			apply_seal_endbr(iseg, iseg + ibt_endbr->sh_size);
   303		}
   304		if (locks) {
   305			void *lseg = (void *)locks->sh_addr;
   306			void *text = me->mem[MOD_TEXT].base;
   307			void *text_end = text + me->mem[MOD_TEXT].size;
   308			alternatives_smp_module_add(me, me->name,
   309						    lseg, lseg + locks->sh_size,
   310						    text, text_end);
   311		}
   312	
   313		if (orc && orc_ip)
   314			unwind_module_init(me, (void *)orc_ip->sh_addr, orc_ip->sh_size,
   315					   (void *)orc->sh_addr, orc->sh_size);
   316	
   317		return 0;
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
