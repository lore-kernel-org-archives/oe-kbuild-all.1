Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF61C07EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076969; cv=none; b=P+qqjXKWb0pBdBDfPmZciE7VfnbyWYiM7K1SxQ/oP1QLltC+JUic1SFKKCOQob/+APFlNwnDhY/jUX0R3L/Qlt+63a9DVnt74FW42EymBNtahwsoEg7/GLYWH/xPneP6oojKfEvbmSO4mlOSUzTKEECTtLpSEWMvhos5OfM2qCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076969; c=relaxed/simple;
	bh=8gP92A+Ze+n24rBoK52XoGxxw396/VWsU0nZSEiSWIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdFfi7krcMgHlVplM1gV7UMpvxKZhhOIywsngntMOzZuIxPVMOupQFnjcfKxnsq7eabof8G8YYQTILak6ulwbNzvWeJRoe+Ts9hdMuAZZzsWz3AZKpADMTmqxFn2a6YAaArvM/97l+i/Xi6N4kR1d7mf1Ah5iyWB1b7q+wfgssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=AkcDpWdh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="AkcDpWdh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99f646ff1bso572181566b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1729076966; x=1729681766; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8gP92A+Ze+n24rBoK52XoGxxw396/VWsU0nZSEiSWIg=;
        b=AkcDpWdh2d2jG2tzNQUZAXutkeAwj0cTegZr/BLy3XUq2vWsMaHCIOGQh7zjUeD7vN
         kvqG993Nkd1ES/f6Z7UNi61uPqvIG9EmTpVrqrsfpWXvLC9UoWBDs/+WX/ZXrNgl+FvF
         0A5QpjVaaQVvRGMOJCC5gboZfao/zlQI4/oHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729076966; x=1729681766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gP92A+Ze+n24rBoK52XoGxxw396/VWsU0nZSEiSWIg=;
        b=FM5E9VsPjv+fWbP4bFtma1GWKkj2NS2UVk9elhz5Pvwo0Wb7MS6m4XB/7dkFqbBh1p
         me6wtQXLn0xRTPFvNCHwAQ2I31ywOC40K9aUpsC2bVCmdnq/aZbbhKjcJV9f4s0tagT9
         kWOZOv2ZuroCjTtTtjodsHkcK7+xzS3GXmNU6wBFuQfuzSiIg1BnLPVxRBuRWuvj2ije
         Dtz/CVD50V9WLocD1LX13A+d9n1wE30EARluhcF4XXYgAc6sK8zzaDllhblZnOr5jjx8
         aV5qEU5K+r3XmKamos3gyIilNp06OZr+W5ZPpdF9bJqVsyxsRG1jbCAACVp9BhFo9qFN
         cdvg==
X-Forwarded-Encrypted: i=1; AJvYcCVsIVrLBWIVQ4LlcSvTtj5VXMfJj5+AMj9UgwnltinVtxhpQfN3bQw5aHapA/24Irmr2aJpxD8GTJFU3laB@lists.linux.dev
X-Gm-Message-State: AOJu0YzDqIYmxnJSHc68DxrEUx9LT2Bzp70uxrD8z/76nfAaUn/3TnKT
	EyLh9LQFkU0QyXgx6NoO+Vfl/m+I5Th27SFakT8/a60HCC2jo55c+kP4TiZ2rWKR0NJ9FKenk6s
	jVPSLbqGDdAuCmfSsiKtnBR3cMI36lqEqRP6ECA==
X-Google-Smtp-Source: AGHT+IEBWK43pEuSVPY5kfHUSC1ctgBijgdwpK1K66HvvMpx96cAtgZ0O0oJMCEPtTEDN0Fi58hIKlah5t26W53KDfY=
X-Received: by 2002:a17:907:74b:b0:a9a:222f:45bb with SMTP id
 a640c23a62f3a-a9a222f495bmr682124866b.35.1729076966086; Wed, 16 Oct 2024
 04:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410161847.oG293ywD-lkp@intel.com> <CAOQ4uxhD1QYnZHRekQPm-A+3SFXMzv3vZW6r59kSOFAtXNWHEA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhD1QYnZHRekQPm-A+3SFXMzv3vZW6r59kSOFAtXNWHEA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 16 Oct 2024 13:09:13 +0200
Message-ID: <CAJfpegvecwzi4FccCaVc-UFhRD88evWEFqe8S_DqMBwSePHXGg@mail.gmail.com>
Subject: Re: [linux-next:master 4258/4954] fs/overlayfs/file.c:234:57:
 warning: omitting the parameter name in a function definition is a C23 extension
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, overlayfs <linux-unionfs@vger.kernel.org>, 
	Christian Brauner <brauner@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Oct 2024 at 12:41, Amir Goldstein <amir73il@gmail.com> wrote:

> Preferably also the fuse_passthrough_end_write() function in the
> first patch, so there is no build warning mid series.

Fixed.

Thanks,
Miklos
