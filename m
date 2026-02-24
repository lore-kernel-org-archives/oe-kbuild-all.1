Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB021DDA24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 22:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971384; cv=pass; b=M+FrgT0l4TWTNvPhrPkvxUwSwogw+XS4rrGZ2x5OMbo8bJHZkRR/e7tkgxKa0LXAuJqhErrNlG6H9m6M5DB3C5t/OVg+76Vlk+P0nn572LPGskG/wm27fAvn3Ks0JbGaj5jA+KqbzbpG7gztASlY5KxJAhMBFyzhRNqXl1IRpaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971384; c=relaxed/simple;
	bh=avUAB1b+3yIFF9msEyBE0V5JXSDfaJrLcszTJK/JZ1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXaqqR/bJ0Si5ErYud3NFcR7Xsq+elyX9HagzQPgg4yPWXOjIqe5CQgsxwVBkeO/okLQ5XkIX0gQ6FzBp282yKEZEBYz+q+49owSlrOhUnp1geKPsMtuQqghvcyxSMpnVEl3pbDZAbj2PT0amQ3YJSstop3n3KhsYA8da+WFpQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L7iCoiKj; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L7iCoiKj"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5069a785ed2so90811cf.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 14:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771971382; cv=none;
        d=google.com; s=arc-20240605;
        b=WTNvx5RaRHWWD14pVPnuPYWSmtogrQI2z+PfkaDmPFz68LFeerp5jXB95qPxg6HBUC
         6pwvx6zEX/oPdM6+ggdqW9BA1b5ycPzFCKbBkK4oh++0h/hYRgb7rp0eY6GxfaQuwVih
         30TbgS3CH+JXXJ60Uss1b+35Nm70aYoDC4OmJhuR6G0buCJDZdljrWV+/KVo+GR8SSLN
         xwMsz1HruRAc3sy+/pjm144z9MN0rhf7OfWd0ZQ7pRr2PQ+8/Ud3EsbpjA4/+QbszPz2
         gUhVCeIo7UPj9Zlr6eQgHoEgp9B52YWselLSvckT2WUe4jRXFctH0Rq/mZhJUNdf1iHs
         rybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48FXZFJTw+6x79fJ7a6Jy6tjuNMBhw39wfTzGL1KEH0=;
        fh=1qnY0ufgVS5in3xm/z/xAFkukdEfBRVUTnKfPrxv0c0=;
        b=R+Gi9sBAMZIppb0lgRNfiXgln/1QaoOmAGiMH1mdsNEwuyPzq3X4ZBGisTJCuXA+yT
         /voNUie1dsaYBqWskIXQ/ExpGSX7NckNgU5B+2Lt7SJk84pjj2zO8rFHBkrFNs08HZM7
         kcgooFmzONuh6K4tmZk55xp/SyFJCb8L1LaLVmLaOS4U77ZoxHonsF9KsM0kfCuVYIuZ
         KGWFAMJVTWMTl0UUMs7Bv333oo7X5reH7D/rg4z04ZA5WJ8lKR/AFx6JgcL0gPvzM70d
         jZpCi0LBy9tBlX7qjnB2pzUfWrvVMd2LQVMf4Vp7FOQIe18+xtotf7UDH2/ba/rL991+
         jETQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771971382; x=1772576182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48FXZFJTw+6x79fJ7a6Jy6tjuNMBhw39wfTzGL1KEH0=;
        b=L7iCoiKjeW1fN8Q4caKKLsyTNknrA4ZtwV0Ksw+GaO+knCZCUiYsZkSZDntNY3uvrS
         W3155j6jfTcj7zx/MiQuTWSabiTBlzl9PjUt/5QERbwQXEtdTeA+JMLKuFVF1Cz3ey9j
         Sf8ZnZrWHB9cMiuaLdynBxS8A2VT1TiIzYiUpcq5UN5ZqP38lyTG1lqwEXHS8p6Xuw4K
         iBnQ9vNcQsDMjkyMwy4QRZ4/lLD3WlrUVQL00QiN7Ufr26pWPpOXBtofsr+4uqDR4g+H
         ZsSfQ86j6vKLc86R5wm29zYT1GN/0mtnXMUKn12QcsFR+a82raU/szngMIdYTdS9BNyN
         Nqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771971382; x=1772576182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48FXZFJTw+6x79fJ7a6Jy6tjuNMBhw39wfTzGL1KEH0=;
        b=AdFjFLWGSKnv36cCDQISLYfm90dPrwvfvcLl1F5KisOGNKXUG5KD7m4qkF1/yZttDW
         zPXEQxSQauLKjIrCq7u9mpkyOCrIvVAq/LTFFFaC/8RGjJrIYbkJMgVsyz1mlg8nDSXM
         Kp4Dv5Cp5UVnwdwqRL2lQC07T2W9Sz2ysNCfMqVikxYqhbq1qDWbxy7hiLW0zRJ1E+KT
         PdfkCk9EguzwtkgY9Pst7HYQt7MofUy/C6bk+JQokXvjQlpVv6TH7Q6aqk3E0++qMCWi
         aoFsIk5OiO1XALqk9GV0W9zwveHmPcrF0iBE8NMkqfnqMU7s8HF6zVGuT54sefcEydTk
         8DXw==
