Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A533239
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 20:45:04 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-536bbef1c5eso140532307b3.9
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iAbmaywqCnYwDgGyA83uoTiWp8OIuiHt9Dztfrfb50o=;
        b=fLPPg6Ok491j+kEUwtcmTYfLQVb831bpBcrWmgYcbLry2oj6zzvIi9EknDrWrcN8u5
         +Heu5DWMQ5gVvQ2E2s3vYuhE1pN9hs4pYjyu23BCOk1Rh/FQ0c2HbJUtF//6wX3Ftdg1
         wvuh66QcqR+bb+mGdyVe7yX5zO449qO2zJiASYaeVvD3Ag+SbtG5VK16lqdHeOglGEDC
         PfVtvfW47PPEOFC2o2ix2D1bpx2/LMbx3d7JxOt/Mp+wRnv5USAE3vp3kQN/8OEH+wd7
         H2qGWVjIWAElGFX9zSy6ZXDwndgtZsWmYoBB3+B/f3jmI6MWDnmYKeTMwzVi3QLKMPWV
         mHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAbmaywqCnYwDgGyA83uoTiWp8OIuiHt9Dztfrfb50o=;
        b=vpt9G3QckYUGG4EsQXIW1m5NHR1Bprn43IGb/Id+9uboVr30ns2TM4A9IcD1Ucvmt0
         4CC6/y8tD654qTc97e/dRJx53VTmONxG2EzXL9XwQJ93e2MCWXvSdjyN7Nv83ImApyso
         Qy3KVm6+XsdNLvybl7qSvyVzRRiNDMyozioRPYs7IucJGjJllcJgg0QAddpvYa/R1Cep
         abJXQzOllcAltkl/0W1lv/E02pIolxBQUASHDm7PfoL65zOFjstran+0sC/vkzcHlTav
         gf1LVs8qjgaIgyIpjCYkk03u6VvqzQmteyJgQ4QrZMIEddZWK3WrqLOC29sZ8W4MwDdf
         z7TQ==
X-Gm-Message-State: AO0yUKX+ykOV5zOygu6mLsvqn8GHi9mfJLggz4GokFiiiAdIQNTI0BiX
	0sF66co0RnVt+RjubrGQ4PXqM6JpVCU+ROpTdJY0Xg==
X-Google-Smtp-Source: AK7set+Uaj/2NJ6gbeUZMoXIppLyJE1P0U3dwSOB5Ug7BzzosigJeWtwRHT0louuFgbnKxNcPtorPBdK7BLHaR0/Y40=
X-Received: by 2002:a81:b606:0:b0:52e:c79a:cda with SMTP id
 u6-20020a81b606000000b0052ec79a0cdamr1152005ywh.10.1677098703475; Wed, 22 Feb
 2023 12:45:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302230244.9GrTbcGc-lkp@intel.com> <Y/ZpJfvFo0Y/e8Xj@smile.fi.intel.com>
In-Reply-To: <Y/ZpJfvFo0Y/e8Xj@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Feb 2023 21:44:51 +0100
Message-ID: <CACRpkdaPy=Q9OAbdQH8DnJuP0eucUMOWkOrebu3yT-8h4HwMgA@mail.gmail.com>
Subject: Re: [linux-next:master 7757/13727] arch/arm/mach-davinci/board-da830-evm.c:18:10:
 fatal error: linux/platform_data/pcf857x.h: No such file or directory
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023 at 8:12 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Not an issue for upstream. The file arch/arm/mach-pxa/balloon3.c is removed in
> Torvalds' tree before this patch will come there.

(Nonrelated)

Arnds board file deletions has lots of upsides, here is one:

git grep 'linux\/gpio\.h' |wc -l

v6.0   549
v6.1   537
v6.2   505
master   359

That's the biggest reduction in legacy GPIO header usage ever.
We killed off almost 200 sites since v6.0!

And the grep even includes a few false positives.

Linus
