Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE78D30B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 05:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707890320; cv=none; b=E62C7erC5B/3fEFz/HJ5PN020xUnZNE1xK8k54pQ0TClQsGMd7ROE/WJUDMI1Tmn0BKo8LO+meQP/dpc1KTM2duz/PYRPSB8Nl4Ug4CF/ZBPALcQc0FpO2EJuYocGJm0knpNlTaiicMAyY25QA18KKPW8Vi6JJ4MOKnlrEn+gbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707890320; c=relaxed/simple;
	bh=ZcqxcjQxDebT5CbvXKPEB85P6WxkC7BjuKlGqRqGBgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ac8Fb6ors68T5zMBNCHyY86DyfS8UYgtFWH9PP1g8cTAQuQKXB7RgPdjS7rRpuUwOXIvoKDEy8t67uymAjWcHGpmxB9whyDTD/K4F9G0cDrkxCJrBBCdMyowMlcAN5Zyo9C5lwmacPoo7W/UyvmNdAZZn2xcvGH8Cxj5CXMn7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s333MwRI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s333MwRI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d91397bd22so39210735ad.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 21:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707890318; x=1708495118; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nY08EkkPJUeVUObPeyFdb1hWJ0D/OitTX82rprubt28=;
        b=s333MwRIRHCakkF3lzashF2BCSFoMLdcpfF2D7IO1pIZghEnMc7HrpoIHdV5wCqYn2
         AZu1hB3BZ7QW+zcOSyP/1BdUmXp0A26ThxQS9l+CueMb1sckUHeA9WO07Wb9+Jisnq50
         a2yIM/ubXksIiY88jvxY+l0mzP7xpDCfebiZ3FRGMaeDLx1Amkllmtvher0aDSMYR8MS
         1G00R5QdDRseEzzkc16rB2a7Z+7WtgAhppl1JAnuq+KJt5w8HqhFVI5TdzndiC2t72JO
         VcGcNReJQu92yqqFiRXBdMlkWPjTNvlQX02yHSEUHqGt/DGUiBuBvAcBg1FYKgc9UORt
         3Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707890318; x=1708495118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY08EkkPJUeVUObPeyFdb1hWJ0D/OitTX82rprubt28=;
        b=c6aJGTpyv+GU9Q+lrqEHfaC3TomRAsL4qYaeinyapv4cMYGCEqgYlioioWKE8C6/tj
         1K5di7qhP3kbTAgPoR0O0P+IhL8zzLme8g0+Osatid+nBfxt3q1NYBfn+lf6n/7SVOMR
         8j47gprWQF5oS6mAHBPk0e0+5Ai+9B988SmpRk7+3o+DVIGjRsY+C/x1lnHIJk+DLFEf
         U1rDPKjtBOcy6tnApHSAr1naqdpZdeCBXpeNdO9uOKSKsNiIihDy+XbRwSEJXoCCBpZE
         kjV/WaWSgv/EEU4pq5eITSHolp9QOc08Xng8cOPevZed9DDu5fGPvPgYlVmAEG3au32V
         eOKQ==
X-Gm-Message-State: AOJu0YzsH1bsI8JOVXkvx2XUO90ne+9DldtfHV0rMIRs/ZVSBf4IPbyV
	ux9rrYbHqGhvOM6lL8JJ3hhlhkh2wMVr/EpXzakIjBIGnT/4creo/sJAmWShZP0=
X-Google-Smtp-Source: AGHT+IGhQ7H2Zp/0O/Pg0ufvkyGVHSn7dTBcgVXoYEUm94RfKCVKGGx5r5Tk819uhm7fp8LAAnNK2A==
X-Received: by 2002:a17:902:708c:b0:1d8:f071:5067 with SMTP id z12-20020a170902708c00b001d8f0715067mr1822353plk.35.1707890318439;
        Tue, 13 Feb 2024 21:58:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiv7v0g/VUOGhVZtdAvl5qwTiaKnmJDlU0BzdcWc+GYFLjbNOKuuavSx1zq806FNjT0Zzka810dkxtLaZqvb2fLatR1+EYjNH9LAsE+txrDrs96kKtbwN97fDiH4oex5XGySkqeA==
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id jk5-20020a170903330500b001db4f25b168sm859730plb.255.2024.02.13.21.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 21:58:37 -0800 (PST)
Date: Wed, 14 Feb 2024 11:28:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/opp/debugfs.c:48:54: warning: '%d' directive output may
 be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <20240214055836.c5i3zmkhdllldwon@vireshk-i7>
References: <202402141313.81ltVF5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402141313.81ltVF5g-lkp@intel.com>

On 14-02-24, 13:43, kernel test robot wrote:
> Hi Viresh,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   7e90b5c295ec1e47c8ad865429f046970c549a66
> commit: 46f48aca2e5aef3f430e95d1a5fb68227ec8ec85 OPP: Fix missing debugfs supply directory for OPPs
> date:   5 years ago
> config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20240214/202402141313.81ltVF5g-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141313.81ltVF5g-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402141313.81ltVF5g-lkp@intel.com/

I have informed this earlier too, this report is incorrect and applies
to a very old commit.

-- 
viresh
