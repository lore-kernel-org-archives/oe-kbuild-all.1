Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D622EFDA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252436; cv=none; b=aFwtV8IEZ9KUjrGYDo8h8iYX/hxcrPY/W9HV8jDO1ZZnDK345EnrgiOo3oz+OvXJtoitcTh/AaCcxD4KZdkGGjN8eUZnLtPSiPC4gzWyxHFxQZhghwdISHmkTLmihWGUp9rx4fDHvyLLLN0ii1VzmIsS4vUXn6tag0ByD3yC6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252436; c=relaxed/simple;
	bh=wNoDWg6mJO3cLoCYf3JqbMN76LZntd42xBIfHg2bFSo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6F2P+pGOeSy65n/A78Uooorc24l8yqipn3hmS02Fv/cvg3oGzhwJXPYQkm8VrS4/08JZINiogFBz1jk4SHpooArDCUgcMx8X/3vC6Oc2yaBoKihkOA+1+4Jh4rHOi8IxviBAjBaOEYbRyVp0HZRAjcisBFbJ4eByObA3XUAZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W003036l; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W003036l"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so19851585e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 09:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766252433; x=1766857233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzi9+ITS5sdqpVBInAmAuup4pJjmlBO/nHdw3S/rzlM=;
        b=W003036l4mgcMs1QXKeUWL3YK1yPscH/LzrNUuOxSBO0V46Zy53T/rqxQEMdDEnzWH
         EchnTGTrpJwxF02p4rcJ7nuNKZFHEowP//l9x5ze8P+lVBDAcTi3qaUlSIH88ZpWsBn6
         xzks2Z8oWGxQMlyyAeNhBCJhQw3NeUQlYanI7PxV53JW4KPolp0NS1FRFxhAQpaCl7kt
         2IVxb2xmj0Xs+6gstavkygBn247fkUkkCT/lGhZ44TVqMG9RjBeC3XcHZZV3o1KvWRn0
         xs3DepVN3uYzfORfoHLSXh95hZJwLwAdbKp2SyFabaMiRId3Wr90GVABfzdONdNZbFCc
         SpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766252433; x=1766857233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lzi9+ITS5sdqpVBInAmAuup4pJjmlBO/nHdw3S/rzlM=;
        b=KIc5FpmIzoHz3XAPK3b/lR5NmjXsIbMqmFi9GwdvrLIhdH6hpQjupGisKLS/+DZnok
         QjaHykvBuI1KwuLEuRdxz1WZYMOLaPlrFoG/j4yghlK8j3FXhpswxL5LgF7MbvEGLlAW
         +wyn4ixJRc2D21HfOG2Rp/DaKnA5yzJLIexaQyoNSnyjCGBn2DFFb3Byc7rSkLh+6x9G
         edjaOLOdHUSdbxHfnPoqcnuCLu/9bTjdQB91h6d4sHiTPRmQqvOkfiRgXC7LmBpGEoXq
         nxC6ySXuDHgzPOa31V7jpDQEOoTO7dQ+XlhSgTnipZaDz23Vo6BAoWANH3EY58h87Ho3
         qRyA==
X-Gm-Message-State: AOJu0Yy9+ECuPJ+4p4nZP1P5LSxrzBB6mVuHKPPEflVPxpJaJltxmkZe
	qkXmrxUGREU8aVdn9UfkijxcmBQuBy0tH4KyJWx9XtH6U53A3+7T8Xzy
X-Gm-Gg: AY/fxX4mtfel0iX6ycySku7bDt/KnWJ8nzXqpRucaXaU1cGfaU46znLMTh4hQbURmpP
	w91jv4czs0Z5fTVw6cPgRUUMzgvjfc6Jk5S/jhMaJZaxJgDmj8GtMpyzCdc5W1BHRSDPcq7fXlx
	wbX2iLCxdakya8fi0PZe9Xn/dvsBffD0TF7WTcGyqBF8I9zIdr4FI+4XuF6ET+bzTrNVGcUg6P/
	VtXhPjMxBq2JxHNgFJxbHPKVLS+SVGXGIp0sRfEZ7Th67fFVHBqWXZfssuIW1NRPlQEei9vHsRI
	DQZc4pnkKaDO5ppvCUSjpgmLVRz2dMxfB2KoymitR1DN377PgbWFaxZPlTDqW9aIXkizK0iQggc
	5VmLAoaKn3Il0BRevJ1cjRffn7WfoinK0dDpKGOAreYs9tKr0Ea6extYIt4urYfLUk7X7a3UgYw
	d2roRwCVaDREpffOOGqI8vYrD8ltc/nLQO3SgUI0OZUfI0YGDUETT5mjSjlFN/4Rw=
X-Google-Smtp-Source: AGHT+IHPPGw/WHQIJwktqhLNGJj8eH/hNThrbMxno8BNgOCv7QHcQA+6VdmLbgDJhuJHb3ULiVIiFg==
X-Received: by 2002:a5d:5f87:0:b0:431:a50:6e9b with SMTP id ffacd0b85a97d-4324e4fce39mr6851071f8f.37.1766252433062;
        Sat, 20 Dec 2025 09:40:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fa1sm11264780f8f.23.2025.12.20.09.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 09:40:32 -0800 (PST)
Date: Sat, 20 Dec 2025 17:40:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: Re: [linux-next:master 1525/2671]
 include/linux/compiler_types.h:630:45: error: call to
 '__compiletime_assert_588' declared with attribute error: min(((pos + len -
 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
Message-ID: <20251220174031.0d00085b@pumpkin>
In-Reply-To: <202512202322.0kwyiXce-lkp@intel.com>
References: <202512202322.0kwyiXce-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Dec 2025 23:57:10 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> commit: 0f5bb0cfb0b40a31d2fe146ecbef5727690fa547 [1525/2671] fs: use min() or umin() instead of min_t()
> config: i386-randconfig-015-20251219 (https://download.01.org/0day-ci/archive/20251220/202512202322.0kwyiXce-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202322.0kwyiXce-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512202322.0kwyiXce-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    In function 'fuse_wr_pages',
>        inlined from 'fuse_perform_write' at fs/fuse/file.c:1347:27:
> >> include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_588' declared with attribute error: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error  
...
>    fs/fuse/file.c:1326:16: note: in expansion of macro 'min'
>     1326 |         return min(((pos + len - 1) >> PAGE_SHIFT) - (pos >> PAGE_SHIFT) + 1,
>          |                ^~~

Seen before, I think there is a pending change to fuse/file.c to simplify the
expression and avoid the problem.

	David

