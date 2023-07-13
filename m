Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772414F8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 14:35:32 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5776312eaddso6983857b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689258931; x=1691850931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U+nZs1D1Fy78rQMYBUsa2zJlUYwdKFxkmf3A1rmDrGU=;
        b=cGS20WglFZH80oZCUsh3d643sr0inSlbZIvRBWljXnUlcarcOVGnweAmCGDjTSdOVA
         3V+b9h3IjNR1DVnHjfZtaXJ+EfFsA6w35kyu79aodg0E+JQ1ly5PiHe/1U1v5Iod/QjP
         zs/A8wWV6qi1c1uGhe2uJXcSWxPzxOx1NPWBvBbfsE5jxSxpnKM8a0/N/PC5GB7SlIKn
         KimZIbhMrw66fsuBNCqHcOEwy9HH17RaAGLrsTRZMYXHC67Q+NR5VkLA+2IC9Xk2Etw4
         17hlZjF5Cl5oPFbb140M8iMeJ9bJ6uLpC0DqA04l8pt4xnfqcIgJSA3fVlyfS1MnS4Wt
         IlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689258931; x=1691850931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+nZs1D1Fy78rQMYBUsa2zJlUYwdKFxkmf3A1rmDrGU=;
        b=XuGK0Ful92YBaV0T9lBlVoyGuR7RD+QJniZvvGYbnAz1a6md1kYmJoU8tntvXaeMtt
         np6XHgvrk+JgF0AncaBep52/VhVVQt/oubvKgXDDXghEzwtB7OinmN15yHR3lDYTJ40D
         wcGrz1IalU853hBS2aES+rHlkdU062jUICNfLFJm5x8aHwp/8xmWGR7Hg6f660aLsqai
         B0qKtc0c+Mq/Kr8xSL/uYW9X7C5Lb3tFEQcMcrouvULi+STWR1YfyaJBx+o4y5J+CLUh
         BEyOMLPSivm/4gGj7J+W1f1c+OD1Z36+ZtI+ba4C3cba0UEt5xzufk+j38o5KHZbDiXo
         pNNw==
X-Gm-Message-State: ABy/qLbUMse7TtBdZ++wGJv92gUiRkkGWU9mkak0Yhq2wIW/7DxpdIJB
	at0tKnIpCg7UdiQ52cfyx1B+W/MbhCkDq1dAazMGmQ==
X-Google-Smtp-Source: APBJJlFCLSbqykMOKhVl4eIiYOTG4q0RsjPmrCXlhwTgVypmlxf76Gjvj7/gN6V04qVsMULZmHQMNfUyUWDPWx5kvIY=
X-Received: by 2002:a0d:db4e:0:b0:577:18a9:fde9 with SMTP id
 d75-20020a0ddb4e000000b0057718a9fde9mr1863913ywe.43.1689258931405; Thu, 13
 Jul 2023 07:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307132143.zFvbDAGK-lkp@intel.com>
In-Reply-To: <202307132143.zFvbDAGK-lkp@intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 13 Jul 2023 16:34:55 +0200
Message-ID: <CAPDyKFqsy-rNe38zbu+=ARcMMFQ-KcUScAqm8LcZBy0nA_eaSg@mail.gmail.com>
Subject: Re: [ulfh-mmc:next 3/11] drivers/mmc/host/mmci.c:811:17: error:
 implicit declaration of function 'dev_sbg'; did you mean 'dev_dbg'?
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jul 2023 at 16:20, kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
> head:   9f8a7787f3f98b77d0844a83a6df6fe383d88ca2
> commit: 1b12ce08ebdfd50e7b593b370c087ded61a9fae0 [3/11] mmc: mmci: Improve ux500 debug prints
> config: arm64-randconfig-r024-20230713 (https://download.01.org/0day-ci/archive/20230713/202307132143.zFvbDAGK-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132143.zFvbDAGK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307132143.zFvbDAGK-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/mmc/host/mmci.c: In function 'ux500_busy_complete':
> >> drivers/mmc/host/mmci.c:811:17: error: implicit declaration of function 'dev_sbg'; did you mean 'dev_dbg'? [-Werror=implicit-function-declaration]
>      811 |                 dev_sbg(mmc_dev(host->mmc), "fell through on state %d, CMD%02x\n",
>          |                 ^~~~~~~
>          |                 dev_dbg
>    cc1: some warnings being treated as errors

Thanks for reporting, I have amended the patch to fix the build error.

Kind regards
Uffe
