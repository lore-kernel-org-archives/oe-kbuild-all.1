Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BFF230264
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 01:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550427; cv=pass; b=HABDjiGZb3UEeiiZ5KwQfnboyqcKZUHlnfHbT2tO6jeZ6IAn7wScP9x1aNr2OwVa0qIlNVsl3QIDUx0XtTWbvc8CqHVznPJRJYnzO/N0LOHkQz6KrwewxvjCbmjE84mlsrUcD9gMfBqeO/exHfCx8dGfMJ0Pnzr5eDdfS7eVJSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550427; c=relaxed/simple;
	bh=+nyjZCDAwF0QjimVoTdB1F3e4hI9equawyVNGhNT8QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHb3KB+IP9m1vkBndXnLnBxldW6eO6DgOQMYqnXOJCCdhuwdsHL5vXJ0NKYXFJKkNvY52yXg2sdi6GQfHBxhI2BFb1oUc+sSmY8vdwipV87Y4V7t9HYMdZDNngv6qgubakMbKNNNT/haMKxeVU6z98k7nnljDmFlcIui9KwWvHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6erUwnI; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6erUwnI"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64eb84d1e37so4016730d50.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 18:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778550424; cv=none;
        d=google.com; s=arc-20240605;
        b=DRjfGbY3AdevsE+1IoFFXTXnn30PDcFpv/b1tKwNIvrvrnT66Wd1joX47wvRMDqF/O
         l26UeuXnNKkwVm8WKPLkM5Mzg5AyjsEJSKq3sNy11BpVECa/6dRKjcvOhvudWhq3OLOR
         LkV0oxpU++OD7PflNyk+pWZjFI5rT3eDx3IqHKVkZgn8q2aLCxyaa1irJSfG7f99IpYL
         3rLDtBufjS10SwWBbSHHdjNKJhVKObQmbqxHJ0dRLaesp9+lrvAarUkxJyuAQ5ATYot7
         93dCO2L8R5umbJfDyMi/bo1q1ydAJAheJQYed080ZoFU1sutSs9djmNOfjUMZwtFLKAY
         T7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FwpxFc9Afr8dUopKAPOlu3pFs1eNc9ld1yrbloSYHCM=;
        fh=cM5KQ0r9fOTW7cmDKr5U+GJNA2AssSMx4kq5wvb3PGg=;
        b=DW4d0VKel0TT3w2WKz8l9i7cyIvI8yMjaseS0qoJNxH/ZEA47P1OaZA1gWiQAciqdU
         zxM2u1p1JntbwocKirMfpC8seKV1+iStp4Lj+xccgBYvVnfthXwUME+DnR269msnveRV
         OoB/FuwDTgh0VH7gWXGwIKmD8IDJZbB0WLpPLX46NBft3R+nCDVQ65uICYxJ/SqHvoMC
         M8AVvemJ+c8Gkvf7AqMJFetsmWSULp2dxwoFRac6IxlfvIrSoICkW+1yrEwEY/2QijmS
         psmPC5GSvf76NeDiGC7flOCSCrolhkFQkO/gult+vOQNhewK4BSoTch+okylQR/7PUsM
         gPEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550424; x=1779155224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwpxFc9Afr8dUopKAPOlu3pFs1eNc9ld1yrbloSYHCM=;
        b=k6erUwnI0mmQdWbTX0GCI1WoeiY4JMef6Rg41uO7mkb+6uuGhQFKwf7F8Ec3zeB+jW
         feCx0Ouw2H6H/ozVqMiasJ/nEr8tTP7yIjSF6dT5kmE/IUSwrToagZUz8JEtUbTMGovQ
         whtXnHpaEl8CER8USpHZwPwkzJKy3nRjOJTJ/fXChR87xVd+waX3raIZVTJrC5erk5P9
         DG08pj8hCCn7YIoTsuE9bva1uGpLlfV8JkIvdvnQgA0BRCLrzA5BunrcZ6QvOsTaDcEl
         ar9m1XmEtACzP6PsmHb5rx6353tP1QdULw9Gx/Rel3v2Cii6SuMq/j1nmuHcqCfppCec
         Zo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550424; x=1779155224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwpxFc9Afr8dUopKAPOlu3pFs1eNc9ld1yrbloSYHCM=;
        b=Wh3d22AXzLlZ3XmXPFHSsmVgO/kKmLJ2vxPa1aH3F5I4kPkI6jxvse/aWpXoGR74Cq
         Gs3doTE634pTTjikL5O6rtypwsxLaNopPPFJlQPI37k5B0n9yGDv0WATov9JnRHCZo/k
         DNwVnOcamXEtCwVKnhlR/rSNiooLk/RSDeMpW9ojFtz2vfJlKNUKU+fqF1sxCUKsW/4r
         8naUt072TzLVUOnmHMSJbKazSE2pX4mLqwnDftQggGDVJdTupVsWtHVrmB7Dm96I0JNR
         Nfza/wBnorlUgrIgIUsYPnTZdSOKbKPa1K7/PrGnZwHP6Edile1leDnIN7ltFJJD4kVR
         ZgGg==
