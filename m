Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880E3033DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770987932; cv=none; b=Jmq02GmcMTO422F6fJhc5loVxOCp5RQJN/C9BrhJl80e+vOgHqYKKUht06Egn0u6CLvegxoRBULazK1UMAO1Le1j1gkmprjSHf0+Al3FPZdOC60WTotmTQCkmgFxuuUKSxUypL6IFR4UoUZckh0BYn2tI1IiQ2cn7GJxR8XHsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770987932; c=relaxed/simple;
	bh=IVc42heI0hMCj4ws7zasG9pLn/XiLujeIkp9D9CO+NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZryEQ5/HKo/MkQoFA3+YYs6lQWJIGp3JgjmeyQYIDUISzToHuudYuYwsHS9ApqriZtxJg3JZq4Q/ACIO2r+UGXT8UkyuMForztFrzbnwWIvzJ6mPioHys0IiAlKrK5WWR9yF8cjV17Shq4HvpsNd/lNdyRn01j2gfv2fofSQSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5fa3f2b8f7dso621537137.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 05:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770987930; x=1771592730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA8YczKRSeoQbJEtcnOFAEHbKWV2BJI6BhQNIywG3ik=;
        b=iNxHDYwHpn8Aoc0yOWl1VmLQbA9fovhDAOI8iyq1hdPeG9e8rkJmO/bh+en7ahVoWq
         7QtvbF5H8rnSBxkjZCc7t7Yg5woSpHQKF6ofWZP00gSdy7nMfa7/o4JHT95WJIDIWjgM
         R0z9qM6kSu7kTanmdfogJIufx0YvhE9OHCGMOrtF2yJtxRfoHLUBnsdo4hCZzf3rwEtI
         d0dqO3V5nRxw5EH6zrjEeG7hV1cPtJUpKMmkxChWtBUDCdtoKBoznF99o56Wa/6WKg3/
         SCPFtQjhJ3b5VXSsgepLe8JP1o0GzhxMrsQm6/EE7J64hP8aeOC6MEBOqMrl1voNyW7t
         AECg==
X-Gm-Message-State: AOJu0YyNkvuR5a7tqfxqPpHMlMRSms2UzYGxyZwDha5T5Dx9o7p97RvH
	6bMV007oymiTvnac3W7iF1lGylzSqjBJu/Fe5MXJh0DA+PmWXe4ZN2aNFwbU87pY
X-Gm-Gg: AZuq6aLDHdm8d2+9sI+KzXAkLM0GymVmPkX3sfytxec1tJ3fPbwGbxJf678yCA5yAgw
	SyOClPc3JVDvCz7s0lyXetkBEQ156+a7hKS37JRU/4q1QC7/vLiJsk03N85PWSwsBU5o5nSXBkL
	3aXxAetuQx4pZvBLMZu2NaOVRAMYK6cpWizDlZMev70LGNZR4/mgV4jcCRLBFLMOH272DfAB1hU
	GkJa3vhm0GuGyiWNEzgQWCTRxOiYW/Qe0izDmtpeIXwXM5i8nscxewmbWbiB+n+TPDMTAuIJpMJ
	kzyLvuGOqgoWvAnVDwDSYA+Hl/cxuADdqhcolOBbsgCaixVViQj6oZ3WV7jVILIQmtHx+oF6OP/
	os7cx9vuJqlHy6Snk0SwTBQKM2QtA0knXN7sRnNNe/5MEgOb1Y9MxD2mgj7zT7tFGoWbcws5Ss+
	BRyIxVbL3xGrfuK+gGfY17Rg9sJhumsPWf1RDMUJbzUo9iJqdSSgXnyiUU8lgS
X-Received: by 2002:a05:6102:32ce:b0:5fd:ed7c:b7fa with SMTP id ada2fe7eead31-5fe1a6d59eemr532822137.21.1770981311630;
        Fri, 13 Feb 2026 03:15:11 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd3a99cdsm3118917241.13.2026.02.13.03.15.11
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:15:11 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5fe0959ae3dso597922137.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 03:15:11 -0800 (PST)
X-Received: by 2002:a05:6102:3913:b0:5fd:f8d6:21ca with SMTP id
 ada2fe7eead31-5fe1a47bbefmr490613137.4.1770981311221; Fri, 13 Feb 2026
 03:15:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602131114.LrOqbQnZ-lkp@intel.com>
In-Reply-To: <202602131114.LrOqbQnZ-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Feb 2026 12:15:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUG-70fF7Z9hQ4aXW-p+26wr9H5QXi2_=v_8cjoD58g+A@mail.gmail.com>
X-Gm-Features: AZwV_QjKkyzGlxxS0UqwSfoYkqhRdoxu4XqidjptmxF2sLRG-4dAOww5inLIVSA
Message-ID: <CAMuHMdUG-70fF7Z9hQ4aXW-p+26wr9H5QXi2_=v_8cjoD58g+A@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: xe_configfs_get_ctx_restore_post_bb
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi <demarchi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC lucas

On Fri, 13 Feb 2026 at 11:56, kernel test robot <lkp@intel.com> wrote:
>
> Hi Lucas,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   7449f86bafcdb588422bb14a4babfd285e723670
> commit: 6c6988c5e03df145e6c5cabc50d67b11f5aa2e56 drm/xe/lrc: Allow to add user commands on context switch
> date:   5 months ago
> config: x86_64-randconfig-r052-20260212 (https://download.01.org/0day-ci/archive/20260213/202602131114.LrOqbQnZ-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131114.LrOqbQnZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602131114.LrOqbQnZ-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: xe_configfs_get_ctx_restore_post_bb
>    >>> referenced by xe_lrc.c:1116 (drivers/gpu/drm/xe/xe_lrc.c:1116)
>    >>>               vmlinux.o:(setup_configfs_post_ctx_restore_bb)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
