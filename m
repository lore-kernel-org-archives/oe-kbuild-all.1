Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0692DCF41
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596583; cv=pass; b=tX5ceWUR+WqWYc4SEB+/jpzeyp9CHjOTsbafL0LAhNqfx5JzdTaLdXfpSM830poVP0zuVKyzdaOtOY93yDKWkxiyQfmLiEIKPxEP26qNqy4swU/fdvjQ5IOh5GIDHiu1Qi0uvO4IQNHcSBIKvJbgfak+0MmZRt0lzb+BBBJ7x0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596583; c=relaxed/simple;
	bh=QNt/4nb1yOfc10K+3rEYQyzDAJIynIp+UYo/ZIosCME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k98RQXB6bfHAClDVv7/yGYUdxi6T8BxgAvBLo8ysQnpLBdofEtkrYcFxCIo9K+MFQqGssLs4S0dpniANlKsP6+b8zSYblI9LuO2AORsqA6JmzzCIMwolqGfII7pJv2mtKG9Uf33flwLXWAtE30DlsZsd78SWAhhFGa9DSTyAVKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFXU0SIK; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFXU0SIK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso4236665f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 02:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769596579; cv=none;
        d=google.com; s=arc-20240605;
        b=ZdfTki03rk1HCDRpcYl/jboMContiZjdOFz3kre6pD8nvrgCNFT7pDvYhtQ+GLXUMa
         cEEZAiXG4OlgPiFsBS2c/0rHG+1O/t/RJQUBjTjseIYv9dz6SMBG5hs/5Te+I0ZpkcXO
         o1ZUkFBszRXNSXrC9w/9hwJaZFpOGyfQZbTXFcGLOBTY+qry90CEsyivCnr3bTyKhECp
         /eVDzWyEAmVZaU7Gb99NA3nVDJuFCY0DN7GEmpyUSNZxhR5nsR/33x+kUW4FtiHf2r6W
         reKiSinz3x0mdBpds+/byLm+RhhdV/ySYJ+lXT0IxDCDhWeNROMxYsCAiGVEN9mCT1xJ
         NSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aNGz1NdF+1GC7KQl+abP/x/JCTd+vu3I0VioJLZrLJA=;
        fh=vv57iBuvvZK5ileQZpzHaAMsPljD+yKmFVejiKV2zgI=;
        b=P6EsbpS85yz9eD7mTnDffHRqydjMlXeBB5wW7ZBwCcwTINOMBUJTnse22XITvvVdK7
         O2bS/SfYbvwNkr0bzRZAI81bKpJglVdwNwNNDAEYsPVWbU6dMtM+B3Zdeb/lEaH/CaU3
         JLvLxK7oQe+WHzcSSAu/LXGrXUZMVbSUDbI74rQOoS0c9QzzzZYYkmZwJUKq4hKBBJ94
         5vrXd5GuaysM//R5Ba7cNWWbcH8NsfMuL8CudAiFSjHJj+UaTKMRhEaPf+5sBxN4LvUJ
         uv2nicl3lhgJ25d4a+RkeBgDSELFyUV/MfBeZekkGRBMgtYA3G0u7k3rl32slSZ0lUHC
         uFQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769596579; x=1770201379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNGz1NdF+1GC7KQl+abP/x/JCTd+vu3I0VioJLZrLJA=;
        b=hFXU0SIKMzNoihZiY9q69p77nTd/JoFl4nSJo5q5Q9ZCgj2JmaIu8lr8OBaQltKwSy
         oVaTd5SGpAW2g3d3pn4AwtsjD+uwMdGP93tFCOM+NEP0jGWaFJDEQX++ebnvbqolYX+f
         LkNK1PuwsyE4qj+ePQfjYJEgxVK724cAfb6uXAHg6oFSZJrLb2kx28ILj8buSzNDVD6A
         nv+cf/zVAhcREvW70lCVjvCv8s7oVIN9mxYzBAjeAyX+SRdtEM9AjwPNbII7QWYZJ4BN
         oHlB3EzC09XSqN0c06jGv9U7GjBenujA9THeKdBQVvYM5Rrrxu0mmf3bbKvS68fgiE0L
         Fisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596579; x=1770201379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNGz1NdF+1GC7KQl+abP/x/JCTd+vu3I0VioJLZrLJA=;
        b=DISh5bYgKHt1AVmnelnMj8XEiMN8LSw0mr9mc/4vTq8zrY2uJ56lvyyTaZjd+8jjJ6
         hmYg6Fl72iBWVnMIxSL88kEneTR9ef2A+JljqC22VwFUL2yiO1i4nl4hackbxCPBa2sm
         H39nE9NoCyxYFUfKH+jvVojM0lkZ8uFc+PUXBK+x3bEr0lyR3gR7fe9gNozZYYwfvA19
         E8s8FMVMYza7Ro11UYjTiwI2JgjmwLAFp8SyKoIsYFP8+gAOOCYEXuam9wUoshdDGnad
         QyX/o72s9nEd944LEkzEaHOqRN64fxEDx++C7mM5lzkARMxnT6+YcrMsS9BSYIRW+Gpi
         tpyA==
