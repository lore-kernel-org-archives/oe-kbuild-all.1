Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DEB22129F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 02:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667062; cv=none; b=Kid2B/+2rKFz0U8wdpTPtCFSFtt0QRgAzmOvZNbymFv2V1XQzuSRHkNMQCEBWQadPoNGMLzQ8F+hXJsumwezicEi7SkOqGPQbq2GmcfD3nwfAXUdEKLnuNxIRDdTQET47/39rJfgSR6zq/bky5RASGpneSLs1LOiD4hbQ/0p87I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667062; c=relaxed/simple;
	bh=9a4n2kPDzF0DXccy7fQpDqoOMcVW96AL3BwAsewKImk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq6mF46zQOlEdO08sck5DRmV+muu64aCd7an2lBgc+Ug+cMGtZsC7kROxLkNbR/o2IAbgkNKQubcqJWn4icnBqCpaWPcvYvJM74qOs95NZuM4sh6IP2G8KfcBvWGCn6Et7100StJp1olzButECBh+3FfY/UDOS/EZVAoY0NPnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWKf6+fq; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWKf6+fq"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a347c424aso5652986d6.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 18:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767667059; x=1768271859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PneSlTXDqotjglO3Y2Knzidjrv0hwlCbWEle0lUDcE=;
        b=jWKf6+fq0ZkxtPL9Fmj318zru2YxffIfhA+k8hJDZuIL9etBNQ7tO45be8MTejkXqF
         faQh3Fd9SNrMTqju5D7GuX250CGPpioDwrjHA4VYH2v4cxCrZNDPx6swXyI1+5mi7njr
         uyfjEzlN4KrLRe65+kwO5BKT+vQVapB+56+sCr+FENDMGgUdzxOk8SHOyU90Efd0y0OF
         MSvCT2tpZ4kKNinx5ByI0Wp+mQL/iz3oHFjLZ8MUQhIeZDiVaVDXBjo2k/FNqNBd58At
         nJJFJKgAcdSiF51gpuS0xuzdOX64qayDNnqJuWOoE5He+lsbLUIcbZFk0aiaE8H4Wdlf
         CByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767667059; x=1768271859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3PneSlTXDqotjglO3Y2Knzidjrv0hwlCbWEle0lUDcE=;
        b=FAtrLJtjDY7Z8DeQrAZ5/rsH6EqCPSLeVvXN5Myvo4pRltH2XOPCgU8cDbREyK+9Dm
         ekeRUgBg35aKobb1GectahsETk+YgByksLwXmH1ntFxeYOlG+sxh9Am441oVhnZ+QXD8
         xdgjU5aML+mD0W02BZIM1s88bJ1HECn2e0Zj1apkoLZlbx0mnklmAQ9hkIlfDrwz9EHS
         aHY7b5b2vpLZgUch/AlVrgOpZ+eF0p0KHBFhV2pj9q6s9K4XWCwM1u8uaTDL3pY67tjX
         69BoJPerKNZUKe8K89yuui8GlmJ5pndBxhbSb6+HS7De8VBKYMkgtnlHMi/zL63I4ViZ
         zkcg==
X-Forwarded-Encrypted: i=1; AJvYcCWtggAuBMCCw5uaAkhwdXWeb1INJlMwd/G4VSMWDKtYEziVJ0+o5sa6RBV8QIxd5Rt7LSQktthCcMIC4ZZ7@lists.linux.dev
X-Gm-Message-State: AOJu0YwhxJ66hVDd/ZMhbiz54/GdXKzhIxDLlK/Am/HKw5XrCQcjfXtX
	LSiQdMWfkB+7XcafqoanQygILmBOdXNf88ikCq5AL9kvedZ104IFIBMQVds/2jpb
X-Gm-Gg: AY/fxX7Jf9N0MTVZc9GlK/t6MDLJgM0egm5gYZoGb5rylo0nJ0vNU7DDBaqPzDeXaO2
	Ryf9jOT4RmLnspavCTAK7gG3Fb8yL1XNpubkB5F85FWm+xBHL6x105PRarCVOiZbVPqhx/tcs5l
	8aPPq/lpiNgaPMTKFsP0clnTtuFusZwSwVJDnlwGBSGz9Gjzulx0fe1pqYci2DuLncA71MextAi
	asfMsFQBV6/OJTy20bHKc/kN3l6D6OEpOw4hlv9H+Gmv4KtT8eFqaZlIJRxLR8aM2Iy1j8m843L
	PIlVrZ2RPMZ9yo+vNsO0rgdFMNIDpX+l5xN+aa56kFYFeKsOFx+QauUG2WsKxp5d+CDY1d5xK3Q
	djqFAgu0swXYxMQlQiJpTR25ybCLU97yCTwNY0waJlBdcBYN7Mrtr48i/vDxyyw6hTWhWSQsnem
	P4LolJeJFFYlUE8P2dhcLYj20iZmRMEXWYUAusIt7Aryx5fO/uKjSl/RPQs7wVsJGZGnHW4gmwf
	FiYT2Uk2VpfKGU=
