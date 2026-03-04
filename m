Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299A371886
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618540; cv=pass; b=gNtTcs7zcvS5+lYcGeHwv8QmvwzohcPRKDyQOKpCwM5BwE/YV2GiGB6l8KX4YpLDGMmIAb9PSteFah/yftM6VnElrxdkpCd1bbkJVsdYfjaP5PB1j95EQyQ1akxhj40J3LgqLaGfhfrrkmdeoB7cNCC57a/BqiF4vAZMVV5lByE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618540; c=relaxed/simple;
	bh=LIXUkQND/XUYwmiVyoCn3iAB4eY7xw2BT+VhHfmIACs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICXyuXETgAXudgaQ9/uOxC0kYJsxD2QJ8zQ6XgvbsHUIWIaBoBsE0qL2oJfp2I1in7A0trD+z/9aX+wZk0pXNqlGVnZ+y3qqmj4cgVYsuv9AiLzaV9MJBTWkQBQblc3qpX3QUdTfgNdczZ9b+VZBHSLFaJvgdzoZIlb8FR2qoGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=T6Z013fc; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="T6Z013fc"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-506a321cc53so76074221cf.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Mar 2026 02:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772618538; cv=none;
        d=google.com; s=arc-20240605;
        b=XfsFCaG+uq38ngqIhXzdwuUOHgtw/oOkytepmKb5zE6pRB+66C7Pqv3LSh6sGQXGv7
         ivcziJ0gmaApTQFmlo+Nb/mbAsB/3oijcIclyzQnQPsp9zrPPqBzIs3Rk9GGc5mRwpJT
         l8v5RQaf1e9nKok72MEvWuGVLKuqYlglQh8Z1IZk1258lNbRUP2R1nMruhPoRZ2/t31Q
         cQfOk0K+02VTuJ7vEEc1aehirzVZOnMNfg7tsWY6l10daJPUDe8+q+RGpeAze3JrMeub
         GbYRuNsuJ654mUdxTMRYZC281zT6/FYRh+4TldvOQsTGxolPfsa6x3oWFEYHznX6JDcA
         +o1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5rljX6QFPComIDSDQ1Skhem5NjDWFGniNxooYJEikxQ=;
        fh=QCb9tUV2pRDPBmx29iVGTN3dYwSGeBKfiqDJi9vn2K4=;
        b=OZuKf3m4SeZ2IcDb8aUgmRt2A/4UsdUky+d/chRoT4AhQulti3dGsHAaH8rArP2WZm
         khaSDnBTXOpiPEUgsihTlt8bMj9WUwP6cTlwAu0JS/IZFqPQHfRzqUOQ3zxPFLIhHV2D
         6BnoYN9FrgJKq2Eddyp2APQ2QpSatWpGfXmvr4zZxfXYaRs6Y26+NKQf5CszQLjHC9Jy
         dD+MAdOB03S1qwIVdR2KcWRb1TJRkJw7c7eA4kFcxyzWCP5YWM+P3K4IUxohT1pruiT6
         jlO5PE7urTCTHNCFkgNEAvaMwQixDcPRM2CZ19FL0LRhmgeHnNu5cvu+L8oHBrMBiucQ
         cvaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1772618538; x=1773223338; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rljX6QFPComIDSDQ1Skhem5NjDWFGniNxooYJEikxQ=;
        b=T6Z013fctX8tQpV1DjmBc4mZ5jvqqcC0NNW4C+5YZzFLYBDUZOSF4tkllEyEL8f2YZ
         +zlUbcX0h2i7zzekqdx4Zi8gcdNFmJ6N+ClxG2s9Swa1dKYtqM8SjuNzBr1xsJNHYIrj
         CE9N/4PUOmE9XV+qmZ0+BZWq5Zasz9ka86AqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618538; x=1773223338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rljX6QFPComIDSDQ1Skhem5NjDWFGniNxooYJEikxQ=;
        b=fG0HJOEc7jgnpRtnjIJOW70QlfLrgqQLrIVp6c1aTq4xdC719tA4cjNi2lt4n0ujyl
         JWSVgEZNbcLo78CYyhvsIV+CxMFwGZDZ+GjdFMU/lQE7shmknz4yJ/0XFOb4XLrkD9vx
         GpEzxUAOSE5SAebN7sljF553rdaeIMF9G9D63G4+Cei3kKBiNbLzOce993shtabHyYBu
         vg2jqLICdbGg8n3Vgrxn63rgi7Jdo6DuW1pnTnKlTwVook7a+Y8RE244TzNhdm/6Csoc
         qnYUSeMpEf6w8mgof/qOOrC7M5u4pNIkZELUkZxTWge7ZO/PD8WEYCzELCqKxDSp0g/G
         JRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwufJeBeu05xnw7gQPsd3LqYci1DWBVSQoY6jCn2Rmyf2R+RYnV6/Ihimpvf4uRbj4q7BhF4ACUm7pfGX1@lists.linux.dev
