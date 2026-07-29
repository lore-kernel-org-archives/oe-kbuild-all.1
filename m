Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27444C670
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319626; cv=none; b=Ie1ltPGtZwaIyPWpn6i4sHmZreziabCHuZo7jri148P2HQAXpQgL0Qa3TsZ4Zlu3R1FM9IenCm/SgmRPZPgiCIIQkDPAvBzALLkb+kyJCn1bdUkqJrvrqPkV90AkmTh7Fcr0/Sfh+u9pS+Y387fFlk4ljp32ciRwQXE8n867inI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319626; c=relaxed/simple;
	bh=GgCcrNbHdCBD7xXFMVJvPxLFI+c7q21jZNU5tbMpJXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhazLsGzZ1HRTvRy13HFAl3U8igwazoR4wMxUFpTg9PwTYf9nRG82UwT/fXA32pMbbcs0QFwzqm1Vgx9bPw5ecsOk/X2KyiB7uWrr2v5YdVmiHA3f1v5BNpSr0Hc2JBu2KuBp/Gn/NZQHbiM94lJxzk3YJbgnwIoRokX05N6opQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZPAD41+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZPAD41+"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceaf8a1265so9369865ad.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785319625; x=1785924425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltiyfcpncL+fK7rWL3LABJqprUpnAddinkICIJvoFBQ=;
        b=iZPAD41+JNWXZseuNFZuBzZabqVZNpEtojDuXDj++jglneSMp/DEad4uJi9DwHISER
         N89owEnstVg3hjGLqPnbxpUSDoRHD3jHmbLt3O43whRXNknrsBgD/7yUMB+sMyqTC6tK
         Y0zlYEGPI+5XuU1e51gHryTCX/bMNgbQ8ud6zs2kWRN4dFHDSMze9pF0VmNDdnUCpcsa
         UTQZMUOtlxXWcvO19GheDP+EBJbqwQER/g51uMeQdPqL+tZ+nNsOHUtdW6kuWIs2QNst
         06G6mbPx95ddhtpnYD7qYVuz/E3IQPA03jZmoarbp/JO+39I1Q8F5gHUMUko9YJU5ZrD
         xvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785319625; x=1785924425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltiyfcpncL+fK7rWL3LABJqprUpnAddinkICIJvoFBQ=;
        b=CLgJbBvVnj+uzgyDzVZ/9fGid/3MUcASdiPKTWVoCkOmIDIaWPyWfSJ9iR42xeypcv
         XkGO2LR6uH6Fv2YVyKh6gcsMbH2o6SW4jx3BdNt34CdYU+QfVI7KW3QgEZxAZ0xmntzP
         stfWbI7baxPWP3GyXpbEoA0BTbzekEf62L7KtM6d2g+IZ2cYB/amUGjsTv46sYSh7M/n
         oTbozHay6edy/gcEA+sPT3x5ujQVYyHy1ilicbkx7VxSiKbTClQL2sl2KD/OJFEymnkH
         cT3CujVrXVO8ifWSAIfNoVI2g1RyDAIgGWi7NpnT5y3G54y4hYEEEy7xl5FWWqR4SnRD
         JL/g==
X-Forwarded-Encrypted: i=1; AHgh+RoB1KxCy8br2mD17jJkVNDV/DMQ8iXlE/1E4KZuZgbZdPG7YSPcqIF3ScQ7V6ploBEuEzvN0Bg5efUcKFNP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0FpQ1/wmnABc640phbgUL4Ig+AhjCeA3NYidQQ5LsXuQNBLJO
	NUQrMQDo1FICjWXDT8st+eWzpP06JfLi8uJkPgg3FZJAum2dN86c//Hx
X-Gm-Gg: AR+sD10xbcjhAlFj8x1oUr/1CHSLAaWMQejUmFCSlmmiH0dxMsU8gH/PI3Mb5LBVTJc
	+TqorjCIFEa7NSSfP0f4Vuk6xhICQkr/djkLsJl8asKTy9+k7YWGPAbIq7cSnfQ7zy7IwYSmyvD
	Mn1299dfS1UZnvVWD6QR1QAjkoI+H2UXtH9nVeqBJeuCnhzscRD2pwS3855fUUpFFzB82XpLhBR
	7gMBdNN7SJ8O435b7YpVdPLRFPXvAxB8djxhuKqyvEx+79ljHGGQzhBj4awp5O2t8IYGPGPCEAH
	hUZ5bzyrFZr0wX3vEKadsVRti2kW1OLS+veJlQ8q7i9zI4f/Rw9SJUdznpp1ZWFQZ6SdOQVSZdU
	DvgNvw1oCvkcPb9bzbuCjGOXuZXT1We0QNP4eEnLAmGCSkocdie9Bwb2bUl4T1HbVGDTucqEQv4
	NpbnYycypsFRSd9vhhg+95vUzvA6fU0G6gty59vVh1fX+DBha7ncYYG4c=
X-Received: by 2002:a17:902:f54f:b0:2ca:f40a:be76 with SMTP id d9443c01a7336-2d015d94cb0mr62989015ad.36.1785319624787;
        Wed, 29 Jul 2026 03:07:04 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm8827915ad.57.2026.07.29.03.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:07:04 -0700 (PDT)
Date: Wed, 29 Jul 2026 13:06:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>
Subject: Re: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn:
 missing error code 'ret'
Message-ID: <amnQwkLaHtbkH2Me@stanley.mountain>
References: <202607291308.8OeeiyIv-lkp@intel.com>
 <8a416f4caf9d41168a38e04140486aef@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a416f4caf9d41168a38e04140486aef@ti.com>

On Wed, Jul 29, 2026 at 09:56:57AM +0000, Holalu Yogendra, Niranjan wrote:
> > On 11:16-20260729, Dan Carpenter wrote:
> > Subject: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn: missing error code 'ret's
> > 
> > smatch warnings:
> > sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn: missing error
> > code 'ret'
> > 
> > vim +/ret +984 sound/soc/codecs/tac5xx2-sdw.c
> > 
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   979  static int tac5xx2_jack_init(struct tac5xx2_prv *tac_dev)
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   980  {
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   981  	int ret = 0;
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   982
> > 38c89fededd5a9 Niranjan H Y 2026-05-05   983  	if (!tac_dev->hs_jack)
> > 38c89fededd5a9 Niranjan H Y 2026-05-05  @984  		goto disable_interrupts;
> > 
> > Is this supposed to be an error path?  tac_dev->hs_jack can't be NULL
> > in real life.
> 
> We added this as defensive strategy in case someone calls like this
>    snd_soc_component_set_jack(component, NULL, NULL);

Should it return zero or an error code?  I feel like it should
return an error code since it disables interrupts which
pretty much stops the driver.

regards,
dan carpenter
