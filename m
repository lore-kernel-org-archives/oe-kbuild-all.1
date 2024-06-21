Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7F16F0C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 23:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719013291; cv=none; b=ps4IikpJ8Df2ifRJrFo/Mla4UgN/8kUQEBA9CgOiPVvWzPbNNr2E9dmodnWspuVYqnqTHLdQHQZx/ePphuPN0VSw6tt611D83vBW5fOYyHvKEbCXh+PDZQhqAV/3axTv5ifM9ZRXV/Yv94eF0hVvq3S6KCiUhKujuSKe+BtP0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719013291; c=relaxed/simple;
	bh=3c2JKoHs1mokA13/ugGq9cnWn3ScDvS1Sht0jeVePRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g76wuYDh6oS8/wCCNeyN3d7YdUoab7jS3rwtSbZ1j9b4ScJYM0cy8UnG3esW6DzT74C9wC5sIap45sow9ncilnH4U3tMgCmOhdS3zJZBvVNJv+cMyWc8mFIvOeNTQFnY2CyAqSjmjp0pCf2lEQ1kxKvZysjcKrPbKWe8/pVYnU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmigU9pH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmigU9pH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719013289; x=1750549289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3c2JKoHs1mokA13/ugGq9cnWn3ScDvS1Sht0jeVePRE=;
  b=OmigU9pHkguyYWSEkKMLMJzYfDcnO04S79zaQAJQUtxeBE1oe25ESAe6
   dSASCGlkZHBtRQjjv1gmNnrDYfPfJ06ij84BTtqA4JI4vz+lfMh/wpLG4
   DtM+LqWL3kK1YKvFz9lOovTtkom9IWwIrdr2Y9BnomEk9j4x/HLkJdywR
   oeyVdHxwJ6F//FZHBhTsBLWSHYQ5APAPDD9lw+Lv9JZQRwXEp5VA2JOhm
   s5RDQRgStmHdNyi64STeKIpf4espa2OO7UIm4PJc75GqcJ6QPuynyOEav
   kJFNviC/qCjjZvoJkTZNj7YGUOs5Zzh07I1uRskQfgHjAmXY9pvKZWrFF
   A==;
X-CSE-ConnectionGUID: gn0mSrcwRDGh6I31u4jSsw==
X-CSE-MsgGUID: WDhgmXEzR4SkLky0Jjv9NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33609844"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="33609844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 16:41:27 -0700
X-CSE-ConnectionGUID: lOD9ZVfXTx6Hogv0ES/QNQ==
X-CSE-MsgGUID: RiXwVJGQSA63kAXJdPVcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="42836357"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jun 2024 16:41:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKnsi-00097e-00;
	Fri, 21 Jun 2024 23:41:24 +0000
Date: Sat, 22 Jun 2024 07:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Borislav Petkov <bp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] x86/sev: Move SEV compilation units
Message-ID: <202406220748.hG3qlmDx-lkp@intel.com>
References: <20240619093014.17962-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619093014.17962-1-bp@kernel.org>

Hi Borislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/core tip/auto-latest linus/master v6.10-rc4 next-20240621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Borislav-Petkov/x86-sev-Move-SEV-compilation-units/20240619-173322
base:   tip/master
patch link:    https://lore.kernel.org/r/20240619093014.17962-1-bp%40kernel.org
patch subject: [PATCH] x86/sev: Move SEV compilation units
config: x86_64-buildonly-randconfig-004-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220748.hG3qlmDx-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220748.hG3qlmDx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220748.hG3qlmDx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __sev_put_ghcb+0x7a: call to __asan_memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_es_nmi_complete+0x42: call to __asan_memset() leaves .noinstr.text section


objdump-func vmlinux.o __sev_put_ghcb:
0000 0000000000000190 <__sev_put_ghcb>:
0000      190:	53                   	push   %rbx
0001      191:	9c                   	pushf
0002      192:	5a                   	pop    %rdx
0003      193:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # 19b <__sev_put_ghcb+0xb>	197: R_X86_64_PC32	.data..percpu+0x24
000b      19b:	48 8b 37             	mov    (%rdi),%rsi
000e      19e:	48 85 f6             	test   %rsi,%rsi
0011      1a1:	74 4e                	je     1f1 <__sev_put_ghcb+0x61>
0013      1a3:	48 8b 16             	mov    (%rsi),%rdx
0016      1a6:	48 89 f8             	mov    %rdi,%rax
0019      1a9:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
001d      1ad:	48 89 d9             	mov    %rbx,%rcx
0020      1b0:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
0024      1b4:	48 89 13             	mov    %rdx,(%rbx)
0027      1b7:	48 29 f9             	sub    %rdi,%rcx
002a      1ba:	48 8b 96 f8 0f 00 00 	mov    0xff8(%rsi),%rdx
0031      1c1:	48 29 ce             	sub    %rcx,%rsi
0034      1c4:	81 c1 00 10 00 00    	add    $0x1000,%ecx
003a      1ca:	48 89 93 f8 0f 00 00 	mov    %rdx,0xff8(%rbx)
0041      1d1:	c1 e9 03             	shr    $0x3,%ecx
0044      1d4:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
0047      1d7:	c6 83 01 20 00 00 00 	movb   $0x0,0x2001(%rbx)
004e      1de:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
0055      1e5:	5b                   	pop    %rbx
0056      1e6:	31 c0                	xor    %eax,%eax
0058      1e8:	31 d2                	xor    %edx,%edx
005a      1ea:	31 c9                	xor    %ecx,%ecx
005c      1ec:	31 f6                	xor    %esi,%esi
005e      1ee:	31 ff                	xor    %edi,%edi
0060      1f0:	c3                   	ret
0061      1f1:	48 8d bb f0 03 00 00 	lea    0x3f0(%rbx),%rdi
0068      1f8:	ba 10 00 00 00       	mov    $0x10,%edx
006d      1fd:	31 f6                	xor    %esi,%esi
006f      1ff:	48 c7 83 90 03 00 00 00 00 00 00 	movq   $0x0,0x390(%rbx)
007a      20a:	e8 00 00 00 00       	call   20f <__sev_put_ghcb+0x7f>	20b: R_X86_64_PLT32	__asan_memset-0x4
007f      20f:	c6 83 00 20 00 00 00 	movb   $0x0,0x2000(%rbx)
0086      216:	5b                   	pop    %rbx
0087      217:	31 c0                	xor    %eax,%eax
0089      219:	31 d2                	xor    %edx,%edx
008b      21b:	31 c9                	xor    %ecx,%ecx
008d      21d:	31 f6                	xor    %esi,%esi
008f      21f:	31 ff                	xor    %edi,%edi
0091      221:	c3                   	ret
0092      222:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
009d      22d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
