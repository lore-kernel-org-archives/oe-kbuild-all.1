Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E63DEFF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088457; cv=pass; b=IAN+0IdN3CH0Mxr2d8UKeGlUwCG5MDsyhddGehyUQ1uEOR97UgdIimFUD+5F+UjbXrrXt8+g7IHsJqUKfRIoKFnh+1G6aImSct2kM5g2WnsjsB9/GYJ3JtJ+SwNqiCDIMYOTB0ulgjvin0yaTkoX4B45WPZzOEx6EwIZDYLHksE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088457; c=relaxed/simple;
	bh=33DaKSiLeoHHZkKGgXIGQ/dZwzi1DB1eTuzhRZCbxgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WR8mBDHHc43tBOy2C0nPlK6pLFX7yfv35e5NdDdVu0erSPxLq9VQey9i5n0KGh+5LHAvD8IzFQ/0kbudi6U/AZ3ygo2MTbqB6pq4/7aengoaszK7cbpRNZg1bp3ebyrzdV5yykAKPx8iRKYLPHvo43T9RvFFVeZJBC7RS03I4XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f2cAiytM; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f2cAiytM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44c350a5b87so965627f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779088454; cv=none;
        d=google.com; s=arc-20240605;
        b=agDesfdeHaJgFWfaM4psIZxYHbvjbkR6Gr23wrpC0EuGvkW4cR4oG2cJ2koop7M9Rr
         Lb50uTAXzjp+rmduURNm0GYsGZQ1R75OuFgyanuCqNKCgn8CHV2Zb1VodXN4QdVlR4nG
         M05jEB6XkZ2W6z01WBbVc1UTznO7sIuS5TypQW1ZC7bQ7vaspaf4a4jpx2HKiTLHupnE
         hJzPqqn2Y4hmOsP3RZd0xv/lZcIT9mC4sdaELlVnN24Mnr+87mjENQ82W+pBXOpisbg4
         qO60oUZeHZh+yzSEsJV2I2AZ1SHC4l2rWZpFe4Da4+bqu1kQC3oXFp7kaVf2/V4C7U4E
         C3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O7Jv7YKg9B4IAJGkXHP6bs2Gud+eLQyTYJ9ABZ76kfs=;
        fh=rlPIJo2Vlu4xb+UANhUt2eunZ/KjRErtm6GKqYIGpaU=;
        b=QDV/60OiQoXUP6HmGkUvWX4tQf13eaPb1PRgaS1C8kTaTpKYzNuNyakvsjVmH+ldfd
         bUGtI5ctHjPfdGFlYQ4FrXapYHhi616lVpCUC90lxV7NKxJEgeI2cufD01cjTSH/WEqj
         yizKpvUOezMIDJ7HrVThAv1B/Z3VV0Ft8e79yC3rlzW4o40/juN/OIQW5N/p7jjpNo1d
         TEJnmfcucE68EwA0RpKfLgIAgKfJVHfl0S7W9ixERFM8PTrLfcjcheB9882sZx6QAfFQ
         e1ZpMDEoJhVS/f5syBC3bMibiUNOJa0GouvpiXq9BbqOk3BnLQCT84KZDYmZFBzqokIC
         gBPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779088454; x=1779693254; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O7Jv7YKg9B4IAJGkXHP6bs2Gud+eLQyTYJ9ABZ76kfs=;
        b=f2cAiytMvAcAHjg+2Bq7D9Lp3j0rDk6+Mj+NhmTFXWZvfQh7fdDhBYC0m4nIbPqMEM
         tN9iLIpDIBzYPU6GPNoKROMzYL/V1tOoulAFA7kcRGgVbz8moc3mODburofylD1X69EJ
         I5xxUHblNOQkBXqYF1umYCQofP241hw0Y+ywxKQUMNdpmYtv9oQuerOswDDyHeq93UwJ
         4t0gycbx0r9uVKMVLEsYV84swBPxwPhOY9sqy5L0aUlrg01KZ/siaQJXMXydtYYJoVl5
         k/aqc91Bh/qrfQO7CRBGI99jhihZeqNuWtDAGFAAXluDfxK9XNQ7RieENpyP4K0Y4/pB
         kUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088454; x=1779693254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7Jv7YKg9B4IAJGkXHP6bs2Gud+eLQyTYJ9ABZ76kfs=;
        b=mcEG8HU87cKVO9NMXFclVqJ4hS1BC3GK3CHoY8budz9iU7huKUQpLpfjfaY9JTcYg1
         cStJ/xDNxsZGKaX8Cw+xc7MeCj51wZusLjYoe8p0uKzAkWmOjgh34DpXYeM08ap7t9JM
         Jh2GHT68hiCxKoLP+etQhEEAFr8+TU/mKxoY7TtAO5l7FjA5AtlWpjoU4HpoqWxLMy4N
         cBshQ8nnVkVTBF3drkhW0a87QZbDriBkai6O28fvElEmepkofM/fxXZcrrmgJlFgQvFI
         geV8LmWxZZLWWpKZ1Lm8DxpcRffsn6V0OqTOSvzncsGTri4sYNP9BIxIt+g6jF91dbkZ
         Zvhg==
