Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D21DE8BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088593; cv=pass; b=n8Sa4FC7+X1O+4Ng/kpC60HzbLU9jRSdTGhNIiU7XLhruANDZTOmxD2wuNH2HG4XJQ6Y0ys3okBQnH2mdmY3MtgRIvlV0nnVYrxp7IGQgmWA7BfM6Uf0DQpsKTWyUecSXTdMArDsVdh3Mi56AVexRnYx66l+C8naA2k5qfUUNSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088593; c=relaxed/simple;
	bh=tx22XnQq5iusGZNUi4jx8fJul8fZXyHUd9NeJj7bbmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wptb/yKCvf9ZafXN1vw/PZijgYZqEOODuQDVXZlRyBSShNaPQweiPJEITLSoDq26xJ6UbPYe2RggwgqY7wOEKiFMTqRwHr3BqJNWUfewbkWyxV8qcVYxTVl6EcW6M4KR8GT9p/8JBiaS13Z9X6nx4UchnIwJPQOjzJJ9gnYWQ3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K+e86wjx; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K+e86wjx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so990403f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779088590; cv=none;
        d=google.com; s=arc-20240605;
        b=FYvVzYKWuaip0zUbSCS08Tfcvck249cLgJ4jmFiRhiHESZ/ijkfVxZsX08WEL1H80j
         4Pc6Q9QgQosxCURATXLUlX/4MnaiG8avYCiqs8Y6VXbVUZ3xh6OludcPLOxQun5ySvN4
         llNBIhbqsSkAuJWQmL/LRE9kOkAL68S/1Edq6zMF6z/OmFNBj0CoeyO7S63xkafBZSTi
         4CQHjxGy+gwjGB5GdaJK/PMsC2sDXiWuHhesBxFVmHkzOpHjcRT6TFOCO3tW1N2/yLo4
         qaT5zsfbovZmDBo0I9IEnLDCz72Hqr26v4bHF0TBFnGVlVG9HgN9wPHgprvESvW1/FUV
         kLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZczKVujFRv7rihwZvdeXGSr/XKmzVkTgnNL1SzmYsco=;
        fh=jLiKfW3HxmwdyoybqqTZBv8Gm/kSnyjIaYqW0mFmpMU=;
        b=ZX92zIji+eRJgoeeQTgHIQHn8y+r2600u283+Vb9L0yv0+/OEqOJylxtPsDg6SFF2y
         AEZ+mCDyJ385Rj16O0YD9eoSBdu7oKo4cIbp1ppqgVI5mWig2PkQZdzlWaXX9JQTV8Mf
         aAPOAvDzO+HEYgiYGMC2xynb3ZPefJ49e/PTDzZLHCpZo+g8pyA28TYJg6IN9yECJQCd
         4R0/M/P8nUSQzcgTVxJG2VTN2UvrPNyeA9oTCH8WN7rdBWIQtyIF46WZCo46RszsZBgC
         Oeb39KfE8qCJO4s6P7fbRwUWAWRaVN2h5I9n3CzlhuqVVZzrFlT1BgR4azN96EhtoewM
         j6xA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779088590; x=1779693390; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZczKVujFRv7rihwZvdeXGSr/XKmzVkTgnNL1SzmYsco=;
        b=K+e86wjxJ4+BgTjgrPjq/tln8lxYR0r1aOa7IyKt0tHocs8aOxjGLrKfdfVUyG4kAe
         Ia8gVEFzfrC0C39zKNGc7Bkz0SV690bYcEbWwCZErrd3/5x47myVDCMS+1U6XPLjAzAg
         vHp4oVNXdagsaFwj0BIhncwAIx1HRermwGsM5zQagETPwqkF0Tm9FS6sL+aVwPLdbUix
         gVo5b+fM5GJldKpPWl8RYDfnkId+IKXzCwfTHMyIJs2wVQFiIupDi29GlynWH+YQaAQJ
         Aa8mPlpjcVPqULtJFJsp2ooHZas+0yXLSe8qbPg9DVMxRVECuwqy95y2jtXwRtLgscgj
         c3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088590; x=1779693390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZczKVujFRv7rihwZvdeXGSr/XKmzVkTgnNL1SzmYsco=;
        b=tM/9d+42Tr3Wz7ojzmSNtvZx19jyfn3qhVFIyLAxlmjne37y+WHFhLs9H/vFIuiuWW
         A1yCfAJU0LfOtMte+dR8jffEPCMHxzbcct20kRDLOSufn5fqDrzAH8FiLJnvE0spWks1
         IFMapYLcG21JsKagWMYg/67OoR7xm5wZt2nVPyvqbMr9pJKLx6extowsa//RRuA7h8is
         OenYp6gZjycTNmgPNAAVFm87ujVPVmKrjURKFTjv+vZ8eFVtOS8krygGFB4wkNaDf4ce
         +Z15sjyZ/wA3shplA+OOCHcGHrPHb3yDdZHsxOg8FAQwP2jVM+TjCZqM0R++2M7an3EN
         NC7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8lTMBcsqWTA6ZbXAVYPcMo3VZRlI4t/cvigMwZN0kXvvekfg4PgjG73rgKd6IZkqxpvfFmwIrIzcPd8Btx@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr0zde6Da+HfYVZWtKVASOe/Vo0lqwhRXTY9im8ZP99D4a5TyR
	+wfgMTtkJNwrRkGOIAiAyBhQCcIFMCGdN/yHWwRuCS+GU0TqD8XXDX+lgvihAJx9SLQ0ZepgSCl
	0N2OKuUcLlASKTdeXIMw7HstlyuX4AUMDqxlVAY7JGQ==
