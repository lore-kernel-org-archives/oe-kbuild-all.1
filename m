Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9B34A3DA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 17:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761241333; cv=none; b=BhxqZAWYQy5LaRt6ZCWIMWUHVdxX+L1ctBasjwef66yEmruqzxQjL9dYsY6na0sicfmgpjGY7XrGUfP1vnOhr4i0vRQvjnmogGaMEpjh4FmR6qY6X1RvPQniUtRW52xlZ++tZXgd8SCK4h/m/2vJ47j2r6F2u3WJ/1MSeSDk0Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761241333; c=relaxed/simple;
	bh=PYcQKEYaNNgr4v4S9nNndeYvxlEoxFnd8ONcOz503ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vg50O02W8T3H9QBE0G7AEzvitqAc4KdVeZP4tXlrOV21VmPiaKqCOT7d7Oxi+BESo0kiSO02YQy6vZLVvr7nCs1elq8mhq6OafMPtq/dpazslZ00vRxsK8GcUPQPL02a7ls4s3eSfOl+U98oxGyZ70yTJ5Z5IiAesNv6zZBe8mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv+j79bh; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv+j79bh"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4e887152679so9777761cf.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 10:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761241331; x=1761846131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4seA+HI4M9DYT+ZaTto7qe0lK31pOsptA4eC1KcJc3Y=;
        b=bv+j79bhaiZEjfbLJpkUxXXkKBJKnVGf8bb3wXJYqEDgOV3weW0vdDyG0fCRbBoVf2
         Ith8l5h8Po1NeVQNq8fGzj1ILiUiSJcLxxwQk0sxZu7Me6+gMLo9b8NJOrTYMoGKQHyL
         sC1QMKQe/HR3TScqynSdGdjEEfsyIiEOtwHedS2WX/aHMvV34q3/VxNHBQJyTZwPD8p4
         xX/TYDKnofS+aNC+Vb/tgGfPku5h1GgIH7gvSp7bYpx4ZQKzkMjdaTDZnjMUBR7UaZ2V
         oE20NKLMZit4SIiUvqgEnbWjSvXT5okHTDq1zVBXSdWa3K59ngK2089CZ+G7Dg5tH8p0
         2CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761241331; x=1761846131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4seA+HI4M9DYT+ZaTto7qe0lK31pOsptA4eC1KcJc3Y=;
        b=aHl+CrSXVHU5BGANNrqC4yI9Z+PYycdaC0la+zwvCKGZO/XbdTlQiJWbgsR7Y2wgQX
         Uo5RNC1fYQ7uxGNnyPYj3q2Ug4BHKY20kSyoCNcoCKBILDeUWn5pt1JRDWK3uGefgDvt
         VpdyoKKLCoIwGBfUWFjnggY5vpfL+IflcoWkNUZh4/86LotuJGNObxgVbsx/MfzqJN3A
         XoDAPINND2WFOB8B33Dluvns7GF0aBE302JmkWFxeNzhywF6MZ5wezW8ww+W27Nqb+9I
         nvX3vatw+hv+YNBOdV52Cejc78jXXqqaWQ26ogYCcKCZllAuJoOhvKcyjF1uqF8967Yj
         3/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXfafXZxEuW2cQoOSfSgme00K1HKjKi+ZdGqZdWeM6j7zweprAmfqSRBBNRm4wR+ljRfpewGx/Do/YLKLsz@lists.linux.dev
X-Gm-Message-State: AOJu0YxKC/P+8z7ZQgyPN5oicVRmcru8eKhu1pN+AQMeVHyXRrjlgxDp
	GMxPrrxVcaycV8QykommPuXyB2WPx8bezOeYC443vMoG789ODiP7kQe3wLKppUfyiSHYcZlaoVx
	60HdOpX0UubPCpli3Knk5di0SPZ8NcDg=
X-Gm-Gg: ASbGncuvEb5QR5FsshLHGoFNHSbwDNMWoZcN2C8LSd2gympx/TkyBd7uKDBsFzSh5+R
	2dzk7S7/Ss8TTPfMUpLhKiXA8mR9YfRz+pkGyjKW/cSzd7n8jsbFhnaLQVgLQLrDiwy4e7H1TlU
	pm1n6KOOd0NDn5gtCSMmBUPhlc8eJFk1o2HxfAkPCID0cG5PKuXwE+3K4KDZshKhTc5u8I+ITUB
	Ybu1mJohaiEemRhUI7VErHQSgQ2fcsaOi0B1sk8anMBxsUZnCV5c5L+1sSijvj4NMUyzCYHkODL
	B8R+FIGPYHXRgv4=
X-Google-Smtp-Source: AGHT+IGYUuso1wFbBlLzlxrBDhKNZB5fvUBjAyfkvZne5zRw/oAvLVqArsWiIODnGqRp88IRvA204zsjZ+T3SghE1I4=
X-Received: by 2002:a05:622a:1392:b0:4d6:c73f:de88 with SMTP id
 d75a77b69052e-4eb732d317emr110436861cf.3.1761241331136; Thu, 23 Oct 2025
 10:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022202021.3649586-3-joannelkoong@gmail.com> <202510232038.LOpSOOQa-lkp@intel.com>
In-Reply-To: <202510232038.LOpSOOQa-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 23 Oct 2025 10:42:00 -0700
X-Gm-Features: AS18NWA9peuK7QugY6JLjKXBNkxaqO8WfrQsHaG3gveX1ZXIjyuXAfTMF8nltv0
Message-ID: <CAJnrk1Z-FzeXhse762dV7NpSexCcP-xcUSQ+2uviG81HWFdjZQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] fuse: support io-uring registered buffers
To: kernel test robot <lkp@intel.com>
Cc: miklos@szeredi.hu, axboe@kernel.dk, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	bschubert@ddn.com, asml.silence@gmail.com, io-uring@vger.kernel.org, 
	xiaobing.li@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 6:23=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Joanne,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on mszeredi-fuse/for-next]
> [also build test ERROR on linus/master v6.18-rc2 next-20251023]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/io-ur=
ing-add-io_uring_cmd_get_buffer_info/20251023-042601
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> patch link:    https://lore.kernel.org/r/20251022202021.3649586-3-joannel=
koong%40gmail.com
> patch subject: [PATCH v1 2/2] fuse: support io-uring registered buffers
> config: i386-buildonly-randconfig-002-20251023 (https://download.01.org/0=
day-ci/archive/20251023/202510232038.LOpSOOQa-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251023/202510232038.LOpSOOQa-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510232038.LOpSOOQa-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from fs/fuse/dev.c:9:
> >> fs/fuse/dev_uring_i.h:51:20: error: field has incomplete type 'struct =
iov_iter'
>       51 |                         struct iov_iter payload_iter;
>          |                                         ^
>    include/linux/fs.h:74:8: note: forward declaration of 'struct iov_iter=
'
>       74 | struct iov_iter;
>          |        ^
>    In file included from fs/fuse/dev.c:9:
>    fs/fuse/dev_uring_i.h:52:20: error: field has incomplete type 'struct =
iov_iter'
>       52 |                         struct iov_iter headers_iter;

Ahh okay, I tried building with the linked config
(i386-buildonly-randconfig-002-20251023) and it indeed fails :(

It needs a "#include <linux/uio.h>" added to the dev_uring_i.h file.
I'll add that in for v2.

Thanks,
Joanne
