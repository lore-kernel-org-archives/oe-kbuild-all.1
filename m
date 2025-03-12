Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357F15A856
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741799005; cv=none; b=CmBLEFeh1Za6xukjJygBOS2Xdwfa1J0p1ljgvjeoamxQxan7nhazRPZpg3ZlMDU2pD6zZ/5e9DQ0ocSlD9yBZodztgC8bWcVyDbF7at+jD8z+yP5d5hXOpjA1t1D0pqB0TiYPucLWoOw2/TruvnQ/YmOYCY161JHM3yU8oN7Xg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741799005; c=relaxed/simple;
	bh=d5RGvl8vBoar8un/jsN1v4d7Svv0i3evEbpzBZWUlY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aruQn+qgxQAUnkf8GjjYgMmiRRbpwcP7WUnQKM5gL4Jjwc3Pc5uEm3fjjjAzDTpqmrtGQFqJR8q+XHySh5C/i2uqXSXh12AA7McsfqKIkKbBSSjpy8OM0S3VhrMhR4jxU4rN4jVGXt8Aiy7V1hB+dv1jlkuvZlG+UVm9SCS7uf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji/ytpwB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji/ytpwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741799004; x=1773335004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5RGvl8vBoar8un/jsN1v4d7Svv0i3evEbpzBZWUlY4=;
  b=Ji/ytpwB2nG3Nje4hgc8fOBH7y49wdCbK+A0Q8P+G5wVNfTSyy/+cvpM
   FWZ0LYZaGuuYjoJWUgh3VbtbQ/uU56ufMDHuwEIbTbs+tH9LGTHdxw958
   trFzPW1zG+087hAHlurTEnA/nva1arSk+65WJf7KzLT4hJHoWDVf+rFRP
   sfp20yRqy0MQZDtfc/1RqD3bwTur/rr68mQnX7qwz4qDT2XJ3/H2aS7mp
   SEYKq2LNX1+JoF9VMpYZK/avXGJlH6Cw36XUuT0CQdsXN8SQiZHAjLrtm
   hlbX+0MDDERykkbW59C6dsrEG8e06cqOKaednvm7jJPuiiZJxqa2+/QJR
   w==;
X-CSE-ConnectionGUID: qdxpvVygSvKdomTanuOSbQ==
X-CSE-MsgGUID: XtBdT6wdRiqqPEpGQYN3gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43022809"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="43022809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:03:08 -0700
X-CSE-ConnectionGUID: 5whcqBtHSR6z+1Yo4Ot6jQ==
X-CSE-MsgGUID: G+dn2kkvTi+TYxCwnr26yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="125581491"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Mar 2025 10:03:07 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsPU0-0008km-2x;
	Wed, 12 Mar 2025 17:03:04 +0000
Date: Thu, 13 Mar 2025 01:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 544/559] <instantiation>:1:656:
 error: register %rax is only available in 64-bit mode
Message-ID: <202503130140.2sJ85txy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   19d29c162431b011851da585a666f5cab297454c
commit: d1f341d75e00da90d7cbab70ce7958789f0692ab [544/559] KVM: VMX: Use WRMSRNS or its immediate form when available
config: i386-buildonly-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130140.2sJ85txy-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130140.2sJ85txy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130140.2sJ85txy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:1:656: error: register %rax is only available in 64-bit mode
>> 740: 740: mov $0x00000048, %ecx; xor %edx, %edx; mov %edi, %eax; ds wrmsr ; 741: .skip -(((744f-743f)-(741b-740b)) > 0) * ((744f-743f)-(741b-740b)),0x90 ;742: .pushsection .altinstructions,"a" ; altinstr_entry 740b,743f,(12*32+19),742b-740b,744f-743f ; .popsection ; .pushsection .altinstr_replacement,"ax" ; 743: mov $0x00000048, %ecx; xor %edx, %edx; mov %edi, %eax; .byte 0x0f,0x01,0xc6 ; 744: .popsection ; ; 741: .skip -(((744f-743f)-(741b-740b)) > 0) * ((744f-743f)-(741b-740b)),0x90 ;742: .pushsection .altinstructions,"a" ; altinstr_entry 740b,743f,(21*32+ 8),742b-740b,744f-743f ; .popsection ; .pushsection .altinstr_replacement,"ax" ; 743: xor %rax, %rax; mov %edi, %eax; .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long 0x00000048 ; 744: .popsection ;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ^~~~
   <instantiation>:1:1: note: while in macro instantiation
   ALTERNATIVE_2 "mov $0x00000048, %ecx; xor %edx, %edx; mov %edi, %eax; ds wrmsr", "mov $0x00000048, %ecx; xor %edx, %edx; mov %edi, %eax; .byte 0x0f,0x01,0xc6", (12*32+19), "xor %rax, %rax; mov %edi, %eax; .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long 0x00000048", (21*32+ 8)
   ^
   arch/x86/kvm/vmx/vmenter.S:141:2: note: while in macro instantiation
    WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
    ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
