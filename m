Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4710F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 08:13:52 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id y24so14503308edi.10
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Nov 2022 00:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jQICzlheAAJXiVyIpE/mb4oDRCrhQaDe9qfSWHDoY4c=;
        b=wz55pvCOHcKo3Ydsz7KbvWqiVmanGdbUYH39S+u752LtXh6Ehv/fxAvANJoP125bEF
         q6rivoE7QH6RCVq8QhOVp36aq5uIfiP1fFhjVYBQpdsanbEDG0FV3knZxrut+ffOdGp2
         ACZpjCPX5dGLX090pzHBLgOBmtVL48ffY2CK8ZGGjKTsJyRszU8T/FHvzKM3Q6W/VBRt
         SzMuRnONOu6rubz7ORuBS+Ajp4L1OE9j7ADEIEbTQMUKdJvq1HSBekv8c/9x4ffe8g09
         w8d1mCCk0RVWoAXH0QixZ+bfIFZXvLhCaxd1H9AAb9LbYy03baQV3uQvF8yqKt+zXMDW
         OtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQICzlheAAJXiVyIpE/mb4oDRCrhQaDe9qfSWHDoY4c=;
        b=j+FBk65wZlAThwpWuY3B07TWSIlDMnoX4ojSCIUtOBbJCXt8h6UqyU1M/3icpbPZ59
         HDQprjWaeQGR2/bqGXmQsFBfDw33XCzfJj/wCu1npF3jKA9o25080Qi7ZzAubtarulTt
         I9kRhZ6m4e/5m7khlF/wSuAJ4yai3XNRkQkiHaFeK2xTqsFrJgqF0d0Yb3f9KQ3rBKtB
         2KzTMW+uS0SlKhlKPiCHyBGacAM+qNlH/hZCMSjOOSCopnX8e4cuSEC3XsK+wRhdB6DB
         TRaSmSpkW7iKqaSfVwjthp13T2YCCg2ba61qfSNjjgVRoNzYr2eWVnlMvsCAhQBqrAIW
         8B1Q==
X-Gm-Message-State: ANoB5pmgF0Kefvb9Cy9TOKI6JLdBduSiPMU9ABzhlF++1ssWHXab057d
	6fwbv2TS7XggINVWxupIS7RsMPQp4q3Q/OvCQqq0jw==
X-Google-Smtp-Source: AA0mqf6e6HWakcq7ZmwxZYx08ECN0U0eeqU9a4JOyyCP1R4QqQKEbR1IXoqe2bQ0vwxUoX5Vk80o8MLps4SkNsYRbP0=
X-Received: by 2002:aa7:c859:0:b0:461:17e9:4ea3 with SMTP id
 g25-20020aa7c859000000b0046117e94ea3mr20140503edt.49.1669104830253; Tue, 22
 Nov 2022 00:13:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211220541.Ck9NkitJ-lkp@intel.com>
