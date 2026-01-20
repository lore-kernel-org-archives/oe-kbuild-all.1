Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F81350D78
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929232; cv=none; b=H6K6iJIFfziz/ISnugX9TN+X4zpg/TfqERMTyogX/rJWHa2sqrCHaVE8MWNG9JMyPCrZGa9F1DfIzI1W1SznzLmrw/SKDF8g1GH7AXZWR5PStjoWpaAfDVi9fspNjZMrlozVsLiqzX+Vwq2NXZhaaMAjdHhi6Jpdi18uYCbVF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929232; c=relaxed/simple;
	bh=aN9ptQ+ZTLnWEQJ6r0LUoFoGFkueKfjxBhh8im0wQ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Nev1SU/zAR6UiPoHTHx8JAEos9uGSDaSpxpeVz9Uq3IbSmBUAiKvoXcdmDYR7jfS3sFPuudVVPpuLFQgS2R/Un9SyeWvdgo55iGXCYz57rfxryj+bW9qhbQIlF8Y4QxWfsQoV1eZLCKx+7js+ZLP8jeWR264wW8jMThWMIMc+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N6GXsPGP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N6GXsPGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768929229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qwJElHWulL0i4lDs4GYQdqUXvJ6D6SUeZe6yBMCJOdM=;
	b=N6GXsPGPYeb38T3BuzfgDKtY2yGYiD1rkt3g/2v3lxa+x7XcVuyPtoe2/VlXaJHNzQpBBa
	WTg1sMzcnV105oNJfBfJ1Z0VaqkRCx3IKrKAOltYd+sHwNwBeKqB9nYcDZUz1IvSZK/fak
	ncnqJz30dQ55nGX+ayclrgAmDIZLPvo=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-dlFPUQ8gMumcvHdUErk5iw-1; Tue, 20 Jan 2026 12:13:48 -0500
X-MC-Unique: dlFPUQ8gMumcvHdUErk5iw-1
X-Mimecast-MFC-AGG-ID: dlFPUQ8gMumcvHdUErk5iw_1768929227
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12338d13f2cso5798411c88.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929227; x=1769534027;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qwJElHWulL0i4lDs4GYQdqUXvJ6D6SUeZe6yBMCJOdM=;
        b=ChulyzuYLmkB9it18kyQJ0Z6F0pKDn+yuoGB7OBWWFeuyvkLCYN0sH/6MywfM3RWeY
         3ZgD/ZFiduPFHAo1l7YQX0toFUG50K0KD/wlQgdS1E1uFPVXxRVAQSKqIacqwXo1e6Xu
         EI4givb8tq2PyU8aAdWskWztVcgCa6x6T/S7cnPv0Dj1vq+Dy5FxuK8dADlaKL0WwktW
         lNfqdUVnapwwjFhA+dwHDd0Tnmzxj09pdUBBi6je1eGOaV5wrp0oKsT6JfjIKglbbPXP
         u2bdALl0WiINlrKJarwlu54sPJJNbq7OQyBB7PDIxzpk2m3CVdTSv2DQY/BH+TtKy/tr
         q36w==
X-Gm-Message-State: AOJu0Yw1+8XoiwRChcmuZ1ZO0LwMiyWNPTVJCRUoPFb4PSSwrJ6wEZ5l
	Fevobi+sANWUgOCikQCgG2TSFm4aWV5b1LAPhP8NYpW/Bw88RpwLpZpZdXw2HD7ffGohCYtytAb
	0oK/HfJBCo7i/lYWmP2lLvVamsJIsOciZHmimdJ25O8bgoP7pGwpwcOBwwNYJ9rsF65s=
X-Gm-Gg: AY/fxX5E8E5M8PURU613NiqfHQky7E8D7TqFGN7py5BDhr/0a0skAX+DR61VoMNItvh
	IrbrjnaNUvoCl3mnhWI3gOqOQ7FVu3mxiykbyD6dqGBgHiN4FQgFn2NGIkevZUDsxCzTv90QeOn
	TW15ZYJ2NcDW/W6b4Iu2CJWcfaB2EfhKRv4h4CQyJfHw91qKMwQ1g10oVLbIvPp8/wZrpouQgDn
	1bl/Za2yjJvMEQk8qK2ngrqMSt13YhYVY2lk+3OSBZtmnMBbGa3glR6I3y1JxPTtFaVjgGVh7YL
	aON607FEs06w5IyRRTcorEj8jqpJGVU5E345G78zwDhqnG1GOESJXc33UU0BC7N2fA5ISEjsPbp
	QCivPWO/egiuYQ5Z3JC6O4wg7xvOf3WsnY9ECfXiT1JU2
X-Received: by 2002:a05:7022:660b:b0:119:e569:f615 with SMTP id a92af1059eb24-1244b31ecdamr11345751c88.14.1768929226629;
        Tue, 20 Jan 2026 09:13:46 -0800 (PST)
X-Received: by 2002:a05:7022:660b:b0:119:e569:f615 with SMTP id a92af1059eb24-1244b31ecdamr11345730c88.14.1768929226087;
        Tue, 20 Jan 2026 09:13:46 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21239555c88.7.2026.01.20.09.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:13:45 -0800 (PST)
Date: Tue, 20 Jan 2026 12:13:40 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [masneyb:mips-compile-pic32-drivers 24/29]
 drivers/watchdog/pic32-wdt.c:125: Error: unrecognized instruction `nop'
Message-ID: <aW-3xJeE7y6tJicS@redhat.com>
References: <202601180236.BVy480We-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202601180236.BVy480We-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RjKRHpVZ7v_h0bfeRkhbu2SUloP9UHfOmL7VjBIH-lY_1768929227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 18, 2026 at 02:30:53AM +0800, kernel test robot wrote:
> Hi Brian,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://github.com/masneyb/linux mips-compile-pic32-drivers
> head:   a426e474e28b73078378d837ec86f55a5a2e7955
> commit: cea2910f3fcc8d60410b0a0ef0ad76ba6c58fa8c [24/29] watchdog: pic32: allow drivers to be compiled on all architectures with COMPILE_TEST
> config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601180236.BVy480We-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180236.BVy480We-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601180236.BVy480We-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/watchdog/pic32-wdt.c: Assembler messages:
> >> drivers/watchdog/pic32-wdt.c:125: Error: unrecognized instruction `nop'
> --
>    drivers/watchdog/pic32-dmt.c: Assembler messages:
> >> drivers/watchdog/pic32-dmt.c:58: Error: unrecognized instruction `nop'

Thanks for the CI on my branch! I am planning in a few weeks to post
various patches to allow some of these drivers to be compiled on all
architectures, rather than just MIPS. I just posted a patch to the
linux-openrisc list that adds an arch-specific version of the nop()
function. I included the Reported-by and Closes tags above.

https://lore.kernel.org/openrisc/20260120-openrisc-nop-v1-1-a29da65537c8@redhat.com/T/#u

Brian

