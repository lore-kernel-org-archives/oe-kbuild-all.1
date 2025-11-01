Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A88244668
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762017037; cv=none; b=CWIcnD699vjTtOm3y+EtyjVagrP0vfHpZwwgGbJNvcsUoUwlInagS/rEenRQoplYKD0AJO4XRWMIbiBAPIdh8pDDGPNwJV4mNtMjMD/a55E2CryplEBRufjiklisHMdfWDYWMiXV3Ir8RQAAiTAFMs/MqZ9Te6cKzeYI7+Rhq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762017037; c=relaxed/simple;
	bh=ZU+B8diip8WEbhgeqZgVBl0jAv+RKTsNJeccgokeMwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSFuk01th7/0LpGYe37/a32XC5sgt6kJmQJEtkiS6B8A7oUOG0nIOnRIw51i16KsK5iWj3l79mDC03BensSfRyptYIKtPJ5eS2+gZ5pCGDxzGgzTB0KUHVXHhyFS3ut+9FIcaWq5aq2ku5OK6YyIMa8pCAl4UL0V0p1Qm6VDNzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9dJqqyp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9dJqqyp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso41802475e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 01 Nov 2025 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762017033; x=1762621833; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq74eKvJ0jeposcEtzO5+GUodFFYwYCHHX7U8DBS+Cg=;
        b=r9dJqqypbiJEYNY9xCnSr2DXJVkcFdZCLy7tQHmMsjuTYMAkDiVbMReKYdz6WOzSMr
         tyoNw82aGR7XGfcRioSC+Er6zJnc6RceUgVCUZ+LKhmBkXJnREs0D0lpgnZWZbplJ9t8
         qSTnpf/BZ6zt25XdHCIeyqq5zdD2Z/uSQtrerxgpQYx4UfGJ+tdRHPUdmnsDB+HQyyjj
         AyVUOujpdSF+VIeC/wCXruX+tXDN9MsrbTv44Gmm7pVzCbqooZm9qG5/GnLOIzCs0E2i
         +BDi/XFM2zrdJ33+EXq+fWnyC1TeblyKZv5G6VmunGGI+PBDA8YHie+T1RYFB6ij2IqH
         CgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762017033; x=1762621833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq74eKvJ0jeposcEtzO5+GUodFFYwYCHHX7U8DBS+Cg=;
        b=OvZ9KAO6HNe5u4I8N2ukV3SFDmcWWmOqiNCf1uuKZNrXQEjKKwH6fPaM/KwLyCeP4Q
         7aUakcHEk+LrhQ56OCtFB02OFQRuZKCNKEE3rN/zuRFHU8usGad58bATcOtCbSbZu7pX
         Easp55l0xFC4E89QD5dGCPodLXDh0qdtaj1TzwALtvSg5ZPvtQTRagmP7RMBDYmBov6x
         2G6awU/rOMoiHmUCrytGzwWPc+A0MFGgZLk3G1zw/AZ6DobOzLkW1W/R26V2/x9rbNQu
         t8VSBogZIR/PNt93o09isWOX6VzD0Y/A/6AXa9P4BJHGnVEa/gquiYbfelaqqPuZNmSB
         kGqg==
X-Forwarded-Encrypted: i=1; AJvYcCVH2aDNlGvIeyl+Yw3HXesZDbHXlfmN661146yc6mhk5RlzOPx9QSSP4vRk5tHLfaFw3F9M/cxRQK+9v+Sr@lists.linux.dev
X-Gm-Message-State: AOJu0Yw40ULaB+5/hB0W1bjEUZqhW7KfuQc/TpI0pppNw1lFE9pJKGiH
	6hYMmAEX2MowXERsxDO3K5i8UiW7J3Uay/IYVNy9SKL+MD41MCUsQwE/03vLzKQ6igE=
