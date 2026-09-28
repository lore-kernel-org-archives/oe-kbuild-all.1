Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7112D3B42D7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578375; cv=none; b=JBTzs/UOJ4b6muIUpddAJfwVsArAHp5Bjk3hh/BUlmcc2MhMkJImGpVH/1QRQTywDjX90emkLcUN6m7/C1VlLGStQg7HffnnslhSgoRevtAu20A+XzjHx3fGRzLl8i4xR76p20j2hWW/i0Bbf/OGvQiIXvl8Bpcb3p0dnJwxc/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578375; c=relaxed/simple;
	bh=U9e3R0KqY8l1B0OpUpNlBZDCfgqZAMfF4DrJiw+mIhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7ef+iJx2bPwUOMAxGlNiQRKqAh6CkVTbhPodjl09THR/XC9w5nZhN2NXbjd/1wzdmrMwVUmei2oRpEBNxH4i79vTfqLxmBIJXsBwftr33W4r2RC3h7aH4zO5s/hTJiprNdubcKQeMYVQDKRpoewXgh2IPbFsravUGbpUB187rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5e2CRbb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5e2CRbb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4887d3c59ecso1489273f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 23:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578371; x=1791183171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHiVsnql3W2vw2xfyJJOvymbFGjCnTlA9xgGwDre6j0=;
        b=p5e2CRbbNG2S7isdDRYoK4LT5XifxnJbnUTpd4yiSmruNOCb1EAvnE63kuRFNfn/N9
         1AWEh5DSk3jTFsJMh18e3zPugKIQZuH3wg+5hnzPq663o6MQ8URd6PK/AqyIa2mspHaO
         2fbDThdQU4HC9w/5PtsCaoeQwh7b7JHht2oxsu3wR1FNXCYYIMq0LMwj4DfVQ2qG6THg
         TmgPdq+SWczzEWax8Sa1UGNbx+M+yWQWPfmEkK/zOZc1Fm6sAueg1JII53GnAXlRcWDB
         iWPKdeKPwqKluNbkQdPpGBxPSSTvz9YIuG5sHdfRiALgcT3okv489mhDBlPJTnfig6RQ
         HlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578371; x=1791183171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHiVsnql3W2vw2xfyJJOvymbFGjCnTlA9xgGwDre6j0=;
        b=je5yocC3f7ik36s0mb7YfZ2nE4S1X3HVEncCNp6PafmYG8b6vHO38OBmAmglYtiROl
         qvcIH7oFCwQzNXzREdkB47v6jXVDe43OlVyizdnbUWz+MfCaJJJFgTQzKI1CruGp4aFV
         RMr97+WDogxWhowbRNL4fjoIxqoGr4XcmdWUbFkXd+FtTBFm2rEs6bNKeZkGsznDHQbN
         M0ZaXcVcQl7W//Ys/vSiyHQz34Zklt2ICyimz51kFOHlhfFM7oSXavgZnHyZ7hAtKQ+R
         JVtHylr8kqa5LLIf45p1A+fqJ6Do536mOP8fP65bkGP2aqBNWh9U+PmXvqW/hwXe1kF2
         jljg==
X-Forwarded-Encrypted: i=1; AKwUvByHHAoB+FuwfwPVSYxS19iTTFUesYNP7moFack0tjDBFQ/+TwYF77coseJfqbRgWUZItJTxZYtaA/D0A+pI@lists.linux.dev
X-Gm-Message-State: AFq9FYLSijHsUU9kr6w/xO2LQPpxi8ygSAjDaw7SdYrZIrSqlebtzs/b
	io98BiN5HYA3hdzE5I8Xp3Hlv1bROdicjtFPOLg7owvE8P05fA51gxf/
X-Gm-Gg: AYBFou2QgFW5FO1MxeT+YcydUwVWLgRQ0JgRPsTN6X6oNX8wSPzGDoHM04NyRRKIe2V
	YuPuT2sZeFrLabCFpSWMLxT8u9cYnzcVyFHLJozeSySS6fpSD5FbAJMhUmRyesOHwg0X+eJaGH4
	5CteydttxhwYC1JibbNTze4hOULWAKwJyoH9LVU73hLgg8RwRQLnH6Q+Hqenvg+xJ9njZRjoZ4J
	SR3UjMlC+0CxFr0LXzuwOmYPFFWX4+bVWam8/hIoY/tYWAOd2oSUOehDEHOlUBKFSnlFcfOsYud
	QWi/Iz7xcenMWNVz1QlgtJwvom1Psnx7Y80YuHBPlqKnp2wNzUjOcVshRiXgs4Z8QF8LRFSquWd
	RKun0tQ0UvIBpbGxdZo+jIUT2cNIZGJzskmVpJt6r4P2n+AFAVu/f4h5Ma7cMbD+V7Jtf5Adkwp
	ToaEJ/DGAAM6/rYQ9W/0XDWwW/b57fHwcftPBC4Zv4SR+UQBtc/qX10x4BO2wohJXzQV4=
X-Received: by 2002:a5d:5f8b:0:b0:488:891e:5a67 with SMTP id ffacd0b85a97d-488891e5cb4mr9792893f8f.19.1790578371348;
        Sun, 27 Sep 2026 23:52:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm25560268f8f.27.2026.09.27.23.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:52:50 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:52:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"Prasad, Prasad" <venkataprasad.potturu@amd.com>,
	Syed Saba Kareem <syed.sabakareem@amd.com>
Subject: Re: [linux-next:master 6294/10910] sound/soc/sof/amd/acp.c:1469
 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow
 'adata->sdw->pdev' 2 <= 3
Message-ID: <aroOvlIaaXjiT_Ti@stanley.mountain>
References: <202609271355.u0pymQoF-lkp@intel.com>
 <eebb7c55-e999-4aa8-a1ab-5a56f39b2382@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eebb7c55-e999-4aa8-a1ab-5a56f39b2382@amd.com>

On Sun, Sep 27, 2026 at 09:29:09PM +0530, Mukunda,Vijendar wrote:
> 
> 
> On 9/27/26 20:52, Dan Carpenter wrote:
> > [You don't often get email from error27@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> > commit: be2823854e00558f46f5bbb124bb3f3a3bb9a94a [6294/10910] ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
> > config: i386-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271355.u0pymQoF-lkp@intel.com/config)
> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> > smatch: v0.5.0-9187-g5189e3fb
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202609271355.u0pymQoF-lkp@intel.com/
> > 
> > New smatch warnings:
> > sound/soc/sof/amd/acp.c:1469 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
> ++
> 
> Thank you for the report. This smatch warning is reported because the
> ACP7.B/7.F SoundWire specific patches have not yet landed. Those patches add
> support for 4 SoundWire manager instances and allocate the platform device
> array based on the maximum instance count, which resolves the buffer
> overflow concern flagged here. We are currently waiting for the dependent
> patch series to complete upstream review:
> https://lkml.org/lkml/2026/9/17/1422 https://lkml.org/lkml/2026/9/17/2552 If
> the review of the above series takes longer, we will post the ACP7.B/7.F
> SoundWire patches for upstream review independently and include a note in
> the cover letter documenting the patch series dependency.

Just to be clear, it looks like the bug is there in linux-next already.

Btw, it's better to link to lore.kernel.org instead of lkml.org because
everyone uses b4 these days and we need the email's msg-id and lkml.org
doesn't give you that.

regards,
dan carpenter

