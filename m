Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C261FC7CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790675; cv=none; b=CVlYGItoden2vS9sbf6lBoTdp66wwG9mlXAbWFIWGwteESUowvbbo2LowyYryHAt663HSY+u7/WXAqS7SkVF2QsikNvhpBrA0nnmC5aSsZnILip2foyWL72nuoHG0QQaeCXDEbkyKSWuCPPmS05RRHDK9oFVwsxhL7jp1M62IlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790675; c=relaxed/simple;
	bh=nIU5RGZBGj6AglzRmtLgho0SrGl4Vu9/6ceBO3NtQYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHUe6VaDGykfxfyM1oEtyhgZRas1SkteWIPrLsi6UK0CdYWE4qh4aHowURSvtsn1L7Zau/+vNNc4keJVYOnz+ZsyOCqCO2aYHp53OP9smM1N21M2TU4kW/PNxjlTdOS5vU/ltTkM77YPA8EtdnhIBTULawVoLqRGoEOT9HHIuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mco7fkQa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mco7fkQa"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315baec681so12194095e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790672; x=1730395472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QxqFM1Hkl0tufP+atgF+sk6kuXyJIln3OX0G/l5oS0=;
        b=mco7fkQaw4Ul4zMrDwVziAAi0x3Jte1Z0luXtn6BHadC2jfV6NRYAJS/sw1XonPeij
         TWkRTZmBp6u7IiDpYtXYZQFbLf2Bdb/P/i8pvpwPEaVuhAi9lycERRboq7KYK19Zy6Q1
         H3kKnTTOpQDWnwYgp4yyD5DbZ6BgFjLB2JVT69g5t2HGzksy/W2oNcyYXbLVALz8s6Ku
         9A/kG2ELMNNhm6f5fwH8rh18/hP32T42rKNVx6kAhZZNNyGNwxKW/VbYvGWubqhOLnd8
         Nmqo7o5H85AQM+AKQJCBhq1WEc3MNyONL5uUfIJ7OiFz+5ScuCYef32qPro4++g37XUG
         XPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790672; x=1730395472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QxqFM1Hkl0tufP+atgF+sk6kuXyJIln3OX0G/l5oS0=;
        b=VZyjrvN0gBw+fzsRfgWAPKeqizTaVvel2TbYCGyyk2PkgcBLjD2i9iQ/hJDkbzpWoS
         B8Jh0HDtsq1Jlf9lRzkH88C/VcFsvlAhQved9sdtuLOjaW08MaeD9Msgs7xFRNm+rzoH
         XQMiEpior5bysEtRTee3W5xskmfqHmyfVtzEkl9nkYDAILtYsiXNcyNJfDXdm1X1KCVJ
         oChIMHO415lx358CmNz3s3syxCF1ZwBastZjhPyrGl6JgL3ilboErU+qMwH20JKiPJHD
         vRjMQT4hIVki+BL8pNly3oUVjoffFB8D/6QKE+Vtk4veVM9W5Y2wKHeeZjIgmO8Rtz3F
         HMRw==
X-Forwarded-Encrypted: i=1; AJvYcCWEUAdBqLMZoAm6/Q4Fd+UXz2KqrvNA5mIw86yZAxitBug6xc9NZZGXgW0KnZLx8i0kTT395i7YfchcSm7F@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2PqyO1TpITMBWRRxmZ3IAjpVEYM+n5LIrennCSDq3hHJpXVgu
	t9SRudmrKcl2CZjBWBNikKzeNJw95wq1mKjQwDhUaK7clpwb1Xcl
X-Google-Smtp-Source: AGHT+IGs1kPR4BD4I4Bu6h+OyVlwI/etLR9GpZlR3desKnw6hJ1UVyKwI4hNum53hj3kEKOyzyJNuQ==
X-Received: by 2002:a05:600c:1c04:b0:42e:93af:61c5 with SMTP id 5b1f17b1804b1-4318c6f1765mr25240115e9.14.1729790671677;
        Thu, 24 Oct 2024 10:24:31 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b567fe8sm23501945e9.28.2024.10.24.10.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:24:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tomasz Maciej Nowak <tmn505@terefe.re>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-mm@kvack.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64: tegra: p2180: Add mandatory compatible for WiFi node
Date: Thu, 24 Oct 2024 19:24:25 +0200
Message-ID: <172979060252.717947.10687585732746114503.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240903132200.3350-1-tmn505@terefe.re>
References: <202409030438.8tumAnp1-lkp@intel.com> <20240903132200.3350-1-tmn505@terefe.re>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 03 Sep 2024 15:21:48 +0200, Tomasz Maciej Nowak wrote:
> The dtschema requires to specify common ancestor which all SDIO chips are
> derived from, so add accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: p2180: Add mandatory compatible for WiFi node
      commit: 2e57d3dc7bff60b9fb05eaaf4ebad87cd3651068

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
