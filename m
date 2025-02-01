Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84651C5D68
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738439125; cv=none; b=Tv+WvGXEzJkAOVyuNs/Wknw20pZFQjy1w0vdUOZ7LA6XBMJgEW7CaTcB3pE5ClEZcLIwWelPHq+JOcVK3PwaoRmambC+kPSpuaKmVbjvJX77vYsnt0PxC356/Dq2rHUgWQSlnkGVf1NQE/7uyfxvmX5GtphRWFeHxQmHpzzDENc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738439125; c=relaxed/simple;
	bh=61Lt/tsYVXcPMgot8PjraJHrvO2vuhIMkrJEEv9Iqjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zxpko0LlUnnDsE5O4pfgfeCpo3ynuxTYisFCqrsCRaFT3NgDbuZ6ikcqLq0ORKEP1nKQpdlNsks8cCvSpwq16Nlxn8UpJQ+6UhehoDU6sCVRqvzBjn/FDRlI0esPQvyHHUjXiPmuyIUaGQnv37w2H01BFG/RmaaMgByjZ26fUBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l2Ihz//R; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l2Ihz//R"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467abce2ef9so196171cf.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 01 Feb 2025 11:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738439123; x=1739043923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M3fhLrcctFEXvIJBPdTWYwaTVXraRCfDvDbgK+2F94=;
        b=l2Ihz//RtQ/P+QZDi0jUX3MoEV+6wRszcGgJ2yiARmezUMjzc0tGgktmjHUDzHVaLI
         Zib5Uf18PQluQdzFU+eMQyIibtvDWKdkScBLtFeRCztvjamVkXJtYm01WvBJk536+MpX
         X62Zsz/bH5t2JOX7pWMBXrE4U+2SLgSGfkQVV+edMpNBTGxNpHQoVXeJuTXsBBRIxPjh
         wT0chqMb85jA/hSRqld0tII9orPPFBJd3E/mv9I8AfEg2VWPuZOz3HWU8r5mzsKIKytv
         erQD4RXB2hChT7jk8mKt6ZgARcaqagw0RSGpP0nWGvdhJ3hLjQWUIwhLo3N0YdJkRkkg
         8fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738439123; x=1739043923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M3fhLrcctFEXvIJBPdTWYwaTVXraRCfDvDbgK+2F94=;
        b=OpP6Fni3Znbu4wPtISceGuu4Ny5zVu9+0VY32IuTr3YRdCXl7nDaoBkI54xbThh2b8
         Mzn3nmooAA09vT4LMPLFkseUzTWl2wUpCebdPFlawkok56oakTUoTNA4iJp4Ge+SihX7
         qPvT9TPA8SixMFzf4X6Lm7bQTp+ftAmGCNs9gko8CxeNwORruA8oKrSD8qRsUVFhkRzS
         4csH8p1sXRR8OIaR4MGiXg40NsBVaFVjk1q5iLuq5U/mvkONdfniBBM+BCf8DtHWVafL
         V8rhH2t5NK+887t1dOfC6XMxfUN77X5ZK26kWW0s9W03rFugbiUmnTJDV8Wymp+/mHyp
         RXxQ==
X-Gm-Message-State: AOJu0Yz6fv1QPEnPlEx2qB0Q7nXtxTD7TNXfHlBeQoqbhltnHzHkjFJm
	eNMcU+89mbbxOMFQKCONuWLpGNC47tlyigrnHDcpnYzuRWXiKBKhoGm28lzRdxTyvEXd46z9ofk
	REsy35yjZRgNUzo1+FR2yceXftbb5tp/p3nWV
X-Gm-Gg: ASbGncspeFOLFP2N68Y7hDIY9YFu37kLBvh0hm4DLWGLEUiWBynw5n28krBXyrZGR1m
	BMbazoeiU84MwKgF7u6AJwzAQbjjBxibyVtT9+uCR3O+lmDu1KNpb/+vRv2+qfy43VP887A==
X-Google-Smtp-Source: AGHT+IEFvo9PNZ3HprsBi8wDvkLdtiB2CEKSrtEW3p7Q3TNUIC3xX+kJ3vOo8EuwOdq7/6Uf+4p/5RiDwOB6FbyiOBE=
X-Received: by 2002:a05:622a:52:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-46ff88a3463mr2567191cf.26.1738439122355; Sat, 01 Feb 2025
 11:45:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502010728.A5WFMTpS-lkp@intel.com>
In-Reply-To: <202502010728.A5WFMTpS-lkp@intel.com>
From: Frank van der Linden <fvdl@google.com>
Date: Sat, 1 Feb 2025 11:45:10 -0800
X-Gm-Features: AWEUYZmmToH9ArNEULQYu234yNz7TRon8ACxDti1blXT2Gfz6oRxLJv9sJGKE2E
Message-ID: <CAPTztWaeKD7muULky9+dstumPbDs0XBmYDB3reEqSC4FOPtojA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 78/111] mm/hugetlb.c:66:26: sparse: sparse:
 symbol 'hstate_boot_nrinvalid' was not declared. Should it be static?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 3:16=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   f5604ad70091eabe663ea7106ced99449d653320
> commit: d1feef9effa479261c600b78dd0e1a83e730c0d8 [78/111] mm/hugetlb: che=
ck bootmem pages for zone intersections
> config: x86_64-randconfig-122-20250201 (https://download.01.org/0day-ci/a=
rchive/20250201/202502010728.A5WFMTpS-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250201/202502010728.A5WFMTpS-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502010728.A5WFMTpS-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> mm/hugetlb.c:66:26: sparse: sparse: symbol 'hstate_boot_nrinvalid' was=
 not declared. Should it be static?

I suppose, yes. Will be fixed in v3.

- Frank