X-Forwarded-Encrypted: i=1; AFNElJ9ndmCJqmHEEtylcEVAmNkan+vge+cFPZ1nV2zAIiOlGamyNd2wpaV8bTbfSCDS5GSmK6SL2HnnyFTfByIX@lists.linux.dev
X-Gm-Message-State: AOJu0YwhHT3SjGQBXc4W2Rur8FuK6Ve/rz9Osh9VNWgUC1CoDPSk5wjd
	x2VCPrVhyavUW/bpqu45OwFCil8E5zB2mfgroT9YpqVMlOeR7G+eR0JOFuM1mdI7iwwCip2dl7x
	yhMocwQX/brt90WNy5IjcX0SwXHjUxqE=
X-Gm-Gg: Acq92OEHQl03G72y26z1hlYoct12dAhmht7NIAav5QSf8xDj0EetLHXcEFc0CgJLYk4
	61ijVoK5OXh76ha1gJaIC4C1rB/jYeJkKY1GQXhjdbUoQja3f/ko8OXQU/qgpMcka9NMBT32AWJ
	Qr6iILr7KZP99TBIceRbF2jPioOr3XGMMR5BGexPBsHnDiVwZyYT1a9+CEm7tgI8NyvQT/dhoYK
	iVV/39lYq5NnGaFlL+D+KXbefAyYdQlLavgANZhMWaawrDZLGmJMBgxFtRoxQ5jQ7fpFd0GrmTo
	y1vtHTkd
X-Received: by 2002:a05:690e:d07:b0:65d:6eeb:cbfa with SMTP id
 956f58d0204a3-65da842b927mr11122281d50.27.1778550424368; Mon, 11 May 2026
 18:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com> <202605111009.hlpiVkT6-lkp@intel.com>
In-Reply-To: <202605111009.hlpiVkT6-lkp@intel.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 12 May 2026 09:46:38 +0800
X-Gm-Features: AVHnY4Jtlo9H5C7tKgKhoHGPG68VMovdXjvGsxYCqTw1nW1WDBGKDVoH7Bpz5ow
Message-ID: <CAD-N9QU8e1tHoZ0Dsqpz0Vb6GYUu-7bDYYuz9rH52s=6pizXRw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
To: kernel test robot <lkp@intel.com>
Cc: Yan Zhu <zhuyan2015@qq.com>, corbet@lwn.net, alexs@kernel.org, 
	si.yanteng@linux.dev, kees@kernel.org, oe-kbuild-all@lists.linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, tony.luck@intel.com, 
	gpiccoli@igalia.com, frederic@kernel.org, jani.nikula@intel.com, 
	longman@redhat.com, mchehab+huawei@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:53=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yan,
>

Hi Yan,

Please take a look at this testing report and verify if it is correct
or false alarm.

Dongliang Mu

> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v7.1-rc3 next-20260508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhu/docs-zh_CN=
-update-admin-guide-index-rst-translation/20260511-102406
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/tencent_7ADF2D1EBD8EAD2028BC93BA=
7858EA655D0A%40qq.com
> patch subject: [PATCH] docs/zh_CN: update admin-guide/index.rst translati=
on
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260511/202605111009=
.hlpiVkT6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605111009.hlpiVkT6-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    Checksumming on output with GSO
>    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>    MAINTAINERS:40: WARNING: Inline strong start-string without end-string=
. [docutils]
> >> Documentation/translations/zh_CN/admin-guide/index.rst:114: WARNING: t=
octree contains reference to nonexisting document 'translations/zh_CN/admin=
-guide/module-signing' [toc.not_readable]
>    Documentation/userspace-api/landlock:504: ./security/landlock/errata/a=
bi-4.h:5: ERROR: Unexpected section title.
>
>
> vim +114 Documentation/translations/zh_CN/admin-guide/index.rst
>
>    113
>  > 114  .. toctree::
>    115     :maxdepth: 1
>    116
>    117     cpu-load
>    118     mm/index
>    119     module-signing
>    120     numastat
>    121
>    122
>    123  Todolist:
>    124
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