X-Google-Smtp-Source: AGHT+IH/ZnViArMDusDnASin1cg4KvwlFUBMfsXmrGNUlYaoDSSPkbXVeTNfTyQwJuK1hW94jJnL2A==
X-Received: by 2002:a05:620a:1aa8:b0:8c3:55bf:735b with SMTP id af79cd13be357-8c37ec06899mr194116885a.81.1767660549347;
        Mon, 05 Jan 2026 16:49:09 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f540650sm62900285a.47.2026.01.05.16.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 16:49:08 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45B0CF4006A;
	Mon,  5 Jan 2026 19:49:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 05 Jan 2026 19:49:08 -0500
X-ME-Sender: <xms:BFxcacLaYSZeaZHCInRCEKx1t7gio2sOan8nMWlaOAftxb6cMbzZig>
    <xme:BFxcaVi8cvoZQl5Yjxu0XkAdVD9WiLnvhLKqIGJ56Jkc-Uv-6oKEtDTmaK-O0_FI3
    skFnOJcgXWWFOPCRuNqRWaplgcZn0dYLpM2dMrks1atArfO6zbR6A>
X-ME-Received: <xmr:BFxcaVN_MHnqRgCLmuuW_xddB_5EgJOgN5rf_SgfuEUzcrr7m0ALSh6C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepfeffudehveduteeuffeutdetieeftdelfeelveffffevteeffedtteehteegkeeg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegs
    ohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeige
    dqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihig
    mhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepfhhujhhithgrrdht
    ohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehllhhvmheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpd
    hrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrihgughgvghhrvgihshdr
    tghomhdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhsohhluhhtihhonhhsrdhnvg
    htpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohep
    mhhinhhgohesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:BFxcaY5Gx8Jp86sLaYoazAtB9DP7v3tKbfmtFZVR8YT1OUkyVSK-sw>
    <xmx:BFxcaUmk0QWQ3Edbq7ih6qmgSAky7Qhn95FtxRYszP2gv4lO5huQHQ>
    <xmx:BFxcaQJTqkKpqJuZCkQAsFeM0C0nkyz3vT60LAhR_03jL-g4nAaoAg>
    <xmx:BFxcaUTG5mSIvQgOY_GbRZ3D-7cZKEpzjwucqXIXpm73stWvyPiFpQ>
    <xmx:BFxcadtBWFQ5rj93VI_SYR0myk8PisqpeSvfhhy8BiyD_jiI67FztcYD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 19:49:07 -0500 (EST)
Date: Tue, 6 Jan 2026 08:49:05 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [boqun:rust-sync.20260105a 18/22] error[E0277]: the trait bound
 `i8: AtomicImpl` is not satisfied
Message-ID: <aVxcAZe6AEXEfx3G@tardis-2.local>
References: <202601060041.k0JkAkUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601060041.k0JkAkUD-lkp@intel.com>

[Cc UML]

On Tue, Jan 06, 2026 at 12:25:24AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync.20260105a
> head:   243aa6a057d46d3a4de9297422e480d469eddaf7
> commit: 06ed7e7e7aa656f7054af7d3d3387a07244d85b1 [18/22] rust: sync: atomic: Add i8/i16 xchg and cmpxchg support
> config: um-randconfig-001-20260105 (https://download.01.org/0day-ci/archive/20260106/202601060041.k0JkAkUD-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060041.k0JkAkUD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601060041.k0JkAkUD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/rq-offsets.c:5:
>    In file included from kernel/sched/sched.h:28:
>    In file included from include/linux/cgroup_api.h:1:
>    In file included from include/linux/cgroup.h:27:
>    In file included from include/linux/kernel_stat.h:8:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:24:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:12:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>    |                                                   ~~~~~~~~~~ ^
>    1 warning generated.
>    llvm-nm: error: rust/helpers/helpers.o: No such file or directory
>    clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>    clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >> error[E0277]: the trait bound `i8: AtomicImpl` is not satisfied
>    --> rust/kernel/sync/atomic/internal.rs:265:7
>    |
>    265 |     [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
>    |       ^^ the trait `AtomicImpl` is not implemented for `i8`
>    |
>    = help: the following other types implement trait `AtomicImpl`:
>    i32
>    i64

UML_X86 is using the atomics of x86 kernel (defined in
arch/x86/include/asm/atomic*), right? If so, I think we need this:

diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
index bdd7c8e39b01..44b12e45f9a0 100644
--- a/arch/x86/um/Kconfig
+++ b/arch/x86/um/Kconfig
@@ -9,6 +9,7 @@ endmenu
 config UML_X86
        def_bool y
        select ARCH_USE_QUEUED_RWLOCKS
+       select ARCH_SUPPORTS_ATOMIC_RMW
        select ARCH_USE_QUEUED_SPINLOCKS
        select DCACHE_WORD_ACCESS
        select HAVE_EFFICIENT_UNALIGNED_ACCESS

Regards,
Boqun

[...]
