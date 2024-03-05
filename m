Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C067D3EA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709619051; cv=none; b=JlXr3YM2S0s7Ghan3SEbFzKDkv9dP+ZxBA0QbYiS7j49iqAls2269b3yGUgLc/64OJQTVeIcyWCvit/rKbsOx5mAvFA9kgi8P8LI00IvDP/ZFadPhuptaXZK2SbLbY5wM0mkndOPI+5yrJzBhPeg6LdCZ1LkSzt+0C0veaDAw0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709619051; c=relaxed/simple;
	bh=BBLYX/G8lqaAk/priQk9gxGhKUohJC7mD/AOHoUoAnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO5E2AffbNogKvm9W9ZR75FjmTTC3v9v2ctqdWtO7KjsN16/H+koMhhZ/JjhGeCE5ZTQv2z8YIvBMWaidEIewAILfG/pifO/bOfVX4nve68+jbCVIBthUPDtSrA7ww98+tmHo1VBlHy7ZyKo9nPm+7G3D4BPsdsHpd2SH+fV7T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p8agbEFr; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p8agbEFr"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6de3141f041so3509315b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Mar 2024 22:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709619049; x=1710223849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x3HhLSFBCasDaTwrh/hGPbsEPaL6bXvDmjdyuw021d0=;
        b=p8agbEFrbWoFUp6hpxp5/VkGisbenEVcMZCG5gO4Cuz1I67O9UZbyN7i9xjpKxx6xg
         rR1blD15bqko+NYxqPD8/E4FFreUQbkzMNKx0T0GkZFAgreSXMaEfssSmka2YvGSLZzW
         EtmPA+4rzF6kCaPFqnBmimkETp8SsXOpVZZFDu6e/1GbU2X/qlh2550SwWtEl4kXvUq1
         8zfiQ7L5gECiju+0duHMVb2q7V0WVVOvEvenbxX1t9a+mSijYaeQyHial7w3meLuD8WC
         /q+yPlakTt89QauNmrhjP4Fa7ME10G51x/oHmUHDjml2L1Fnp6hCTCV3FnNgfj2KEOBA
         mnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709619049; x=1710223849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3HhLSFBCasDaTwrh/hGPbsEPaL6bXvDmjdyuw021d0=;
        b=r5hPO3J26ThiPDQHpbh7GLvkt0weXtXQc91ozS5kK7j3LujY0SpQyspP42JHxn3+33
         uCNyspVe2+PXW55jz94Wl/POyqFwvVQfsMvjwW7EnsuadpadnWsEeiFmdWe/izQeL8XS
         KNhsQxzUTyda9BW7/12Mi2gOf2GykGJRUh0Mw8mgI99YCFpuLRfwNq56Y0c+CTfjHwsh
         LOg3XyPdjD/RHTHUcSRo/J6X0j4MPL/VooDTROkBuAq6FLNb7gwQHr0hbeeCLUSVFf7i
         UMZZbHY/jNLtDNzk7drZNqvO/tn0ooWXhKRfETJZ2jdD1KYmYhXJa8KTWyHVIFCTDxYx
         Lm+A==
X-Forwarded-Encrypted: i=1; AJvYcCV5ek2Va35KKkUfrlOLJhQgmRyeGVY3eWHJAur3B7aoDVJ2wBmoWIomVT/wmrtqYyNHe/t8tlYOgJm05425b2rfVkGFioQnNUZZ0OpPpw==
X-Gm-Message-State: AOJu0Yz6W3vmhqjXzJmsxqGTSCtBdgZij+QpXOsCQGVawu1E++rUpjuQ
	rtEYrlNKs28JvsFkXn/WnhPnmSzndaP/Bn0W+ZwnYtemSol1aofYyxV2rUxZRWr0gihz3PLqjdC
	V
