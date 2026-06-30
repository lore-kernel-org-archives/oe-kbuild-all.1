Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF1340BCC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817044; cv=none; b=uqM6BgpDqClvaIZ+LFZDqOZknxmqiMCaD+vuqBC4TpuAf5gqkVx1f5oPOi7/mRve/IdhIkXkN2bBKS9FTg6kxphIKghab4LCXMNUghJRA7n4qxAE0okx9P2uPDJkVYIbJqVipj8eApsJ954ce8kHGogcqJN8FiT/WydoZHupXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817044; c=relaxed/simple;
	bh=SFJyhzApgCLMGmQKlBrEgilM7Tdt6DP5MxjLh24ot3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAa01sNFVVMkAR6m4jRUvazUvgwAdVk21JTibdPx+VarCNeVKbOtq8GJbVh/nVZ4lN8Twpufvvrh4YMypiLZrU4OJgVvycMPQQMQZHehjrHk8sSWFio88XLIPuxCMJbICT0/HgsZtDxmeAVEJE17p8bYxP4B7QgH+y0nq3Z/v6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5ruPLiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5ruPLiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0546C1F00ADE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782817043;
	bh=2+HA/JoBOxFhZJaSk9aZ5CarxkWj6UA49Z/NltJ50Cg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X5ruPLiBUuc6QS+cUkyL2xRJLy3FBtUnpR2aREhoZaknY/yUwe5yfN9xWNr46f8aa
	 Yw0jzgNGuR6TFTmqlby8Hl5hWQngF4o6t9dFPBMb6Jd7h8ZJ827+dMMVvKOWD+adGZ
	 9A9U7DeEGgoRefavx39gcEK5IROi6JEZctRXVruUobaJlddRXZ20K5xGiLPKHNKSal
	 kN/buLxbiuorvmEG1i8PvG7PPNrZeszhXd3nrFSKT98GDNj6TDX+9ATP/c7jUgsdsG
	 jE0y4wngjm11BNJm1H9mNXZw5zAH2DfnfwXfidESBdE3k0+1fz3Sn2SOCQd/qvTqs1
	 7+FYTyJ5fd+/A==
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c04bf4711so21815611cf.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 03:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+dlu7waU7S/Tg0mbIxO7eYy7Oqcn6i/40jOsBxJNkpPSPzJ+KbaPjrqmoiiEvoQgiyz2hoCkGIoyCOCaK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp97hW2Hn9VyALn9a9INuxwD5rHX2E4VBts+4J7fohXTuQgNLl
	inRJyTrssDxM+9mOq8geseEPpUDZrgSgQ7oMRpUPAD2q2VvPwJLOuBlNIXIysyZJrShgUIkgjp/
	fuZZopmAPVZKRtfGUa/PGWDjqliEA1N0=
X-Received: by 2002:a05:622a:207:b0:51a:8c86:bd40 with SMTP id
 d75a77b69052e-51c1ca5ad03mr786431cf.61.1782817042418; Tue, 30 Jun 2026
 03:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606291606.9h8aGniQ-lkp@intel.com> <20260629171909.1d6e96dd15a80b8f463bb68a@linux-foundation.org>
In-Reply-To: <20260629171909.1d6e96dd15a80b8f463bb68a@linux-foundation.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 30 Jun 2026 18:57:10 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wViR10e-9B1qqv5MNTMGVHVGLDiDzqh8PM=PPfm5rCTA@mail.gmail.com>
X-Gm-Features: AVVi8CfRjXxRj_MDC-E8kjBOS5LOmhQQQo2Vt2_pEXaIk32vDSLRHRLAK_LHPZk
Message-ID: <CAGsJ_4wViR10e-9B1qqv5MNTMGVHVGLDiDzqh8PM=PPfm5rCTA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 59/142] mm/vmalloc.c:3590:23: warning: unused
 variable 'start'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org, 
	Dev Jain <dev.jain@arm.com>, Wen Jiang <jiangwen6@xiaomi.com>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 8:19=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 29 Jun 2026 16:58:34 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
new
> > head:   88cefc306c43b58d9bb65c9e96e284306710d961
> > commit: 80c453511b6ee1af0e4db83c3db0020215c4eaf0 [59/142] mm/vmalloc: m=
ap contiguous pages in batches for vmap() if possible
> > config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260=
629/202606291606.9h8aGniQ-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 16.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260629/202606291606.9h8aGniQ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606291606.9h8aGniQ-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    mm/vmalloc.c: In function 'vmap_batched':
> > >> mm/vmalloc.c:3590:23: warning: unused variable 'start' [-Wunused-var=
iable]
> >     3590 |         unsigned long start =3D addr, map_addr =3D addr;
> >          |                       ^~~~~
>
> Sigh.
>
>         unsigned long start =3D addr, map_addr =3D addr;
>         ...
>         flush_cache_vmap(start, end);
>
> See, this is our punishment for writing kernel code in CPP rather than
> in C.
>
> I'll queue (and test) the below.  It should be OK -
> arch/csky/abiv1/inc/abi/cacheflush.h directly includes asm/cache.h
> which declares cache_wbinv_all().
>
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: csky: implement flush_cache_vmap() in C
> Date: Mon Jun 29 05:07:51 PM PDT 2026
>
> To avoid getting an unused-var warning from
>
>         unsigned long start =3D something;
>         ...
>         flush_cache_vmap(start, ...);
>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Wen Jiang <jiangwen6@xiaomi.com>
> Cc: Wen Jiang <jiangwenxiaomi@gmail.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Thanks for the fix. We even have a checkpatch check and coding
style documentation for this:

6813216bbdba ("Documentation: coding-style: ask function-like
macros to evaluate parameters")

b1be5844c1a ("scripts: checkpatch: check unused parameters for
function-like macros")

Reviewed-by: Barry Song <baohua@kernel.org>

Best Regards
Barry
