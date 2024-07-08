Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5E17C9E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720464727; cv=none; b=SZRB9LhrfR773jBizAuJ0MASSX37N+iXfCDsJBC9rsdahfvC/apZPH5yMzCt+EzVj/yjV+vFGcDjWmeSJvS6+iz/miL6NG19rPf/gjh92S3qbo4kCD/ZbYpo0stHvaIHD+ZB8ZQQefg/WXyHV05MGNSqUSp2ZbW4DNk6tS2jUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720464727; c=relaxed/simple;
	bh=tqWuK5etaboPZQImIxopM9Jo8EdfI5lbnyOw6jdv+B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jj1xyzdf6QWj3lhazRf7e8tCKIwMmpiqErbhhc97cnVR9Xvjm5E+XZddV+VvwYE/uXsD87yAhu3uMRsP0/PeCxaIvg7Izc2yyvsGZ12OTxBI/00UeJxrmnUqabhVjpdCQh3Z88fVmGqznyWPES27GzANCXRc+/Bk+Gsm7HPNqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBAxHSi/; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBAxHSi/"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-65011d9bd75so36306807b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Jul 2024 11:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720464724; x=1721069524; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ot4kTSF8yh1w4GxdmGA9PVDM7xfI4y+fgzfFZkCuStU=;
        b=qBAxHSi/BXeYrQhEKndaf+e3bfyVkM2G61cGgRjRPr7l380C/ld532/kYyvUAKoMVk
         GeFstBlQSXSFrBXD8xEYvMD5dtJ6Nc587tav25ScB2Wnxq5OFqt5EgOXgWw7TblGPE5V
         Sb8Gsi2quPL9ZG8+Z2MhIg/NtXZnzwsL8Uppwvj0KNgT+qam4MUmtciHzGoSn6Y1v2lc
         dj8OhIE0Izph07ASHLjSu2Zbbm36G0pc0I68JpCcwjwZkHDciyN27pKEAxdkT7sUTYPi
         46iG9xq8i2IIvkAo0krasRFn3KBAAY1AHWcopLr/8q6ux4gELOEy8KXaRBaT5outfmdP
         Jjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720464724; x=1721069524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ot4kTSF8yh1w4GxdmGA9PVDM7xfI4y+fgzfFZkCuStU=;
        b=UJMe22wOYEYqrIeQoIQbhGi9drPASS2ZdMDx57zVFKZEB9xwKKWr1SqCmQSM3A9d2C
         M+05/LGjHkCqaYumeaMsmc57tz8HMDF+49lQMxKvvqC62D7E1P27PVO5LizfdZk/F9eg
         nev3qzJBUEfPKZpWRfwoZuauFYr7ebMNaJYNAahqOxRzc5CIoBccY6sTrQ1IbonmqgkR
         2ii3WQsLwtKvqJ73J7yVhPn/R0TGKPv+C03AVCbU6uNwUWHl8UWckG1W4pJJI+WFW1UI
         2X2Y1bEWfnEmClw/rbU+YZDPvsZgk2tvV2jHUZe64EJ2E/TRy5tsOg251zC5or71nH/8
         9KoQ==
X-Gm-Message-State: AOJu0YxJyniG+8RqVT9aS77q4YAFJ2WInc+IqzrH8eFKcGT2POuWv0wk
	RW6l9NkH799yYIZWk8a7sP6zyCh4NnpSFQOZ8JlTMdFf/gE7nXYcev3Cb7xEufIiP980HtA+JfS
	SfJF/PY3Tz0CNO7zpOMXM3byFqXwj+ED6J07LkQ==
X-Google-Smtp-Source: AGHT+IFR7gbAn6A3MRL1AfoMWZF2uz4RbuEyXAZ/HHmFFeMUbx4BF8viefzYRuWwlD1ZUNWc6rK12EMZmKqAAQHZ0Ec=
X-Received: by 2002:a05:690c:4b06:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-658ef249fc6mr7552327b3.29.1720464724390; Mon, 08 Jul 2024
 11:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407090029.a72M25wz-lkp@intel.com>
In-Reply-To: <202407090029.a72M25wz-lkp@intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 8 Jul 2024 20:51:53 +0200
Message-ID: <CACMJSesFR4L4wYFDX0xJKGqfZ80vq0HG3J+7Y1kWqodjqTS_Vw@mail.gmail.com>
Subject: Re: [linux-next:master 10192/10451] WARNING: modpost: vmlinux:
 section mismatch in reference: mgmt_index_removed+0x24 (section: .text) ->
 .LBB3864 (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jul 2024 at 18:15, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0b58e108042b0ed28a71cd7edf5175999955b233
> commit: d009853d746532353e0d1517c75289bb7dbf0450 [10192/10451] Merge branch 'gpio/for-current' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407090029.a72M25wz-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090029.a72M25wz-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407090029.a72M25wz-lkp@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>

While I can confirm this can be reproduced easily, I am not sure if
this has anything to do with GPIO? Looks like it's an unrelated issue.

Bart
