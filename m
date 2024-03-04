Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B98E10A2E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709535256; cv=none; b=iyXX+l7SEnmh8Hm1JtxLuoCi/RH+VLyYwPKV5CALGsce38UiEOqQrKwjRcpzj5N6O12otZnzjh4qR8WJhb3F2ZOFlq5UDde+cKs6J6vopVK5KTBUkM5xYTQ3VoZV9gJpExsb+1ZtO7uPj7u4UlxV3JIJYgf8yd/G5tCkSA/c30s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709535256; c=relaxed/simple;
	bh=qwDzqEF8GG32Owpd8pywxD5f8JJ2TAEnywKhR1/cXOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9OswZeEPZy/8mRismG+Glema4R1EHfF3Npyt2TStNeDRiLaV2mCKmC81dTcNTBwXzmH3HGKjdnxumeVtNL8P15DhdBosnlMbAejtSRoyTS/kR1zvH3Y9kty4hxcIUvzAvCkZPxKZH0SQJpH0JKGyyzJGjpby4WqS6k65Hmecpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qYtoXmG4; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qYtoXmG4"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2998950e951so2183132a91.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Mar 2024 22:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709535254; x=1710140054; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D8N5jw5DNhX96aWHAoC7hlIkB5rQeSq/PiKBnWFq/Kc=;
        b=qYtoXmG4j356uK4MXFVsBZBhheWbt83RsA73jpVeC2DcAn8p9ESQAmK3b+CQfw8jBb
         ICNnpDkO193SEWIjG6vGvhzBe5ile2YXQrBY44hY9f0i5DlfbA6n6f2+ZazkItbOUMVj
         pdC9XcCEroJFr5FEPXVRA8k1hlhoxNz/6sUNkpA0L+zGW6O7pJ8wQrKBxxgz0UJmg5zS
         3Ey8DPU2PgrQjMiIL+Nue6ewCivv3hhIB4MESGwSHpDFYOpamGlJaB5Us88GqyTPeTh8
         o7d2bB9bOgG6stH5F2c73IOo2CVMP4j+wJe/CGSOCIBR1G4zzJhhduTi4NVBLNwTXCVr
         f97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709535254; x=1710140054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8N5jw5DNhX96aWHAoC7hlIkB5rQeSq/PiKBnWFq/Kc=;
        b=ZxJPHHoztlPJolYo3kL2o1VRl4ZVPG7MquSTM5Z0IEFi4xAUxSS1WYOeZ+dT3qlJx7
         nZ4iBjtJckitlCx0J9Fhef3BVXDdXdfax1JEoj0AD5Y4Xn8wete/w2A6aTTcsPIpPEin
         dmjzcD3DAeddHElimLglUPzUxsh/c2c57o3XfhBVkgyESiQxS3Mk6KJ5KsjsxjROCijd
         GEyWH9ZSb5wjF3cTYMvHRBynm8DBpB/nPzlOSSD4v8R3OdTT7xyYzlBBRDTamC17pltr
         EOH8jcz/iQzJ/48X7hnbtdlUehzoCqt2ZxdpcyPoFbDzredQmxj7QviZPsflqK2bm4Vc
         ifTA==
X-Forwarded-Encrypted: i=1; AJvYcCVqfm+Xrim4OIgbTQdlReBCi/46DgSOJUaQlF74F8pViZNcg2PUTS2ITpJkd+F8voZ/qYEc7UuOTz5//doj27azSB1/18+jonHn4L86cg==
X-Gm-Message-State: AOJu0YzpDVWjPGrIO+ym5BOPoh/LlTA04d3p80D3rXxGAhVcfcUI91Dt
	/FFCJKX9+k+DK8WQOYqSo1KoGgv17W/v7Ui/FZBHGNt1vhmJYywrmSz61jA5MEA=
X-Google-Smtp-Source: AGHT+IHz5qhAqvj0ld03y+Oe0fC9BOHVqZ8VG5Zk/vWgrlA+0AnapYB2A9wkUbEc3qSB4xAkQ6x+SQ==
X-Received: by 2002:a17:90a:a88b:b0:29b:33eb:1070 with SMTP id h11-20020a17090aa88b00b0029b33eb1070mr2853462pjq.14.1709535253867;
        Sun, 03 Mar 2024 22:54:13 -0800 (PST)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id y33-20020a17090a53a400b0029ab5abcbe1sm10102638pjh.20.2024.03.03.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:54:13 -0800 (PST)
Date: Mon, 4 Mar 2024 12:24:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: drivers/opp/debugfs.c:48:54: warning: '%d' directive output may
 be truncated writing between 1 and 11 bytes into a region of size 8
Message-ID: <20240304065411.w34vbaeg2rlq6z5k@vireshk-i7>
References: <202402141313.81ltVF5g-lkp@intel.com>
 <20240214055836.c5i3zmkhdllldwon@vireshk-i7>
 <b41c6cdb78c96d5f4a909fc13c253ef0d8576c86.camel@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b41c6cdb78c96d5f4a909fc13c253ef0d8576c86.camel@intel.com>

On 21-02-24, 06:01, Liu, Yujie wrote:
> Hi Viresh,
> 
> On Wed, 2024-02-14 at 11:28 +0530, Viresh Kumar wrote:
> > On 14-02-24, 13:43, kernel test robot wrote:
> > > Hi Viresh,
> > > 
> > > FYI, the error/warning still remains.
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   7e90b5c295ec1e47c8ad865429f046970c549a66
> > > commit: 46f48aca2e5aef3f430e95d1a5fb68227ec8ec85 OPP: Fix missing debugfs supply directory for OPPs
> > > date:   5 years ago
> > > config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20240214/202402141313.81ltVF5g-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141313.81ltVF5g-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202402141313.81ltVF5g-lkp@intel.com/
> > 
> > I have informed this earlier too, this report is incorrect and applies
> > to a very old commit.
> 
> Really sorry for not responding timely to the questions in the
> following reports:
> 
> [1] https://lore.kernel.org/all/202311061847.BOtfUmbQ-lkp@intel.com/
> [2] https://lore.kernel.org/all/202312170608.s9xI4TQb-lkp@intel.com/
> 
> We see that this still happens on the latest mainline rc regardless of
> x86_64 or arm64 arch. Please note that this is a "W=1" warning. In our
> tests, it can be reproduced with gcc-12 and gcc-13, but not with other
> versions of gcc.

Okay, I have a different version of gcc. Can you see if this change fixes it or
not ?

diff --git a/drivers/opp/debugfs.c b/drivers/opp/debugfs.c
index ec030b19164a..986c08e18d05 100644
--- a/drivers/opp/debugfs.c
+++ b/drivers/opp/debugfs.c
@@ -100,7 +100,7 @@ static void opp_debug_create_supplies(struct dev_pm_opp *opp,
        int i;

        for (i = 0; i < opp_table->regulator_count; i++) {
-               char name[15];
+               char name[19];

                snprintf(name, sizeof(name), "supply-%d", i);

-- 
viresh
