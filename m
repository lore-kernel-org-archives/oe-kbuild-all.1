Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA71E4AD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735926579; cv=none; b=Ig8po6P/Y85kw5VBI4CaEZNsnlOj0o2v/Jyl9K6yFURGjIRrG32gAOdazPxK8lsvCZ4j7zb1x7YFZooyViK15XL6lkmzE85ZJfrHBkJxyIp0mTVPgK6eJJjKhFqvEmC2urYE1N9GCBtI+60u/vbU183CYPptXf0sDxw00bKC71Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735926579; c=relaxed/simple;
	bh=XrshPINz3eLQzhst0hPwRAOsoI2AmMmZ/6pxW7yxc+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzBj5ap86C1M6vQXDFod5U3bRAZqteBlWwj1p76CrZy4BNjhnbIERQz2N/LuhwKuvRsoxq5/qYUfotYKPNfU6PZvABtVjlQUFtP/tyUHBmY+FEBe/SuERn8RK1vtSy5idOwiD8EgpZWxQPSvZyzkMVLQE0wzX1gLhiXVs2YeJgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GT4EocsJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GT4EocsJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21654fdd5daso163311185ad.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jan 2025 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735926577; x=1736531377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uo6rDt3cubn9bpF2zPQJPXlVkUPz31qBbOgMeoTNNwk=;
        b=GT4EocsJPgb9JahX2DBArrQqEIeUTWdBN/SM+H83Zv4sm555F/e1GQZyNsNwt1BRPA
         yEPsu+6QhhUOEIZEhCVu4y8tZrLKpXHnJ+hh0ZVHD+W9DBNVOn1rlUJLncDhgVFiMca9
         GgQ15adPc5XWd0gV+nvpEV5RNlp/qF4lIBuOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735926577; x=1736531377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uo6rDt3cubn9bpF2zPQJPXlVkUPz31qBbOgMeoTNNwk=;
        b=SZ/TLjF6HSlu+ndOm8DkjucsB9Np7YOtt+gcDhJgbfUAzSB4WQZGozCc5QcIEmFylI
         IS5aM99ssJIoTN8ON36Em9DcDgyAZcnMgTMI2y7puL7QPwhnJCt7K5GsYCx43RzlHl9l
         TEhQfdsWtmNZhxnBiXajckeKrJGlXgoSfqV7fV6GZQJJJHFDMZbmxKuYJ68cmsbunm4H
         o8l8OfN27Qbu1eUjY94N0XFXwDUJrF3tg3RMgrSetzQmCwzN8duQsfXiSMc7Jv52VylJ
         +xK/WoLRRxCgp/7tAMJAECMDnMbDXVKAsrb9ejuFAhVpTW7UHCXHclCNmAbme7GN2wV+
         UZYw==
X-Forwarded-Encrypted: i=1; AJvYcCVYXK2FnwiuDe3aIF7NFbLcsB62yghdDk2BuZg5E0k5rH9HHzv6Ckw23kaDeMFOUZquHA7pUyvEx3LUUZ5s@lists.linux.dev
X-Gm-Message-State: AOJu0YxPirdovlxXF5pSVi/EtefLczg1/O7wx1LPx/nLTvMvLXPWH/Nm
	3Bka0+NMXVBVDMjwZS2n0o+o+fF1kguAP7QAD9WH0r51UNZWYxDSAHEZw2fb0w==
X-Gm-Gg: ASbGncvLHvaX0MO5k3wjVTweEEhXQQAwU4q4++6wGZql+bzUL9ZUcSihqfCLPo3pmF4
	aYHIJsOtJAaTpjyjfGMQzsSZWnyvBB1brZMGMqhl8MYaaghMZKZcepZ6AIBmVl7qQd5Vw4XSLpN
	VfXyGjzbAjwu58LRzixMFWyTZvLmIYg3cyNaZ/Tr61Iog9iw2kZpnFBKByjJD9PenEb+RPB9r+x
	rirAf8XB7eiloA0eg61Mn2ZfM0Mm+Iby64UxLFnvTvMHJByQyK3PauNRBMRP1u5Al+Bs+NnWJLr
	pTxSrjuG8IzMxZ2adXk=
X-Google-Smtp-Source: AGHT+IEP6VscL7M3waPA0hLpJx6rrTglT+EUuuWZP6+HRsXadnxU5H5OOXvSJAsJi390KfXiiCH0+w==
X-Received: by 2002:a17:902:d481:b0:215:6fcd:6cd1 with SMTP id d9443c01a7336-219e6e8c508mr569945525ad.7.1735926577412;
        Fri, 03 Jan 2025 09:49:37 -0800 (PST)
Received: from localhost ([2a00:79e0:2e14:7:2f1b:db40:bb38:fa8e])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca01965sm247761675ad.240.2025.01.03.09.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 09:49:37 -0800 (PST)
Date: Fri, 3 Jan 2025 09:49:35 -0800
From: Brian Norris <briannorris@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>
Subject: Re: [driver-core:driver-core-testing 29/29]
 include/kunit/platform_device.h:15:15: warning: declaration of 'struct
 completion' will not be visible outside of this function
Message-ID: <Z3gjL50fsmh-fQPH@google.com>
References: <202412241917.orLfjA92-lkp@intel.com>
 <Z3bdT0DrjcV6UzHe@google.com>
 <2025010347-outright-fifteen-a9c9@gregkh>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025010347-outright-fifteen-a9c9@gregkh>

On Fri, Jan 03, 2025 at 04:52:01PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 02, 2025 at 10:39:11AM -0800, Brian Norris wrote:
> > On Tue, Dec 24, 2024 at 07:37:20PM +0800, kernel test robot wrote:
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    In file included from drivers/base/test/platform-device-test.c:3:
> > > >> include/kunit/platform_device.h:15:15: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
> > >       15 |                                                  struct completion *x);
> > >          |                                                         ^
> > >    1 warning generated.
> > 
> > Same:
> > 
> > https://lore.kernel.org/lkml/20241213180841.3023843-1-briannorris@chromium.org/
> > Subject: [PATCH] kunit: platform: Resolve 'struct completion' warning
> 
> I guess it should have been cc:ed me.  I'll go dig it up now...

I sent it where get_maintainer pointed me:

$ scripts/get_maintainer.pl -f include/kunit/platform_device.h
Brendan Higgins <brendan.higgins@linux.dev> (maintainer:KERNEL UNIT TESTING FRAMEWORK (KUnit))
David Gow <davidgow@google.com> (maintainer:KERNEL UNIT TESTING FRAMEWORK (KUnit))
Rae Moar <rmoar@google.com> (reviewer:KERNEL UNIT TESTING FRAMEWORK (KUnit))
linux-kselftest@vger.kernel.org (open list:KERNEL UNIT TESTING FRAMEWORK (KUnit))
kunit-dev@googlegroups.com (open list:KERNEL UNIT TESTING FRAMEWORK (KUnit))
linux-kernel@vger.kernel.org (open list)

Anyway, thanks for picking it up.

Brian
