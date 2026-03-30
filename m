Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B63B3BFA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863041; cv=none; b=AMdEAzA4qDrjE6DyhP4KHq1F1w+uLF8kgon7wRMrbJWbgO1tVgswsXKOkqTuwIregFLiglg8b+VwqQcabi2FI2QpHnMBeCaF8+azCBGG+vaMi6oC1ErXv6SspC4M9tLA8n5ZIGy30iKll7CI7d9Sj/ewx+HD5oaM6GMpYOAWlkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863041; c=relaxed/simple;
	bh=dDXdYT1zf8jcRW3Lh7wW3hi8RufyCiCX8TZ7JkbPYLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6SHdT5U4USRr2fEzQnc2I1RixzkH5FLReAvfAgXRtjszfEVK5TujiTfgwDSospu0aiYOeqndJjVqn81oGQad2+R7fvjjInUWRL4sVHqbm9yMo3igHDWLg1KiwCu1pBbude42db157kczuYvZsewxEqU7QAyGedZlQX5XC/BDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuAKmw5Y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuAKmw5Y"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fe655187so55135615e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863038; x=1775467838; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+az+AaDlx97xMl9c5AxMiWqH7QYTzxKlo69P1hgDlo=;
        b=VuAKmw5YNvuAK2LoSA5ZtPtDD4uwWHv58PSABlFlWLRNKVlHxdu+zUEv5EHcwPjjtF
         f9sxc90JncdH2X6cflTt58mEu4kpr1TF4XQACvKAXfQ9ILZeQEalri0bYsj0oJ+TYZ4j
         Kp3lt5REWhHGhUoGMe0lV2iwi4fP3d+fRZbEa0u/W3SdpRJNPrpZ25/fyjkUNCTPMgk+
         dPYtHpLthE7zefacRLyQFVEAtNu3e6dDb2QOEDBzuWEoCfMCH+HjYE2dcm/HzTaex0Wd
         yqve9jQkN6kpgaM4lJGH1OdnR+dtygP9qN9ub9mAQ91YUCMooAuWULsvLjLaXJVwJH3g
         hH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863038; x=1775467838;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+az+AaDlx97xMl9c5AxMiWqH7QYTzxKlo69P1hgDlo=;
        b=XnR1uuN66tHLn9xdLR/PxO1WVqz98gA+9NYXe6f3wlzkYOc80UynZhr/EvF6h4NnPA
         SJmYX1udXNKbGFFuiZ8u8HyWFJuk+He+XSfUMqNsBBjhi03D4ozXOAA8Ki3zGk8B7KUM
         mRVBN9utMzh+hmcIalReEgIe8C6LOQMEc/uoiG3pMo11k0cZbmuGwJcUVTw/bAvDjBrq
         gtN9ypHfr4jPTjYZ/qtcuM3c+zzUBgeIJazXcHemYFwAhp/v05M3YFSgpvIxglGWtnd1
         VVQxuG8h85qlFtEB1PpKK2MCHDlnKUao/Rjc6VOzUVjAyQ+7dABp0/sQfUsuDbGXghoq
         a5yw==
X-Forwarded-Encrypted: i=1; AJvYcCUqoAXCDisj8+AyJhrOEKmoAlOCSj4gJc8077J7qmnvPxJFjGOAnmf2DPHIjmTX3KmVHprMGay+w8JybPbr@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ9Yj1zYNEgq0JrE+W2eFQJR+eEFCjxImLsXOxO1HsgGB0ZA/d
	qIpq63b5WLEkRJSo0uYbruYHmIfTPyFzJeap4VeeBRIk75lGa5EBmJPw
X-Gm-Gg: ATEYQzyP+Y+tL5nyX2IHp7+YiFcXeGrW6FaCtYVRU/EcmvOcCMjvHwnJOW2BRqFKB/Z
	nhhqZWxxHQLI1DaJo3uD3+PJEPtT6Y4KuFbNYKubK/xd0VTomJu8krr7aks03EEbMS+Mb1ag2yt
	rUFAOS47C21DiljUe7dBXEGFsTPoJlmq5XAg9Vv/EVpa8s0pzfjKqVgv3KOgEgcAmbE3JAYUIne
	SOQbarJb44Kay+3W6pdOId+zRIuWj9cAQ61wqBUwFOl9yXpnpLZqNWWqwU10ZaKayc7jv94LaBd
	nLU9ARxnP2Q+v657M3cNt+PwnBLg9DXt0K5z+gh8RkveauwgGYMFu0uzjU/KSRfpdgIzHFc9Ni6
	FXLpHIT9OzZNb9AYi83K96OgXIUZUWWQc6urr3uKg++Z4rWAfZgpTzRrVyOkvSnVtR6HQVbyD04
	29xtNklyK/41EiMc8c5jE=