X-Gm-Gg: ASbGnculMl7/EAmotVA58fPrvP5yR3tkJgREKCwCCPpUDCQdcfvOu25GXWWhI0Vm+Sg
	/24ASgh5+lBGxYJkyfB4g7nvm1tdpgK/Tyi590EqYOqXBSnGjjvGhSCQ8HRtCxG/ErghjwnQ6ug
	VAyeBq5NbaDIqk/phWmkRPHhO2JK7R9O66XXhfacp3agf96T5G5G2IwJot/pNhgC2agjHZtAHvc
	zc0/s1dKEBV8ZMUTzqSf9/lCha/80c5CtAc0RzAlDaTiLAvQf8qZ8fz7dkXrAX1lelbJ+5QUSIU
	MmNkz6aDRZ7m92WbCH/CTOJFE7rE5xRw72rbmUOy35Gy7kFmuJTkXrm0y6YGr9BmNEkvB1zZ9MY
	WEJkYfwzlQik6NCGEr+jGlNgQwYpeFBTq6mBPGZ1u1k2JNlmQJmdfgrjrsJ56Z9TD0Qiy+Qcf4e
	v7hmjExVYyGYi9jmmU
X-Google-Smtp-Source: AGHT+IGv0uSR0v1hhSAx2GYRMsDrrYeSeRA7g62Ym9r2SphEpFPHMIVpJ6YWfLDNq7gaovk4mD9ryQ==
X-Received: by 2002:a05:600d:4393:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-477331db3ccmr40988945e9.3.1762017033060;
        Sat, 01 Nov 2025 10:10:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c2e677csm58418305e9.3.2025.11.01.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 10:10:32 -0700 (PDT)
Date: Sat, 1 Nov 2025 20:10:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Avri Altman <avri.altman@sandisk.com>
Subject: Re: [bvanassche:ufs-lrbp-as-priv-data 27/28]
 drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn:
 inconsistent returns '&hba->clk_scaling_lock'.
Message-ID: <aQY_BE1SlUh8jxkq@stanley.mountain>
References: <202510311328.Is1wMfkq-lkp@intel.com>
 <5dd16de9-4594-4b42-b912-d56c3ce6868e@acm.org>
 <aQT5iXgmRCzaa_xZ@stanley.mountain>
 <fd51be38-8000-48e8-a5a0-0289904d4756@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd51be38-8000-48e8-a5a0-0289904d4756@acm.org>

On Fri, Oct 31, 2025 at 11:23:39AM -0700, Bart Van Assche wrote:
> On 10/31/25 11:01 AM, Dan Carpenter wrote:
> > These are from the zero day bot so how they are generated is mysterious.
> > The zero day bot thought the patch was 3 days old.  I think someone did
> > a merge or something.
> > 
> > I re-ran it on that branch and there were three warnings.  The "literal
> > zero" is a style issue thing so I haven't published that check.
> > 
> > drivers/ufs/core/ufshcd.c:2955 __ufshcd_setup_cmd() warn: variable dereferenced before check 'cmd' (see line 2950)
> > 
> > drivers/ufs/core/ufshcd.c:6849 ufshcd_err_handler() warn: inconsistent returns '&hba->host_sem'.
> >    Locked on  : 6696
> >    Unlocked on: 6688,6849
> > 
> > drivers/ufs/core/ufshcd.c:9035 ufshcd_device_init() info: returning a literal zero is cleaner
> 
> Hi Dan,
> 
> The inconsistent returns issue for hba->host_sem has been fixed on Martin
> Petersen's fixes branch but unfortunately that fix is not yet
> present on his for-next branch.
> 
> I plan to include a fix for the "variable dereferenced before check
> 'cmd'" complaint.
> 
> Is it expected that I don't see the above reports if I run smatch
> myself? This is what I see if I run smatch (commit 2fb2b9093c5d
> ("sleep_info: The synchronize_srcu() sleeps")):
> 

Yes.  The dereference happens inside a function so you need to have built
the cross function database to see that one.

It's not hard, but it takes a while.  smatch_scripts/build_kernel_data.sh
You might need to rebuild it twice to see the warning...

https://staticthinking.wordpress.com/2023/05/02/the-cross-function-db/

> $ make drivers/ufs/ C=2 CHECK="smatch -p=__kernel__"
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   CHECK   drivers/ufs/core/ufshcd.c
> drivers/ufs/core/ufshcd.c:1536 ufshcd_clk_scaling_suspend_work() warn:
> ignoring unreachable code.

This isn't supposed to show up.  It's seems to not be parsing scoped
guard correctly...  I can't reproduce it.  I think I'm on the same kernel
and Smatch release that you are on but I still can't reproduce it.  It's
not something I have seen from the kbuild-bot either.

regards,
dan carpenter


