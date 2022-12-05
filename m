Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D07C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 07:00:23 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id d128so13296068ybf.10
        for <oe-kbuild-all@lists.linux.dev>; Sun, 04 Dec 2022 23:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/Y0Vb5kcrMQhAGncUr2mNXMxJ04sqKCU928Uvmw/bM=;
        b=PNA8z3CnuSJayJSqpl8AUO0+eZ0x87siZasxBMD3qgO69+Ek3pMIQlf20d644A05y7
         AXLWVk/+304EbB4kyA9tcKeAWTbK0DO45HIt3fhnicNPu1SYOHBdkSOmkYsnALmnCLKq
         bG0MiOzsz78f3ije7SDPKCnrqr3WRTS4hFDpuBoRyFFIPNvQFPGPCGvZTBHljkKyjdJR
         WClvrtl/H2StiSG8t1axdjdOab0DKO4TJBZWWFhsJDT80IBqtD9lHSYiIw2hvUgJcCX2
         /iXNtuI+ofgvbDSFcdDktgjwYJtbnN0B2c145Q/LIim1jVuBH9u++xLYx81qKIJfr+9Z
         YTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/Y0Vb5kcrMQhAGncUr2mNXMxJ04sqKCU928Uvmw/bM=;
        b=mRNm6cesPegNWT93HkY+E7zZBlQfO4pf+AzBcERpj1WertozOvml0xvVufHPqpGYm5
         dl+sxtFM82XHWGgQPZvp4ZPi/EmL6cpuwLKTlfI3D5VvBm2KQIh4XsBhaP0w/Ffy6K7R
         qUmTl1U9KFcezlXSCFT2MW3N6WzuFKMVXOSTZ4Mickly4UUfOC2auc//U/XY31xD6SK0
         9tx6x8Lg/4VOMfpNZUjG9UltrhJyQ/nrEvaz/ViJ3O/OPoGe28IJMyJmYjtB0jNeHkFk
         M67amejY7yjySR0K76oU7AhFfXfgGC4chGJ9S8gb/eDJj7AqfrshIXMdpYyD8jyahmvq
         PayQ==
X-Gm-Message-State: ANoB5pmWtlV8pVE48EAaW78Tw7Zf8KMracPQgSdgNcj2aamSzP+wn5rn
	UNGKQjkezRSFhI07y4OZ/M9KwKk4OuJL+/dqGBpHaA==
X-Google-Smtp-Source: AA0mqf4My8ma/ePWLf9+82YEJtUr9KDdOYg3xmBhqqPiF3Cr4RPN3S1CDbhjbqsEyDXZLWAdr2YCMGy7hbN76aZa/M4=
X-Received: by 2002:a25:1e89:0:b0:6f6:b3d1:edcc with SMTP id
 e131-20020a251e89000000b006f6b3d1edccmr33564250ybe.125.1670223622256; Sun, 04
 Dec 2022 23:00:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212050032.IP1v17pT-lkp@intel.com>
In-Reply-To: <202212050032.IP1v17pT-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Mon, 5 Dec 2022 08:00:00 +0100
Message-ID: <CANpmjNM9T1KFwjG6yTXXyJR83oJujvfnDzhTPeW_2q=j=qi9LQ@mail.gmail.com>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/kcsan 1/3] ERROR: modpost:
 "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Ammar Faizi <ammarfaizi2@gnuweeb.org>, "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Dec 2022 at 17:35, kernel test robot <lkp@intel.com> wrote:
>
> Hi Marco,
>
> First bad commit (maybe != root cause):
>
> tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/kcsan
> head:   144b9152791ffcd038c3b63063999b25780060d8
> commit: 7c201739beef1a586d806463f1465429cdce34c5 [1/3] kcsan: Instrument memcpy/memset/memmove with newer Clang
> config: s390-randconfig-r011-20221204
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)

My guess is that the above commit fixed the Clang 16 builds, which
means that compilation is proceeding and new errors are produced.

> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
> >> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!

Thanks,
-- Marco