X-Received: by 2002:a05:600c:8b08:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-48727d73611mr192261325e9.13.1774863038151;
        Mon, 30 Mar 2026 02:30:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2577cbdsm18766581f8f.33.2026.03.30.02.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:30:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:30:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kate Hsuan <hpa@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linuxtv-media-pending:next 165/183] drivers/media/i2c/t4ka3.c:577
 t4ka3_enable_stream() warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <acpCusUjXndiISEI@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   4fbeef21f5387234111b5d52924e77757626faa5
commit: fd55319692151de2b89c21356d1445bce364769b [165/183] media: Add t4ka3 camera sensor driver
config: um-randconfig-r072-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280011.CCbaQy6n-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603280011.CCbaQy6n-lkp@intel.com/

smatch warnings:
drivers/media/i2c/t4ka3.c:577 t4ka3_enable_stream() warn: pm_runtime_get_sync() also returns 1 on success

vim +577 drivers/media/i2c/t4ka3.c

fd55319692151d Kate Hsuan 2026-03-25  558  static int t4ka3_enable_stream(struct v4l2_subdev *sd,
fd55319692151d Kate Hsuan 2026-03-25  559  			       struct v4l2_subdev_state *state,
fd55319692151d Kate Hsuan 2026-03-25  560  			       u32 pad, u64 streams_mask)
fd55319692151d Kate Hsuan 2026-03-25  561  {
fd55319692151d Kate Hsuan 2026-03-25  562  	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
fd55319692151d Kate Hsuan 2026-03-25  563  	int ret;
fd55319692151d Kate Hsuan 2026-03-25  564  
fd55319692151d Kate Hsuan 2026-03-25  565  	ret = pm_runtime_get_sync(sensor->sd.dev);
fd55319692151d Kate Hsuan 2026-03-25  566  	if (ret < 0) {

pm_runtime_get_sync can return either zero or one on success.
(See the comments next to that function).  Probably use
pm_runtime_resume_and_get() instead.

fd55319692151d Kate Hsuan 2026-03-25  567  		dev_err(sensor->dev, "power-up err.\n");
fd55319692151d Kate Hsuan 2026-03-25  568  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  569  	}
fd55319692151d Kate Hsuan 2026-03-25  570  
fd55319692151d Kate Hsuan 2026-03-25  571  	cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
fd55319692151d Kate Hsuan 2026-03-25  572  			    ARRAY_SIZE(t4ka3_init_config), &ret);

If we pass 1 to cci_multi_reg_write() it is treated
as an error and it returns immediately.

fd55319692151d Kate Hsuan 2026-03-25  573  	/* enable group hold */
fd55319692151d Kate Hsuan 2026-03-25  574  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
fd55319692151d Kate Hsuan 2026-03-25  575  	cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
fd55319692151d Kate Hsuan 2026-03-25  576  			    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
fd55319692151d Kate Hsuan 2026-03-25 @577  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  578  		goto error_powerdown;

And we error out here with ret == 1.

fd55319692151d Kate Hsuan 2026-03-25  579  
fd55319692151d Kate Hsuan 2026-03-25  580  	ret = t4ka3_set_mode(sensor, state);
fd55319692151d Kate Hsuan 2026-03-25  581  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  582  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  583  
fd55319692151d Kate Hsuan 2026-03-25  584  	ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
fd55319692151d Kate Hsuan 2026-03-25  585  				  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
fd55319692151d Kate Hsuan 2026-03-25  586  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  587  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  588  
fd55319692151d Kate Hsuan 2026-03-25  589  	/* Restore value of all ctrls */
fd55319692151d Kate Hsuan 2026-03-25  590  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
fd55319692151d Kate Hsuan 2026-03-25  591  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  592  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  593  
fd55319692151d Kate Hsuan 2026-03-25  594  	/* disable group hold */
fd55319692151d Kate Hsuan 2026-03-25  595  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
fd55319692151d Kate Hsuan 2026-03-25  596  	cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
fd55319692151d Kate Hsuan 2026-03-25  597  	if (ret)
fd55319692151d Kate Hsuan 2026-03-25  598  		goto error_powerdown;
fd55319692151d Kate Hsuan 2026-03-25  599  
fd55319692151d Kate Hsuan 2026-03-25  600  	sensor->streaming = 1;
fd55319692151d Kate Hsuan 2026-03-25  601  
fd55319692151d Kate Hsuan 2026-03-25  602  	return ret;
fd55319692151d Kate Hsuan 2026-03-25  603  
fd55319692151d Kate Hsuan 2026-03-25  604  error_powerdown:
fd55319692151d Kate Hsuan 2026-03-25  605  	pm_runtime_put(sensor->sd.dev);
fd55319692151d Kate Hsuan 2026-03-25  606  
fd55319692151d Kate Hsuan 2026-03-25  607  	return ret;
fd55319692151d Kate Hsuan 2026-03-25  608  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

