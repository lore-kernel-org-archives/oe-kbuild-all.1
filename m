Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A057854652
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777706150; cv=pass; b=O9A7WVvJrf9/hGhMgV8eLM4K8BJL5yi2r9r4hQRyA206kTTwX4fZM6R0QoC5JtGSXB8OsAA6jmNMROsv8PE6QEFC3ByRH0mFR6rYJocgFHf6QLu9YTITd4Nl3lw4qd6xDd06JV/5YHGiYUIKeHT+J9CS90CtR2iaw74hTKzOhyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777706150; c=relaxed/simple;
	bh=yVenhuGWF9U1qvmyzdQCDf2oZ5qJPtG5CRC/Ym7jrxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRYIEMpesoOXxVBOrm1fGcYBZotP+wGxCExki7BRf0Ngd5Svg41Oa1ZuXDofMtgraEMeu7vmtvRTXqLZi3dQWf+H9boRqBB0JPYwh3deJNloOwzG10Dx+mbeqEvZ4ZImW/MIFeSS7A4zbkkmoFQuIhh36KNqyD4NkMW3M3uWnc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV7sfZLc; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV7sfZLc"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d958880ecso821176e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 May 2026 00:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777706148; cv=none;
        d=google.com; s=arc-20240605;
        b=E+Pu+sRlnrfiRMFrei5r0ZbK/vP4t2Bx4hIOLINECfelcjwrVo3MdiyePXYOTIuCkO
         LxJzy/Wn1hdEFKXtPyXnMfv4Y9fOupvyYRX/RyZIN8UUyEHcLjnUW6JIlF8+6kYs09/X
         P/fpJG4l+CyNiWWna++CbIGED723V+c7cuVXB/W8ecn3lpc0ghdUNnkCBz+Wzr0kr4ow
         bcJDOA/epe//SocAaWlJH6yMKsWPq7Yk4GBkn3UirSUsvAoHWoqXSRBiyoACoIcjqM3F
         cwYrcLqYw+JV547IbjPg9cH8YBPDom70oOoKXoZeFZQp7RFZt2EG8vOzzYTOEWeOy7Zj
         0YVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YQX8lDfdrTUcNmIhOEPxk5AXUTh82y9K4DWiFcS+BTs=;
        fh=8knItmjJlKUAfLpheb/wccq/XIXw8UPh6ZDKEX0Y120=;
        b=KAbH3U+UaC78ztgL1T2QyHkyXLIhmnrKFF5yfzZp+CxHi3En6WlQfB1SkHBth28Red
         xR+33hjVxWKhPUZ3j3lkkexhJeeK9cA81nO27DSgtQmYM3AK0UT2CuFLxuIbP0/9j6g/
         gIty478DSDweN0RmuePoYSjHtAyPJ+Y9Si06K1ktpR+OOpyIuOYiY9TNhbqerUnOXNbe
         JYaSoPYjKT9P0/kC0wLgbJhlidGulOl492XAuxdmhCaHCa3D/9yBTNHmR/gzPe8BIq5x
         EyYwsfm5ecOCq7I2k66gva4vaLzB+BKmeWL2Z7XHlxDcS6LBUyj0Ka1KyeKdo0nOKsbf
         f0dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777706148; x=1778310948; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQX8lDfdrTUcNmIhOEPxk5AXUTh82y9K4DWiFcS+BTs=;
        b=iV7sfZLct1mXLZhOkw3hMZbNgDjaEXCQ8tRElwK7JkYReUBwy74IzN/jlwJ16gHVSc
         HXDbApl3J3J0gb9Xc4a4z6+pgu5UErBcZxEUx0G/JVG2Eab8U4zo1peLsvxWLWzrygel
         DNIx6mXn5Yn5ACOykHdfB4FjgWc9lf4VEIjJAYHuD2VMWASmcpAV2dmFioJCjAV4LOxi
         RHoh1sNWTagt7okK0GkT7F8rbAb6Xhf5L/vmWSckUmQ7wpKEPAvFYdKQjyNKed5LIX2h
         dGnJvH76kW6j7slK3stvqqmjWMOegqsgWWvIiwHIWl7oXNOgH7SJ/tFF4LULAk4POvSe
         8xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777706148; x=1778310948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YQX8lDfdrTUcNmIhOEPxk5AXUTh82y9K4DWiFcS+BTs=;
        b=Z1N8MJNTgUz4fNSIfBr9cHNApWyht8earXbpDmCUjsmhq9BH3juPNbBdjbwFSJA8sT
         tL2q2DUiY4XdKhbXLT1/XFFVluy+ujgdKCyx51lqqtA19+P7jXcAu+cnhdEvLuUgJHBF
         Pau6Mbhk0TLfYPtL2CB5KduP7Vj+ds8n80zanVkhRvK/9rVI0c0Ducj42oQrxCP86qnU
         wCBFCnG5qxUrqKHGV8TZ7cNjw5ZtgNQ7B1x45xE3r7jylHu7DgzbGcoNSDyrTV7m0PSc
         mg9o7+HDhV1rnAzq2NuFlEgPX0bxU23a+TC3zDuySbIpjCsEolfYGkSMc0Pi7yv8PZZo
         aUmQ==