X-Gm-Message-State: AOJu0YwpEIL6EPDWAu7+h9KGDinmgxrHMcgpPo3uOYJo5FKsPRUSyqYL
	IRaMduYRcJGmpBO59kp3l/6f+VUe4xKVpzGBnf8+AMvUaf9Bvp28VMWeGEUQrOJI3adoOK5U9AF
	hBvDsMFIvTTDljyLHGnPakOticAoNBZgIgOKV8oQ7Rw==
X-Gm-Gg: ATEYQzwud7C7L6H3JLQAm0abgNoiaLTq1AubWeB9Ucd4L45IwafKWnQsdGQEOgIIBzd
	4jO1tYSAjjwslFBwiP1RB8bCu3y1TCvLjRnsEoVHozR4ylCJEfcRMfTf1wPCjJoa3c02We9DKB2
	wcqEpqxc3ryMQhl0NTJWLjdUffZhZ/4rYEUCWSpHp5sqEV8EqIDSDVrnk+lDcXiVrviIvuZUGVw
	9d0MzDQLeTDru8SpJY6FjKPV7lzGb1z6Rz2H9qPw72x8/pyZBnfE+PbA/+sfQKceD0Kb34oomCn
	Hx+qDQvNqw==
X-Received: by 2002:ac8:5d08:0:b0:4ee:42e5:f5ae with SMTP id
 d75a77b69052e-508db2a0f46mr19747451cf.25.1772618537934; Wed, 04 Mar 2026
 02:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603031522.e4lroM3J-lkp@intel.com> <CAJnrk1Zj=U7DkaQRRfbqqAUQ3+3R2hS6agtj5iOLKO5+ucBRmg@mail.gmail.com>
In-Reply-To: <CAJnrk1Zj=U7DkaQRRfbqqAUQ3+3R2hS6agtj5iOLKO5+ucBRmg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 4 Mar 2026 11:02:06 +0100
X-Gm-Features: AaiRm51FsggTwyckvNK359mX--xhf-NMyHgCYBKJtOAb9mDYPUQDjmmmHDb7Z1o
Message-ID: <CAJfpegvgbMMmxt7P6XeWt=ZWqsF=db-u8YmpyFz4inW-gZe0cA@mail.gmail.com>
Subject: Re: [fuse-devel] [mszeredi-fuse:for-next 9/12] fs/fuse/dev.c:1818:43:
 warning: variable 'folio_offset' is uninitialized when used here
To: Joanne Koong <joannelkoong@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.sourceforge.net, 
	"Darrick J. Wong" <djwong@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2026 at 18:19, Joanne Koong <joannelkoong@gmail.com> wrote:

> got switched around. These two lines should be swapped.
>
> Are you able to fix this up locally Miklos or do you prefer that a
> fixup patch be sent for this?

Already fixed up, but the push failed (I was travelling) and forgot to
retry.   Sorry for the trouble.

Now pushed.

Thanks,
Miklos
