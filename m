Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C274C7C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714806883; cv=none; b=aPoBZlLAWbFLZU6dMAMbRXQashIEx6FXVyyD+LbkherENgE57MBudAbdoZD4Wj8bTaAWh7MaFegyX4+ZGN0+9mn87W/Ouagu5OdeBRGpdIkkCPnDByJ6Hz8degrYtQ8LkYI7WNhWwlXWeOnnwqBpFN0ImHkZbbm6cdgvWxEECzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714806883; c=relaxed/simple;
	bh=JPi5SPuiU0SL02Qqqpcf1D/xtRrzm+mxaCVNvt4+a+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpwDAWS+eAkWx0v2Yl3z7n6p4JRpTg3URi3i5AiL58kwn4rdlNsJpCKMKJsFc9+hNSAyFfj4gajpKe4ZVIyHRiWBn1O5Uq3mcx7hBDmbNR8C3D5hvvqxmrrUYhfxfev3VeJWdpeXH5f4rXMV3ctDptrgGgQxslAlFEtgVJ7XkWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vz5lCkKh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vz5lCkKh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ed835f3c3cso3609125ad.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 May 2024 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714806881; x=1715411681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4N1i5Pm2LxhMxIRBzRCWAdKMXxb3hPvU+8V8CPs4HE=;
        b=Vz5lCkKhVOU0AbYADHXnTbVbg1Y8QHHATOnBR8y3vt25c64DhgDNnBx4gO8qfRZ+hU
         RWs7uwEMxXZNPKWX0W1qh1xF/9TZwVAhdNf6GNK5c0AX8EDQvCCTRpJSuU4DkiZfciq3
         3qPrtFUFEbv8q1S2VrIjfR7gni84ejq7u7QW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714806881; x=1715411681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4N1i5Pm2LxhMxIRBzRCWAdKMXxb3hPvU+8V8CPs4HE=;
        b=DwXUMiBKMr342v58KHMg6xK+5nlQxsIzKHQjf1xsZDRmmeyK0jzZaS6mV3YqQJN6U4
         viVYQ23xtD45EAh/ze2HXBeNcNsH6ELAuGmx62eFCXIurp6X0Ro9r+Z0Tyz7UV636l6K
         iNJq67cSQ8bGCTKSahWGz8l6l8CbOuvZS45qbSvwL5WFQ+39CwQ0xAymJaHEtpGDgKvb
         Kbye/PRMImqMTaSCDMeNn3jZx/VzbdMmQ4rkI85Jlr29HFOj071Yn+KMkwsq8QQixDPB
         kpu1bISKOGYJegZMim17E62XipXeLlSjm5gSYLxKpse6rv7IA9dk1vWJc1K5uP/K30f8
         jePw==
X-Forwarded-Encrypted: i=1; AJvYcCVhPUixiNZELAP5oko8bnb629REggmLoq4MGAxucuCVfF/WjKdcGyXS57c4E2ON6YR8ekGgEMzPMCHWaiAhvkkoWv872SouVuhiGZgUeg==
X-Gm-Message-State: AOJu0YwVZgKeRercp5h3AuE/2/sEL36m0p8GfArWCIll+BsSnuQFf7Qy
	Z35ZFlNlDZcTMD5KClmPmFC0IrGCC3MdZqaDU8YAYBDhWNWF2jlnsE9mmFsAbu4qQQD9Em7ruU8
	=
X-Google-Smtp-Source: AGHT+IFn79avCXCi7TK4D20lbbR6FREI9JMpMXrAyAVwamxmEgAFymvNjriz4FhRmJ0iOLvNa3EtUQ==
X-Received: by 2002:a05:6a20:7f84:b0:1a9:c28e:bc17 with SMTP id d4-20020a056a207f8400b001a9c28ebc17mr5550146pzj.45.1714806861314;
        Sat, 04 May 2024 00:14:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:a616:7211:d0ce:9ad9])
        by smtp.gmail.com with ESMTPSA id b185-20020a6334c2000000b0061f42afa8d0sm1391585pga.6.2024.05.04.00.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 00:14:20 -0700 (PDT)
Date: Sat, 4 May 2024 16:14:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240504071416.GH14947@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405041440.UTBQZAaf-lkp@intel.com>

On (24/05/04 14:54), kernel test robot wrote:
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/block/zram/zcomp.c:214:2: error: call to '__compiletime_assert_285' declared with 'error' attribute: BUILD_BUG_ON failed: ARRAY_SIZE(backends) <= 1
>      214 |         BUILD_BUG_ON(ARRAY_SIZE(backends) <= 1);
>          |         ^

So this is what that BUILD_BUG_ON() is supposed to catch. You don't
have any backends selected in your .config:

# CONFIG_ZRAM_BACKEND_LZO is not set
# CONFIG_ZRAM_BACKEND_LZ4 is not set
# CONFIG_ZRAM_BACKEND_LZ4HC is not set
# CONFIG_ZRAM_BACKEND_ZSTD is not set
# CONFIG_ZRAM_BACKEND_DEFLATE is not set
CONFIG_ZRAM_DEF_COMP="unset-value"

Which is invalid configuration because it means that zram has no
compression enabled.
