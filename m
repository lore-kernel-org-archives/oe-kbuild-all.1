Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC12E37157
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709551267; cv=none; b=mNC7xP8IdW+IFMPKNkFws3tqtyOoxFxQZ8AS9MwOfFcWrVPOffArm2z1JH+JesdF3taQYOkJXVjuBl9Oy4l6qXKxc3gaWek94YXLFIjS0uGk0bRn2v4g1h9CS7/viU07q9PSvJN/XN+SPWvTV0gFNo62optqAQv8j/PSsMG1mjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709551267; c=relaxed/simple;
	bh=89CAsVYAN2zXiJyL10MU+anH7boWcF5E6pDAta4i614=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWd33hny76W8mFkTPvWgfJKJ77DdGHw4iS/NFGiKwWkB7O3w5VRBgvOzrGuPiXWFs2lVl7cTyVmNshsspkMQc93smWJDzjvvqNx5L125BK1CTgT8yn7KywOAT871Dvo3EWQhwTjiRQAv7x7y/WUXqJ9Tllpf6P9UKMqwveiT6XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsoWcjIc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsoWcjIc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e617b39877so701324b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Mar 2024 03:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709551265; x=1710156065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=POpV966jVtwtLNbOuhb8nczXwEjbEx88TFd8lhRobks=;
        b=ZsoWcjIctlAAkB3H0tm6VEzqGmsWT7V1QHiqhEG20MK0bC6m/KZs1q/DyguSYFpMTF
         I9bAvXwLAHM1MFfhRqLyFhFPOeHwahPhtMK9ZPCjPH+JvrpHGEn3r++IkCnGjwfvmARx
         b6KRytok0kX9U1JNK2h3BWEI+XcNS2yUOOaswMFluJjtQb0eO6mvxpNFAfsjkqThTBoG
         Zn0e96q9ni66qfmhhp7b+ZVMntM7nPaENnaX0bSV5wBowr5tmqds+Nz+k88sCPyYbb6g
         06yrI+BkIaVxF6Ot7X2PF6Wkj97deTGe9cg7VvSPQNxjJqWafk2gsz9dLic7nnE2TPRK
         fuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709551265; x=1710156065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POpV966jVtwtLNbOuhb8nczXwEjbEx88TFd8lhRobks=;
        b=bGKK/2bSwIIP16phSh/OGla0lj2Q8mT2QVTp4poEkdR0CYRy9b6Oxjv4H4iq8DTM37
         WO6eZ5Ek/9wvSF3LLog5uxqB+hnusXJPBh8GYHr/ySe17DWOH4YdFR9tgwohMVSONFV6
         19uCEWWJZWTbRX3CqyZyMyULaFBUD+J8AKgLlTqpFWQJKycSXayG6CB22U05yLN80CfF
         /TeD/FYx4OwFbIWfrRnD1SY8QJnM+tBQCxRSTKlpJ86Lmj/I2mUuGe+0EiItCQgWHSvk
         3aRxniRVSIGQ16MILi8qQvdXCv6xP3RfYJjvxxsx24Re/G/6kROotRp56m+PZ7dtCwZI
         jncg==
X-Forwarded-Encrypted: i=1; AJvYcCV25igHAucUvQQhUwXxWoMqjxW2vZ8HscWwIIE9NvO1vsNK9rhjjmuJXw/LPO7JwXkgIfFmQtrpiGPlgo1h4WfsdJkcwcMzu1AP/hhxAQ==
X-Gm-Message-State: AOJu0YzLdfKMhUvo89RbCxtyIJ8SZXoWyWai0OsnH/9PIUZk66wxnyuX
	fH4rD7+0Qz8R7oS8YYJb5c2zNdBpeANcwJ0jjxdfm8Qxs2e/yAOEZDGyT/gOLzWP6PSZxOUPue2
	S
X-Google-Smtp-Source: AGHT+IHp9l8/9h1aPTyTCNgQKavrjxYrCX8+UQn+y6+tAOz+DZB+e6L22yyM+IfyPJ5hIGmpQczRCw==
X-Received: by 2002:a05:6a20:8403:b0:1a0:ebbd:9ae7 with SMTP id c3-20020a056a20840300b001a0ebbd9ae7mr6237970pzd.4.1709551265178;
        Mon, 04 Mar 2024 03:21:05 -0800 (PST)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78393000000b006e6233563cesm1469110pfm.218.2024.03.04.03.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:21:04 -0800 (PST)
Date: Mon, 4 Mar 2024 16:51:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yujie Liu <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: drivers/opp/debugfs.c:48:54: warning: '%d' directive output may
 be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <20240304112102.wih3u5ny3iero47n@vireshk-i7>
References: <202402141313.81ltVF5g-lkp@intel.com>
 <20240214055836.c5i3zmkhdllldwon@vireshk-i7>
 <b41c6cdb78c96d5f4a909fc13c253ef0d8576c86.camel@intel.com>
 <20240304065411.w34vbaeg2rlq6z5k@vireshk-i7>
 <ZeWGpyXXZBeYjnGW@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeWGpyXXZBeYjnGW@yujie-X299>

On 04-03-24, 16:30, Yujie Liu wrote:
> This fixes the warning for "supply-%d". Seems there are other remaining
> warnings as shown below. Would you like to take a look as well?

How about this instead to fix all warnings (drop the earlier change
please) ?

diff --git a/drivers/opp/debugfs.c b/drivers/opp/debugfs.c
index ec030b19164a..a9ebfdf0b6a1 100644
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
+       char name[] = "icc-path-XXXXXXXXXX"; /* Integers can take 10 chars max */
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
+       char name[] = "rate_hz_XXXXXXXXXX"; /* Integers can take 10 chars max */
        int i;

        if (opp_table->clk_count == 1) {
@@ -100,7 +102,7 @@ static void opp_debug_create_supplies(struct dev_pm_opp *opp,
        int i;

        for (i = 0; i < opp_table->regulator_count; i++) {
-               char name[15];
+               char name[] = "supply-XXXXXXXXXX"; /* Integers can take 10 chars max */

                snprintf(name, sizeof(name), "supply-%d", i);

-- 
viresh
