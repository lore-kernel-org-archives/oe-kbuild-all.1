Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18963B3E0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 22:33:00 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-62613b2c8b7so257126d6.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 Jun 2023 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1686177179; x=1688769179;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t9by4qHftkkIV9Dk+LEK7WmI/x+RI+VPrc+0RTrcbSE=;
        b=ajwy+j036eXsYFXblwjoEB6Aw6OYAH1T+vWl1PD2S4FA48pMWXcuQKY6N9JS7YBGjf
         1oJt9AhWoSXHs/cHV/yJu/2zFme+hAEFalbyMQCjYxXbxYPfLfMUuXAsxh0QngcDpKt1
         qBuxMtrQ2tRjZjaOZx1HUc1wmaGpZSpO3dQgXpzgIQbZ5P0PHZallhvi3h/A50nVhyin
         R1aPZoe5W9qz8UmY9Icgql9muuNPAEIttcC8/+xr3+ttCz5+p6MhAiq6HqsDrLhgktzx
         UqQpclTpEaVZmBM5WifFpsySrLBbfReTiNxXVQj5itXBKRbLeyNnN3N3NphVqX/2WwX7
         99yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686177179; x=1688769179;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9by4qHftkkIV9Dk+LEK7WmI/x+RI+VPrc+0RTrcbSE=;
        b=IpA9flPncjUFM4RqoZBwgJfVGM7QX4YM5azF3JKwS+AWG81BOJH/2ksOjd7jP1hUs5
         ynDvtUyuVT0MPps7lFbyk1BQHQm0+//6PPFE/vg+FaaR8VUHGycBFT8SKvnYGHo3U2de
         T+cXZk1eZBsQ4pV8V/QKoVQEnRDy7pe6SB3g+HWPqTDJkW7XOaFwLmIKUtovshXLUo1O
         cmkMpfpAlgpkd2JaVBhpNu/9vrqBxqQBC816bc0nkET5sCwbLCWvi764LwJS33XmP/mI
         4ciQhdg6oO0ESYyGjecdUN9mb6mv9eXbnu0fa5EOV/yK+wUJwE4w+56WvOMbc/nm0oW8
         FrKw==
X-Gm-Message-State: AC+VfDzjxnyw7QSHBkQiq6b23EKPKU16vKeLoCFT33zq1BWXY36eM6vv
	B6C3UU/VOzeC2lj+dvyJhgvP
X-Google-Smtp-Source: ACHHUZ4ewnwuAf75MX7qtYNX8ySyhllpz6opxYtjHAmuUfwHeN4bTSuQYtfKgtbd9TlUj5MRrofMow==
X-Received: by 2002:ad4:5c84:0:b0:625:b67c:919c with SMTP id o4-20020ad45c84000000b00625b67c919cmr6170358qvh.21.1686177179508;
        Wed, 07 Jun 2023 15:32:59 -0700 (PDT)
Received: from localhost (static-96-237-115-254.bstnma.fios.verizon.net. [96.237.115.254])
        by smtp.gmail.com with ESMTPSA id s12-20020a0ce30c000000b00623813aa1d5sm229915qvl.89.2023.06.07.15.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 15:32:59 -0700 (PDT)
Date: Wed, 07 Jun 2023 18:32:58 -0400
Message-ID: <30166d8a65c734af1c36b15f01501903.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>, linux-security-module@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jmorris@namei.org, keescook@chromium.org, john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp, stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, mic@digikod.net
Subject: Re: [PATCH v10 7/11] LSM: Helpers for attribute names and filling  lsm_ctx
References: <20230428203417.159874-8-casey@schaufler-ca.com>
In-Reply-To: <20230428203417.159874-8-casey@schaufler-ca.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

On Apr 28, 2023 kernel test robot <lkp@intel.com> wrote:
> 
> Add lsm_name_to_attr(), which translates a text string to a
> LSM_ATTR value if one is available.
> 
> Add lsm_fill_user_ctx(), which fills a struct lsm_ctx, including
> the trailing attribute value. The .len value is padded to a multiple
> of 64 bits for alignment.
> 
> All are used in module specific components of LSM system calls.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h | 13 ++++++++++++
>  security/lsm_syscalls.c  | 24 ++++++++++++++++++++++
>  security/security.c      | 44 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)

...

> diff --git a/security/security.c b/security/security.c
> index 94b78bfd06b9..8c877d639cae 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -761,6 +761,50 @@ static int lsm_superblock_alloc(struct super_block *sb)
>  	return 0;
>  }
>  
> +/**
> + * lsm_fill_user_ctx - Fill a user space lsm_ctx structure
> + * @ctx: an LSM context to be filled
> + * @context: the new context value
> + * @context_size: the size of the new context value
> + * @id: LSM id
> + * @flags: LSM defined flags
> + *
> + * Fill all of the fields in a user space lsm_ctx structure.
> + * Caller is assumed to have verified that @ctx has enough space
> + * for @context.
> + *
> + * The total length is padded to a multiple of 64 bits to
> + * accomodate possible alignment issues.
> + *
> + * Returns 0 on success, -EFAULT on a copyout error, -ENOMEM
> + * if memory can't be allocated.
> + */
> +int lsm_fill_user_ctx(struct lsm_ctx __user *ctx, void *context,
> +		      size_t context_size, u64 id, u64 flags)
> +{
> +	struct lsm_ctx *lctx;
> +	size_t locallen = ALIGN(struct_size(lctx, ctx, context_size), 8);

See my comment in 7/11 regarding the alignment calculation here.

> +	int rc = 0;
> +
> +	lctx = kzalloc(locallen, GFP_KERNEL);
> +	if (lctx == NULL)
> +		return -ENOMEM;
> +
> +	lctx->id = id;
> +	lctx->flags = flags;
> +	lctx->ctx_len = context_size;
> +	lctx->len = locallen;
> +
> +	memcpy(lctx->ctx, context, context_size);
> +
> +	if (copy_to_user(ctx, lctx, locallen))
> +		rc = -EFAULT;
> +
> +	kfree(lctx);
> +
> +	return rc;
> +}
> +
>  /*
>   * The default value of the LSM hook is defined in linux/lsm_hook_defs.h and
>   * can be accessed with:
> -- 
> 2.39.2

--
paul-moore.com
