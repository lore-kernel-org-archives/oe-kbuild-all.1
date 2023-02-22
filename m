Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F029A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 19:34:02 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-536cd8f6034so106610037b3.10
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 11:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1cgvm0KPnTrpOY3Sh3w8GOEuFHx/rfKQKFhylxiwL5k=;
        b=MeUlhrZ5IR8KKkmFezuMyD39wJxaHdz6MJw5Ws+c97a7CWjbnrAjw5j66iyvZ4oZHu
         08J/Sv+iUJDF4MUJXFSwXDl800IjXTa4fL8bwvJ2hUAOHurV4xzkzsa53VAPCoWqfObO
         45RsbUQyJjaUmJdyBHdNUxuxSPOM+SxvC7PHS0iVQtf5ulYxDP9/6jE1eCAghriKEu1o
         yvmhe8NmcGnS+ZuekWhKadjs3L16UTuZNcgdACo/LavHtwfpE1DBiVpJCmEueXl/BOhs
         KTYfXjhBaCfLqLjLaRJl0YdvD/ALjbktBDEfy0XF3yITPV/3Y9/hXWfnLMMybbOBu0fn
         ByIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cgvm0KPnTrpOY3Sh3w8GOEuFHx/rfKQKFhylxiwL5k=;
        b=7/pAD0vHw3ujEGoO1SqhhHz1yBd6lSz7f0p45xOj2hvdXRh9ACMoZwuRk/K/u1FAr4
         QW/xKnac0aFTmjhE8CQONR5MDdSVhI8v+6Z92hsJJ+aWFhi0h2TOfr8oyZ23O3zRbM4g
         N3AyhSHHREd0N5cFQ3v/kDQPThqtiP9gcvxl3KlFCU/FbWr/Rr559C1L2uP773pDK9xc
         qSzjU97v7QLtt7z+2AD7aqiiU9GlZ96Rk6VOq0WleCDXYMMEVGDAHMgMykoOimamoACb
         7vf69wfP8eqU6zugDtgLyEfni1+ng22vuXRpyA8+mTzwNt/BZ3eK7BKn7zE+pJGV6JTG
         F1HQ==
X-Gm-Message-State: AO0yUKXMdfDYcEC/AdKk/gIbIiF5UfDN2J5NsJpP2g+zDyKU50exfaID
	M7cKqv7q8wqM9Qy2Z0wAEjg8R3MwDEn1bgYdVeu7AQ==
X-Google-Smtp-Source: AK7set+NHLUZn+3XyLVfTp82OkDknHuur+QVE8so/oBYFlW/yggINJifDMh5ZyhvgLG6lS60vSQYtXIwD04n1gB/LNk=
X-Received: by 2002:a81:ac4e:0:b0:533:9ffb:cb11 with SMTP id
 z14-20020a81ac4e000000b005339ffbcb11mr1159419ywj.7.1677094441741; Wed, 22 Feb
 2023 11:34:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302230244.9GrTbcGc-lkp@intel.com> <Y/ZpJfvFo0Y/e8Xj@smile.fi.intel.com>
In-Reply-To: <Y/ZpJfvFo0Y/e8Xj@smile.fi.intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 22 Feb 2023 20:33:50 +0100
Message-ID: <CACMJSesgjGjwL_hivYOVVoCG9x--2RJUu8YCJ+DXE=7cg+RTNg@mail.gmail.com>
Subject: Re: [linux-next:master 7757/13727] arch/arm/mach-davinci/board-da830-evm.c:18:10:
 fatal error: linux/platform_data/pcf857x.h: No such file or directory
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Feb 2023 at 20:12, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 23, 2023 at 02:40:42AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5
> > commit: 91a0192e90e9df40d4b63c4ce11126114ed5d79d [7757/13727] gpio: pcf857x: Get rid of legacy platform data
> > config: arm-buildonly-randconfig-r003-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230244.9GrTbcGc-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=91a0192e90e9df40d4b63c4ce11126114ed5d79d
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 91a0192e90e9df40d4b63c4ce11126114ed5d79d
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202302230244.9GrTbcGc-lkp@intel.com/
> >
> > Note: the linux-next/master HEAD aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5 builds fine.
> >       It may have been fixed somewhere.
> >
> > All errors (new ones prefixed by >>):
>
> Not an issue for upstream. The file arch/arm/mach-pxa/balloon3.c is removed in
> Torvalds' tree before this patch will come there.
>

Thanks, I was having a heart attack knowing I had already sent out the PR. :)

Bart
