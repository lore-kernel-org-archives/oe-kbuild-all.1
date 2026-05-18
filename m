Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9274C262A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088505; cv=pass; b=YhP2K/MnRchvxov+Qj/bRve9Cia9jWOXkRBYDAqfYiuE+irirmEVLpgny1Ya28VQqCZx4Pz1oJvbivV8MsToZyxePJujs5PqN0BG7OxHeXkRx0tm9C7Sg0YFZ9AoqGy80l57Mgv321nn+8/3as8dSbWfpMbrpxy54CvfK7RZ/nM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088505; c=relaxed/simple;
	bh=dyTd1zq5r9rUMR4f8hOsE0/w3mL0WNwp3sv5d+6zRoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTQMiqQaQEXGW90TJY1XRYV5bLFL04IVjqAsg4mSRfWnv75DHpaXTMujsEY6jzzMNeyASznr1Rdp+JailREBcUrqo7FGDNETXAK662rNHXUWSjlf4TXJLrvo5/7Szg1YXlwJhx1amYIbPkThQnQ4wSmDhZTO+oTwy4tE07+yDwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L8AH4Pa7; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L8AH4Pa7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45e7c636e74so359950f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779088502; cv=none;
        d=google.com; s=arc-20240605;
        b=LalvdmgutswQvmKQQZbtH06Y1keBao5FGyspBV562vMi3RB6EvTJuLCDpZpg1nlqvB
         kpmNTqxqxyyI2Fe56QRv8ds83wMhNvdD4GvUW+SbHwmb49gSkS6WmvI+HWjE2R3+juG7
         GJg1RCAj46ratxrf1MSuItMh9ED19dSym9p9iBr1tKw+cm1ghAAdna+adhXiaouPocHy
         GW0erFzdgeP4WUUe+vNYqPg6m2CdKZj7ZlTlJSSrLXvUVNo5eVggKusVcYvdN/1nl6K6
         0+ws2ntxcyxeukk4c904qd9SKHjwaUf6Uia6ymR2uv6fa/GSCxFa4ZGSnGR1RPx0ZYNY
         50xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AIk3YvXW7H+gMmmPuJQZLkAXdjsYSzjI9nXJFsHO2iY=;
        fh=oSiXUqLvL3vC26ennTz2IVJCu+qUTwHibgIeCIb53sg=;
        b=F+6hLNqqZQY/WQ6kk6dIKe7UjAaw+g0FjRg8cfU9NIVfx7wYxQnABNmOdtkYk0JMNO
         OhBgoQQVVFT8sphDUS3AOhmy4w3EDXOd/OM/w0kOFsSF4bMrw0ETfRW/mH/2ReTtnvD7
         TfZa5CFyIPFEximCPkDtrANksPVdMOzmQ1dhn6ClY+4ZFZTXT4FTbryfom1477Fs7jNU
         2ijoEiGNejN+B4CIj4ogot2owo4NsvAnwDvZGRybaQ4KSLZ/AGleZNzCe4A3MSWeWINM
         mp0I2TcCdPg9IKxQxHDiJmgETtrGbb1QkQlE8f7c2NhrCSvduK2ECK1jhKhqo7PQeIbh
         Wnrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779088502; x=1779693302; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AIk3YvXW7H+gMmmPuJQZLkAXdjsYSzjI9nXJFsHO2iY=;
        b=L8AH4Pa7XXMhyP0DZu/L8/OKP7GhBYWr10yvHGWrrH0dEyM/FxbxZ+nmkUUmxHNklM
         RLqVSpJxlNTs5o0cn+og8EKE7hmsQnWozN/juDrg4gpGta2np5QKb48UuAQpSB2bJm6d
         vyU9oGiSMMflI5QuHJGkWc+RHY28EzXGowvmdWHCN2ckGEo+LCi6Sd2Dm+8hln/70M+4
         zj+K/B7rBS5Am8hdxtuT4WSdiDixYI1mzlGShyRg/Z9/ex894vsUTxuR37bpQXCQd9p8
         P9vDt9mjji8J1m8hyl16tBfTB5jLqOfTEM+akd6EhbyHSherJmoRRWWgR1TpUuBfH+7K
         zSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088502; x=1779693302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIk3YvXW7H+gMmmPuJQZLkAXdjsYSzjI9nXJFsHO2iY=;
        b=kIOcZJt4Y+2kQQkqj28V8pl7iMNIsEgLS+IbLHKLH97Pgk3CtqjL9yPBrDyVstcw03
         5TIvMLRY3BPcOevjkyF2tI8JCU2iGzGkVejgGqjF8d6qmfblfLDujCn7HyJjJyzDRfS/
         P4l/g2QUiY9z4bVN56S+7q1ygQm9LwdMUB0V5eMeqDZb9uOnc/NKw0diMD6Ry5FcnlsG
         PtZ+AHIsbrQBqT3XDS1eZrvgyNzBfK9Bb5LazT+0FWKc0Oj3Zcxqywaxbx/zZT5eAl5M
         lGAtLzcW0867pgZX1Txqf0bGfebdEp7MrYKiLqfPmstD5l3YAzkvu1KdvpG0fyBs9O2h
         n2rA==
