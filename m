Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F473822BB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 22:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305781; cv=none; b=AfwaLtm36GMjdszfRfNLCJ5OvxwR7WJccXa2fCDxCvAG4PE3hh0SlEoTeGMMSE8PAUDH95C4yN4C6DK+iSACieZSnC8G2EWBEInWdGY6AmK/T2uBK+cBqCiSaXgqiSFYFvmCsnNBhRDuWKCbmlA9IfTkRwAIK8Ooe6HJcTs79j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305781; c=relaxed/simple;
	bh=eY/l0pNNsKlt6FeaeoIeAQ6qCqKnez5RHCGxpugoodE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iStGhKprwSWHQx6D3pLFH8h/Je0+8237xIhT0GlHxd80h/CUhIJW/G5W2OiIMidd6FFngyH9bvvWaKdDdmKWWtbxvOmkPCQupqxzlc3vLnM6WDpwmfuhCLoQOBan4poKsoZXhg7MbsYMJkoCVHZDfyoEc043VTuOWdbNv1QQeRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ki6gCBJo; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ki6gCBJo"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c11c43aca0so1561020eec.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774305779; x=1774910579; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQitIt/VZw/RqI0BD0y4OU+WxRTPVb199E6XKyMY7/Q=;
        b=ki6gCBJoN/gXgUxu66jO/zD1EHp2EohZMBRBJLilcT87IdXuTd42re3g7Xx1wsyAAH
         2Va/2VU4Ut3095GIkUDIgMrz1IGdU2Ivi28DyYIqtW+BT2Ip2kjKML31wcYXhs0DuC7a
         BpNA2KxQr5YBCJnK6SSl7zzYZexVfkJnWbKS0+RfLCs54nhNRV8C3jP6yRTZnaLMKKAw
         uktYKpab44Qtj9umKs8gFqESRjzXBu+cggyZ72h+KWpF4PxtcrKNHxMFNyLF6drp5+Ed
         E7dj4ab1InDmz7jcnj8IEfKpZF3o48zBfoerQFnwJKKDfipYJ+CrEIdGyroVNMPABEbA
         fyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305779; x=1774910579;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQitIt/VZw/RqI0BD0y4OU+WxRTPVb199E6XKyMY7/Q=;
        b=SRPbpIGEi//gix6MQWZAqk6ie/m1DiTH9n7lTbOWQ0Q5we1WFTSzxqYfA7X0amn7JD
         UvxxensWY3yB1Jyd3Y4V/1KlCYK86qTgGta8AuZfPaVM2vgPl+I5v0gsf3hvKyQjkXxK
         0iKy7KMQuS150tlw29Olxkooh4ITTFq+UK2x/NIajElXWuwYV1AQfDtBEVK90D+gO8Fi
         EIQSSbpMQpueVTdg50Mo0lpJRuj8dI3mFZhYg/jGF2LlfjtrKubZqYySxKdCWmGvK4p2
         r0fUl+PVke/IfrweWScxGrBt8ftCuno/beF9397QxXwKOBs90HQkt9rpPD6h6yEOSoTD
         7bPA==
X-Forwarded-Encrypted: i=1; AJvYcCXw7WNW/ymWi07u2nKGOFtDCNkMfzDpKmCYG0ehGttmz66+omNPTA6XKzJ0ufzOjIlVQ/jmJzhdhlkoIhvI@lists.linux.dev
X-Gm-Message-State: AOJu0YxcBwGSzzg1H4DBTR9xJKFyfhc2w+DHCVm53+5YIxtajLOwbgfA
	LXlLbMttJUXRGOcH3ZblA5qK+nGvodf8IzuP+EL35ljizQBQKtM5LG7h
X-Gm-Gg: ATEYQzwTV+jJ8Vi8GrOKdpQirWkL1OIuDM2OwaEA3/KPU/Z+kXFTLKAPeuAwujT5Ruj
	ff3ggsXWA7keYWBYNuKr7wHXpxMvWQhl9agwkqLSmt9hpJxCavMKcLlX9yHX+XOFKYiPb4VCkN8
	bfVoP5g9ZimCJOdpouu95Qc9VwZ5FUtrG7946rao211TC0SOdOyOmY1RGiE7BCsYUu7sThjoWk1
	ksTdHYROJG0OmmKduDlPo6C3dT26KDsXjo6GL+picjpQPMefpcA/Ojy8QbHaJZ/law3HczTs1GI
	jZyp0U0xA/dM+M2lVQwDJz+ypBwGyYnhx3xdYuJDd+N27+iGO2VD7cUTVT//USm+uB8JxqijAFN
	LjTPpzM1NerFSW5nmf0f0/vgoAuaXcmgAd1SoIVMKmft6wJCufPOZvgwx8uSJ9NtVzqOuO2OLeP
	l/Ojvh/wIKjPZ1yWAoG79+0p+JfxxMzscnxKL23Ggh86tkAtFyXF/H71KjoKGK7iSk
X-Received: by 2002:a05:7300:bc85:b0:2be:1a8e:10bb with SMTP id 5a478bee46e88-2c14b5271damr517863eec.12.1774305779340;
        Mon, 23 Mar 2026 15:42:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm18575186eec.9.2026.03.23.15.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:42:58 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:42:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Peter Tyser <ptyser@xes-inc.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: meraki-mx100: use real software node
 references
Message-ID: <acHBpaEIfS71oryo@google.com>
References: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com>
 <202603201641.qJ8m8Nhn-lkp@intel.com>
 <CAMRc=MfWsChQc-xHiBtL6HKv6ax36szfEE8Ckjf7VUfhxzG9OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfWsChQc-xHiBtL6HKv6ax36szfEE8Ckjf7VUfhxzG9OA@mail.gmail.com>

On Mon, Mar 23, 2026 at 10:39:30AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 20, 2026 at 9:18 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Bartosz,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/platform-x86-meraki-mx100-use-real-software-node-references/20260316-165120
> > base:   b84a0ebe421ca56995ff78b66307667b62b3a900
> > patch link:    https://lore.kernel.org/r/20260316-meraki-swnodes-v3-1-15501a52300e%40oss.qualcomm.com
> > patch subject: [PATCH v3] platform/x86: meraki-mx100: use real software node references
> > config: x86_64-buildonly-randconfig-001-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603201641.qJ8m8Nhn-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    ld: vmlinux.o: in function `lkdtm_rodata_do_nothing':
> > >> (.rodata+0xa9b6c0): undefined reference to `lpc_ich_gpio_swnode'
> > >> ld: (.rodata+0xa9b840): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: (.rodata+0xa9b960): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: (.rodata+0xa9ba80): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: (.rodata+0xa9bba0): undefined reference to `lpc_ich_gpio_swnode'
> >    ld: vmlinux.o:(.rodata+0xa9bcc0): more undefined references to `lpc_ich_gpio_swnode' follow
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> FYI this is a false-positive - the prerequisite patch is already in Lee's tree.

It is not: you did not define a dependency on LPC_ICH, so in the 0-day
.config it is not enabled.

This is what I mean by tight coupling.

Thanks.

-- 
Dmitry