X-Gm-Message-State: AOJu0Yxi+KTsg+Kpr8kJlW2K3vnf20OGc0kcdnT7tZaYV17vZ4wSYkU2
	bQTeKUHY+EXzrkFOeILenTr62UbefE7w50Ps6VQKSCoTccV2w5b2EubRagugJ8amJJ5dehKdPxe
	8fh5jr11MkMW2Gz0IuO5QXJ9YlIocLuw=
X-Gm-Gg: AeBDiesz/8qiLmDP6XaatvAg4YthjF/WQgmyYH3Oe2EGH2q5I2pFiOj9KSqC+hmiWb+
	M3uBvLPhYLxPmTzysyZrUxDYzoO+c+OMsC5ahAf14QyVxY9Y/KmypYZKaERv3HCvPXN9G8osWo3
	KbBHqWuPTJQS6Lxs+Gl7v+peu+HytXTCeIrOw8lTctFt5wL43o5NYaj6JscffVyggTnd2jMeQDw
	s45YdO7Q+p21LI5dOEsIl+yDE4t2eFaZ6aNt+Ezrz9KblFrPous2wFyyyrTGR+JNXlw4ersdQFR
	plpm9iGPTkW21qec+b/gwpGhXi8R3OfX38r0Ugs4rAuMD9nuavIb
X-Received: by 2002:a05:6122:1d0b:b0:56c:d66b:7516 with SMTP id
 71dfb90a1353d-5750c8e9cb8mr920114e0c.13.1777706148535; Sat, 02 May 2026
 00:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605020512.8DNwzYZU-lkp@intel.com>
In-Reply-To: <202605020512.8DNwzYZU-lkp@intel.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Sat, 2 May 2026 13:15:37 +0600
X-Gm-Features: AVHnY4LDkPWF8zhL_eVAWlcvw7znS0eM8CSnTUKDsGAefJY2b0wcL2X_DFScL50
Message-ID: <CAFfO_h5jg7oOmaE=7ptW1q-ENFmvBH=h3BsV9nmC1UFe7x3uBw@mail.gmail.com>
Subject: Re: fs/smb/client/dir.c:248:33: error: label 'out' used but not defined
To: kernel test robot <lkp@intel.com>, Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Aleksa Sarai <aleksa@amutable.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2026 at 4:04=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://github.com/brauner/linux.git vfs-7.2.openat.regular
> head:   be7728badbd230f1ee7beba4162383fa022ae767
> commit: 93306cec35846eebf467d63a775fa711d7106b2e openat2: new OPENAT2_REG=
ULAR flag support
> date:   2 weeks ago
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202605=
02/202605020512.8DNwzYZU-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260502/202605020512.8DNwzYZU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605020512.8DNwzYZU-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/smb/client/dir.c: In function '__cifs_do_create':
> >> fs/smb/client/dir.c:248:33: error: label 'out' used but not defined
>      248 |                                 goto out;
>          |                                 ^~~~
>

This looks like it came from rebasing and should be fixed if we just
do "return -EFTYPE" instead of assigning the error code to rc and
doing goto out (similar to S_ISDIR handling below it).

Regards,
Dorjoy