X-Forwarded-Encrypted: i=1; AJvYcCX5WtsRKIytZqYgf3eHEEmxb8Go5tHtDJmwf/S/35GHWDNUR8qE5s1HaH/npEEKId5p9frsRX05lDNdJfAc@lists.linux.dev
X-Gm-Message-State: AOJu0YywMX5ZCx9WtxPemNoeM7I5m3YVR/odeP71kjnF7kFBAY2xFYY5
	sM7cmKvdOEaXP57ra+HPcJgmpidar8jut2obkhpafh+jwo7sidvIosJmlqNof0ROoMMEFH2/Z3e
	Vt1nEZvqZeybp04f7RStBSXJu1bSr3BE=
X-Gm-Gg: AZuq6aIypD64nPJdDBnweA2uSt60bhLEHnl3HtnfzcQ42RnC/0yZadxdYUmyxMaNtRF
	JD8KG1Iam/9n9rqPIrmash6zXpIFsQ2/+KBFNHhLxRiU5qWhJlCj8cUrAGUbwspgL9s7ZoGHOlJ
	eFDNOSzXcugjR5IeeoRysK7e1mklj4hhN6L0hNrxjDdlk9YzYfK2DHkIEL96OKwDJjSnOYUtTNb
	I160aWr9xW06qeYe+ORtXckAyqEHiiwuBb4nLmD5YMQuSnZkepq4EBtPBXy5t5QtGUYxCM=
X-Received: by 2002:a05:6000:4282:b0:435:a3b9:9b8 with SMTP id
 ffacd0b85a97d-435dd05aeb9mr7009532f8f.24.1769596578375; Wed, 28 Jan 2026
 02:36:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aXiF55y5D49gcpUg@adminpc-PowerEdge-R7525> <202601272006.NUdRcAIi-lkp@intel.com>
In-Reply-To: <202601272006.NUdRcAIi-lkp@intel.com>
From: Austin Kim <austindh.kim@gmail.com>
Date: Wed, 28 Jan 2026 19:36:06 +0900
X-Gm-Features: AZwV_Qj7MERsWUr2UR9-7KGxNj314Bp7cMumeTxY5gnB1yiNhAliYiHPNAkx7jk
Message-ID: <CADLLry6Ve2d07f9anQSbDeU4GUvSiCVMmSZuvDw2ntB4-HybwQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO ELF notes
To: kernel test robot <lkp@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Albert Ou <aou@eecs.berkeley.edu>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

2026=EB=85=84 1=EC=9B=94 28=EC=9D=BC (=EC=88=98) AM 4:14, kernel test robot=
 <lkp@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Austin,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.16-rc1 next-20260127]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Austin-Kim/riscv-e=
xport-kaslr-offset-and-satp-in-VMCOREINFO-ELF-notes/20260127-173528
> base:   linus/master
> patch link:    https://lore.kernel.org/r/aXiF55y5D49gcpUg%40adminpc-Power=
Edge-R7525
> patch subject: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO =
ELF notes
> config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20=
260127/202601272006.NUdRcAIi-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260127/202601272006.NUdRcAIi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601272006.NUdRcAIi-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    riscv64-linux-ld: arch/riscv/kernel/vmcore_info.o: in function `arch_c=
rash_save_vmcoreinfo':
> >> arch/riscv/kernel/vmcore_info.c:23:(.text+0x240): undefined reference =
to `kaslr_offset'
>

First, I apologize for the inconvenience.

This link error occurs when CONFIG_RANDOMIZE_BASE is disabled.
In the RISC-V kernel, kaslr_offset() is only defined under
CONFIG_RANDOMIZE_BASE.

I will submit a new patch shortly to avoid this kind of error.

BR,
Austin Kim

>
> vim +23 arch/riscv/kernel/vmcore_info.c
>
> cfe94d456775a4 arch/riscv/kernel/vmcore_info.c Austin Kim      2026-01-27=
  10
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  11  void arch_crash_save_vmcoreinfo(void)
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  12  {
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  13   VMCOREINFO_NUMBER(phys_ram_base);
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  14
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  15   vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=3D0x%lx\n", PAGE_OFFSET);
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  16   vmcoreinfo_append_str("NUMBER(VMALLOC_END)=3D0x%lx\n", VMALLOC_END);
> c41bd2514184d7 arch/riscv/kernel/crash_core.c  Ignat Korchagin 2023-11-29=
  17  #ifdef CONFIG_MMU
> c41bd2514184d7 arch/riscv/kernel/crash_core.c  Ignat Korchagin 2023-11-29=
  18   VMCOREINFO_NUMBER(VA_BITS);
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  19   vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=3D0x%lx\n", VMEMMAP_STA=
RT);
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  20   vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=3D0x%lx\n", VMEMMAP_END);
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  21  #ifdef CONFIG_64BIT
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
  22   vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=3D0x%lx\n", MODULES_VAD=
DR);
> 649d6b1019a2f2 arch/riscv/kernel/crash_core.c  Xianting Tian   2022-10-26=
 @23   vmcoreinfo_append_str("NUMBER(MODULES_END)=3D0x%lx\n", MODULES_END);
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
