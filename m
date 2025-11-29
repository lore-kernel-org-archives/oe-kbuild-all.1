Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DFF1EA7DB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 19:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764445929; cv=none; b=YFGLF5fjAU6qjFxJumr8LI9bJOa2AYO5bqXuNEK/n0AB6/7I5FWc4aWgftEBcAjmzXERejK0BWchDf8x3xlWagYLEcANsb5rHU3KoMhPWCioo6fO0z53MZznlYq8Qb2yrw4kju19XP1x36DCWvM4NZOQ1uE2EnArQxgZPsgqTKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764445929; c=relaxed/simple;
	bh=OrmomZ+9BKBtj7hi44FcTpdla33Mr2LSv8PXGh4OlGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lI5tQa620uqnCBMOAJFCG+CzucpuLyU6Ycr9Aa8Y5wjxftnZQ/O8iw44KxVd39rugJzfrf2i/oh1tjMjsshPVs2VLNJoIfD2tlnIBtvUi0dfIh83U5ZYai4wVWzU1+gMpsgrHu2z9VRqFQnnuRPpEo2eSWcSEN208Kly7l88cjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=EdDlKbWF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EdDlKbWF"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso4656915a12.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 11:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764445926; x=1765050726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUeLWvyACxGaCf4GzfDj2Zf5qGJH4Y9rmObQPo3NL+0=;
        b=EdDlKbWFBD7DEwcw4QNm+4G9j8KwKCoQtVY/6V25+PBYvClFWxYwzFqHBQ1kY9yXIb
         MpL+IAkn5BAz1jGJqf8rJrloGjA/+/T7ioqxPAeTXE53hc7AdyLjKjglRN21q1S0LwOZ
         +LKblbMnc4OoiDdd9z0RYSjX9AmKULXo3EuFIeDSwmpi2vXt4ySslRK3fc+mLQOuj6eo
         N4vajLh4l5wdSzn/yjvnm7gb/VG4nppMm9sSmlRs6qeoP6tTw/bpFiUpwOl04CFUPFYw
         7wbT3QeDHCqrb6uCUxoHRw09KgT2E4NVPd/3yHJqsHmk9ronAY+OBKRMky5AuHsSswu8
         a5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764445926; x=1765050726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YUeLWvyACxGaCf4GzfDj2Zf5qGJH4Y9rmObQPo3NL+0=;
        b=OHCRi+cmsYdBiXg0flS213n5YWI8G5724TmZzDfjchUSz21TmkOShExj4c122O4QpY
         Xw1rFtPFkIz9uDfnvsm9HBmd31SRzuzT97GClpM/GMapWgkBlue2KiQl7RZmZwB0h/Zy
         ROgrRDc7l4PegEfNL7uoRjk7iSuubgrRNfzJ2n2GAb9wCCfhjNQbumZAh2cKqxo6PVJt
         n/jBg6Vyd1296X9jm8oc5PLB3bpl9MawKwDccwXx063FU+05VGi1REWG4YR0WUllZSPT
         I+o1dI6/Jf8BY99OdIq/wmwg5I2BgcMPWrEPfp7rylMBcFAo0ztLe5DSVn059KFcaW1X
         ghZQ==
X-Gm-Message-State: AOJu0Yy9b39qt5SfAWO/OfBHpwy3/qVYBg7ipSuWFTdqx51FiGWQUpJa
	m2s03/Tgunav8cnvVceHtlUt2HDHgJV7HyPrWwfyG5JjM0ySWjh6Fx406KhbHh/K8VSrKS5n+ju
	jSycM3hLE9Nlnb3EcNocpjrIa6mYe75mu4XB38z+rsA==
