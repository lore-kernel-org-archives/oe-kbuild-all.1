Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537512113
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jan 2023 10:26:44 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4d19b2686a9so105471647b3.6
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jan 2023 02:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fG/qOjXUfppGChnP3Lxtdh/yMmyW83w+zHL2i0LLc24=;
        b=WUIs1LZAtLAYFyTenvjo6sLHPTIrx6Ckh+t+2odL1LQlQ3jnwb4mkjaLi29nvciLx/
         FSO7qS6IEnwChhrMTrEOkMwjfi0ke53kXKWPhaFDFMvZHHs5VYAug3N4RAkVzCmVgocW
         cdbL0SueFQoTNjMyV7hWwJxBkYT9vsqWB+UgvHxm3OU6cRYAeNvDzUgvWWSPlENqDI2E
         aiYO6ZKTufJVlRQlynTKTSB3xD9/kiAU5X03ym7XMaJ0s2Z1srijP6a+aH8svR+j/CfU
         QNsPCQtYXIu+BIMdaAI3lKr9oKKHBDPSfhz3aCtD/ei/jx1/wMf+ZSJWEFC0qkHRIDtw
         3piA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fG/qOjXUfppGChnP3Lxtdh/yMmyW83w+zHL2i0LLc24=;
        b=rzmxx8qH81+A9lwxnZrboYbZUPQ3ihK+ZxcbmzNQQjifgfLv9+zLCenu9oRNZCA5zB
         gKEp7jh21P8DIQUC3Px7J09/UeT2x5rLeIsyscPGDEAAS6710jj23vdn2Q1jsKczfKED
         DFGI16rfRf6oRN1lgRF0v34wkptQuj0G68Sg3UBLl9Kj+YGQbvCltQ9VhcAwjfdAb5+h
         fgthvLxK0xkP2r7X0waugUQ9+y+IGIXhhxRJh3SOW7T8ZfhKrEalF3y7/H7suO7BbrYl
         oMJmQc3N6DkUxyL6PWMb3mYEQdBg+3YNwEwnKa2F6p9cmSOEyR9bX4RQbzhQ75eOMLHD
         K06w==
X-Gm-Message-State: AFqh2kqmoIpQyNsfp74fl4s/hoiGZgQgjo2t5bGYaiXpr7Gh6f2sgYPN
	j4pGmNunz3tj614DKXUJJXmQR7RDZBCvwqhcqFUAow==
X-Google-Smtp-Source: AMrXdXvsc1UG/zzCOdBL0lV5XfrXxwWjdZOsYD0tBmWdq+MlumYWj/JWY7nkCbBUjhudSXh2A0Zo+yiebu1ted0dLjo=
X-Received: by 2002:a0d:e60b:0:b0:3ec:2e89:409c with SMTP id
 p11-20020a0de60b000000b003ec2e89409cmr2098736ywe.20.1673519203165; Thu, 12
 Jan 2023 02:26:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301020356.dFruA4I5-lkp@intel.com> <aa722a69-8493-b449-c80c-a7cc1cf8a1b6@suse.cz>
 <CAG_fn=XmHKvpev4Gxv=SFOf2Kz0AwiuudXPqPjVJJo2gN=yOcg@mail.gmail.com>
 <953dda90-5a73-01f0-e5b7-2607e67dec13@suse.cz> <CAG_fn=Vz47zvCDoUENX5kH7Giena+w=yifWbMo28ayAUKU7kyQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Vz47zvCDoUENX5kH7Giena+w=yifWbMo28ayAUKU7kyQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 12 Jan 2023 11:26:04 +0100
Message-ID: <CAG_fn=UvnHd_gVuqkWEC9RLBUjreD-BC8sb67nLD=bq+SP7Zfw@mail.gmail.com>
Subject: Re: mm/kmsan/instrumentation.c:41:26: warning: no previous prototype
 for function '__msan_metadata_ptr_for_load_n'
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 10:15 AM Alexander Potapenko <glider@google.com> wrote:
>
> > > Would it also make sense to exclude KMSAN with CONFIG_SLUB_TINY?
> >
> > If the root causes are fixed, then it's not necessary? AFAIK SLUB_TINY only
> > indirectly caused KMSAN to be newly enabled in some configs, but there's no
> > fundamental incompatibility that I know of.
>
> So far I couldn't manage to boot KMSAN with SLUB_TINY, it just dies
> somewhere very early with the following stacktrace:

False alarm, a reduced config works fine with both KMSAN and
SLUB_TINY. Perhaps the one I was trying previously was too heavy.