X-Gm-Gg: Acq92OEcjbjVlIobLbtQMmQpjHtzs7vj+3Euvn1L5Tmm4iBp1gEikmCfpzf7eEVDN8A
	bvvpyV8PY5rO3lnuihHct1KwLCe/rDbQm/CtTTaqHHXn3xXEhJTo4Be1TJ+qieXG8BjUg4RSC63
	0i+QcL7EniZhIfnuYGhyMijORxoHKwNjZienh6hVZqudiooTAzjuZGg6Wdej/0zmhk8D89t9JW0
	nLrabLB6Xtj7247lbbu2InzKTb4jM/UtV5eADEKi0rsq6/nhHlG9+/vQae49t6unkV8fNjL+yC1
	H0cGzLsSko0GCmpJofrnDr3eYJXIFVnnavtYo4Y9y7SNQLU4lZiUpEf3jlPpL+cQ7cOj1+Q5j/T
	z/rlWiXAYNaAkDtzuVYdGUFgVErkO
X-Received: by 2002:a05:600d:8:b0:488:904b:f31 with SMTP id
 5b1f17b1804b1-48fe6325213mr176536695e9.22.1779088590627; Mon, 18 May 2026
 00:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140957.DjseWRNF-lkp@intel.com> <CAPjX3FduCSJWY_Qx53ADfh1tpvsAjM7XCa=j1JjL3OYF8B4D7w@mail.gmail.com>
 <20260515150436.GS2558453@suse.cz>
In-Reply-To: <20260515150436.GS2558453@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 18 May 2026 09:16:18 +0200
X-Gm-Features: AVHnY4KK42SBaktV70LPzRFHYdAD3QUszMpbRedzWLO4wFIADi2xjoQfI2YDfmI
Message-ID: <CAPjX3FdXrYCSqDDKXctdnKY1hrQA6ScFnGDxOEcvf92yeg6gmw@mail.gmail.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 32/43] fs/btrfs/fscrypt.c:240:34:
 sparse: sparse: incorrect type in return expression (different base types)
To: dsterba@suse.cz
Cc: kernel test robot <lkp@intel.com>, Josef Bacik <josef@toxicpanda.com>, oe-kbuild-all@lists.linux.dev, 
	David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 17:04, David Sterba <dsterba@suse.cz> wrote:
> On Thu, May 14, 2026 at 05:53:48PM +0200, Daniel Vacek wrote:
> > On Thu, 14 May 2026 at 03:51, kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> > > head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> > > commit: fda37caa264ff597b0fc03039dc95e392432bbc5 [32/43] btrfs: implement process_bio cb for fscrypt
> > > config: alpha-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/config)
> > > compiler: alpha-linux-gcc (GCC) 8.5.0
> > > sparse: v0.6.5-rc1
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202605140957.DjseWRNF-lkp@intel.com/
> > >
> > > sparse warnings: (new ones prefixed by >>)
> > > >> fs/btrfs/fscrypt.c:240:34: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_status_t @@     got int @@
> > >    fs/btrfs/fscrypt.c:240:34: sparse:     expected restricted blk_status_t
> > >    fs/btrfs/fscrypt.c:240:34: sparse:     got int
> >
> > @@ -238,7 +238,7 @@ static blk_status_t
> > btrfs_process_encrypted_bio(struct bio *orig_bio,
> >          ASSERT(orig_bio == enc_bio);
> >          return btrfs_check_encrypted_read_bio(bbio, enc_bio);
> >      }
> > -    return btrfs_csum_one_bio(bbio, enc_bio, false);
> > +    return btrfs_csum_one_bio(bbio, enc_bio, false)? BLK_STS_IOERR: BLK_STS_OK;
> >  }
> >
> > This should do the trick.
>
> Please use errno_to_blk_status() as btrfs_csum_one_bio() can also return
> -ENOMEM, which is BLK_STS_RESOURCE.

Ah, right. Will do that. Thanks.

--nX
