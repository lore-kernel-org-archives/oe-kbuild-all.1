Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB89C3BBF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743163643; cv=none; b=b8/srKhng1RHP1JKMe9UrJYNJt+z8lDp3TmbQmYcX3JMZ/dv88cWdMpw6mLcX5C+WBZi8dyLX8X57ejsbOLIgRUPhEuTim8cgTykzVSQz4N+1t3+4LL70tpDMNDLay1syXzv9XI2XdqHb9sZQxKY+AnJfFhwAjImdct0f0em07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743163643; c=relaxed/simple;
	bh=7d+6QNSuDC6KwrLysg6VBznBKhWYjfkfU7W7RNm9/1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F21qRKBLR+KI166nedYFuOW7IXqj49cC9OlMT2fADkuqb+T5eb0Y5KpqUfZTBKbBxgEcNiGKh86VowPUpv4E4lMCGs+LQXLk71gAtfUYUZ6lIuWS+vvUc3UTWugOtTNBECCK2TvUai33Nn77qcECrvBIuQsZiZXfXxvYX3PFKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=m8DYsBmS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="m8DYsBmS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso3811412a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 05:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743163637; x=1743768437; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09+GMoGHkdHczaMyTmOv+EAAirFwS/ZKLc5EZlU9OOI=;
        b=m8DYsBmSVsqjJbWNGnuv3qc1Cd8wwtmJBLHvvzExAMFb5DXrmhmbx038Vvvq4JrjxH
         ae4jFVR4Br0rDBJhbqPcRfSmfz33MeR0E44XOtF4c8nzTv8mEE0rbrbR576/uImdK4Mb
         FmMGA3K54G3eaIZOb6GMU1/mnyJ7+wJur7ueOhRMo3yjvdUI9eqZlTqQftJAeIZmakQ3
         N0kRPuC+XXlEeF5Vt6w/r2KhznreoDvndSUGXJ4fw1IMQ+qkZKF/hVid0wjxhxJFCB07
         CVVr5jhgHhMXXds7lUqh6/ZHty9/54cpLnhFdDMpPes1WZsCapIyu/ni5hlTrm2A1wF6
         U4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743163637; x=1743768437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09+GMoGHkdHczaMyTmOv+EAAirFwS/ZKLc5EZlU9OOI=;
        b=ijSkgnc3/y4iImvSNg/HYz9j9LhAK6fzvxIHmctbhX5JrX5YBuqZvIty77bFyge6wS
         5wJKY77jpdJMfBO/1ERnnuCAQSlaoOA3KNkq4Qi3xU8ABKFpEZhybdBT7x5V7hzt7l0F
         GFyi/G7N8eGwdz52vXRYrX1js+Odzg1qy6ky0h4k7cROFgErneGnlSw2w4cD/9sFVNqv
         0ylHDNCuZ9FanVpVkXk2N/sXBTJ8JPWAwKUYuA01SKJC5NxXiphQRyo0Yr3xqSXvOLAH
         cxyUgRy3GRIHs+ejMjizi0YYHX8IHWjkVrDR4eoe4v43Xcv3fd6KLy3R3oC7quZCbN0I
         Os0A==
X-Forwarded-Encrypted: i=1; AJvYcCWhYpAIOw8stWagYdGNq+ulpQfwZq3cI3Q+Igk50ZtViCMzxvQ45PTVfG99vFJmxawA0oCA6xa69y3PU/OV@lists.linux.dev
X-Gm-Message-State: AOJu0YyR1YUcjW/+bKj/Hc0xgtLnheo8CLoI0VYZdyBF28s7NRyK2djh
	tkyVn46qq1veN9TOREHGmEVNV7bfUY8+RI17n1o6bqxT0j6QSuaFucxQrGmVaH/DHcrsWjEqmWJ
	q8FP+h9wYifxEzXAGE7JebDOfrJGxL9qB0stWVjptLOGDVxLHj0M=
X-Gm-Gg: ASbGnctICvPNrmxK0edmDqhxAce3EQ4hvRyMioe9kNQg/GAoq5RkbnQK4wy2NsKDBwl
	TMrnV4NZM2gUGquixTK747tsZ49m4ngWl49x4DOQkCHuY3m75GchdRwvWLf1UtIBDRoickaEES0
	2ozA7HxNw7QaGcxkwDbOWmq1xN4A==
X-Google-Smtp-Source: AGHT+IEvuoX9oBJaqHNYv5Dz0eUnUDxchxNgE45fespyLtPPlnCY/Td7egXvxePpplAljN1oAsouobB/WBhk3Vu+e/E=
X-Received: by 2002:a05:6402:524d:b0:5e4:c119:7ff8 with SMTP id
 4fb4d7f45d1cf-5ed8df6b4e1mr5956743a12.4.1743163636552; Fri, 28 Mar 2025
 05:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503281836.8pntHm6I-lkp@intel.com>
