Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFD11C3C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 16:00:09 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-589e590af61so1164407b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691856008; x=1692460808;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKjXbNOxBUoKdt5wk+C46W5/G1KOdB0MMzQNnwM3Y04=;
        b=pAqqF1ibtmBCRDkbVvPzU6fUG3LiEiRyxfSGsp5AZ2Ib2GqCFulXDm0VCI/gxiEvhm
         pDmhSPim1FziI/qSq6gsKlCK4XbPkCZt91nZrKWb91P8O+jlHX80mF/kaypjBpGvhlvW
         W5pALc0FyFNq31YrYCYxTQPPN/jr1MotNvv14HhK3FwtBwsKiCFvw/5GMd8y7ZuvYiZ6
         ts9vtpi88m+y5elN7mLubEFCUfJgiIi46MaYYjLY6Gybtu2T8fduRoMzfENdIJUHcbee
         nNiISY5BtZMy9DcE5Ab/jeaAS3GoJp/s/1gqbtVOkp4OwRT6Aft9JJbowOXp+m7hKASG
         5ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691856008; x=1692460808;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKjXbNOxBUoKdt5wk+C46W5/G1KOdB0MMzQNnwM3Y04=;
        b=TK6PWvRWwIgT8+lNiw0l3uSIm1FJt4WMyInQsse1FI6QndgPcv5DzFxVDpX52rR5sY
         AXHRGirAvnWG3ryaGHmKmHrz0oZPnlrFtwl5C5FSg+bsOvRRPbM2ygwmPHNsmc883SNZ
         CAycGt1Bmv7a1Uf7nNY50g3Q0ALrXMYq6bQPDKhlMm+PBIqBnyxODpyJsltqfyBcTBLb
         TWpjc8M0dpzhsJfzTv7ItduhxO4oyLpnOgs3fAN0F/x7umqwNWS9CvoFJnLIoTmFKVvh
         thculF7x3oLqxeja5VVH7ZYIe4kcyGFmwUDuxxRvGYzajeuBOvieqBCcAokZg486JMzT
         0rQg==
X-Gm-Message-State: AOJu0YyQW1E4YBtXkvJWOKb0MkHPtPnJWO+AgyoTmv5yRYuwvQskn+Fl
	TEHC7XJ16icBIf8bi439jQBhdA==
X-Google-Smtp-Source: AGHT+IEocvpvVOui7yTY9ExbIMfEkllGH76f/GF1jlQQOhNcLwCvS3Wa+1LCaj6CaKHNGXu/RMX0UQ==
X-Received: by 2002:a0d:e8c1:0:b0:586:a68b:4c97 with SMTP id r184-20020a0de8c1000000b00586a68b4c97mr10628956ywe.13.1691856007967;
        Sat, 12 Aug 2023 09:00:07 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id s6-20020a815e06000000b00559f1cb8444sm1687895ywb.70.2023.08.12.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 09:00:07 -0700 (PDT)
Date: Sat, 12 Aug 2023 08:59:58 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Julia Lawall <julia.lawall@inria.fr>
cc: Hugh Dickins <hughd@google.com>, Christian Brauner <brauner@kernel.org>, 
    Jan Kara <jack@suse.cz>, Carlos Maiolino <cmaiolino@redhat.com>, 
    Dan Carpenter <dan.carpenter@linaro.org>, 
    Christian Brauner <christianvanbrauner@gmail.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: Re: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611:8-15: ERROR:
 PTR_ERR applied after initialization to constant on line 3607 (fwd)
In-Reply-To: <alpine.DEB.2.22.394.2308121307551.3315@hadrien>
Message-ID: <2c47913e-1b11-dbcd-4f65-e3b11dc41da@google.com>
References: <alpine.DEB.2.22.394.2308121307551.3315@hadrien>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 12 Aug 2023, Julia Lawall wrote:

> Maybe it would be nice to transform this to a more traditional
> if (IS_ERR(...)) return ...
> and then the branch code with a return 0 at the end rather than relying on
> the PTR_ERR of NULL to return 0.

Thanks for checking, Julia.  But as I said to Dan yesterday in
https://lore.kernel.org/oe-kbuild-all/baf5ac73-23b4-e325-28e5-9547af7ec3a@google.com/

