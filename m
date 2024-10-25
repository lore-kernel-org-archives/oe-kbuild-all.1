Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFFC800
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880061; cv=none; b=E6+7WQyEStG8JXj/TR5OPku+atsXJz6D73HYaHAjObmfv8h4jfu5+hfh37PTHOZVcfq/0X46vrTxHSsO4sPEggD7A0G1hwW4pPk9qD4uScVmQrT7UWurgTd90xG/jgxweIZI4dM05fPM2wHXpKxY1B2aV+CUFBnIHDDFe80kpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880061; c=relaxed/simple;
	bh=RUBdo8xhWLnr4lmOrbAMcDyiq3wloM5129FHujLTsdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EENg52ilmLIKtJUam61ZbQ4pLUvMWt02//C8EGVaXE0Xn+Pco/IJllsQfkdXSbkERLSn1D8upSyJ/yKmHeWzZZvBw/5aJ3leXyb4V0hoyoiroPKTyQCMtx0QGVWAwn4cVv6mVA++PHxq19fTGf3yZ9eAdyQDywrzct+zNYhr22E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ye69E4xJ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ye69E4xJ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-460969c49f2so34031cf.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729880057; x=1730484857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRQv+y2IqS7AxTEkkTnJFxtyxoD2fpd8WHbtE3K+zR0=;
        b=ye69E4xJCqtN1+WX5+hnGn/je49nJb+EYJd9gvUtu2h4PbVNHa4evWFqQaKaz4hGfR
         jelWiK0t/aAPkIw1iEvjd1Ljut08a5sVzQYiHpCIhKweh1k3OR8QD23GvXXqS86NiDwp
         xbeer7Ag2/fPwbEQATLtu7o0y3x9ydOHMjeu2D9IxpGjlIgC+tSt1xm0y2RyZZLKg8S4
         QaONr+/F9C+W6w+EgH2L/VkMUR5zjCJlxhDkeowt4aBnEf5fozlhPwSIVvTET+fSIOzW
         wgJLuGCRjbZfpj7EIIgD5PFbuzgRz7wOFomDyYW3sU0q6cfsy4Clv3MmbpKry2xqhYXE
         eCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880057; x=1730484857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRQv+y2IqS7AxTEkkTnJFxtyxoD2fpd8WHbtE3K+zR0=;
        b=FuStosZCxyIBnCAEFAujK2kynkmdNpafTuHvtBC3T7qY5BihHnxke0IkJ9PeOsc7om
         9qRxNz5uyxdqSERuh9AHiufasHJqgA9tL8LBzbw/ePJinD0R99irRS2EG2fpvPPChNDa
         9rbFjeOxDVR8DSQIq0KLuuqRzqOpEGFkPH267veVFkksVsnu5vLpvaX3EH6ZjIIefeHf
         GZNCFVtlH9BA1vXbpX0Jw1yfHiFyQSKgarT22mN9VWb60xkW31YQ22HhWoHbRIq7vyj/
         xLP7QQJ0wT9fmdjxPw0ugoZDWRvJEwWmt/L80g71IvWy8TUt02qpJPBiUtfhhVdtZJ/c
         Y8lA==
X-Forwarded-Encrypted: i=1; AJvYcCXBAbF7k8AwHGXSbXs0luskvITXq8XVXeM+J36iNWbNDRLIVO1iGHn0jidQwRI77NHj0czOxnT8dONKnK/N@lists.linux.dev
X-Gm-Message-State: AOJu0YzPBgLCUS5Q8q+etJYdzBqBrrkLML4GAKYuN4G7bfI2kUk8ynCf
	KYGn0l2UnZ4q8yAs5a36pijGyJoI3sm8mjsW3ZkmLHuY3/4teuq8A8geLbyI1GJb+iWcUEe7yOE
	pehKTEio2qeXfJX+XuV4yfriKKE/7iUatGwZz
X-Google-Smtp-Source: AGHT+IFCW3snO8WDCQ5BeVi/grnTyWnYHJ2KPU63NjiD9zruPXeiJiTQ7RWvWm05eyfhy4acsLFvFYXWJJ/0LRjfv5E=
X-Received: by 2002:a05:622a:1206:b0:461:2e49:f1f8 with SMTP id
 d75a77b69052e-4613c01fd6dmr200681cf.4.1729880056835; Fri, 25 Oct 2024
 11:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023224409.201771-4-xur@google.com> <202410251411.eRNArTOZ-lkp@intel.com>
In-Reply-To: <202410251411.eRNArTOZ-lkp@intel.com>
From: Rong Xu <xur@google.com>
Date: Fri, 25 Oct 2024 11:14:03 -0700
Message-ID: <CAF1bQ=RmUbPGro2c+0mukG7PjP4OMgZEqjmfRnOudt_N12vzvA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] Change the symbols order when --ffunction-sections
 is enabled
To: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can reproduce the build error.

The reason for the error is because in CONFIG_SPARC64, the symbol
swapper_tsb needs to have a fixed address of 0x0000000000408000.

In arch/sparc/kernel/vmlinux.lds.S
 37 #ifdef CONFIG_SPARC64
 38 ASSERT((swapper_tsb =3D=3D 0x0000000000408000), "Error: sparc64 early
assembler too large")
 39 #endif

This symbol resides in the .text section. The patch relocates "cold"
functions (tagged by .text.unlikely) to precede other symbols within
the .text section. This pushes swapper_tsb to a higher memory address,
and we have the assertion.

However, this sparc code appears incompatible with the original linker
script. The original script prioritized .text.hot symbols, placing
them before others in the .text section. Currently, no functions are
marked as "hot" in the source code.  If a function were marked with
__attribute__((hot)), the build would also fail.

I don't know a good solution other than adding a branch to the
include/asm-generic/vmlinux.lds.h.

@Masahiro Yamada: I'd appreciate any further suggestions you might have.

Best regards,

-Rong

On Thu, Oct 24, 2024 at 11:47=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Rong,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on eb952c47d154ba2aac794b99c66c3c45eb4cc4ec]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Xu/Add-AutoFD=
O-support-for-Clang-build/20241024-064725
> base:   eb952c47d154ba2aac794b99c66c3c45eb4cc4ec
> patch link:    https://lore.kernel.org/r/20241023224409.201771-4-xur%40go=
ogle.com
> patch subject: [PATCH v5 3/7] Change the symbols order when --ffunction-s=
ections is enabled
> config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archive/=
20241025/202410251411.eRNArTOZ-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241025/202410251411.eRNArTOZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410251411.eRNArTOZ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> sparc64-linux-ld: Error: sparc64 early assembler too large
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
