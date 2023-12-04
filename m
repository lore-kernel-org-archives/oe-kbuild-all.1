Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0832837F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyN0FeGa"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-548f853fc9eso5852402a12.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Dec 2023 06:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701698974; x=1702303774; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7YWLKYL+TZy0FDvwaUZBqPs1GQRI/NVi7Z/lE5VeVA=;
        b=EyN0FeGaZDibIHtlURniCS8bb0IYdkox67hbibFeCNafbHaJSbADGYXIUf+Cbh36jb
         xWFFpyy4ZXe/QquglWeCdAnspuJQzbeA60S2CFOk6b9iVJKy1LsoCtLEzMyjell5p6Uo
         l9/aZbMw+3Bvum0e9aZcCd7NwZg2HlzWT9dQZjujq+ArAaVUpLbu+rPGoFNQjsgusTFC
         nKlliRKYFssVDa2DGNTPWP31ZSftxMRKhZHbAr28J1UqPeq6w7YY0ID8mM0LRyRdqbNV
         P7Un4AYeow3mSjEgjO+wVtdTx2f0qUi91PaWX6TaHUrub/nWG9xA5KNuQC3KEcD0KF82
         YgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698974; x=1702303774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7YWLKYL+TZy0FDvwaUZBqPs1GQRI/NVi7Z/lE5VeVA=;
        b=Ym+YlRdFrAAz0Z/GWxZFTxKxJyMWJx2rWKem3WEezL2TuBnCdgMTJSwyLM03dKMCCl
         IEaM4b3cZsZlpw5GuyxjL30N+/ErGwXimsHhztpPNa2Coi4JHyLhhJD/BPJL/kMVVeM+
         6/3WOtn70YLA3VQRLYaIA1gC0xCXxq7/Y9D4CXuH/yi6wwiKUF8uB07fxxVHXhn/2wSa
         tM9f1EfMldm3zLEafhTQ2xba6Ao81nAN1iUTqioY3oTaTar2Xy+vYFQEbHp/qdl2Z9cL
         5bc2DhBmAGEFPT/RDOUOhQrDDZj1BEHrjMOXnyrvye7RCVKGTIDMnDTEqmjD+le747DB
         4JcA==
X-Gm-Message-State: AOJu0Yx9B9AdLxVf+fabokEda/KrkU6VI6JGOZwEjdXbWufZWdGcpC9F
	wn1kDlJBy7wKg03gEXg6l7I=
X-Google-Smtp-Source: AGHT+IEKL6I3Me3IGNDzZQExj7E7RsatGLFgDyXh3e3OviqfoXTTEGQeOZ/7ee3tEg3WaSqPC9bDzw==
X-Received: by 2002:a17:906:73c2:b0:a19:d40a:d1e8 with SMTP id n2-20020a17090673c200b00a19d40ad1e8mr1648024ejl.180.1701698973692;
        Mon, 04 Dec 2023 06:09:33 -0800 (PST)
Received: from mail ([87.66.46.106])
        by smtp.gmail.com with ESMTPSA id gq18-20020a170906e25200b009ad89697c86sm5416098ejb.144.2023.12.04.06.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:09:33 -0800 (PST)
Date: Mon, 4 Dec 2023 15:09:32 +0100
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Dan Carpenter <error27@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, 
	kernel test robot <lkp@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	linux-sparse@vger.kernel.org
Subject: Re: drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast from
 restricted pci_channel_state_t
Message-ID: <ilupya2l2yaseiokhgal65alkzbubylgz3nkdabqipi3xhbzxi@dkbofpqmuwdn>
References: <Y/7ZzYyisv1ylrho@kadam>
 <Y/7YN7U9Q2iqNDFo@kadam>
 <20231203165932.GA6480@wunner.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203165932.GA6480@wunner.de>

On Sun, Dec 03, 2023 at 05:59:32PM +0100, Lukas Wunner wrote:
> Hi Dan,
> 
> > > Please advise whether these sparse warnings are false positives which
> > > can be ignored and if they aren't, how to resolve them.  If you happen
> > > to know the rationale for the cast, I'd be grateful if you could shed
> > > some light on it.  Thanks a lot!
> > 
> > The question is more why is pci_channel_state_t declared as __bit_wise.
> > __bit_wise data can only be used through accessor functions, like user
> > pointers have to go through copy_from_user() and endian data has to go
> > through le32_to_cpu() etc.
> 
> __bitwise is not only to ensure endian correctness.  It can be used to
> define data types which are integer-based, but treated as a distinct
> data type by sparse.  A pci_channel_state_t value cannot be assigned
> to an integer variable of a different type, for example.

Correct. It was done on purpose to make a sort of 'strong' enum type,
and thus warn if pci_channel_state_t values are mixed with some other types.
 
> A few arches define arch_xchg() and arch_cmpxchg() as pure macros.
> The sparse warning for pci_channel_state_t does not appear on those
> arches.  (These are:  arc csky riscv x86)
> 
> All other arches use a mix of macros and static inlines to define
> arch_xchg() and arch_cmpxchg().  The static inlines use unsigned long
> as argument and return types and the macros cast the argument type to
> unsigned long.
>
> Why are the casts necessary?  Because there are callers of xchg() and
> cmpxchg() which pass pointers instead of integers as arguments.

Hmmm, I'm missing the precise context but it make me wonder what's happening
on 64-bit archs where enums are usually only 32-bit ...

> Examples include llist_del_all(), __wake_q_add(), mark_oom_victim(),
> fsnotify_attach_connector_to_object().  (Note that NULL is defined as
> "(void *)0".)
> 
> When using xchg() or cmpxchg() with __bitwise arguments (as is done
> by commit 74ff8864cc84 in pci_dev_set_io_state()), the arches which
> define arch_xchg() and arch_cmpxchg() with static inlines see sparse
> warnings because the __bitwise arguments are cast to unsigned long.
> Those arches are:  alpha arm arm64 hexagon loongarch m68k mips openrisc
> parisc powerpc s390 sh sparc xtensa

OK, if the underlying macros do as:
	switch (size) {
	case 1: ...
then things are ok there (but only if the size is given by a sizeof() of
the correct type (not casted to long or something).

> Indeed adding __force to the cast, as you suggest, should avoid the
> issue.  sparse cannot parse the inline assembler, so it does not
> understand that arch_xchg() and arch_cmpxchg() internally perform a
> comparison and/or assignment.  By adding __force, we therefore do not
> lose any validation coverage.

Yes, indeed, using __force inside specific accessors or any low-level macros,
like here these arch_xchg(), is OK. It's done in plenty of similar cases.

> A better approach might be to teach sparse that arch_xchg() and
> arch_cmpxchg() internally perform a comparison and/or assignment.
> Then sparse could validate the argument and return value types.
> 
> builtin.c in the sparse source code already contains functions
> to handle __atomic_exchange() and __atomic_compare_exchange(),
> so I think xchg() and cmpxchg() should be handled there as well.

I don't agree. Sparse shouldn't know about the semantics of functions
in the kernel. Sparse offers some tools (annotations like the __bitwise,
noderef or address_space attributes for __user, __iomem, ... and type
checking stricter than standard/GCC C). By using these annotations, the
kernel can define a stricter semantic, that better suits its needs,
Sparse should know nothing about this, it's not its job.

Best regards,
-- Luc
