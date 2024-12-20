Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2521D011
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 17:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715764; cv=none; b=S7TKC7NSe4OScKZO/tFwA/YYO5duALi91Cb5wUckC14IXVbE0WEhd6ngch6zOyushh9WGAba6jwHnsfFdhRGipczBN2+9ZccUlRXspov+VGeN00W6LUic1xnHbUoyA5WqphLTGz2sva7HaRW31B3rRpYcUikFeN7I6B1XRceEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715764; c=relaxed/simple;
	bh=WDQibC61giutAdujK4uq94ZhQJz//zKet3vo0ET0jxI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8RvXp/LhPsh+X4kz5LddEn8CoWYLTP4132XhpwhH/zXNGPY78ipV8aWj5jeGXwAeakYKlNR81dzy9ppCwk1UB9YbApZUTOWFv9yjvEMDVTG5S9q05wujVkC5j5T33yd0AUYWohRQ/hMgydbpT30Wv46UUOVk2RMPBrzfQL0qqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlKpM72m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlKpM72m"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso21122215e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734715761; x=1735320561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1acnOwku0j86Rkz/9DI9NJnBGHkF0zD5pkfSAcUkJQY=;
        b=UlKpM72m93t1lT93qKyJVJlWbcqvGtB4hVg3gRyUA3k78CxQNNStTsU+Rf6WJOWhd0
         iTLEUmsRvRTc70dxK2p4W2LvQHOqHzzRp8Jt/cF/3LdpACpVy2wrzK2Zu92UkU83EaG1
         JmTnFL6ETeQK2iL9cnj7MPwCMqoxU6ly4hDO66hQ1Usazm2PLFu1REC/gJTjj7fCQmFI
         8gDmvyFicaZoubXjJoNPcSp6y71XsnnoftGcyZHoPRp2XYLDLbM8td6b64XVFq6gOwX7
         V3Ew4bt/me8A7vC0SKF1J3f9AobS1Y+wH75ggDSlKYu1ymfshLmkspEWpAe6vePXqX2D
         aKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715761; x=1735320561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1acnOwku0j86Rkz/9DI9NJnBGHkF0zD5pkfSAcUkJQY=;
        b=GgHssghJmUw9nRHmtyTMk6V5oer3tUlxtFc3tTTP/umOwgvRJm1E/8HQjD/amLnNfq
         P1X1jr4E3QaJ8RakSo3gNU3yR5n68MkdDp7lQcOY9RPfZDck18AR69V1UyGYBPAGlJRd
         1u/UG0Zr70EHvW6+hqjNdNImMzidlMbLBjIkKLQsihQ0nT2NTW7EJ+m9zaBmMFhlF92+
         ny7EyA1GIs+IC0U1ZaK7t7HvhFH/NPKd1nDtb7xrAmGA6rWz4N8Rwft/K4WBQX7+CPyX
         qNUlno2zGtoMQ6Hjvw/PayBPYko2wLJtwN9oDi5mt9CwDtUF8ljm7m/tnRSDQWRLWKW2
         gwDw==
X-Forwarded-Encrypted: i=1; AJvYcCUM0SCSQX0uzDuwTNe/34NVrOxdPbN+crv78LLKRn3hcrY+3ChzubGC2+fnENdHnB1wiwuiFR5YSMlwSoyl@lists.linux.dev
X-Gm-Message-State: AOJu0YxoThw+Hwk8HEPpiHvk2a/2cYTZYkd79D3c11k4Gwv1Ea0L5Q2d
	zT/dq4/NOrkBu+3UvscJbYvbwvG1WSRztDPjtA+kvYjmRb/lwoWQ
X-Gm-Gg: ASbGncsssROtMvvcDo/9JOLYiEFWNosotiZM1atSyljFWCyHSFStCR8o0kMrwh4G+F2
	F6yl1ANgYOn4C9KrXXDvvm9GA+LkPjz1Nr7FgZaZn41h2J/4mm3A4kEja+LQlpL3QhrCoCrSnYq
	yHR06lbRTnAK+hiYpnL0ey+ObVvYsM3hV837pRus0JtOs8BZsLtJMzMoV7zrYG67h6rVNM1CA3G
	GpKV0OPVcK5OgGLnyYiCK0DhV1sHImvys3COmL5g1WuXwCjyEkdIjK58C4FKSN2/QZbNRCVKkdp
	S3KQRddgkYNNe0R+oJwQj4I=
X-Google-Smtp-Source: AGHT+IHAMiEunzbO9UoyE03A9SJJaPmMcLi6Aa3903H21Qa87ssKndD8Vu/gQUdc3zzX7opMsirxTQ==
X-Received: by 2002:a5d:6da1:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38a221fa065mr3846919f8f.20.1734715761345;
        Fri, 20 Dec 2024 09:29:21 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6aeesm85758955e9.6.2024.12.20.09.29.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2024 09:29:21 -0800 (PST)
Date: Fri, 20 Dec 2024 17:29:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, Eddie James <eajames@linux.ibm.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/hwmon/pmbus/ibm-cffps.c:184:60: warning: '%04X'
 directive output may be truncated writing between 4 and 8 bytes into a
 region of size 5
Message-ID: <20241220172920.7a34eb46@dsl-u17-10>
In-Reply-To: <e76a0071-b6dd-4a99-9a78-69f104278c70@roeck-us.net>
References: <202412202139.tZ2VJL2f-lkp@intel.com>
	<b8b9dc2c-cb70-41c5-8606-eb3aa6cdc257@roeck-us.net>
	<20241220163056.7bad4962@dsl-u17-10>
	<e76a0071-b6dd-4a99-9a78-69f104278c70@roeck-us.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Dec 2024 09:03:51 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> On 12/20/24 08:30, David Laight wrote:
...
> >>  
> >>>      drivers/hwmon/pmbus/ibm-cffps.c:171:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
> >>>        171 |                                 snprintf(&data[i * 2], 3, "%02X", rc);  
> > 
> > The only ways I know are to bound check the value or to use
> > OPTIMISER_HIDE_VAR() on the length.
> >   
> 
> -                               snprintf(&data[i * 2], 3, "%02X", rc);
> +                               snprintf(&data[i * 2], 3, "%02X", rc & 0xff);
> 
> works as well, at least with gcc 11 and 12, but I really dislike that kind of nonsense.

Ditto.
Using the result in some ways can also remove the warning.
But you have to try quite hard, a simple (void) really ought to be
enough to show you 'just don't care' but even 'if (snprintf(...)) {}'
isn't enough (it does silence 'warn-unused-result').

I mean, the whole point of snprintf() is that it truncates.

	David