X-Forwarded-Encrypted: i=1; AFNElJ/gCCfAAhmq3rBgPd+u5y6d2gbET1Bq1txq+Q4TpiOD+apFrxMvFFhoI2VW3u1F/BmwObkV3v7kI3gyz63a@lists.linux.dev
X-Gm-Message-State: AOJu0YwjM63jYBERNEmzjDp+K8ze6JuYUfov43gJm9D1BKPkkwFu/ggg
	zRBqJiiJUHxYS3yd8i/GDc1UzAsrPchUc7rd2ma4kKB4B+q5c53hPl/5rV1KBOKFQx61gnK6asc
	EtBQInSS/i/i9giFDOFHmHTNI2u15wUa9kuAplsgMTw==
X-Gm-Gg: Acq92OEVKs1RggzQsv3mSnAxCY7KoEPWP+bItzak/S/gvtm725OWvnp53yGXw/5MbPD
	I9fG0UPQumfFcNHxSztAZJoE6eKLzg11ZjZmJzXWg2sMc0rDKXs4w+mX2qYzN4zRKjqX2agU+3J
	U32eKZqabGG/iQM6Uo1ZbonAOUAbs+bqDsIqnJJOGidpzsn9nUaNyf56bhLIh7qkT5YFquD3hOu
	t+69ywu5qGEPO5uZZB4zZtd+h8JKVyMDE/P+Dot1uNJ/ap8XDDYIm+0BcG46V1sYstkTQ0IzaCn
	TvML/aURx2D4cE+ZDJ1UAEsryMv46hDNoPyBuNoSNWZ10UBn/K1YCkJ85fRz2XQH4ALNqLcW4oj
	LD38XgK8=
X-Received: by 2002:a5d:588f:0:b0:43d:733f:aee6 with SMTP id
 ffacd0b85a97d-45e5c5aefe4mr20471223f8f.10.1779088454245; Mon, 18 May 2026
 00:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140955.Dr60lOTF-lkp@intel.com> <CAPjX3Ffy5eThg4tDhvLYh-Vb3gzbSMzhkL8pJfDgtt-YD6CTTA@mail.gmail.com>
 <20260515150222.GR2558453@suse.cz>
In-Reply-To: <20260515150222.GR2558453@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 18 May 2026 09:14:03 +0200
X-Gm-Features: AVHnY4KJlXtZpmrbIITn4S2J76KjWqy2PpMkLMT7XgtFYcqHuVQ3rKPY-zrY3yI
Message-ID: <CAPjX3FdLz5sRxw6ycvzoKo7JFPQiuwM6NoSdXbWJRBbHgF=9NQ@mail.gmail.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 34/43] fs/btrfs/super.c:659:3:
 error: a label can only be part of a statement and a declaration is not a statement
To: dsterba@suse.cz
Cc: kernel test robot <lkp@intel.com>, Josef Bacik <josef@toxicpanda.com>, oe-kbuild-all@lists.linux.dev, 
	David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 17:02, David Sterba <dsterba@suse.cz> wrote:
>
> On Thu, May 14, 2026 at 05:34:20PM +0200, Daniel Vacek wrote:
> > On Thu, 14 May 2026 at 03:28, kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> > > head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> > > commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
> > > config: nios2-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/config)
> > > compiler: nios2-linux-gcc (GCC) 8.5.0
> > > smatch: v0.5.0-9185-gbcc58b9c
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202605140955.Dr60lOTF-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    fs/btrfs/super.c: In function 'btrfs_parse_param':
> > > >> fs/btrfs/super.c:659:3: error: a label can only be part of a statement and a declaration is not a statement
> > >       int ret;
> > >       ^~~
> >
> > And here we are. Old gcc also complains. Though it is less clear :-/
> > So this?:
> >
> > --- a/fs/btrfs/super.c
> > +++ b/fs/btrfs/super.c
> > @@ -347,6 +347,9 @@ static int btrfs_parse_param(struct fs_context
> > *fc, struct fs_parameter *param)
> >      struct btrfs_fs_context *ctx = fc->fs_private;
> >      struct fs_parse_result result;
> >      int opt;
> > +#ifdef CONFIG_BTRFS_DEBUG
> > +    int ret;
> > +#endif
>
> Inline ifdefs are an anti-pattern and should be avoided if possible, so
> the statement block in case is fine.

OK

--nX
