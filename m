Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0202FDC29
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764583527; cv=none; b=IUpoy20J/5c6TVWQkUNZij36p54URN2oKGuEw2eA9cOHCYl0aH5TXTQfGxneGD4I3WkAP39jDD3yO91WYA/xTxh+LtI/t+b1GuENAsi6l2feDoq74zm9m4NKQS5nLzej9UMDnvkh8+w+Q2LH8hlTffaPLyRR36TCRP1an2/iqhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764583527; c=relaxed/simple;
	bh=QW3C2xm8tqFI7avgttrCxfznYuX1TOfUYkhhTrUEOm4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ik/HbCVo1zAVSwlCRrvTM467c9nJ1ThwrlR8QZYZ9kgRvQHmv4v+pii5jeqN5hJchEj/jQIi61RAb6q4oUaCYMNyGoONxoN1qeJLbHSm1wjMuhH2u2Olt33Z6bxddjI/+jW0oqI6L40OVVOvCuNNDguIctXzF4EiaOXNXXKDJzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I6wxlFdg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I6wxlFdg"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47799717212so29388395e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 02:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764583525; x=1765188325; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hokwNu6IaYMbmwrE0WQgJHcf6cEHAYouUTPDe+4BPQQ=;
        b=I6wxlFdgODzABJwVZc7K+cbFJe7LEKdQ2LSQh6gQC3P3q/CuPQJO+ST1/QPsVmOIBU
         SWBtJKUQfcDXQtCT4AP0owrZb2WnujYYZgL8lyEqf4h7zIVb2wH+N0AXCzlJq0+m4QYQ
         SSmx/cvb38VWAHaJLh9GSOf/J1a+r8hlCNrdIfuYlRbNuO5WxUp916fWL2+f+KNygzHS
         DjaffIoJenK7TVSRpJSNGx13EY9HOiDue3/pmJT96N7JRXdh0nmWZ1tDU7C+kk087mLd
         hA1RQ/Cx3+o9V6wlxfQU3DSD8ie0xLGiQmPaIVBNiwXoFUJjb0kT2/blQlX7tHJulgY2
         T/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583525; x=1765188325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hokwNu6IaYMbmwrE0WQgJHcf6cEHAYouUTPDe+4BPQQ=;
        b=ECpp7FO2A0TQnX8v8UeIc38H3zfyeK/vGOnspcrOS0sszpKHPkOUsjd21IrDbB/WZO
         3Y8geGpq4lbHxwZyS27qpxVBnV8Hr/++mEU5LXiNuBLlQd/8MTNBtocP/rCJpBRFblPB
         n+i0aXbbP/2AKNTQL1v5FUN+Lbpn+H81PdEWCffuK7EMb9IZVDhupTcP6fgYgMDexoOF
         Qs2E4RVOPg50KF3jdM7Ltr4BciKNSza0zT55JFoRYDbPYUU6GJbvTJxHwVgU/1Ny+hqT
         ba/4QYe/NcqeJnKjL6y7Ej1COtjR0vuxud6tLNiJUqQ3U8Ka8DYnAVJjJjttIlIpUPX5
         b6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFWbq4YNqvZhMKU9+6LtxL4EygSDW+9xWH0zgn4LYvXXUaJ9S9h9uO3iigRgvr0OYZLwXWgy/NDMfwT9pn@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm1W7q4e4Q+RLKDKD0jI50Y7mr8JDQTRGqVVnKLQmNVWdiX1uU
	5La3UulTFsMVfoX4pJoJsUjs82nckGo0oFbKKoCZikNFOohQTNLBDZxeX+rFJ5F+Vxt9REx3k3I
	ot+IrT5yIY0GjA6x0Mw==
X-Google-Smtp-Source: AGHT+IEuJJnomH91tNowPcxingIui9TDaWLt/RdsMUdASyq1y4L96SoNxyEjJqbWxxwvW7pcu66mrnWs+f8ljRM=
X-Received: from wmgp1.prod.google.com ([2002:a05:600c:2041:b0:477:9f92:40da])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e93:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-477c10e1ccdmr386141335e9.15.1764583524562;
 Mon, 01 Dec 2025 02:05:24 -0800 (PST)
Date: Mon, 1 Dec 2025 10:05:23 +0000
In-Reply-To: <202511300859.35d9m0hj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202511300859.35d9m0hj-lkp@intel.com>
Message-ID: <aS1oY_RE06wPmaOR@google.com>
Subject: Re: error[E0560]: struct `bindings::file_operations` has no field
 named `compat_ioctl`
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Nov 30, 2025 at 08:47:52AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6bda50f4333fa61c07f04f790fdd4e2c9f4ca610
> commit: f893691e742688ae21ad597c5bba13bef54706cd rust: miscdevice: add base miscdevice abstraction
> date:   1 year, 2 months ago
> config: arm64-randconfig-r073-20251130 (https://download.01.org/0day-ci/archive/20251130/202511300859.35d9m0hj-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511300859.35d9m0hj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511300859.35d9m0hj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0560]: struct `bindings::file_operations` has no field named `compat_ioctl`
>    --> rust/kernel/miscdevice.rs:161:13
>        |
>    161 |             compat_ioctl: if T::HAS_COMPAT_IOCTL {
>        |             ^^^^^^^^^^^^ `bindings::file_operations` does not have this field
>        |
>    = note: available fields are: `_address`

Hmm, that's weird.  Use of compat_ioctl in this file is guarded behind
CONFIG_COMPAT, which should be sufficient. And this doesn't seem to just
be another UML failure.

Any ideas?

Alice
