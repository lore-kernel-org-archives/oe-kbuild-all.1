Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172D728136F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 23:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761001261; cv=none; b=FlDzbTmQOSAFIUUhFGfehPJs0wK+W9HP6XNh4QzMHyB+VTDKGPiZVUbyxqyGSv/ZlEf8db8C8SZA2aGDoJ8u99KkVt8kP+Yy7maDWcgm2rvlQf3vOPaWUoTV1MtrNO206pU+5zEfqdg3NweJoluC2RsliKO02HfZAql/jqy4ZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761001261; c=relaxed/simple;
	bh=MMIhDjeFZTVW06BO4C5sNb1AQjnc/2P+QYmht/b71sI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PlR6MOF7cPt2hdPBl6Bqe8lMnaPPyCdxM2zDa9gj7GWMQRvegzM5CcmnKGe467B9Rk66rS1BUgGZkyhIEwzlq3gZNVMyxRuILVSMZDY1NsWc/StqVqT5robR7L+Y45qdvSHaOUpmYkTh7+v8jlhmODY+nYMfIAVzS8L8QasUSfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pagIcNCO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pagIcNCO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47496b3c1dcso2574565e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 16:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761001257; x=1761606057; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C+YTl5MaFNDPh2LQODMBbgsO+rt0d2j5pgrcEowQ9SQ=;
        b=pagIcNCOj1lb2BJj3X+4VsySsJUIuUp21aAitpLN8c/DjcDuUSUMDM5FnxTrwU2B87
         XuVgEEsSxgh7sty1xW2elrXVBV2xPYYe2sukax6ezgLHW9YeATX2m/B/79ww0xEx4E2H
         wVu+jnvPKH9r7bZCXuYpPtIKl51/1jLj/A9xKlnO4/Z61OKMd7NGXQyKRXa8gvwm6XOQ
         Ne5PghgyO3SC65HXa3ivAbwbfC2Hi/dgZWmRFu/SbeUtXQZL3RDwKsfwjmiJK+Pd6sVE
         tgzwJDIVkv4N6L2nIUa+0rLjxrMWPf5DjA2/zKFlwni9KnWuDAbZlMtVuoOFX+36uvvH
         PbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761001257; x=1761606057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+YTl5MaFNDPh2LQODMBbgsO+rt0d2j5pgrcEowQ9SQ=;
        b=DyVSR2w1PQt4jfXs3RemY/Und2wNUwsIvAhX511FNkpGojCnHcAzbCFgzGyNPU6hEX
         HW5YQ2cjlWdkB0RqgEfJR5aSSWs+WG+ErV4gRVXeilEhlegrWlRGlEDVoedYUrmlWyW7
         AieuiwOCDb4ZeMIEyMV/gMa7dDijNIjMAYxC8yC6Er5/SEFepl0/l12WvwG8ZoqjLjih
         6Ri/tx5jQfEYOujwy8iFldx70zq74BWG20F5gGI619LHnFznKEmZjrWNrirKavCCgm4M
         UiBid9R6wu7aPIgg1d1WXOexpI42QbPTp1sh463W6OJQzpKKSWzf0myjr78fNmEnuU5M
         K6lg==
X-Forwarded-Encrypted: i=1; AJvYcCVOMgRBs+0wZwQuIrGssA+qkcGL9Ohlocxm4HOkF+1VWypKF4yYwTHzxnyqPz3hy4VQxWQQS4uHUVYL0hlF@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrlw1GmttdkXabPylaWr1Q5vZwOdkxhksu8+Xk2lzfoZeSIzhl
	Vs2KTOv30pEBnbns74ygrxaYI7BVFrl5gecxMJP/+lx1HIFkf5kLvOK0Rm5sgi0vByuojZhaOTF
	pcFzuVmjBLEqjcPhU8Q==
X-Google-Smtp-Source: AGHT+IFXOZk4fKNLEcQ194UEEQFUbHuH0Kfa7GML2Cmd8kN3Tsh2FLTTo5Kx6voF7xttPbOLL27F2j29/4j8wOo=
X-Received: from wmbjx13.prod.google.com ([2002:a05:600c:578d:b0:46e:5611:ee71])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1884:b0:3ec:ce37:3a6d with SMTP id ffacd0b85a97d-42704dc9a96mr11386255f8f.47.1761001257442;
 Mon, 20 Oct 2025 16:00:57 -0700 (PDT)
Date: Mon, 20 Oct 2025 23:00:56 +0000
In-Reply-To: <202510141538.VZqnRzHh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202510141538.VZqnRzHh-lkp@intel.com>
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251020230056.726931-1-sidnayyar@google.com>
Subject: [PATCH v2 10/10] module loader: enforce symbol import protection
From: Siddharth Nayyar <sidnayyar@google.com>
To: lkp@intel.com
Cc: arnd@arndb.de, gprocida@google.com, linux-arch@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, llvm@lists.linux.dev, maennich@google.com, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	oe-kbuild-all@lists.linux.dev, petr.pavlu@suse.com, samitolvanen@google.com, 
	sidnayyar@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 14, 2025 at 8:36AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Siddharth,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on arnd-asm-generic/master]
> [also build test ERROR on soc/for-next linus/master v6.18-rc1 next-20251013]
> [cannot apply to mcgrof/modules-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Nayyar/define-kernel-symbol-flags/20251014-005305
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
> patch link:    https://lore.kernel.org/r/20251013153918.2206045-11-sidnayyar%40google.com
> patch subject: [PATCH v2 10/10] module loader: enforce symbol import protection
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251014/202510141538.VZqnRzHh-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141538.VZqnRzHh-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510141538.VZqnRzHh-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> kernel/module/main.c:1271:32: error: no member named 'sig_ok' in 'struct module'
>     1271 |         if (fsa.is_protected && !mod->sig_ok) {
>          |                                  ~~~  ^
>    1 error generated.

'sig_ok' is only defined when CONFIG_MODULE_SIG is set. I will wrap this
statement in '#ifdef CONFIG_MODULE_SIG' in a follow-up patch.

Regards,
Siddharth Nayyar
