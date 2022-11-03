Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7137E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 05:38:43 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id g10so941891oif.10
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Nov 2022 22:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLEu3t5AnSbUChUpRMsVL+20+KRzqg0fkfOmBWO9nO8=;
        b=Adh+/6/RWAC5RfX1jcAoXGOY+XED8fJCKVRxVzt8j5ZRo2bMZ+ooyY6M8Tr4I21m+n
         ZE630lWmGsU/LqyZRdPUOvAN3E3obzUXPXWhmPeKgy5sbOPikMq0pg1qK8qxRNozV2bN
         w8ffMFvQkIvW4Eu/1lcAXBXCpGNUxSoPmfq1/9T0AkXfyc2IKO1PpYgnbLs4IXu2M8v+
         0IpMlA+gisDAue5x3+J7ESz2U/Mn3tna880WdJ+9ko7GugXull9SkMfyj96k4P8wCziF
         yMK4jwvw0OAuKZFGMWDxlFU4P2HWAudJ3+WbH0txhbJFuu2Ho/+uilmWM8NAMs2Zozxd
         WNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLEu3t5AnSbUChUpRMsVL+20+KRzqg0fkfOmBWO9nO8=;
        b=iPuK1k/J7s0H9zVizAui4TKlQAFBFBTkRSO6ybe3vn0ofQub2MEVmTszJOdXa196yd
         MD/wSLnbObWHC5JNL6LiagmrPXJAr+0V9L8yMMOcgUSbKabmUmO/ABqUd2EcaktX4G1w
         NjPavgiyVza0g6+D/pZXFKLEsayArKkPgoI1EUmHR0yNKtPX1cxPWc+pStnzqGLZya/p
         HCCrYajy8hTLcZhT2yiBWYVVr6ZWSu7ZFCbYdUpb3pFMzGM7Ox44eQUXxi8cuAZ3mZ0A
         Z02EOy9/byjphkneawTnW2d5G9X5FhRTMMCym2+l3nPLnq4ukNKEWgiBjQRvAF3+m1wj
         1SAg==
X-Gm-Message-State: ACrzQf0xn/rGEiuwij6Eo9+1dss0CeJOIibHRpGNtuRF+4vrI9DIH8fv
	KHsyYeaWChUxmA+KXP7MocKnAw==
X-Google-Smtp-Source: AMsMyM6YcQOW5c0o1WqlNidD9ZMIXlHUfiRSfwQdMhe8VJrVif4bVQukzIrPQvbpN46WhLpQrGRIJQ==
X-Received: by 2002:aca:1e11:0:b0:359:6a2e:ff0f with SMTP id m17-20020aca1e11000000b003596a2eff0fmr14770039oic.33.1667453922343;
        Wed, 02 Nov 2022 22:38:42 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id c4-20020a056870478400b0013320d9d9casm7038658oaq.44.2022.11.02.22.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 22:38:41 -0700 (PDT)
Date: Wed, 2 Nov 2022 22:38:32 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: kernel test robot <lkp@intel.com>
cc: Hugh Dickins <hughd@google.com>, oe-kbuild-all@lists.linux.dev, 
    Josh Triplett <josh@joshtriplett.org>
Subject: Re: [lkp] [+360 bytes kernel size regression] [i386-tinyconfig]
 [a3cbd790ac] mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts
In-Reply-To: <Y2Mts96+N0TMFp90@3c1188ed3aac>
Message-ID: <9d70f6-db1-faeb-3a2a-a42fefc13e3c@google.com>
References: <Y2Mts96+N0TMFp90@3c1188ed3aac>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Nov 2022, kernel test robot wrote:
> 
> FYI, we noticed a +360 bytes kernel size regression due to commit:
> 
> commit: a3cbd790ac6e9d8f6d63731647a8123d0fdc69a8 (mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts)
> url: https://github.com/intel-lab-lkp/linux/commits/Hugh-Dickins/mm-huge-rmap-unify-and-speed-up-compound-mapcounts/20221103-095502
> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
> patch link: https://lore.kernel.org/lkml/1b42bd1a-8223-e827-602f-d466c2db7d3c@google.com
> patch subject: [PATCH 3/3] mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts
> 
> 
> Details as below (size data is obtained by `nm --size-sort vmlinux`):
> 
> 74c6c283: mm,thp,rmap: simplify compound page mapcount handling
> a3cbd790: mm,thp,rmap: lock_compound_mapcounts() on THP mapcounts
> 
> +--------------------------------+----------+----------+-------+
> |             symbol             | 74c6c283 | a3cbd790 | delta |
> +--------------------------------+----------+----------+-------+
> | bzImage                        | 491584   | 491712   | 128   |
> | nm.T.page_add_anon_rmap        | 100      | 209      | 109   |
> | nm.T.page_add_file_rmap        | 39       | 143      | 104   |
> | nm.T.page_dup_compound_rmap    | 0        | 69       | 69    |
> | nm.T.page_remove_rmap          | 87       | 151      | 64    |
> | nm.t.page_dup_file_rmap        | 0        | 28       | 28    |
> | nm.t.lock_compound_mapcounts   | 0        | 13       | 13    |
> | nm.t.unlock_compound_mapcounts | 0        | 13       | 13    |
> | nm.t.__page_dup_rmap           | 40       | 0        | -40   |
> +--------------------------------+----------+----------+-------+

Thanks for the feedback.  But I think you'll find that patch 2/3
gave a nice little negative size delta over patch 1/3 and baseline:
it's not surprising if patch 3/3 then adds some back.  With my own
configs, I had found that the total text size ended up exactly the
same, or 80 bytes less, after the series; but 130 bytes less midway.

Ah, i386-tinyconfig: I wonder if that does not enable THP,
and suffers a little from doing more work on PageCompound now.
+360 is more than I'd expect, but I won't worry about it,
until the humans start complaining.

Hugh