In-Reply-To: <202211220541.Ck9NkitJ-lkp@intel.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Nov 2022 13:43:38 +0530
Message-ID: <CAAhSdy2A26U5gF_WSfzcdT7v-Fg9aaKXLyT4M=4ba_=WboupzA@mail.gmail.com>
Subject: Re: drivers/cpuidle/cpuidle-riscv-sbi.c:506 sbi_genpd_probe() warn:
 missing error code 'ret'
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 22, 2022 at 12:41 PM Dan Carpenter <error27@gmail.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
> commit: f81f7861ee2aaa6f652f18e8f622547bdd379724 cpuidle: riscv: support non-SMP config
> date:   7 months ago
> config: riscv-randconfig-m031-20221121
> compiler: riscv64-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>
> smatch warnings:
> drivers/cpuidle/cpuidle-riscv-sbi.c:506 sbi_genpd_probe() warn: missing error code 'ret'
>
> vim +/ret +506 drivers/cpuidle/cpuidle-riscv-sbi.c
>
> 6abf32f1d9c500 Anup Patel 2022-02-10  481  static int sbi_genpd_probe(struct device_node *np)
> 6abf32f1d9c500 Anup Patel 2022-02-10  482  {
> 6abf32f1d9c500 Anup Patel 2022-02-10  483       struct device_node *node;
> 6abf32f1d9c500 Anup Patel 2022-02-10  484       int ret = 0, pd_count = 0;
> 6abf32f1d9c500 Anup Patel 2022-02-10  485
> 6abf32f1d9c500 Anup Patel 2022-02-10  486       if (!np)
> 6abf32f1d9c500 Anup Patel 2022-02-10  487               return -ENODEV;
> 6abf32f1d9c500 Anup Patel 2022-02-10  488
> 6abf32f1d9c500 Anup Patel 2022-02-10  489       /*
> 6abf32f1d9c500 Anup Patel 2022-02-10  490        * Parse child nodes for the "#power-domain-cells" property and
> 6abf32f1d9c500 Anup Patel 2022-02-10  491        * initialize a genpd/genpd-of-provider pair when it's found.
> 6abf32f1d9c500 Anup Patel 2022-02-10  492        */
> 6abf32f1d9c500 Anup Patel 2022-02-10  493       for_each_child_of_node(np, node) {
> 6abf32f1d9c500 Anup Patel 2022-02-10  494               if (!of_find_property(node, "#power-domain-cells", NULL))
> 6abf32f1d9c500 Anup Patel 2022-02-10  495                       continue;
> 6abf32f1d9c500 Anup Patel 2022-02-10  496
> 6abf32f1d9c500 Anup Patel 2022-02-10  497               ret = sbi_pd_init(node);
> 6abf32f1d9c500 Anup Patel 2022-02-10  498               if (ret)
> 6abf32f1d9c500 Anup Patel 2022-02-10  499                       goto put_node;
> 6abf32f1d9c500 Anup Patel 2022-02-10  500
> 6abf32f1d9c500 Anup Patel 2022-02-10  501               pd_count++;
> 6abf32f1d9c500 Anup Patel 2022-02-10  502       }
> 6abf32f1d9c500 Anup Patel 2022-02-10  503
> 6abf32f1d9c500 Anup Patel 2022-02-10  504       /* Bail out if not using the hierarchical CPU topology. */
> 6abf32f1d9c500 Anup Patel 2022-02-10  505       if (!pd_count)
> 6abf32f1d9c500 Anup Patel 2022-02-10 @506               goto no_pd;
>
> Error code?

Yes, we intentionally "return 0" when there are no
generic power-domains defined for the CPUs, the
sbi_cpuidle_probe() continue further and try traditional
DT cpuidle states.

Regards,
Anup

>
> 6abf32f1d9c500 Anup Patel 2022-02-10  507
> 6abf32f1d9c500 Anup Patel 2022-02-10  508       /* Link genpd masters/subdomains to model the CPU topology. */
> 6abf32f1d9c500 Anup Patel 2022-02-10  509       ret = dt_idle_pd_init_topology(np);
> 6abf32f1d9c500 Anup Patel 2022-02-10  510       if (ret)
> 6abf32f1d9c500 Anup Patel 2022-02-10  511               goto remove_pd;
> 6abf32f1d9c500 Anup Patel 2022-02-10  512
> 6abf32f1d9c500 Anup Patel 2022-02-10  513       return 0;
> 6abf32f1d9c500 Anup Patel 2022-02-10  514
> 6abf32f1d9c500 Anup Patel 2022-02-10  515  put_node:
> 6abf32f1d9c500 Anup Patel 2022-02-10  516       of_node_put(node);
> 6abf32f1d9c500 Anup Patel 2022-02-10  517  remove_pd:
> 6abf32f1d9c500 Anup Patel 2022-02-10  518       sbi_pd_remove();
> 6abf32f1d9c500 Anup Patel 2022-02-10  519       pr_err("failed to create CPU PM domains ret=%d\n", ret);
> 6abf32f1d9c500 Anup Patel 2022-02-10  520  no_pd:
> 6abf32f1d9c500 Anup Patel 2022-02-10  521       return ret;
> 6abf32f1d9c500 Anup Patel 2022-02-10  522  }
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>
