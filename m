Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C53B149C6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418318; cv=none; b=msc/LSBOEgKNq/ytPFdQSoFILByUZ7qQG0YDnUSI3xLTTmWIhp5+PF97Zny4nVFLqsMkdzqYXv9ArJJwws3SxxWnzskcNwcexcYCKhRmMWUO3D1lJ1/pTeQtpw+mvJFwyj+I+IVZY2FuCfxwd3Tck5uwGmFpUZJOvESfTSeCOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418318; c=relaxed/simple;
	bh=B5tr4c+A3t7MW44YTpL9XRKWVl0YJlXuVZFNo1w/JCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nMObgE25NjIrmIm3so4zdOjRIR9xAo2iVGL5+6ZqAyqwshTudwYAVaNhSKBTWE2WOlZOfEh14fTpumGIqE3eBiC0mFpSG3agM1u1/+HGHH/sSAxvDR+h7twBKQQ8Url4fIJLtPjiP4agjy514DRy5z1C0GyXd6ibjWRtKy81EfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4WWlGfg; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4WWlGfg"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37d275cb96cso38617741fa.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766418315; x=1767023115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5tr4c+A3t7MW44YTpL9XRKWVl0YJlXuVZFNo1w/JCg=;
        b=l4WWlGfg422+3/u+HdsPsLDjjc1f/qzXdLTPQS2wdqf4F8dN6MR0I3RJD1BAjUWz9N
         jcUnr7MGhhmBu40Rixw4z/zmXHLA+JA8/B1n6tKx+w+1HaRJt0mgrS+GjHBzTmtYr51j
         DfKrxWb4rj2fA8O3P0f+vCdhK0ZQp7/cv+DI4v4+z+BHy8nfbEgo6OSe4Ks7Egj914iT
         T1Z0dGIjv66+jsYEsVesWpJYddXTdLAPYyyRTAUHo73BQagv//jZotMF0UA4/KY3hTVv
         B3O5/ngR4rgKlbdSXSHB2J9RpyZSxG7JolXCKrA3utDtaHOvF+OoxGc78SsKhXSe8Wuq
         Ying==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418315; x=1767023115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5tr4c+A3t7MW44YTpL9XRKWVl0YJlXuVZFNo1w/JCg=;
        b=iiQD0hn2uYFSs6Co5G3hhMzmknhZtINHULpijkQmkj55czfDF2/WojVZmEwjhjzWCZ
         Ze48dTF1FUf+d0Zyfnp09u5hrPSRGgiTI2JNdmGjS1Fc65B4mo/HJZL8hfz31l75j8lT
         dw67z0UnR8z1NAWOlhzaww42MjLvm6YoAiDu2VsPyMGXzn4BLf3maHFjyWkwClrjCFcB
         NnucYFRJxYaTra0WRRn708ErX+nsqaPhvdXaplCCMBGuPYXwrd7xqU//X6VWQutLfU0v
         YhiuomOy9iG0uTuehh3oPSQY1+o4p7y/i6Hlb7lkOju4KbwI6da1r+eu7AB0qzKwI7QG
         9NgA==
X-Forwarded-Encrypted: i=1; AJvYcCXRPkRV1P13BCyDUDwxLBa797/lqrzTTAy6BOt54t+IBrkkfzSPE92pXYXCWXOPKy8hHYt+eBHg1nOhtl/J@lists.linux.dev
X-Gm-Message-State: AOJu0YzdE6jUXDxN18RD12w3BswwP9MvctnKKMfFYIIxp76i2CjFbgbj
	Vf+11OtaAHfEvoaVIqjfnkRb4fEcVeuPHurJRzin1ibm+Jncsyt3XWo6
X-Gm-Gg: AY/fxX47gKOfutuirPHz+mvuEGiUTrCQat0Piqa3DLm1jvycPU95PyfxSXGDZuTePcM
	aU4gJ3eg7Ag+qvSg579Chx0rr8VbA7NyRja4XomNWnyhg8uGFHjXSSS269/LVejN/oLQj75EV2J
	KTXs/FjpnjR4Y19TfLpANaaVSZqGHLUR/U64gWd9uXAtYkamhVV3WPG39UO2wgb0DsX08QzhB9w
	n8or9ukKa3wY5dYQuzqT9KCFBkm2IZZhh3ExCJzF7TyHHHzihEbafmTysEp9yyVQ99ZYrJRW4Ak
	GHpKCKg2EWAx9O9tlBPzaWy5GlIvEpEn0smlfNuMv1AVmGGedS7FZR17Pv0X/Dresm5I9xmxIxr
	4ZwJbxdPD0Kerxod5YoLHtQH/893ky+L5dJDiCXz1NJma99uN/T7+nxdspEzJpnrlVL9rmR2R3M
	YK/qepCZnm1BRRc3xAdes=
X-Google-Smtp-Source: AGHT+IHz/r1NcBgyLxzJRzke/s8B1R/YbOuFqJsT9HcEX0jf4C84uhz25xVn0SBQljw81BhkKsTNhA==
X-Received: by 2002:a05:651c:325b:b0:37f:c5ca:a10b with SMTP id 38308e7fff4ca-38121553178mr35264171fa.4.1766418314576;
        Mon, 22 Dec 2025 07:45:14 -0800 (PST)
Received: from localhost ([212.74.230.163])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-3812267964fsm27500491fa.42.2025.12.22.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:45:14 -0800 (PST)
From: Roman Shlyakhov <roman.shlyakhov.rs@gmail.com>
To: roman.shlyakhov.rs@gmail.com
Cc: helgaas@kernel.org,
	linux-pci@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] pci: pci-stub fix kernel-doc warnings
Date: Mon, 22 Dec 2025 18:44:20 +0300
Message-ID: <20251222154424.117668-1-roman.shlyakhov.rs@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251222132854.112890-1-roman.shlyakhov.rs@gmail.com>
References: <20251222132854.112890-1-roman.shlyakhov.rs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sorry for the misdirected patch.

This kernel-doc fix was intended as part of the v2/v3 series for the
BUSID binding feature, but was accidentally sent as a standalone patch
outside the main thread.

Please disregard this patch — all kernel-doc and build fixes are included
in v3, which has been sent as a reply to the original submission:
https://lore.kernel.org/r/20251219131038.21052-1-roman.shlyakhov.rs@gmail.com

Best regards,
Roman Shlyakhov
