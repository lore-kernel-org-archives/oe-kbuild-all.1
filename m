Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F012B171
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720729595; cv=none; b=eMPXoSmbOLGKWxCU89IzT3eNm5stouft3NjDsf+Co0/sKvZX+u9JCl8gq2h+nf+7SzzqyFKui6m/ebG3yZMfCm+HIKvA7gaaA6MAIMvrTHdSJHF5tHothqd4YzZOJcyrcoc76RwRvJ/R4Pcs3Raha5yNpnAS219+fe0r0aez+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720729595; c=relaxed/simple;
	bh=vIMFT0yarMRkobJBPNMU56AZLR4/xYQh7WhaZMq0I7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuvxKOdy3gfe26x7/kkil0qOFlBMJf5nIFmcjrs6R0tYRpJItcovxldYVlg5Pbh1ZDa9O5StZQQnlj86rMf0ChWqpvY0b4s0kXHcP6li2Y/xkmurj06/Bw4FnXkUhMjlVmHKlCsjhqqn2yMN3qYkQWIghUSME7e5e/x/URwoDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ka5oC2k1; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ka5oC2k1"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6561850a7bcso13211567b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720729593; x=1721334393; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nx7PSCfcdgExZAoC0olVJGtD/kL+jmX7st457iM451Q=;
        b=Ka5oC2k1cOpDb60FNjKooODp3/KuP78yjgFWz5h/K24wI0LooqfCBVw4f3i14GpLi9
         kMuW6hM5HkEPgOLqrP+wgMWOs812+2GC7X2zgaEzmcXv29JwvVJLrD4Lxls8hxdPeO7B
         HKgmT4MgnM/GZtoOIyo1wT+Wq536vCZKxHw0vCr4NpnRJY0ByZ/WWGN1F12l3JW6mpLd
         2YF0ST8xKHUmnEYGOiKG6jdHhUqG9oUkNm+PCrm2me6v56S91iGEhyFB/sQDkVavmlsf
         OsHNMsUw3jrpRuUUj4x39GijG4aty7LoLkB2z255q/jqXAWtwvOebPGaGqsJQeFtLYcl
         AUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720729593; x=1721334393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nx7PSCfcdgExZAoC0olVJGtD/kL+jmX7st457iM451Q=;
        b=VkWtBvD7z/swbQ/I4VpCCt6wvNjgZNh1OsIe1jGMCbbD7c1kNgZ4wlqUaG2zp7wBj4
         JfeH8nFpwgEIHJVKAAbP2LTX4HJeI2FDuCbqIGtpGTWh3aKALT1NnTmExZchWRgUY5ER
         /YkZIP37OAr6XFI++suEa1Oabi6GrykatSYEeoJOuVJQPhF8PuqMNAvloNoWjoae1x8Q
         obNSLRTB2arwHI7zq4Nm8ajJ8oULtmeVAWyBvfz4O7hGolGF+MjMxvwERevhY3eqSBLm
         xxGQpH3NgyI1qxZfehjsWvFoiAxWo7FVx0+a+imxYYEJqssc8UWJumSUOfg37hvReZI7
         wE7A==
X-Gm-Message-State: AOJu0YyFZw3yxtRVGXYOTdidpJ1N/oSXbIpqzCJufjRV/8VD1lTmWfpb
	voMxL9vRqsBHDCZNKjQ8hixvgG8xlZHTuC7EWajLRIGTHkgJiNZ45WF8e/gVULS+Qd1BZT4hX4C
	7cYES5IxortN6qjH+NRkPnHFwdJsZDY2ztvNI
X-Google-Smtp-Source: AGHT+IE99TQ5xDaen9zNOYXY/2DA6vGL27fQnp/41FtPaaLWf4T2dFDF00RLPSBtIMXy0RmNoRyMQE9tkQklAidH6es=
X-Received: by 2002:a0d:e616:0:b0:643:c2bf:c156 with SMTP id
 00721157ae682-658eed628fbmr93052517b3.19.1720729593033; Thu, 11 Jul 2024
 13:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407090645.ruIapj8y-lkp@intel.com>
In-Reply-To: <202407090645.ruIapj8y-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 11 Jul 2024 13:26:19 -0700
Message-ID: <CAJuCfpHTQh455hKMbRpR3Z71P5J7fucr2Ba+bTA4HyWKzpj7-w@mail.gmail.com>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 alloc_tag_save+0x24 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 3:13=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   256abd8e550ce977b728be79a74e1729438b4948
> commit: b951aaff503502a7fe066eeed2744ba8a6413c89 mm: enable page allocati=
on tagging
> date:   2 months ago
> config: xtensa-randconfig-r132-20240707 (https://download.01.org/0day-ci/=
archive/20240709/202407090645.ruIapj8y-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240709/202407090645=
.ruIapj8y-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407090645.ruIapj8y-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >> WARNING: modpost: vmlinux: section mismatch in reference: alloc_tag_sa=
ve+0x24 (section: .text.unlikely) -> initcall_level_names (section: .init.d=
ata)

This looks the same as
https://lore.kernel.org/oe-kbuild-all/202407032306.gi9nZsBi-lkp@intel.com/
and both should be fixed by
https://lore.kernel.org/all/20240703221520.4108464-1-surenb@google.com/
which I believe is in mm-hotfixes-stable branch:
https://lore.kernel.org/all/20240709224150.B4711C3277B@smtp.kernel.org/

> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_copy_cle=
ar_tail+0x5c (section: .text.unlikely) -> __setup_str_initcall_blacklist (s=
ection: .init.rodata)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
