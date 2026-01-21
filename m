Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6641C2F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009990; cv=none; b=DCCGKxzqjn/MVRPxHSrgyBF+KToO5VAgr5G0+6v3qjEhzmPXf2rHLHjo1BbWVMOwCWuynPV6z0SUpTiZ6cF3L4FlbCr5UdXzhIdPP1pC77n0OHFCRtka8PwTBZT6jNn2qIYmezVDOC3Rxql8JxMXJjbY1dFu9ZXnix589kaxwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009990; c=relaxed/simple;
	bh=pUJslqA4zeViV/8SfbcCw34MkW7SdbEU66wajR84v6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jJMOvHJSWyOQNofDfY47Q/0VND8rE3G5273FlDTyD0Xdsiv6tKy5NkHeDjszAWt6swJJPUkDgqr7meqsqeo0uNcQUbCOQRWmxlgbYFVIC62dUHH+W0WfK8+XFXHGvJulJ/KWwpERWVP9iV9ysg2N1Y+p5p5uIgM9ARvPCKL/alI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1I0XssT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1I0XssT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769009987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KEnz+C52vOE4Xe6XYu6KOzOiyocaJmfV0+6qXi2mfzU=;
	b=d1I0XssTLdGRR9+728C9MuthTVsE1J8dtHSvEfN4gP++2POjpniyxuWTo2loolGMC5l+Do
	hhdcOs6/5tPdGVnnv3rFGrKKEmzFRip6klqHBQ3FtXBcf9z4U/MrwjZkAl8F/cmIBCyVEL
	XWpfLwLXBNnKC8cHgxEo0IgZ+TVoYhc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-PtT-pdnRMSCj1nKMwEJCyA-1; Wed, 21 Jan 2026 10:39:46 -0500
X-MC-Unique: PtT-pdnRMSCj1nKMwEJCyA-1
X-Mimecast-MFC-AGG-ID: PtT-pdnRMSCj1nKMwEJCyA_1769009985
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430fdaba167so4600821f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 07:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009985; x=1769614785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEnz+C52vOE4Xe6XYu6KOzOiyocaJmfV0+6qXi2mfzU=;
        b=SRB1MyybyK/zIpM9KcxLQDeSBeueMNwBS/dElBPxAFe2VME5fhWCd2517hGp2CdLrR
         nWyuJjsuPsVGwSOvyfeC6tnGjAEfa/M0KF9X8Mi8XVTJpjtpR9wSZTR5vSyI9aOTFtHM
         +A0egUrD0tK1yBgI0DKxNOpjcIVsv/eqXuZtUAh1rL2wCfc+scFc3UwuwY15gsDrJbiq
         0FlPMa0EFH7FcsSdgW6KkjXu0EECra9Gvwae4pn/vMqEmwhKu/rOj65YOMW+zG09BSUd
         lLKisyRQU1RulGoXwOL8S20Ygtm7u+8+nET/Zp3rentBeZsgH80D8eZACwewC/E+7oqH
         QHnQ==
X-Gm-Message-State: AOJu0YzwRigY9zH5AKBPCad05Hk+qMToqQT3SPhYtTRG4i6B+bI9tWVA
	oAxjNShzpYRRYBBsQEz2R+7UwEVYprdT6PyV/+oLtMvqujGenmWjirE0c8SI0VHmS4VX8+U5CdJ
	wePbugSRJizlzkqk712rwKqqpJ191t/f3IZP7RlgAIqHTdWftXprPS5u+tC3LBvyFivs=
X-Gm-Gg: AZuq6aLEtTY8hWH70I7qqCfI/POfo/bW2NGuW4yiFMeNVwBkFGBdDRZ5HUujSrRPzmG
	UYnefGaoiaz2V4vnwVqm1ut2nZpMadzHAuS2tVxoxEJMJs2zm/ugDPQx9HVkxkU5PjKcNW7jF/K
	xCUftPCx99YxsJH08IwxY4t1KrlPfPglPgC/8T23M/Y7b66Ug98C8AW3wNumEuZW6YZTZLMjCRH
	iBDEI8eMW+QJU34ar+b6tdrpf6PfUAKQMpKUqeYloj0Lms2FlBaOfFFXewetmLhT3EULMB0uQWq
	lPYhEtBntI8qKUP8FUaBtTuX1GYmffaxt7YKclD58ayq7aWITEAkX0Ma1drqiVBaalsF8n5v49n
	Ps4/MLrx4TQCjX0Y77kZCZyYs+veITesvuN2D9DCG
X-Received: by 2002:a5d:64c3:0:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-43569bc17f6mr22943562f8f.34.1769009985014;
        Wed, 21 Jan 2026 07:39:45 -0800 (PST)
X-Received: by 2002:a5d:64c3:0:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-43569bc17f6mr22943519f8f.34.1769009984554;
        Wed, 21 Jan 2026 07:39:44 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.129.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm37459480f8f.35.2026.01.21.07.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:39:43 -0800 (PST)
Date: Wed, 21 Jan 2026 16:39:42 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: {standard input}:11828: Error: pcrel offset for branch to
 .LS005A too far (0x3e)
Message-ID: <aXDzPokjHlJweiBY@jlelli-thinkpadt14gen4.remote.csb>
References: <202601212126.OCGOmVW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202601212126.OCGOmVW7-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DVGdjTk7nupJmHCjT2GWSlp_cmlPf8AgWa5_TcT2_rA_1769009985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 21/01/26 21:14, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6c790212c588fddeb0d852f2790840753bb604b1
> commit: bb4700adc3abec34c0a38b64f66258e4e233fc16 sched/deadline: Always stop dl-server before changing parameters
> date:   5 months ago
> config: csky-randconfig-r122-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212126.OCGOmVW7-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212126.OCGOmVW7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601212126.OCGOmVW7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    {standard input}: Assembler messages:
> >> {standard input}:11828: Error: pcrel offset for branch to .LS005A too far (0x3e)

Thanks for the report. I was able to reproduce the issue following the
instructions provided:

  {standard input}:11828: Error: pcrel offset for branch to .LS005A too far (0x3e)
  make[5]: *** [../scripts/Makefile.build:287: kernel/sched/build_utility.o] Error 1

The failure occurs when compiling kernel/sched/build_utility.c.

I tested with several GCC versions using the same config and got
different results:

  GCC 14.2.0: builds successfully (build_utility.o created, 133KB)
  GCC 14.3.0: builds successfully (build_utility.o created, 133KB)
  GCC 15.1.0: fails with pcrel offset error at line 11797
  GCC 15.2.0: fails with pcrel offset error at line 11828 (as reported)

The error appears consistently with GCC 15.x but not with GCC 14.x when
building the same commit (bb4700adc3abec) with the provided randconfig
for csky architecture.

Interestingly, comparing the generated assembly output, GCC 15.2
produces approximately ~5% more code than GCC 14.3 for build_utility.c
(912KB vs 868KB assembly, 25479 vs 24356 lines).

I'm not sure whether this indicates a GCC 15 code generation issue for
csky, something specific about this randconfig that triggers a boundary
condition, or if there's an actual code issue I'm not seeing. The code
changes in the commit are minimal (removing a condition check before
calling dl_server_stop) and seem straightforward.

Is this maybe a known compiler issue?

Thanks,
Juri