X-Forwarded-Encrypted: i=1; AJvYcCWVDUQXWX0e9/pihHKehO6Tlqvn8QpoE3JJDJqjRVrGNObdhL5RynmxDc9p0tFGa2TgzLVN4GdQU98EhkjU@lists.linux.dev
X-Gm-Message-State: AOJu0YxcLokuEcFNA5NhNslskdJP8In73vAuVx+dcaYhlSoyZTQ8l9ZO
	XZVXQW57HXXadRiENeSzmPxW9MXGuA+775xhLUUE/GfewCFgzNpZXkY+hwtlhFENfcJ7css3KJQ
	A1EjtpvOQlXu/wl8pzRc2rsmx5KLjpVAISbXdWN1p
X-Gm-Gg: ATEYQzywqMPUE30wobQVivhYZd1nqSkd7pcojuVpsTde/mZv+dHW6bJ4otEgzT8+h7D
	eTtkCqp4fjsUilCZu1BmK33YM4zwvjQdWbsgS/hxayf8v+0FC5WGIR8gvdsuSyAfRVzU51B2pnC
	CvLA06fMIPuNGnpLFNbX3HepY1f9L8t9ojpJBrk2kulWu2V/RK6i+MiBzvjuRj6ZxQQNzj91+/c
	01kp6fV774523ekWe52UrehEce4mLVtJZezMI6ZMLFctCzRrp6QXfPjrwjTUuo1kS/IQTnXwgae
	/u5LXeKmy6VqwhAnaP+RvTRWPJSF7Ku2J3/1pg==
X-Received: by 2002:ac8:5903:0:b0:505:e719:3b49 with SMTP id
 d75a77b69052e-5073a331544mr1246501cf.11.1771971380858; Tue, 24 Feb 2026
 14:16:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224165250.1322946-1-surenb@google.com> <202602250250.n38q74JK-lkp@intel.com>
 <CAJuCfpGcA7YmxzmJuEzjJyLAQrV-uGS1LH=B1eX50MSh09z21w@mail.gmail.com>
In-Reply-To: <CAJuCfpGcA7YmxzmJuEzjJyLAQrV-uGS1LH=B1eX50MSh09z21w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Feb 2026 14:16:09 -0800
X-Gm-Features: AaiRm533kGl5au_lU-qDQs1zUoFTWbklJ0-4014AJth8cYkZ1yJ6e5gdW0m9ejI
Message-ID: <CAJuCfpFKS7urCogZu5bAzmOaLUmAXTp9ftuxfLwy+7G01HSr5A@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs allocated
 with __GFP_NO_OBJ_EXT
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, vbabka@suse.cz, harry.yoo@oracle.com, 
	00107082@163.com, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 1:14=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Feb 24, 2026 at 10:54=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> >
> > Hi Suren,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 7dff99b354601dd01829e1511711846e04340a69]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasary=
an/mm-slab-mark-alloc-tags-empty-for-sheafs-allocated-with-__GFP_NO_OBJ_EXT=
/20260225-005422
> > base:   7dff99b354601dd01829e1511711846e04340a69
> > patch link:    https://lore.kernel.org/r/20260224165250.1322946-1-suren=
b%40google.com
> > patch subject: [PATCH 1/1] mm/slab: mark alloc tags empty for sheafs al=
located with __GFP_NO_OBJ_EXT
> > config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/202=
60225/202602250250.n38q74JK-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260225/202602250250.n38q74JK-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202602250250.n38q74JK-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/slub.c:2787:3: error: call to undeclared function 'mark_objexts_e=
mpty'; ISO C99 and later do not support implicit function declarations [-Wi=
mplicit-function-declaration]
> >     2787 |                 mark_objexts_empty(sheaf);
> >          |                 ^
> >    1 error generated.
>
> Thanks! In a hurry to post the fix I forgot to update the
> mark_objexts_empty() definition for !CONFIG_MEM_ALLOC_PROFILING_DEBUG.
> I'll post a fixed version shortly.

Fixed version is posted at
https://lore.kernel.org/all/20260224221132.1702713-1-surenb@google.com/

>
> >
> >
> > vim +/mark_objexts_empty +2787 mm/slub.c
> >
> >   2783
> >   2784  static void free_empty_sheaf(struct kmem_cache *s, struct slab_=
sheaf *sheaf)
> >   2785  {
> >   2786          if (s->flags & SLAB_KMALLOC)
> > > 2787                  mark_objexts_empty(sheaf);
> >   2788
> >   2789          kfree(sheaf);
> >   2790
> >   2791          stat(s, SHEAF_FREE);
> >   2792  }
> >   2793
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
