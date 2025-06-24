Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867381DE3A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758334; cv=none; b=JB+2ls1LjF2YgiyhELB4ghI1idaZoUZeHW7D8JNvkG3lh/rBTZ8KcKBeqLBnq7RLEycxoPUAQ+rSlbMY6a3nrs9T8c5HS+Ej+P2oNMKfhbVMSYgNE2piM9ytYmOtH3YBsgLpqvLlRr5hAvu7NS9MrbDRJ7UjnjAxJh4OUB5XaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758334; c=relaxed/simple;
	bh=cDz/xKJA3GJIOOI7+QVSHUOmCq6Hr6Q9w9SxHFqR3lk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TrL7/Vs5C8Ez/2K6NgYlGONwm3e60bR/WWMF3nCTSZI46knGq9fZz4CLUsDqjX08QRNF1I6BJrDYrjIBkQ+oT7frgTv4TmJvptbu5rtaDsQGzEDc+hV90m6fM9qRUo72T5rNbX2T4nBJKLVaq3UCPERT8mNbCLbtsy+s2uGarPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3XDgCgV2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3XDgCgV2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4530921461aso1914945e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750758331; x=1751363131; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3F16BtIk8k4/yVVBxX6JNq3pzVJe5ImT0Qp1C8rLPs=;
        b=3XDgCgV2l8j9hP74BrveWfgnv7U2HCz1NHH+XHCOU3JtUfOA3cpGlpAZGrnMgOHP6K
         F9ee4WU/A4AO9T8+PmUJCD8ycqwxRyFSPweJg9rI+ytuq+g8BrwGi5tQpaA02QK65v7Y
         W6icYKFn44oEYr33wUdbsAYsiTZy6d5z3R1+93QBoHN9fwZOL4vn0wDMy+Hh1BYS6Nsd
         p017kmeSpy8Ulq8rRjk24MSosqz2Jq0+BjINwS3O96/PyQKEYMU5lBxND0JSVhhTE3xp
         ejMXWWK0zo+mMRnKShkvwY7Ph13Yg/3gjCggFUZfREcdj7Q0uFHlVa5le1sfiVMBXtKh
         Jlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758331; x=1751363131;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3F16BtIk8k4/yVVBxX6JNq3pzVJe5ImT0Qp1C8rLPs=;
        b=CjsfhpFc979MhHjFTBWD+hD61VUixRjdwtAQWAhoZ/9rsYQRRFQxRGMcCeHI0yt6pM
         tu/UYxpN39a/ty0ZCXqtcr/oOM/v0K26FuvUy2Zmb2ED08QisUFPIJanrouvaNJlg98o
         Z/NdPnkOMIhnFb2rktryEFZLYOfdVSmk1ZU/LOKNtnHwHUDieHp/4OIlKA/AXsh5k5ke
         Zzt6aRi9x2V71t9EVNvNggnARSmcQwiWR9d3kwDfDYjth3IOL0cOnUD/kp9TLzwfpAXR
         UBJTuBv9ALfM+hnrFLJxb+nnryznrvJiXWefpY+bV4FhoCUCvDePFiszMalFejlS8eGL
         pizQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0SOOEoUqjC7dUgg9iL+YNRs2PZLisg2QZprInfXNbiPWm2R8uVCBAfRC4AX49KOB8SeVw8p7MkPXn1yZB@lists.linux.dev
X-Gm-Message-State: AOJu0YzAapZCP2GI2sUhW9YcFADahk4N9OXaHf5NOPp+QHv1Qs2FiXEb
	+kWQ9Xii2ou6mC8bJB8KowBpy1ajC5dMNjsCaaIarn66neJUQbNAyuv61+hVFrl33XI=
X-Gm-Gg: ASbGncvlucbQqL57xMfItsZZ8/3BJ/E06ORygxgI3xviBzMbFCyi4tU1cLrLGITmggr
	Ofq6bc23lcNkW1mBGTJONHFsoMB8A7419XtylXMfcTEK0fqf2+KIb8Tyd1icWI128P4/pp/3xZE
	4J8sfDtNCPdmk6FTGrxW+EzZVzJCTRZ9esJBxBJ8NLrUFn3wjBFI+Bojxsq6QxHPJFDkTo3fIqv
	07Kufjj61/vedoAUkceXBgFwxpZsLOtRNkhUZcJDdvkvtjlmm5zqJVlKlA7HOJzNKwmoMCx/va7
	CH43DepTBmBqxCk5GkuTKMxEOQrG3U/BZG3FPEVEEqtj3rRVyXL8HNf5uuwpOlRaEOdEN8HV
X-Google-Smtp-Source: AGHT+IEfKJ8rIR5mAmTAhZsWYAZro+s+2RnbRZh2P2aL/uoMTWVJrb/SH/ZyzpbFKtFo6/c4Y61qGg==
X-Received: by 2002:a05:6000:2807:b0:3a5:232c:6976 with SMTP id ffacd0b85a97d-3a6d12e3a8fmr9251881f8f.44.1750758330808;
        Tue, 24 Jun 2025 02:45:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cbe8:9695:6e5f:16e4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453646fd7aasm135856715e9.20.2025.06.24.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:45:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: kernel test robot <lkp@intel.com>, Manivannan Sadhasivam <mani@kernel.org> 
Cc: llvm@lists.linux.dev,  oe-kbuild-all@lists.linux.dev,
  linux-pci@vger.kernel.org,  Manivannan Sadhasivam <mani@kernel.org>,
  Frank Li <Frank.Li@nxp.com>
Subject: Re: [pci:endpoint/epf-vntb 3/3] Warning:
 drivers/pci/endpoint/functions/pci-epf-vntb.c:695 function parameter 'bar'
 not described in 'epf_ntb_find_bar'
In-Reply-To: <202506240711.TJdFg8To-lkp@intel.com> (kernel test robot's
	message of "Tue, 24 Jun 2025 07:49:05 +0800")
References: <202506240711.TJdFg8To-lkp@intel.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 11:45:29 +0200
Message-ID: <1jcyatjww6.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 24 Jun 2025 at 07:49, kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git endpoint/epf-vntb
> head:   a0cc6e6fd072616315147ac68a12672d5a2fa223
> commit: a0cc6e6fd072616315147ac68a12672d5a2fa223 [3/3] PCI: endpoint: pci-epf-vntb: Allow BAR assignment via configfs
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240711.TJdFg8To-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240711.TJdFg8To-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506240711.TJdFg8To-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Warning: drivers/pci/endpoint/functions/pci-epf-vntb.c:695 function
>parameter 'bar' not described in 'epf_ntb_find_bar'

Hi Manivannan,

Sorry about that. Do you prefer a fix on top of what you have already
merged in your 'endpoint/epf-vntb' branch or a complete respin of the
series ?

-- 
Jerome
