Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84825A35E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760186263; cv=none; b=QJ2Lv70uN8aPsmceIj9GnBTiWmZxOKhYLywZKcUp0qPyqSi4OuW+eqtSgqBKNgx+qKCoPVUJqbVM48mbk5125p4mnc+VgR4fytMc+Tu6oUBxe5VPxAmww3QQ+9GTygOfe7FZtZXaZTiEG16ix18HTtDs/zvgNaIwZpDo1ZuZC/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760186263; c=relaxed/simple;
	bh=FMiY4ZQUUOd4P9ieRmAGobDcQ34k1Ch4+rby9oBwooE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrTTkhAUg2sXfjr4JvnEyWpbuSi0cyisXaRmLnmGOFtKaRIp9Py0HCw+LpjtwbImwTHFHYfAcoDYg2mG59t59Lv+cso59/rBCF0v4kbtzntq2AvqvZdDRvTKWkqWsgvRRt2I/M935uMtMYtJytfz8g/eQYCosmXDc6+XFT62fNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhC4PaRe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhC4PaRe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so2808205f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760186256; x=1760791056; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5qg8csjW/Bsuq+K2XEr/yyiuErSXJ4xPd831KWzAqpw=;
        b=OhC4PaReUWUyc/C9yg+WlqeKT3YnyS6wUi8EE6poNH8PGSyUGAwUas1i23mJ+rh9fQ
         zMLWjad1PCdjFjEBpJyYW3PNjqcyzk4qvsgnG56VI7pzE9Dr779OzWFtUbTCaFEMEdha
         am+SuKFMFGTSRaPMdcyRBGfgCfg5thhm+FOEuSuy6FE6k+Zx5fZerk5xg+P+sa2AD6Fd
         PVglQN5zXnCE90w4YHw4ojFqtHwSW3T/WEjyzIkI5FFNNX3ICLG5VvjCe1dbWFqiTkUF
         CUauOblyJtyDOijFYFrwKrEhD1pu0fN9QZTB9dmBI8vtXX2qtbKqgfnV8AWA/S1km/4T
         6wyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760186256; x=1760791056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qg8csjW/Bsuq+K2XEr/yyiuErSXJ4xPd831KWzAqpw=;
        b=tNnoqwQGqTPL2ZNWY/+dCVkRbKouxfFzfR/fDC6exnmvZEFGvdks0U6DIUc/Z5qQCv
         CN+km43YgHopXvosNVFD+fsP+E5o9MuzXxMpGg8ToANr2lvzyuQ2gW8rnROBiyncT7s0
         rt8oNfIqyLdmOLd+itZMiZCDd/ty8pFcRNMkgDLfvhjqpI93xZ6r4iTkH2nT4Q9rwdQu
         DAKkBkLfPwzwxiQHuk/M5SIxbgr/1BP2lHCIVjeMKbGdCSqMIOrx+Gozv8r+/echL95q
         fxsiAr6KMBmo0FoTNes5Ucn6eD7/q0W4tBPSrnbJmUmUN8HnT6movYI2sfpSjIC35k/5
         2x7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkNgbFYdyhl6zCkuYvjjWkVuePKGPOvbqwB1FAjocoH+ByNSmEoD7YZFuZK1/JjEO8gMByN1aTvvRAJ03w@lists.linux.dev
X-Gm-Message-State: AOJu0YxWows1PbbASupPPTFMohVLZCRUwRjPIqRI0QRGIej7i/nQ2kWq
	COkS6mSOjtOYB2JaWRt9szsXwOyHJRX4E3F9H0k6BHqBQfr7Q99E4ZTy
X-Gm-Gg: ASbGncvq0QOOSXfWBo6uvCZrtZnei/IVHjt93Mi1Gz7R97kBXhw20MjpcU4/n7gxXB8
	95PwMeRvtWCBMMbZ/K+U/aKdPfXwQVfVUmCMeoOXm3FIu9fbMaP02LU3wYaeTqMkW8yFhTfNKsl
	Ci2Q8d9Lm/YphnaBi6FACx2lhlozv3foLdMY7zK7laI6zAcv/H8152+SkHs/SOSkoanxPo4MPty
	QX8cqZPEuFdFMSewLSTOUFTeXdxSxR8H4ufrcJeoTZDtI6HCbb/rHNPIjF7/7AdWzE89dhXbLR5
	uKE54Lj8OtT6i1W+C4/xFAgyF7RYLaWgOZFSAvaTCFMfjQ8dsMcGxvSaPOKoizd42GjJEFCgmnl
	n7yqwYCnTVJ7KYys0oVxMbctVM9rowH8BbfWCLb9jkfk=
X-Google-Smtp-Source: AGHT+IF+rcib9YhfwxDNHT2wDPbjArqhOMk8C1S9qvSwF+nEblZewag0fFJaLComFOM1/qCquehFqg==
X-Received: by 2002:a05:6000:288f:b0:425:58d0:483a with SMTP id ffacd0b85a97d-425829a5a12mr13673922f8f.3.1760186256441;
        Sat, 11 Oct 2025 05:37:36 -0700 (PDT)
Received: from gmail.com ([51.154.249.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0a03sm8795159f8f.37.2025.10.11.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 05:37:36 -0700 (PDT)
Date: Sat, 11 Oct 2025 12:37:35 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aOpPj86wEmtpIQQ_@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com>
 <20251011143123.094043ed@barney>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011143123.094043ed@barney>

On Sat, Oct 11, 2025 at 02:31:23PM +0200, Michael Büsch wrote:
> On Sat, 11 Oct 2025 11:32:11 +0000
> Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> 
> > > It looks like the
> > > #ifdef CONFIG_PM
> > > must be removed from struct bt8xxgpio definition.
> > Ah yes, this macro somehow got overlooked by me. I will send a v2.
> > Thanks for the review!
> 
> 
> Also, the SIMPLE_DEV_PM_OPS macro seems to be deprecated in favour of DEFINE_SIMPLE_DEV_PM_OPS.
Okay I will have a look to it. Ingonre v2 in this case.
> 
> And please do a compile test when submitting v2. Thanks :)
Sure! I created another config file to disable CONFIG_PM just to make sure
during compile test.

Regards,
Vaibhav
> 
> -- 
> Michael Büsch
> https://bues.ch/