In-Reply-To: <202503281836.8pntHm6I-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 28 Mar 2025 13:07:04 +0100
X-Gm-Features: AQ5f1Jog71HzA_x7rx0ngc8U5aLe4l_CqsEtPzKn0fR8IXVByQR2yIYcCfIb5Vw
Message-ID: <CAHVXubgrx_R7+_tf4OD8yrAhx_m5LighWJc-MpwCg1BFg3dE4g@mail.gmail.com>
Subject: Re: [linux-next:master 12126/14010] fs/dcache.c:145: Error:
 unrecognized opcode `add.uw s1,s1,a5'
To: kernel test robot <lkp@intel.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 11:07=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e21edb1638e82460f126a6e49bcdd958d452929c
> commit: a44fb5722199de8338d991db5ad3d509192179bb [12126/14010] riscv: Add=
 runtime constant support
> config: riscv-randconfig-001-20250328 (https://download.01.org/0day-ci/ar=
chive/20250328/202503281836.8pntHm6I-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250328/202503281836.8pntHm6I-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    fs/dcache.c: Assembler messages:
> >> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
> --
> >> fs/dcache.c:145: Error: unrecognized opcode `add.uw s1,s1,a5'
> >> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
> --
> >> fs/dcache.c:145: Error: unrecognized opcode `add.uw a4,a4,a5'
> >> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
> --
> >> fs/dcache.c:145: Error: unrecognized opcode `add.uw s4,s4,a5'
> >> fs/dcache.c:143: Warning: Unrecognized .option directive: arch,+zba
> --
> >> fs/dcache.c:145: Error: unrecognized opcode `add.uw s1,s1,a5'
> >> fs/dcache.c:152: Error: attempt to move .org backwards
> >> fs/dcache.c:152: Error: attempt to move .org backwards
> >> fs/dcache.c:152: Error: attempt to move .org backwards
> >> fs/dcache.c:152: Error: attempt to move .org backwards
>
>
> vim +145 fs/dcache.c
>
> 312d3ca856d369 Christoph Hellwig 2010-10-10  139
> 312d3ca856d369 Christoph Hellwig 2010-10-10  140  #if defined(CONFIG_SYSC=
TL) && defined(CONFIG_PROC_FS)
> c8c0c239d5ab1e Luis Chamberlain  2022-01-21  141  /* Statistics gathering=
. */
> c8c0c239d5ab1e Luis Chamberlain  2022-01-21  142  static struct dentry_st=
at_t dentry_stat =3D {
> c8c0c239d5ab1e Luis Chamberlain  2022-01-21 @143        .age_limit =3D 45=
,
> c8c0c239d5ab1e Luis Chamberlain  2022-01-21  144  };
> 62d36c77035219 Dave Chinner      2013-08-28 @145
> 62d36c77035219 Dave Chinner      2013-08-28  146  /*
> 62d36c77035219 Dave Chinner      2013-08-28  147   * Here we resort to ou=
r own counters instead of using generic per-cpu counters
> 62d36c77035219 Dave Chinner      2013-08-28  148   * for consistency with=
 what the vfs inode code does. We are expected to harvest
> 62d36c77035219 Dave Chinner      2013-08-28  149   * better code and perf=
ormance by having our own specialized counters.
> 62d36c77035219 Dave Chinner      2013-08-28  150   *
> 62d36c77035219 Dave Chinner      2013-08-28  151   * Please note that the=
 loop is done over all possible CPUs, not over all online
> 62d36c77035219 Dave Chinner      2013-08-28 @152   * CPUs. The reason for=
 this is that we don't want to play games with CPUs going
> 62d36c77035219 Dave Chinner      2013-08-28  153   * on and off. If one o=
f them goes off, we will just keep their counters.
> 62d36c77035219 Dave Chinner      2013-08-28  154   *
> 62d36c77035219 Dave Chinner      2013-08-28  155   * glommer: See cffbc8a=
 for details, and if you ever intend to change this,
> 62d36c77035219 Dave Chinner      2013-08-28  156   * please update all vf=
s counters to match.
> 62d36c77035219 Dave Chinner      2013-08-28  157   */
> 3942c07ccf98e6 Glauber Costa     2013-08-28  158  static long get_nr_dent=
ry(void)
> 3e880fb5e4bb6a Nicholas Piggin   2011-01-07  159  {
> 3e880fb5e4bb6a Nicholas Piggin   2011-01-07  160        int i;
> 3942c07ccf98e6 Glauber Costa     2013-08-28  161        long sum =3D 0;
> 3e880fb5e4bb6a Nicholas Piggin   2011-01-07  162        for_each_possible=
_cpu(i)
> 3e880fb5e4bb6a Nicholas Piggin   2011-01-07  163                sum +=3D =
per_cpu(nr_dentry, i);
> 3e880fb5e4bb6a Nicholas Piggin   2011-01-07  164        return sum < 0 ? =
0 : sum;
> 3e880fb5e4bb6a Nicholas Piggin   2011-01-07  165  }
> 3e880fb5e4bb6a Nicholas Piggin   2011-01-07  166
>
> :::::: The code at line 145 was first introduced by commit
> :::::: 62d36c77035219ac776d1882ed3a662f2b75f258 dcache: convert dentry_st=
at.nr_unused to per-cpu counters
>
> :::::: TO: Dave Chinner <dchinner@redhat.com>
> :::::: CC: Al Viro <viro@zeniv.linux.org.uk>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

https://lore.kernel.org/linux-riscv/20250328115422.253670-1-alexghiti@rivos=
inc.com/T/#u

Thanks for the report!

Alex
