Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EC023C4F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370672; cv=none; b=d1cAkDLcP4icKBX17VEdUO78hz1Qds+uv/5x+lDWPOLSD2ERlzkwEnmdLL/nc4rN95be/Lha/1NpTFx/6As4ImafNZJwXBtI2kO9vjkRAM3rnLqeMWrAm8q5h+iWRV/3k9zGJ57HgRlXTu6VM0cdy71riBWk65nk1H+NaT34RHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370672; c=relaxed/simple;
	bh=NKeqYvLIifww0mj82IUGWogUIo5n0oR13zzEhbq/V0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCDaeikc7tebpIjt1c7Uf7U74hKaM1Dr+4uEYIEeFKA3l81MSwfpBfVywVUANNNHnG3xpxEmX5ASTgtoyyyloVPuC6n3ONYWFUmZ6tfyLhbwseKsuLJ0BCCptn9CXNVAFuXT4su8OgAMd9HWT5bQSt8M7I7PrEgZBPta9NCEnA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD0cXt6W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD0cXt6W"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so26574455e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 08:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370669; x=1760975469; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vwyKKDWzG4gsyJSsWJd8GHM/HF1gjd2t0aumh3kXjrI=;
        b=HD0cXt6WyrebiE+hHvqyV4NZ1sxyq1nF6guOR1iE/IvNdJSy2RxpRVqGAvMowA5bq1
         m3tJ8OwHvCijuW2VCHBAGRgt487tMrAb8lWYHuS60Zb21F33iWdlFjCkihm0ZqPgpXkV
         eCGHHjEGh7hCoZoiNYlZKBVE+E2mHiiudR073IoIYP6Q/q9dw3Hx+lScu8PPxHuFk72c
         7Jo3ardP3HFpJQplNKjSyCSd/v7cf5L4RpRSFl7vWhfn91xyaYtGMQ2DlvsYLGEvIvE0
         opDCk7BpyP1YmIIsG2VlgIfLikKz+3xKD0NT/GYjnkKIFIJERiLHEdaSExsHaeK3oYlz
         eD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370669; x=1760975469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwyKKDWzG4gsyJSsWJd8GHM/HF1gjd2t0aumh3kXjrI=;
        b=PxTBhk8Y/+/BOd7i444TTs02oipcomeSoT0l97v00ogEIBbLX8Xf8N+gIC7r3GSeR0
         4oNcf7u5ppghm/P8dcqkQN752u5gvz9EWsLss5ADFIvTQ1I0y7FM2T8ZOMew3cEHVfyk
         dBTGxdFepVmPP6m5zcbcWzSVbrKgqNird4hrHyoWQC2ffaL0t/XTilafqDnmiQcFARD6
         wrfeQxTivMjK1wuS3Ipd/PFYlKquZx8I0vNQidlnYFbZQ/+qsTIiLuq84ixJzC7y9GrI
         LW9nKAhHEvh1NkFonTMRRfbSumsdkKxo3oCNuvZRsVNXaGFgoKsgyGv6EVXp0wLHcL3X
         uclg==
X-Forwarded-Encrypted: i=1; AJvYcCXbTxzfGB969nAsqb7QMGoTCb3eRMTx02+Vk3HwXhWgsOdAPZXRR31uQIhtDQTeXxofIf2DJkGqy/lynAf7@lists.linux.dev
X-Gm-Message-State: AOJu0YwBvpOn4ZrnWAJRUg4DEExSFAo/5hm59Iu68zc/y/Pcqdm/bVi0
	tqtP+wj2gQFPql5YIr5zHifWF1m5Y7siWhp7o1tvBYxs8pZLrcs7JQKQ
X-Gm-Gg: ASbGncs121s7ml6K6VPsREtHHOUjRsSr1kmADgPXIh5Ek8JD28f4QVYhtFrlKX9bqyS
	kPsc+Su9TBm8Nztle7cSX2tjORvCxJ5Ej116dpVu4YqTqMxck/spXK2sCJ/C/MNi7MO991Ibwlg
	RoXaYoyNWvCO8knNH2RQg7FVMAFIUEd8jPWPcD0ebEYYjM5NwTSXi9t7zKuPSKJTMaC2KJD14SW
	B1Y+TCJn3+Es/F0oi1fD7H/dGiuLgtmMB6wxJF4+OXx7bhKj/wHiBwTMQLen2yukOa2wHFy410Z
	hs1Q09qme1nOYkNgBgoRnBDjDGAt4n1DbslZ9T27OrP/Z2MTy61ATEfxIsm9D+knaM1miJnWDwm
	6bmjKVnPJhLcVOTZFCSGKqqbGKGAfuHniX0uoYHoNt0QM
X-Google-Smtp-Source: AGHT+IHf3BqDFUdxdtDr5m2nldUhPx2Md3z5kS1xagTVE8+YxLYmc2AFaMMWKUh9GpwqhsdateVBwg==
X-Received: by 2002:a05:600d:4301:b0:46f:aa8a:d2e7 with SMTP id 5b1f17b1804b1-46faa8ad4bamr106658795e9.4.1760370669270;
        Mon, 13 Oct 2025 08:51:09 -0700 (PDT)
Received: from gmail.com ([51.154.249.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484c71csm198294445e9.8.2025.10.13.08.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:51:08 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:51:07 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aO0f62-RnVyKRLS-@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com>
 <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
 <aOzcasDutRtw6JP9@gmail.com>
 <CAMRc=MeGbFi10f94GmmAMyLqBWWw7VmPcjaXQWDEtFgS=hvWdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeGbFi10f94GmmAMyLqBWWw7VmPcjaXQWDEtFgS=hvWdQ@mail.gmail.com>

On Mon, Oct 13, 2025 at 05:36:17PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 13, 2025 at 1:03 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > >
> > > While at it: the subject should be: "gpio: bt8xx: ..."
> > >
> > > Bart
> >
> > Done in v4.
> >
> > Vaibhav
> 
> No, it was not.
> 
> Bartosz

Ah I see, I though you just wanted the transformation of "gpio-bt8xx:" to
"gpio: bt8xx:". I've removed "driver:" as well in v5 from the header.

Vaibhav