X-Gm-Gg: ASbGncvQpHHFgg6eCqYi13EH0qBOynmjpALNzCs+ydz+ChR9roqRc9IIVarunWBNVOm
	UZfm7H8JZePXxqObcNL/KTv15KULOtYGOm/qqAzPDpmLpjq3V5jicYxfqn59isvCuKCvrV9xB5j
	etmLJ3+AooH0J1xGjRQVkmSmPv8gZXLUERWT+KrnrsJ+B99eDrnBGbnxpP57yOfNdgcDG2BytF+
	ZcHfH+/kSHpHQ7E+kXp67NNM9dk2JUaCvojgu/OCyslx0NPKk27JfvEMhEpRMth+4TH
X-Google-Smtp-Source: AGHT+IFrwqbaIeWdJib8FrG2mDeH9cpmV3Xd1JNcESoDRG6rLym64mFEzXP+GMLcdbvXtvEDkr4BWumbOiH/BtJqycw=
X-Received: by 2002:a05:6402:1ed2:b0:640:8348:6a82 with SMTP id
 4fb4d7f45d1cf-645eb7872afmr16547077a12.24.1764445925596; Sat, 29 Nov 2025
 11:52:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511280300.6pvBmXUS-lkp@intel.com>
In-Reply-To: <202511280300.6pvBmXUS-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 29 Nov 2025 14:51:28 -0500
X-Gm-Features: AWmQ_bnFhg4fTSb2cmgYMQtzbTBVTpNXxCQJRN9-QkYD3rk0FAtL0ZYOt9H_zqA
Message-ID: <CA+CK2bCmp4gjpyND2=Chdz-EfRAF20unYzO2dwQb+ZTEihgk3w@mail.gmail.com>
Subject: Re: [linux-next:master 12118/12398] kernel/liveupdate/luo_core.c:402
 luo_ioctl() warn: unsigned 'nr' is never less than zero.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 2:29=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
> commit: b30a1fee674c8446bebd9e399b267ac824093bc8 [12118/12398] liveupdate=
: luo_core: add user interface
> config: x86_64-randconfig-161-20251127 (https://download.01.org/0day-ci/a=
rchive/20251128/202511280300.6pvBmXUS-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511280300.6pvBmXUS-lkp=
@intel.com/
>
> smatch warnings:
> kernel/liveupdate/luo_core.c:402 luo_ioctl() warn: unsigned 'nr' is never=
 less than zero.
>
> vim +/nr +402 kernel/liveupdate/luo_core.c
>
>    392
>    393  static long luo_ioctl(struct file *filep, unsigned int cmd, unsig=
ned long arg)
>    394  {
>    395          const struct luo_ioctl_op *op;
>    396          struct luo_ucmd ucmd =3D {};
>    397          union ucmd_buffer buf;
>    398          unsigned int nr;
>    399          int err;
>    400
>    401          nr =3D _IOC_NR(cmd);
>  > 402          if (nr < LIVEUPDATE_CMD_BASE ||
>    403              (nr - LIVEUPDATE_CMD_BASE) >=3D ARRAY_SIZE(luo_ioctl_=
ops)) {

This is a false positive. The logic is designed to work generically
for any base, similar to how it is handled in session ioctl and
iommufd ictl. The warning only triggers because LIVEUPDATE_CMD_BASE
happens to be 0 in this specific case.

>    404                  return -EINVAL;
>    405          }
>    406
>    407          ucmd.ubuffer =3D (void __user *)arg;
>    408          err =3D get_user(ucmd.user_size, (u32 __user *)ucmd.ubuff=
er);
>    409          if (err)
>    410                  return err;
>    411
>    412          op =3D &luo_ioctl_ops[nr - LIVEUPDATE_CMD_BASE];
>    413          if (op->ioctl_num !=3D cmd)
>    414                  return -ENOIOCTLCMD;
>    415          if (ucmd.user_size < op->min_size)
>    416                  return -EINVAL;
>    417
>    418          ucmd.cmd =3D &buf;
>    419          err =3D copy_struct_from_user(ucmd.cmd, op->size, ucmd.ub=
uffer,
>    420                                      ucmd.user_size);
>    421          if (err)
>    422                  return err;
>    423
>    424          return op->execute(&ucmd);
>    425  }
>    426
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
