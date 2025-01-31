Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983C1E9B02
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341653; cv=none; b=I0bo2WzaXfwbAHJZaxm6J5QwURqY/QqmjTvMfR6JmOfW7SgD8aAOMAPHY2I8TdC4562YgtZMRACpwiVQQaGnGLzBNwQQ/r6fdlMRVxvAQ1uQuIZyrANpSFeLbr20Qy9ezUfnIRcfybo8WPKTnJO/Z1m/eBXBNZ/3uWhJh6qY1kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341653; c=relaxed/simple;
	bh=VGrfosRryCIuxP6ecNC1iOjg9qycJaOLjVz10AUGQe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXk44EEbzPEbDjznrzSTb3kznKGY/q1964vzVGOHeFx3UJrivnL2mPB348w/OrP1pnyNIQbVMn5iswvFGVyGr/WTcn9S3A4fpUQiPLCsIvkjJlEbcw821q86kyV/RrS/VbueCLu8ac1Fcr6dMpFkgBCyHISwtUauG/CbLwl6dm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xUO1en1V; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xUO1en1V"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4679b5c66d0so231351cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738341650; x=1738946450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdxBuZHfYMpiuPPvivE+mj/S5KS/kuYJy2WfQwwjP1Q=;
        b=xUO1en1V774uNURlmsF2rDsoRiuQoCENvrOZHA80BRJCvJHGMPpnsjgoFo/OeVGXOU
         8I+LAKco4OTqQ1a3WlQkeyEMlxH+VeTsCM9OadN6Urv3XOXQjLalDxhui/jNmSlVZ8EX
         uEwPFDVvYsTNcXQCergj3z0zsb+4W/B1x+9Md7fiHuGqQUUymv7Pq6CJeuUNUYHZ85FV
         oUzIaQWrIh3NECHQztdeD7prtHwVxe8apRpZ7tMuhHOrJulf3+Ah3lNrufWepDb3uGuc
         xvBwaW2q71ei90WVcGwmrz1dXqD+p3XWAQW7fIMiNrUD30FvvtzToPHye7x84LsJ6pPG
         3yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341650; x=1738946450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdxBuZHfYMpiuPPvivE+mj/S5KS/kuYJy2WfQwwjP1Q=;
        b=JYsLD1GWBQ2GOPIAI/WoMnemIj1iJq5cRhlRyIy7JXLpat6M/rzxV8p2MTfINd5Gub
         Qv2jDof3LuneMlnnyFGN/AuIMe56dZb2e8p2mn+x+UNbSF4MJOWGwJmlDQs8QOjGrkux
         2ivT0TzU2c7qLZT8wUFJk+s41TDPqJwcW92bBY/Gbifdkb66EOhYz2tB2eliVbMEZi/0
         zYeKxd7+N0bbN0b6tBdjZNTZ4ZhjSUDtQGaDduY34xXljmAGIpv1xt/JxdMI2XRNYXQp
         U57ZBOo5lvhqB8+3tTBveEufElvHs8oYWSR6IcRN1vmmqQWg/gr3J5nIvz3BPFrH5+do
         /P3A==
X-Forwarded-Encrypted: i=1; AJvYcCUPrm4F5YO0/zsGkZeuVBupw5TBQBL4Ujs5m0BPIhJpK/74x9H0N57Z0YUxdvsNOtF9rl9RwXwP/QlcNvve@lists.linux.dev
X-Gm-Message-State: AOJu0YzojNHVz0Sya5QMC29jw6KailWuRlFJ9MLFJ1T1023f51GqTCOT
	go9ejSde8xEljMQ2w6iZsg6R2TtyxNBTsIUIHgmR5yZ5dRLXn8eY2w/LYmj/398twM0SfRPqks0
	KQD5kfyIriw84Cf58Dbm7eKJf057zzYUawRhn
X-Gm-Gg: ASbGncuSKUw8g80vtDaT0FHRmgg0WVASwElBf7mwG0oZ4XZ6exf2STgyopy7+0KzJK7
	BJFeA3jqw9yZcUuMqZjEVLC02Xa8FzmLKLKAJPkOj3RLze/pxId086/zYPWMXHRcdIEwS8g==
