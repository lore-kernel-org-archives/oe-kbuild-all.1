Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902D1E573A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731062014; cv=none; b=Ol4YjMfEigICUC/hLC9gjCW4bReQ/RWJ44HMUbnC5sTK9lNIYfjcg4S0OpeQkjRC3YTjAaIDmMIPfcf90fUJjiEs1Wdvfd+2By6oJBtGaSih3YVHRXlX+heXqd9k4KBC4WgHFU7qxvH2dj5UaNpAzEVz7OsSw8E/Ch5sdf6MubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731062014; c=relaxed/simple;
	bh=KxMStCD8O5sR+ziGmKPiHtWoXQum/CRCg9cCdsNOX2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tedJlWpysOChD99dN1zkGDdbl9tQcUpgE4Yepg+pryBvOdPirup9v8rkpBomHCAI4IPbI64MsfCELw/ai52U7Jl1Ynuu2dvaRYr+Fra1iEXEcKY4F3ZkEUMOi8MApQXBL+rEqVTwxI1JJt0g01ErKMaxFblF/+iKBv9sbZOLP8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJgcKofs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJgcKofs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso2344037a12.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Nov 2024 02:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731062011; x=1731666811; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=say4a8HZSCpRMrLiH7BqEglV9Ia5G13yVfGZKq/ufis=;
        b=kJgcKofsAZ1xiDeRkq2cpO3kWK98PuBUZ02Hk4A3LOJJuKc74lvp55kwWKV40iGbNo
         2hKjaQ9wA8IpgrXkllQZ79cfFrtbqopAvo9bFm6LtZ7BYOcn7YT2Kt4f9lGNdIkeNmov
         aRsxrjQa5qFc0lmYk9ufFWs04jojIB5miir9r/hAty1sTNgFgNgMFlCXX6JN5EI2MkzX
         cxJyGHSSJVxwxVgvdUspfpHyI9UVdu3vnLaLtVDeoVGqomlRjGhGwQeCfCByABEVACFz
         A4hpguKdsi29IKzirlgq6lOuQD32dkxRzrpxvGB3LpqIvuRFJx5GJQJ1z08Q54QqYhzy
         ZiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731062011; x=1731666811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=say4a8HZSCpRMrLiH7BqEglV9Ia5G13yVfGZKq/ufis=;
        b=Rd80qtI9AxlXswmSTN3oYaAfERLD1dXhPl56RV0YKEL1de2Cmnb0wtPtgVw3AHnk7T
         Gqi1gy0Lss6EcitQ8daboETjA6hN9ls5nccZFSWB2yfHt6FysTJoW8VWMVoahGEMK8n+
         vm8Qxb7C8Nuvy1N39rUIuFUp/BC4+/5424Kx0tBhlWVylc+27Yc34UVpCEURq0MH/t7R
         f9dno9GbDU/3JmAMM1SVJDZyAvCC7t3R6MaWLEpG6GPApGZi3odXMhoe6YqmxgnWpcwI
         6l7kBi7JnDeBKRicF5030suZEIEekw+FrCYlelWGfnq2mdQJ+/HHzVLGh47rhX0umG6q
         cd2w==
X-Gm-Message-State: AOJu0YzDDbvuHYIIjPHFtu/IYIq0G4h72VpZLUfDKSQv7bPJEvs5m559
	V5bZy9rh5v4ARZZDvh6eFRgvbFL4FkGBNRNj5B8mZoY9HNlvf5xz
X-Google-Smtp-Source: AGHT+IH6SbnJDhnOo+P4X7t5LTjB6WoMVghmVCUWwRJfZp0LeUW2NZpfgNYdyUiXXfnc7FGQqqThMQ==
X-Received: by 2002:a05:6402:268e:b0:5c9:76b6:d14e with SMTP id 4fb4d7f45d1cf-5cf0a31f545mr1881877a12.16.1731062010505;
        Fri, 08 Nov 2024 02:33:30 -0800 (PST)
Received: from [10.10.40.97] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03b7f2b8sm1823499a12.32.2024.11.08.02.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 02:33:28 -0800 (PST)
Message-ID: <17464711-bdc2-46c9-a216-93851112abbb@gmail.com>
Date: Fri, 8 Nov 2024 11:33:27 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: light: veml6030: add support for triggered buffer
To: kernel test robot <lkp@intel.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241107-veml6030_triggered_buffer-v1-1-4810ab86cc56@gmail.com>
 <202411081703.Ft0YjqcK-lkp@intel.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202411081703.Ft0YjqcK-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2024 10:41, kernel test robot wrote:
> Hi Javier,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on c9f8285ec18c08fae0de08835eb8e5953339e664]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/iio-light-veml6030-add-support-for-triggered-buffer/20241108-042332
> base:   c9f8285ec18c08fae0de08835eb8e5953339e664
> patch link:    https://lore.kernel.org/r/20241107-veml6030_triggered_buffer-v1-1-4810ab86cc56%40gmail.com
> patch subject: [PATCH] iio: light: veml6030: add support for triggered buffer
> config: i386-randconfig-062-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081703.Ft0YjqcK-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081703.Ft0YjqcK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411081703.Ft0YjqcK-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/iio/light/veml6030.c:958:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int [addressable] reg @@
>    drivers/iio/light/veml6030.c:958:39: sparse:     expected restricted __le16
>    drivers/iio/light/veml6030.c:958:39: sparse:     got int [addressable] reg
> 
> vim +958 drivers/iio/light/veml6030.c
> 
>    944	
>    945	static irqreturn_t veml6030_trigger_handler(int irq, void *p)
>    946	{
>    947		struct iio_poll_func *pf = p;
>    948		struct iio_dev *iio = pf->indio_dev;
>    949		struct veml6030_data *data = iio_priv(iio);
>    950		int i, ret, reg;
>    951		int j = 0;
>    952	
>    953		iio_for_each_active_channel(iio, i) {
>    954			ret = regmap_read(data->regmap, VEML6030_REG_DATA(i), &reg);
>    955			if (ret)
>    956				goto done;
>    957	
>  > 958			data->scan.chans[j++] = reg;

chans is currently declared as __le16 chans[2], but it should be u16
chans[2], as regmap already handles the endianness.

Then the direct assignment does not raise any warnings. When at it, I
will define reg as unsigned int.

>    959		}
>    960	
>    961		iio_push_to_buffers_with_timestamp(iio, &data->scan, pf->timestamp);
>    962	
>    963	done:
>    964		iio_trigger_notify_done(iio->trig);
>    965	
>    966		return IRQ_HANDLED;
>    967	}
>    968	
> 

Best regards,
Javier Carrasco
