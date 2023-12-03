Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5C2F44
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 18:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVoZOwzS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d076ebf79cso2016985ad.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Dec 2023 10:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701628518; x=1702233318; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XofiGJnHsU0gR6jHZzAR0X0zZqTCu60EVqYYZjegzVc=;
        b=GVoZOwzSxpUNGdJF8JGpNazA5GsFKk4BqrmQ929yW7pLAOu7qV928vAlWCUI/MGWJG
         qPrlEJ5UqMxzM68hshLf2N9U+n64iyP0IY6MC5e0RJuBPT0EO+danyn1L7PmCfdLJV0d
         YCqSr5vIebatBqGfDjgJJw2AsERJEOi8qJy+Qcf//v9hjT36Kxs7iq2p1Is593R4LPYz
         BPmfJjsCghERV1tJ0QfVit/6wyrNAinznD/yOAs/ELLXj0QNvXcxZtbVZmWHulNdhCS0
         STs8t0P8Yu5mFjv1h8BBD4G22cMyroucTs1OEJ/uxIZOW2f92Td8IZn4lGTH7NB0vmhA
         JuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701628518; x=1702233318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XofiGJnHsU0gR6jHZzAR0X0zZqTCu60EVqYYZjegzVc=;
        b=Qsnh1NaMooELQJ1R0OdaOHyaaZ9WxZWlxxWLY78BAo2VM4t7UF+VBUs4c5+wCVUnda
         n74CX8TjsB2o3lauBAQGa7b+W3XLtkNMo9nuGMlrMbaKsYWNAzX/wF+mm13mTbeo2yjA
         ohdpW5w4PiLN/twrQfskV3Ta852S4aXQ1nJ6CCbhe3Pp37/3GzdR8cr90EL/rxzV1Zy/
         4KH87RDF8vjhWLSMsbSd6y1PrT8AJVJ6uNG4ufgq0EUpZ9KGHKr9b88LJTiOUfBieQor
         b2JYlcczH1ThplnwUSMIM9N1TY7+Syg4Ret/VEt/zHAT1M+t7SBsxBc620jHH+U7ezby
         gH7A==
X-Gm-Message-State: AOJu0YzUCCUNBafNK0bXGhijSShFqX18vOMQRBfFiBeTjT+88nGIz61E
	0miU31r/X3VbS0aD0YdNAMM=
X-Google-Smtp-Source: AGHT+IFcNTCqvliU8fIDZ1fl1Z6Yf/A/136fsYOotxzDpoq9vEcM3vxIB3DL+nn4B5WGbeGOTr5q8Q==
X-Received: by 2002:a17:903:2285:b0:1d0:71db:d427 with SMTP id b5-20020a170903228500b001d071dbd427mr761317plh.134.1701628518472;
        Sun, 03 Dec 2023 10:35:18 -0800 (PST)
Received: from google.com ([205.220.129.26])
        by smtp.gmail.com with ESMTPSA id l19-20020a170902f69300b001cfa91a0570sm6935117plg.155.2023.12.03.10.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 10:35:18 -0800 (PST)
Date: Sun, 3 Dec 2023 18:35:00 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?iso-8859-1?B?Wm9sdOFuIEL2c3r2cm3pbnlp?= <zboszor@gmail.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	zboszormenyi@sicom.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] egalax_ts_serial: Fix potential buffer overflow
Message-ID: <ZWzHv7X1UKgJJYTy@google.com>
References: <202312021646.cwwvptuB-lkp@intel.com>
 <20231203090600.85890-1-zboszor@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231203090600.85890-1-zboszor@gmail.com>

Hi Zoltán,

On Sun, Dec 03, 2023 at 10:06:00AM +0100, Zoltán Böszörményi wrote:
> @@ -42,7 +42,7 @@ struct egalax {
>  	struct serio *serio;
>  	int idx;
>  	u8 data[EGALAX_FORMAT_MAX_LENGTH];
> -	char phys[32];
> +	char phys[NAME_MAX];

This simply wastes 200+ bytes for no good reason. It is perfectly fine
to truncate phys string (which does not happen in practice).

If you feel strongly about it then maybe use devm_kasprintf() to
allocate the needed buffer.

Thanks.

-- 
Dmitry