X-Google-Smtp-Source: AGHT+IHVZupShShMQVvFrTsj/qwh4zWX4r0XFuj2/CNc2c2zC9hpNvltw2cpNnEQ9tTH9earWU2PXRQM3iRt7WcTeRI=
X-Received: by 2002:a05:622a:1a1c:b0:46c:7cf2:d7b2 with SMTP id
 d75a77b69052e-46feaf31710mr3533471cf.18.1738341650365; Fri, 31 Jan 2025
 08:40:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501311826.hU85Yygn-lkp@intel.com>
In-Reply-To: <202501311826.hU85Yygn-lkp@intel.com>
From: Frank van der Linden <fvdl@google.com>
Date: Fri, 31 Jan 2025 08:40:38 -0800
X-Gm-Features: AWEUYZmNCfVOeO6J90nfUdQZ5ICG3gnC-a2IZ971btT0oRVQZsMy0WIgHJTtie4
Message-ID: <CAPTztWZZEhhzqAjj2EeD_4Ro9Fa8gMTaP988Jn74Fez+xR4xhQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 69/88] arch/powerpc/mm/init_64.c:390:6:
 error: redefinition of 'register_page_bootmem_memmap'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 2:16=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   f5604ad70091eabe663ea7106ced99449d653320
> commit: 2acfe4c72e4e3a50a685652d89c927335b90c947 [69/88] mm/bootmem_info:=
 export register_page_bootmem_memmap
> config: powerpc64-randconfig-003-20250131 (https://download.01.org/0day-c=
i/archive/20250131/202501311826.hU85Yygn-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfd=
cc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250131/202501311826.hU85Yygn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501311826.hU85Yygn-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> arch/powerpc/mm/init_64.c:390:6: error: redefinition of 'register_page=
_bootmem_memmap'
>    void register_page_bootmem_memmap(unsigned long section_nr,
>         ^
>    include/linux/bootmem_info.h:63:20: note: previous definition is here
>    static inline void register_page_bootmem_memmap(unsigned long section_=
nr,
>                       ^
>    1 error generated.
>
>
> vim +/register_page_bootmem_memmap +390 arch/powerpc/mm/init_64.c
>
> 368a0590d954a6 Aneesh Kumar K.V       2023-07-25  388
> 71b0bfe4f1608d Li Zhong               2014-06-11  389  #endif
> f7e3334a6bcb42 Nathan Fontenot        2013-09-27 @390  void register_page=
_bootmem_memmap(unsigned long section_nr,
> f7e3334a6bcb42 Nathan Fontenot        2013-09-27  391                    =
         struct page *start_page, unsigned long size)
> f7e3334a6bcb42 Nathan Fontenot        2013-09-27  392  {
> f7e3334a6bcb42 Nathan Fontenot        2013-09-27  393  }
> cd3db0c4ca3d23 Benjamin Herrenschmidt 2010-07-06  394
>
> :::::: The code at line 390 was first introduced by commit
> :::::: f7e3334a6bcb42e7295a9bd9cb36ca4e6e4e66b4 powerpc: Fix memory hotpl=
ug with sparse vmemmap
>
> :::::: TO: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> :::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Looks like my patch "mm/bootmem_info: export
register_page_bootmem_memmap" exposed a (small) issue in the powerpc
code: the (empty) definition of register_page_boot_memmap code is not
wrapped in #ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE, like on x86.

That causes this compilation failure for this config which has
SPARSE_VMEMMAP enabled, but MEMORY_HOTREMOVE disabled (so no
HAVE_BOOTMEM_INFO_NODE).

I'll add a fix to wrap the definition in #ifdef
CONFIG_HAVE_BOOTMEM_INFO_NODE, like on x86, in. the aforementioned
patch in my series. I'll spin up a v3 with it, since there were some
other things that needed changing (checkpatch SPDX warning, and
missing debugfs change documentation).

- Frank
