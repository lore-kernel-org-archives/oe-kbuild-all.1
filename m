Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E410964
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TmhlBDsE"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a236456fee1so24227466b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702889751; x=1703494551; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFBQ/10wtaKL+8m10BxYrHbjlRlg8Q+PUaAuMUkYRWY=;
        b=TmhlBDsEAG9OiXIUpiN7XcGzXZzIWJAiyytePjYfj0vcsmB6tnFImlYN1g6pONkmVg
         7QoWGrfUsoUZWmRfSkloRrMaCOtCTA7JIUE9GWq0zbwjGM5knTzSKwzDL356IS0QQb78
         3dBFLTIDVqqLpuSUcecgtkoa+mpFkodVP67KL3GOeK7NCwTGSo1Ek12ZOKRw6adxe7ak
         GWykjZMOT5xVokTZqPY61pQxmSWau9hQ33hTnsbYNzGS+bX873cP+FFK8BWyjOrVQvD1
         Zt2AlMPB896sHtZiBy6dcCuj4j/0Y5LlnD5CWKdaTjPsFQ7a0UgtVO40ENonUPAPVN4T
         MA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889751; x=1703494551;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFBQ/10wtaKL+8m10BxYrHbjlRlg8Q+PUaAuMUkYRWY=;
        b=xKnJvOdyRcXjUfCYNunT4+TeNwlmdPFKRzTvTbx7OaUjCv7SELlM3514AsQrvyHDYL
         jloZjIJS4Sy72LTUJML0M7y3r4/oHML9dRCM0IdwqLogg36YIdRbDdkiYIRJF2/DGgn1
         wIG8vM2ARlToK9+5we43IAcOSgBz/ui6FnnONu2xa6UCkGYoSapTCABbDPCP4ugb/gra
         A+6+kerl4Z9HFtI6WT1WUWqXpMzhpNrbg6RUM822HAPsRtyvhLg/wDt+2lKwp9JL2M86
         EgiufrEYTUhIuVbkx4ys1z4hpYTO8L92eOVlrfD7FRUnD2lVJASHuna1HyoNXh5AX2/L
         GPBA==
X-Gm-Message-State: AOJu0YwBK8RKk2KZOo6koxjPuXSyZcp5Q1UwY8EdMVwsnBTfjSeePfvN
	8aycPEq0kS2twzohWHb3eFrhQw==
X-Google-Smtp-Source: AGHT+IGdaDWiUH0CwMnQkddG5d+4BtRQEhrjhNcW6sdESY3tLDSH5IHVJmBaHWt9KenF3gsBJ5e70w==
X-Received: by 2002:a17:906:ce4e:b0:a23:2cc9:3bde with SMTP id se14-20020a170906ce4e00b00a232cc93bdemr1457395ejb.22.1702889751502;
        Mon, 18 Dec 2023 00:55:51 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a1f75d21bf3sm13129570ejc.6.2023.12.18.00.55.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Dec 2023 00:55:51 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 18 Dec 2023 09:55:52 +0100 (CET)
To: Ryan McClelland <rymcclel@gmail.com>
cc: lkp@intel.com, linux-input@vger.kernel.org, linux-mm@kvack.org, 
    oe-kbuild-all@lists.linux.dev, djogorchock@gmail.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: nintendo: fix initializer element is not constant
 error
In-Reply-To: <20231214172541.48370-1-rymcclel@gmail.com>
Message-ID: <nycvar.YFH.7.76.2312180955430.24250@cbobk.fhfr.pm>
References: <202312141227.C2h1IzfI-lkp@intel.com> <20231214172541.48370-1-rymcclel@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Ryan McClelland wrote:

> With gcc-7 builds, an error happens with the controller button values being
> defined as const. Change to a define.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312141227.C2h1IzfI-lkp@intel.com/
> 
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

