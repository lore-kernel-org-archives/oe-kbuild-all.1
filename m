Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EF8A480
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Nov 2022 21:02:13 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id cg5so9355829qtb.12
        for <oe-kbuild-all@lists.linux.dev>; Tue, 08 Nov 2022 13:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tD2O1L9LSR5X2UfQHPh6yPxlJcgZh3XBIKttVtqL0pQ=;
        b=Q1kjk/AWggVA2ru6tX7UeIfHuMIG55q6B3J49aXZ5e6OqkBSN+mJIVvyjue6/FV+9H
         IHQJcFtKwuPIkqFGHLKSs/5kwcCTYA+ms25B+2h7z1Yx8znWeKHwKSvfksRzWivChLsW
         6i3KGk/vaSTa0WbGaxBqtL1Rin+PXtHdFNG3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tD2O1L9LSR5X2UfQHPh6yPxlJcgZh3XBIKttVtqL0pQ=;
        b=hJ/8hpUjQx38r1UwtUjDs6AQR0u7Yowz/KvC6+fo7kle1CO8TQRg7tNeSY4kGQ84W+
         u/qrROW7/5eZmK3VTa5kkYvDwE7UYaWXVuMTgM0kbsnkBkOr0mkqjED1tE89XP2/7HaG
         AIyOuWL2nKXAtgF9tpDvcboqJZPkohTzaIFcUg0ejOG43yTFfIq0CuITJ72zdveBCblf
         Cus+gNv2mlVzJTV3SETWIie8kJICgK7+reGHY0nJodlzA+7lng8KIU+GEfB+xE6i3hIk
         XBK8zAUJEBDNrfL8lrXzhRQLHss8v+Hx2W6HAIz+51f/O5cDHf6YxMrLMpaPr6I446QG
         7pYg==
X-Gm-Message-State: ANoB5plrAwjWIwo5wEGDnDNNBi9zXfphhgVYxjpau5jC0rUfpSdgxxoY
	KxQ4IzmIvgunW0nZkTWnVYgxiG7y4yr5Iw==
X-Google-Smtp-Source: AA0mqf6wmXnZ8u2suyUErQ6L5AaW9KbAvcbO0NKcJvyQZ6nO77KAvCa8ii1L25CbuLANXiT+o24Ukw==
X-Received: by 2002:a05:622a:38a:b0:3a5:8993:88d with SMTP id j10-20020a05622a038a00b003a58993088dmr10036756qtx.4.1667941332037;
        Tue, 08 Nov 2022 13:02:12 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id q17-20020a37f711000000b006e07228ed53sm9722378qkj.18.2022.11.08.13.02.08
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 13:02:09 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id n85so13196832yba.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 08 Nov 2022 13:02:08 -0800 (PST)
X-Received: by 2002:a05:6902:1352:b0:6bb:3f4b:9666 with SMTP id
 g18-20020a056902135200b006bb3f4b9666mr52493567ybu.101.1667941328225; Tue, 08
 Nov 2022 13:02:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221108194139.57604-4-torvalds@linux-foundation.org> <Y2rAuDLUYk+QcJal@2d882e5f7ced>
In-Reply-To: <Y2rAuDLUYk+QcJal@2d882e5f7ced>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Nov 2022 13:01:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiL0vN0PTOLAX5VSmjAR=eGnLXZY62_OEM5XTO8nYybqg@mail.gmail.com>
Message-ID: <CAHk-=wiL0vN0PTOLAX5VSmjAR=eGnLXZY62_OEM5XTO8nYybqg@mail.gmail.com>
Subject: Re: [lkp] [+115 bytes kernel size regression] [i386-tinyconfig]
 [0309f16088] mm: delay page_remove_rmap() until after the TLB has been flushed
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 8, 2022 at 12:49 PM kernel test robot <lkp@intel.com> wrote:
>
> FYI, we noticed a +115 bytes kernel size regression due to commit:

Heh. I don't think I personally care, but just for posterity and in
case somebody else does care, we could make the UP case not delay
rmaps at all, matching the S390 case.

The reason is simply that rmap delay is only needed for MP TLB
coherency. So not important for small UP systems (which is presumably
the only case that would care about those 115 bytes).

But I'll leave that as an exercise for the reader who cares.

                 Linus
