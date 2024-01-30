Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF6579DC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706646511; cv=none; b=lG8vDRxkEDhM6Vk3CH8XZDXfSs3rlgGmmRBSfkF8lP4ZIIfJ5k0n6NlSFIhDkSJkDwEg+YcxrS8WmNTp/agtI0s5Aq2RocBiqR7sEdy7G32t0shEVnJI8nWefZuMpq+P5/bcbSdiA8kAaviTyl/x6MrQjALEyhgrvHNiBi6dsyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706646511; c=relaxed/simple;
	bh=XAsdYFMslhrwyfz2pvAOmZEI2D28QZUcYSbTnVjkII4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBfTLOQ0gQQKixwvF0kEGnphvPbGmqK7LZLdrvvnq11aVNUSOx4Etm2NGCpn3vMlKGoL0JJWQb9Jgojp2phm2A56YkZBnmOg6oVhuhgB4CjKgxZ9ejeMwzEAPA9RJHdPMKIPuhS6i91Otan7iRE+o8RvgOBRxzNqeLdFw3Cp5iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=beh+XRmf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="beh+XRmf"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a358ec50b7cso35064666b.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 12:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706646507; x=1707251307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VhA9/+DqbhNtyH8Fi/DSxBKClFXEVw6600bMEMsJnE=;
        b=beh+XRmfsoY7PjsQ1ODDsbEYcGXrVdWESiOkK7wzD+K+rv0TEdbMVDPP9wu0Bwm6wy
         ovWtvNrweLiruecEIqgKUCeaAzuYOcWP9XkpmPN5OceGopoqvAZUQqV/f8Nxvl+aRQby
         gFuwYi7zZNbd0woMt4wu5C/FOYLryW/4g8OBLbX1L/UXZX6bn6l6sACGzEhNyTjsfV5w
         WHcSXQIMn3OerHjwTIcc0VJmt25mg7PnPsK7gAo7Cy2vRlHm/TgladYndt4xg/lJ4Bjb
         6uIpjW/VJZzMuS6a7/VKkj6tJn/41xVtc/eCgoU6GC/e+2FabnPBkwxyaLIENEKqNpEF
         9ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706646507; x=1707251307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VhA9/+DqbhNtyH8Fi/DSxBKClFXEVw6600bMEMsJnE=;
        b=TH6DC7dLY9Aj0tb9thRzJKfc391ZtSS+6dskmGtZV0ukOsBD7Y8bsYlHogdQzd/NNC
         gjY+EbvF/t+CDrSZSeu3O3ZhNRKXR69qqUu6uoTJnBb7WQKO1kmL065uBUe9obcldEns
         W/FM/8qpm80xmKRyJJ/3iY7C5r7OfQxim1feF9d0moOVyDLQWY7hJr2Ya/qIH1JhbhY7
         zCOdM2+H1HWXcU9wvCvzlkVCgKQEW0Jycqyv4bVa9qrqCgrQUaRvTy7Ss25f9LP9q4I7
         uove3V8DwzoXDay8CZIZuyeCrP8nBRbzQiRq7J/5xV2nNMo0im3z25XqQeVPHybujLuR
         AnBA==
X-Gm-Message-State: AOJu0YwT3bQargG1UTZZsHTlmk73eO86g1Tm4k5nuGVm1qXHr9laXGGn
	g8bqZQNtKEgVhj2CsJyBnOYfy0FkycE6l4a1HVXMdsCrP0wd48/oyDXrAHebl84J/58O50OVR3T
	5SU06IwyZqH774kFPX0t1GL1Zk5lmAeWOYakGsQ==
X-Google-Smtp-Source: AGHT+IGOSDd5CSMtgON3icLA3rlL5R453rzGPfZEJyVCNZKco4S9vTqJBvVPdRDv6C9Ce45sWmuVelhjwkyCsNR61KU=
X-Received: by 2002:a17:906:780e:b0:a23:5939:759e with SMTP id
 u14-20020a170906780e00b00a235939759emr2452640ejm.26.1706646507416; Tue, 30
 Jan 2024 12:28:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401310055.wBrlZfRE-lkp@intel.com>
In-Reply-To: <202401310055.wBrlZfRE-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 30 Jan 2024 21:28:16 +0100
Message-ID: <CAHVXubj8R-HeJb6joDD4mRLAeoF0Ky+2YKWRubqs1Gjd2qKYyw@mail.gmail.com>
Subject: Re: [palmer:fixes 1/1] arch/riscv/mm/tlbflush.c:207:6: error:
 redefinition of 'local_flush_tlb_kernel_range'
To: kernel test robot <lkp@intel.com>
Cc: Vincent Chen <vincent.chen@sifive.com>, oe-kbuild-all@lists.linux.dev, 
	Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 6:07=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git =
fixes
> head:   eb70c97995147c7febb0f3ad67ca6210d19f5724
> commit: eb70c97995147c7febb0f3ad67ca6210d19f5724 [1/1] riscv: mm: execute=
 local TLB flush after populating vmemmap
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240131=
/202401310055.wBrlZfRE-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240131/202401310055.wBrlZfRE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401310055.wBrlZfRE-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> arch/riscv/mm/tlbflush.c:207:6: error: redefinition of 'local_flush_tl=
b_kernel_range'
>      207 | void local_flush_tlb_kernel_range(unsigned long start, unsigne=
d long end)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/mm/tlbflush.c:69:6: note: previous definition of 'local_flu=
sh_tlb_kernel_range' with type 'void(long unsigned int,  long unsigned int)=
'
>       69 | void local_flush_tlb_kernel_range(unsigned long start, unsigne=
d long end)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> vim +/local_flush_tlb_kernel_range +207 arch/riscv/mm/tlbflush.c
>
>    205
>    206  /* Flush a range of kernel pages without broadcasting */
>  > 207  void local_flush_tlb_kernel_range(unsigned long start, unsigned l=
ong end)
>    208  {
>    209          local_flush_tlb_range_asid(start, end - start, PAGE_SIZE,=
 FLUSH_TLB_NO_ASID);
>    210  }
>    211
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Yes, we introduced twice the same function in 6.8, you can find a
resolution for this error here:
https://github.com/AlexGhiti/linux-riscv/commit/756d1871f58edac455773db0bb9=
96f8d064a6b06

Unless Vincent should send a new version?