X-Google-Smtp-Source: AGHT+IE6oACOgvAWYNuxhmlkNaKYedbrwaiFIX2CCcZYvwxDXlhWxrJlxe9bZN5BEMGgBQktJ2+tUw==
X-Received: by 2002:a05:6a20:748d:b0:1a1:4ca8:15dd with SMTP id p13-20020a056a20748d00b001a14ca815ddmr945594pzd.28.1709619048735;
        Mon, 04 Mar 2024 22:10:48 -0800 (PST)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id k16-20020aa788d0000000b006e5129b41aasm8183481pff.71.2024.03.04.22.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 22:10:48 -0800 (PST)
Date: Tue, 5 Mar 2024 11:40:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yujie Liu <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: drivers/opp/debugfs.c:48:54: warning: '%d' directive output may
 be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <20240305061046.x2hdu5qy32ext4t7@vireshk-i7>
References: <202402141313.81ltVF5g-lkp@intel.com>
 <20240214055836.c5i3zmkhdllldwon@vireshk-i7>
 <b41c6cdb78c96d5f4a909fc13c253ef0d8576c86.camel@intel.com>
 <20240304065411.w34vbaeg2rlq6z5k@vireshk-i7>
 <ZeWGpyXXZBeYjnGW@yujie-X299>
 <20240304112102.wih3u5ny3iero47n@vireshk-i7>
 <ZeavsDQNBA/txKyb@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeavsDQNBA/txKyb@yujie-X299>

On 05-03-24, 13:37, Yujie Liu wrote:
> An integer has positive and negative limits, and the range is from
> -2147483648 to 2147483647 in decimal, so it seems that an integer can
> have 11 digits at most.

Ah, thanks. Fixed and pushed for linux-next. Diff:

diff --git a/drivers/opp/debugfs.c b/drivers/opp/debugfs.c
index ec030b19164a..105de7c3274a 100644
--- a/drivers/opp/debugfs.c
+++ b/drivers/opp/debugfs.c
@@ -37,10 +37,12 @@ static ssize_t bw_name_read(struct file *fp, char __user *userbuf,
                            size_t count, loff_t *ppos)
 {
        struct icc_path *path = fp->private_data;
+       const char *name = icc_get_name(path);
        char buf[64];
-       int i;
+       int i = 0;
 
-       i = scnprintf(buf, sizeof(buf), "%.62s\n", icc_get_name(path));
+       if (name)
+               i = scnprintf(buf, sizeof(buf), "%.62s\n", name);
 
        return simple_read_from_buffer(userbuf, count, ppos, buf, i);
 }
@@ -56,11 +58,11 @@ static void opp_debug_create_bw(struct dev_pm_opp *opp,
                                struct dentry *pdentry)
 {
        struct dentry *d;
-       char name[20];
+       char name[] = "icc-path-XXXXXXXXXXX"; /* Integers can take 11 chars max */
        int i;
 
        for (i = 0; i < opp_table->path_count; i++) {
-               snprintf(name, sizeof(name), "icc-path-%.1d", i);
+               snprintf(name, sizeof(name), "icc-path-%d", i);
 
                /* Create per-path directory */
                d = debugfs_create_dir(name, pdentry);
@@ -78,7 +80,7 @@ static void opp_debug_create_clks(struct dev_pm_opp *opp,
                                  struct opp_table *opp_table,
                                  struct dentry *pdentry)
 {
-       char name[12];
+       char name[] = "rate_hz_XXXXXXXXXXX"; /* Integers can take 11 chars max */
        int i;
 
        if (opp_table->clk_count == 1) {
@@ -100,7 +102,7 @@ static void opp_debug_create_supplies(struct dev_pm_opp *opp,
        int i;
 
        for (i = 0; i < opp_table->regulator_count; i++) {
-               char name[15];
+               char name[] = "supply-XXXXXXXXXXX"; /* Integers can take 11 chars max */
 
                snprintf(name, sizeof(name), "supply-%d", i);


-- 
viresh
