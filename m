Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E628DB62
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 18:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270746; cv=none; b=RO8T6gi98KmPa69u2XFRH/bHXpSRdrQ6U5Flh3xQvvlSRwxKO0o2ufWuB56BnKkylvt8aDiQBa3WIDnH7x/ZTNr+PZNXUVojdRWF75gB8+eZSo2pa0amhwgMK2p19i5RVBqGW5xC/4/SxeQrKtZsSv5VjnXXlWCoeEO1Y+jomno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270746; c=relaxed/simple;
	bh=fAGFVqJ0ijjjkq/JMmoWe7JDhHbAH4lR76XoIgUmddE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkF+YUzylaULRDY+zhFHZmJhFyi5rwItSStub27nYdGReOesIdIUVzzTjE1NeWSBbuaijyOXR4pgEQoIyVyoQIcER4+EyQ8DnQzUP5BqT4xXTYmQATIGhQ5T2poQRilNUfJyy/Bhc8qTZDOSb8JMZg2IgAYVa0jE5tvaBzpXGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aa/PpOpG; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aa/PpOpG"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-73a01a7bee7so2212591a34.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750270743; x=1750875543; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vep4PV2pZ+9tPEurvQr9lDJXe4H1SpULEo3WQUGiLXg=;
        b=aa/PpOpGr48iHHtTVy3LV+x5H3kUFRrSYbkixjpaEzBbTTIxHVEr5AzNetqOBRTVh+
         Gd1T+08x8lKHeTkp9D9Y2h2s4iOddzUVqIfE5NbxMKYO8YWB4zXeefIgACEp7wPOMTc5
         vZAUe2LH06RtCaXFr7VN/9WbJm/WMqPdbdlVfnyi19gLhp3gwNqZoAOxQIR9xva0Agiw
         x3ixSGKDBxI1Wa0uuTCeP6NEY7FP0dfjzbSa39nRm1EGseTqIslTKqM9qc0DiJEjkeg2
         axgiXrMkRruXY0vW9G7IBtyM1pWk01332pThIql0LzB28MwajFEA1vwTXeh2j/3SW7A1
         6IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750270743; x=1750875543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vep4PV2pZ+9tPEurvQr9lDJXe4H1SpULEo3WQUGiLXg=;
        b=q7/RGE9XV7OTSxD8DszvtrZT0uzNo3jckH8QIPPwmU4oM40SxJmBn9UzQjM8jJc/YB
         4ZqBwNTZefxlDUfN+s+9GKtSxUE2Db0oFtYV3g0HLvEWMhoYxAcPyZ6Eq0xk5L/4qmmy
         1UR1pCQX+CMMrywY5cwskLeG6zvVsbMV5ewdE+5s73Q7fjnLKT3mSmEabl3Dg9fUOkAz
         H16B55kOXwpmJbKSetiAA/IGba3K9YFCFH2DR6zWjY4Ev9ChdQh3t8SHoo+ebj1UV0V6
         dve1PhsnZzqkI+CsnonrVDOBi9MAq15aF1d6GuZzRiq6ZQpdSdeMwHEfeYZVrbf/8c7u
         QCxg==
X-Forwarded-Encrypted: i=1; AJvYcCUnuqd+VHHsQGOkaUifHR5EdHjvaOXQL4cx1E9IZkftzN+QqbqAr29pRZ/ENLCIu47chV05jGzIzfhfucdw@lists.linux.dev
X-Gm-Message-State: AOJu0YxqFYfyNP99RotbZUKRzQyTIxRGYoiYoMjQZupsRrmUMoHAsi3O
	kLYzr5/2WZByMCQs9Q2Xk7med2wEBrSXZyvDpu6bi3NpgTt6jUaj/AfG8ZY4asAb1Gg=
X-Gm-Gg: ASbGncsUt3CzRuxNBCfmLQWh6ufVJXV3XrpYfbZohK0e8VdWL2WdH6esW5fUythtlAu
	6tsPRBdEudioREmEfbeYSMNLVHOKh53wstBEoMgYkuRTcOqE+jADRhEw0sJkPauEunwjo3ttQe+
	3kw8G22G0sK9A8rVHxkcVWX0mvhtIQXaGLKoyhJ9/A1O0kIrYgyc7WWeHo0bg+kdwya3/LXPbxw
	V7W2M9VgoaDokUlDN7/lCKM3WT+8AwogGumWD+mvLs9+PF792YweTigAHWHRC5WwuwtJlV4PGAw
	5CGpnIJLLTA5tx9L2LdjLDIbKrpPsruElAxx9PTKoz7tpclhDsatgMpuaWTGPZCj+jNgzA==
X-Google-Smtp-Source: AGHT+IFKnX0nztNeiuWkt0W77J0j5V4cIVncVTmr2DaNrpLni49egH0ASp6YufKpwNA2PVb7YBrY6Q==
X-Received: by 2002:a05:6830:6f42:b0:72c:320b:f827 with SMTP id 46e09a7af769-73a3626800cmr11319258a34.6.1750270743621;
        Wed, 18 Jun 2025 11:19:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403dc8sm2055669a34.27.2025.06.18.11.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:19:02 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:19:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Melissa Wen <mwen@igalia.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Dominik Kaszewski <dominik.kaszewski@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Roman Li <roman.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
	Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, cocci@inria.fr
Subject: Re: [PATCH v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
Message-ID: <7ae66816-f682-45f1-b848-eeb5a57a68d9@suswa.mountain>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
 <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
 <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>

On Thu, Jun 12, 2025 at 11:08:10AM -0300, Melissa Wen wrote:
> On 06/10, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 10 Jun 2025 07:42:40 +0200
> > 
> > The label “cleanup” was used to jump to another pointer check despite of
> > the detail in the implementation of the function “dm_validate_stream_and_context”
> > that it was determined already that corresponding variables contained
> > still null pointers.
> > 
> > 1. Thus return directly if
> >    * a null pointer was passed for the function parameter “stream”
> >      or
> >    * a call of the function “dc_create_plane_state” failed.
> > 
> > 2. Use a more appropriate label instead.
> > 
> > 3. Delete two questionable checks.
> > 
> > 4. Omit extra initialisations (for the variables “dc_state” and “dc_plane_state”)
> >    which became unnecessary with this refactoring.
> > 
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> 
> Hi Markus,
> 
> Thanks for working on this improvement.
> Overall, LGTM. Some nits below.
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202506100312.Ms4XgAzW-lkp@intel.com/
> 
> As the patch wasn't merged yet, don't add these two kernel-bot-related lines.
> 
> You only need to add these lines "If you fix the issue in a separate
> patch/commit (i.e. not just a new version of the same patch/commit)"
> 

If you're going to fold the fix into the original commit then it
doesn't matter what the commit message says since it will be gone
in the end either way.

regards,
dan carpenter