I'm going to resist making any change here.

As you observe, the code is correct as is.  And I did have a version
(unposted) which laid it out exactly as you suggest there.  But the
collisions between different branches of vfs.git (and subsequent mods
here in vfs.tmpfs) was such that I aimed to minimize the interference.

And I'll expand: if you look a couple of patches later, you'll see why
the PTR_ERR(old_xattr) makes more sense: there is then cleanup to be
done before returning, shared between the failure and success paths.

I had in mind that people might be trying to apply this series to
different trees, and flipping the indentation back and forth from
patch to patch was not going to help them, when there's a known
conflict to come on the current_time(inode) line.

> 
> julia
> 
> 
> ---------- Forwarded message ----------
> Date: Sat, 12 Aug 2023 18:47:30 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611:8-15: ERROR: PTR_ERR
>     applied after initialization to constant on line 3607
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: Christian Brauner <christianvanbrauner@gmail.com>
> TO: Hugh Dickins <hughd@google.com>
> CC: Christian Brauner <brauner@kernel.org>
> CC: Jan Kara <jack@suse.cz>
> CC: Carlos Maiolino <cmaiolino@redhat.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.tmpfs
> head:   aa5b9178c01905d7691512b366cf2886dfe2680c
> commit: 5de75970c9fd7220e394b76e6d20fbafa1369b5a [15/19] xattr: simple_xattr_set() return old_xattr to be freed
> :::::: branch date: 23 hours ago
> :::::: commit date: 3 days ago
> config: openrisc-randconfig-r052-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121841.cgYdEdbt-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121841.cgYdEdbt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202308121841.cgYdEdbt-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> mm/shmem.c:3611:8-15: ERROR: PTR_ERR applied after initialization to constant on line 3607

I'm guessing that there is some common pattern of mistakes which this
check has a good track record of catching, and then it is useful; but I
don't see it as useful here - there is nothing wrong with PTR_ERR(NULL).

Hugh

> 
> vim +3611 mm/shmem.c
> 
> b09e0fa4b4ea66 Eric Paris          2011-05-24  3593
> aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3594  static int shmem_xattr_handler_set(const struct xattr_handler *handler,
> 39f60c1ccee72c Christian Brauner   2023-01-13  3595  				   struct mnt_idmap *idmap,
> 5930122683dff5 Al Viro             2016-05-27  3596  				   struct dentry *unused, struct inode *inode,
> 5930122683dff5 Al Viro             2016-05-27  3597  				   const char *name, const void *value,
> 5930122683dff5 Al Viro             2016-05-27  3598  				   size_t size, int flags)
> b09e0fa4b4ea66 Eric Paris          2011-05-24  3599  {
> 5930122683dff5 Al Viro             2016-05-27  3600  	struct shmem_inode_info *info = SHMEM_I(inode);
> 5de75970c9fd72 Hugh Dickins        2023-08-08  3601  	struct simple_xattr *old_xattr;
> b09e0fa4b4ea66 Eric Paris          2011-05-24  3602
> aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3603  	name = xattr_full_name(handler, name);
> 5de75970c9fd72 Hugh Dickins        2023-08-08  3604  	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
> 5de75970c9fd72 Hugh Dickins        2023-08-08  3605  	if (!IS_ERR(old_xattr)) {
> 5de75970c9fd72 Hugh Dickins        2023-08-08  3606  		simple_xattr_free(old_xattr);
> 5de75970c9fd72 Hugh Dickins        2023-08-08 @3607  		old_xattr = NULL;
> 36f05cab0a2c97 Jeff Layton         2022-09-09  3608  		inode->i_ctime = current_time(inode);
> 36f05cab0a2c97 Jeff Layton         2022-09-09  3609  		inode_inc_iversion(inode);
> 36f05cab0a2c97 Jeff Layton         2022-09-09  3610  	}
> 5de75970c9fd72 Hugh Dickins        2023-08-08 @3611  	return PTR_ERR(old_xattr);
> b09e0fa4b4ea66 Eric Paris          2011-05-24  3612  }
> b09e0fa4b4ea66 Eric Paris          2011-05-24  3613
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