X-Forwarded-Encrypted: i=1; AFNElJ+RybeJiplvHSevGpu1jZ1LJc5at8umXsBpwXFtUggccDgHKMAUM3rOYxF8NvbGBk8fDoMiAU2JG5jyEQRO@lists.linux.dev
X-Gm-Message-State: AOJu0YxbwyMwgAaQlc8zCm6BClfXP93M2B19NfhFuzWVqZxAPoELvg2O
	ziZIAFXjzvPvpUiZ+CMzeL4GW3qGWl87VnhcdD8L8ND9jp3ARokiaqh+tPIHuWGTRxwQT+by5CX
	w7qewR2QvpUkKmkkLIKHLzGbEQEYIJmsRxnAqv6ln0Q==
X-Gm-Gg: Acq92OHIqRU9AxlUGyLQs59dPMmVRXO2FZOzxF3XE3YSCJPrXMv/mWqeZFdIKJG9GhZ
	0XDfWJg+5+UJpaZLSk9QYuqPhze9n9w0/6VBi9rkDmjYLE+CdZ2UJZtW/k1ndi3lOTfITOsinVD
	NPFSxUrZI4dFf2M0cqV+ZXPV6jN1xJWUJ4tKpEunPUhgCdS9tocx79hunCsOLuUsRjv+cQSX+IE
	23ViKjd3PsKkVEKasa4ASO0Tx+cUChf839AFlTnPFnBSU04eVicLg+A5yxjMZnpL4TAQ8Lr2/l1
	sASHWcc4gKr4thrkLpONVORmO1jHkGpcD90KDGo3q1VkWjxIlXyWwWQnzRmANm1Pp+eZe3O/Fbc
	+7QAB3AY=
X-Received: by 2002:a05:6000:2c09:b0:45e:73b9:fdeb with SMTP id
 ffacd0b85a97d-45e73b9fe1amr8358824f8f.8.1779088501924; Mon, 18 May 2026
 00:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140749.ueq3q2k7-lkp@intel.com> <CAPjX3FchC22U0n8Z97p2BNxeYnf7AQXp41VQUot5ZXsSSWy1Vg@mail.gmail.com>
 <20260515150116.GQ2558453@suse.cz>
In-Reply-To: <20260515150116.GQ2558453@suse.cz>
From: Daniel Vacek <neelx@suse.com>
Date: Mon, 18 May 2026 09:14:51 +0200
X-Gm-Features: AVHnY4LcQWLjj2lxGW0HezilloU3iWMU_pA5bzYvoXXv_xADmBiAXYO6wBAHTaE
Message-ID: <CAPjX3FdEqo6Ox44-H9wUHvFh28Hp=xv9mS5xO1mRrCPgBMwbKQ@mail.gmail.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 34/43] fs/btrfs/super.c:659:3:
 warning: label followed by a declaration is a C23 extension
To: dsterba@suse.cz
Cc: kernel test robot <lkp@intel.com>, David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 17:01, David Sterba <dsterba@suse.cz> wrote:
>
> On Thu, May 14, 2026 at 05:27:36PM +0200, Daniel Vacek wrote:
> > On Thu, 14 May 2026 at 02:02, kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> > > head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> > > commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
> > > config: hexagon-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140749.ueq3q2k7-lkp@intel.com/config)
> > > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140749.ueq3q2k7-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202605140749.ueq3q2k7-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> fs/btrfs/super.c:659:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
> > >      659 |                 int ret;
> > >          |                 ^
> > >    1 warning generated.
> >
> > This only happens with CONFIG_BTRFS_DEBUG and a clang compiler. I'm
> > getting no error with gcc.
> >
> > The variable is only used in that single switch case. If we declare it
> > at the beginning of the function then without CONFIG_BTRFS_DEBUG it
> > would complain about an unused variable.
> >
> > What are your thoughts? Do we want to introduce an extra block or just
> > keep it this way?
>
> Yes add the block to case branch please, we've done it elsewhere too:
>
>         switch (...) {
>         case: {
>                 int ret;
>
>                 ret = ...
>                 break;
>         }
>         case:

Will do that. Thanks.

--nX
