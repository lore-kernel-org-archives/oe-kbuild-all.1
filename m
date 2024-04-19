Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070BAD51
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713524194; cv=none; b=qkKcw7votMLJE/L1gYcvSqF/mnyjCrn4uXJdF/XXZzQoNDmb59PrjY3+jZ4zv/PYOa4nnCBGh3WJGb+27NBoGNYVxwAHwmP8WP4bcvaRi6ykrPh4kPEzMGGIuxlQiz1E1ZrEEAgOi/oksWywz7VuIwbYUTH+1+BgffmiUMQs/8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713524194; c=relaxed/simple;
	bh=k1R4HhbjrnBE8URwPJrQEH6QmypJNAXLsiV1eNfh2YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJMQzFsdVEVPE1ngNGjfCtUk+7BQIwmRs7uzLdniLioPqOi73UUNm1xDrQVITyDlDfj7q9GTn4tpQZoUgYM1/zPEgXCy8APJ6OjkG3lnmHsqjuY6Mh6yS/Eo948bth9cdeDdLfht09kxbwHuYpicKYSSE13yJG1nit77vtQPGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRUIEXVb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRUIEXVb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e2b137d666so15788355ad.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713524192; x=1714128992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hvo6+G81nw9ZEN9Z1TxfkTOmPJXyU6L0c8InKxZr7m0=;
        b=cRUIEXVbwFjB/PRIOSVZZQodxgoAMMwySS9Xj5+eCIYoihnCzS5tU1YqpfazKftKJ6
         X9dLcoQ8/Y7hq4iD3Qy5hnITkktpr6cXZtelZd8SCssmSeFvv65xcmv55cEiL8Um7jPU
         hHghWuq5Bc/2rDK605lgRpZKeSjz1ePPlA+KetTpo561I0AIoldHdGXF0wOdcqePgSJG
         lxlPH+/kveGGGxpOWAOxqlNX4K1FPxyEIOORToxM97VGhDA5NEOj2jNVpIGZ2+kN8bI5
         cYUzTsq/t2mKgNCU0deYrATzqf7cPE5vUJWLbtotb/MKz9OtBFyMdX8QHNF5hVis+LGi
         pyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524192; x=1714128992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvo6+G81nw9ZEN9Z1TxfkTOmPJXyU6L0c8InKxZr7m0=;
        b=f0V2rjgt9hmyz1NvNcK8UBGSerAr46bMq/u1C4lk0vbqnIyp5p1bPZ0vssMi/k6Rl/
         S4e21lG9S/XNIZXgscnkhjT/pFQ9jilozgJBXcbb9tudyJ3SFXiC50nsCRon20FQ2jh1
         NNaHOwaG9HxqcuSGabC2ZRKzIAtTHWd18FeBgyDl0MaYZsinek+fGefPJZjgvzMP7GPb
         raHnIxvEL2pRF9eA5hS9JC5zCJgW/LtzkmMTzQpoCUS1CGpXQXs53ESoYA8wIt15AXFA
         bto2I7OQHXudWCVBvxIZupgleLG+rftaImmR66DRDOYmRvsjKZUZRDfM9iw0rtqYMeF+
         ZI/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiTlLFMUOkWyiBf5at2GaW2bAT1Fkwr6RkqIye9GifGaMyDpV950RDNplSpCusDgf6xYktVLNkUCD9QV9rbCm+pBTXAE5mGW8Ok2HvHw==
X-Gm-Message-State: AOJu0Yz/2PqNlDoxEKngencGGnA4KdN+nLIKk6mGhVV4TvWVPmEYRXMY
	RU0B3Zhh83fnyk0bgpipcXmjrX1chY1eD0Oh5EgOT06cpvoT7bevyn9x08LWnM0=
X-Google-Smtp-Source: AGHT+IHKr7df38jv5RL2re5Z8lDP2PVXeZil9FeT31rgUpuoUId8sCKBVf+pl+pd/Tt5Tkn/n+5W/A==
X-Received: by 2002:a17:902:650c:b0:1e4:6519:816d with SMTP id b12-20020a170902650c00b001e46519816dmr1502880plk.48.1713524191976;
        Fri, 19 Apr 2024 03:56:31 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id j12-20020a17090276cc00b001e41f1dda43sm3059136plt.75.2024.04.19.03.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 03:56:31 -0700 (PDT)
Date: Fri, 19 Apr 2024 16:26:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: kernel test robot <lkp@intel.com>,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 6/10]
 drivers/cpufreq/sun50i-cpufreq-nvmem.c:128:44: warning: '%d' directive
 output may be truncated writing between 1 and 10 bytes into a region of size
 2
Message-ID: <20240419105628.faaqz2p4qdlfxyre@vireshk-i7>
References: <202404191715.LDwMm2gP-lkp@intel.com>
 <20240419111345.028ad7ec@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419111345.028ad7ec@donnerap.manchester.arm.com>

On 19-04-24, 11:13, Andre Przywara wrote:
> So I see the problem: "speed" must fit into one decimal digit. At the
> moment it's fine, because "speed" is returned by one of the *_efuse_xlate
> functions. For the H6, the output is masked by 0x7, so can never be larger
> than that. For the H616, the return value is a constant selected in a
> switch/case, which is at most "4" at the moment, so it's safe as well.
> 
> So is there some established way to communicate this, to appease gcc here?
> Would explicitly checking for the range and bailing out solve this? Or is
> the some kind of assert to make gcc happy?
> Or do we just increase MAX_NAME_LEN?

I fixed it like this in the OPP core earlier:

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 30e5c337611c..cd50cea16a87 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -19,8 +19,6 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>

-#define MAX_NAME_LEN   7
-
 #define NVMEM_MASK     0x7
 #define NVMEM_SHIFT    5

@@ -208,7 +206,7 @@ static int sun50i_cpufreq_get_efuse(void)
 static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
 {
        int *opp_tokens;
-       char name[MAX_NAME_LEN];
+       char name[] = "speedXXXXXXXXXXX"; /* Integers can take 11 chars max */
        unsigned int cpu, supported_hw;
        struct dev_pm_opp_config config = {};
        int speed;
@@ -235,7 +233,7 @@ static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
                config.supported_hw_count = 1;
        }

-       snprintf(name, MAX_NAME_LEN, "speed%d", speed);
+       snprintf(name, sizeof(name), "speed%d", speed);
        config.prop_name = name;

        for_each_possible_cpu(cpu) {

-- 
viresh
