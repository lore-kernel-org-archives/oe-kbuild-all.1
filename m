Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52500171679
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714482785; cv=none; b=LUleDYjTYpOAx5pclPe0o1MisGjSvATLgehpHFWExlDwWkHcCq0B2Yy0PINhnkPhXoJRNPXGjv5zAGIjnsJ6CPBevzpQLEYOKI90lqfVpaC4H6ThgyMU/KiPxguaanqiTsVIMRhr5bFLCZH+BU66WJ+PzT48ihJJL7CRH3dPifs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714482785; c=relaxed/simple;
	bh=Ne5Bi0B5WsvRNZIhSyh9MsEOS7OU9xMrt51TWhQWQEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWbWJtE5mLkn+3p0KndnAB9i51HNTMG9gMsTXY3EUOB4wRbUWl4FfaWzt0KKJerQippRrBi3NfLUN380an6tUagmuNr5nxqhdwtD0EknJDTH2a3dWm23FxkBwzl1hy7+kHB+4E9SmaHCigD7mfuQpf1QFAqET0RE3IBybQ77LUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=LCtg2Avb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="LCtg2Avb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ab48c1c007so1507902a91.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1714482782; x=1715087582; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VDzIEg1ZVe1cydRAdGBXm27kG5sPMrbA3OUBoEoLQc=;
        b=LCtg2AvboTl6S9wxppHw+8WxvKTsIRk1G/LhakBm6g8ebk+eROnjRJx7fryirngVXF
         AuR+tSXlkKGDaBIhb1B1xW54A5iXz2H0BejpMYdzFZk6G94/4vHhGPtiCjsQ3mRCIMEX
         EQa5ewNa2C8mHgNMVHI4uvZb6poiLFsWqWdw633ZSmrCIosf+XqB27s7ZXoFRqGu3IvO
         RZ6FbTFYvy/cMb+AHPI5uABAlXscGNUper8hcYGno+qzFvkuk+AxLdeGe44Lw6eTzs6D
         qT563v4IkDyNvk0ZwM2FPqiH1/BAcfN9QQEvc7e7+ZQnIuuBM13EAvFmKW7AYHB1OqW8
         XVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714482782; x=1715087582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VDzIEg1ZVe1cydRAdGBXm27kG5sPMrbA3OUBoEoLQc=;
        b=xOH+BWAz07M2vUAy9gurco0Q/X9IZgHN4XelyQFtiRwfaqUeyjMeAHgUxQYBBdaIx9
         XvxV+hqnQYiauw/WvHG2tqQ1nMJlEJLBfxs5sC8UJIueXF0JDpb4Dbnjs4gQa0HRQCxA
         d5VjbdtXgBI0s1u/Yq0tuXnuF0qWO+9pIGX0HCd3M5CmbVSFqNLJ5kkrs/DG+dG8gfyA
         bw1f4syNRMkkcK+rizNCN0VIqaUtZy8NxROHEOnNczCA+OVwtyTEundEES9rYYzyRk3h
         29p4kpVECPgYWuU5b5awt5g+cEfP+xIr8TMeM2svdM3Dj0uQ1pY10f+ZpSqkmSmo0WXH
         +7Bg==
X-Gm-Message-State: AOJu0YzqIwP/OF5lpGuU+gOMm03CmsQP8XiO6TikGciiIUNsxo5zK3pq
	f5fN63EU2DwM2fp5JzlZFGIGIlzDlGV5fPKUYpnWJxiJHBSsMRaat36EoZ+Zzc5HwQQpNYls8u4
	S
X-Google-Smtp-Source: AGHT+IFy60/C+LkKXI0Q9u1ZeprTkPYIrBZ7ByLHCGACNHhu+cMg8tw56ckMqc/nBJwbtqHIKu083Q==
X-Received: by 2002:a17:902:e892:b0:1ea:95f4:579c with SMTP id w18-20020a170902e89200b001ea95f4579cmr15567894plg.1.1714482782471;
        Tue, 30 Apr 2024 06:13:02 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902ec8600b001e446490072sm16656742plg.25.2024.04.30.06.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 06:13:01 -0700 (PDT)
Message-ID: <8e1bbc90-c094-4562-b563-dfea59dd5a20@kernel.dk>
Date: Tue, 30 Apr 2024 07:13:00 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 psmouse_resync+0xa4 (section: .text) -> .LBB102 (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202404300842.JYA2baD8-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202404300842.JYA2baD8-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/24 6:25 PM, kernel test robot wrote:
> Hi Jens,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   98369dccd2f8e16bf4c6621053af7aa4821dcf8e
> commit: 6b69c4ab4f685327d9e10caf0d84217ba23a8c4b io_uring/kbuf: protect io_buffer_list teardown with a reference

Same as that other one, not related.

-- 
Jens Axboe


