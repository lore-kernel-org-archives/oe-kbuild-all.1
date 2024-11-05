Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA3413E04B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822203; cv=none; b=cMmCJbUTTV0SCVXIykNorMflnPXURNDSDYbBkU3q6ipCg5F5kVXsCCC0s7nprfTyeiv1k4vZYy2gE/i0dADeCkV5NwRapT4nYld1h3CE+UI/770DrS20lAG/Lk3LuijkO1qPCM82z3aT5bHNK3K7yKcQf25q3f0kYlfNqRDuBKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822203; c=relaxed/simple;
	bh=92AZh3kx5JsENG6GS8STIOKISYRx7SKwMhQXCM9A1yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoeCXjD3MneVdOliGPEwJxsh93h3fHe/tEy4SNCta9JrVnLGSRhFi/w5aj/I7cnoTLPM9luh55iwf9R/m/8FrvGTN5rYLVbazUZYSQ1mkUuhUUzuJDbqDDD3CerKHHHjshDMDe+PBDCXmSWFm8Li1U7hIANRkRB8HIR14p/HYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=d4t4OaAD; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="d4t4OaAD"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-83a9be2c028so196396739f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Nov 2024 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730822201; x=1731427001; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j86P/j73xXbIc0Sgbkjbx26V1QvrkTI65ukghjFGMbQ=;
        b=d4t4OaADlcQtZ48JJtkA/ig6nwbZKsS9k9Y2qbc+le/VFFQ93mr2Vq9kR+YxE4/k5e
         +K1and0mcCktJT6s39YB8rMNEUlt1wP1D2ZwG0m/Pb3aCLFEEupQJlXuQGOOuTQm41zG
         MplAuuxgCAlijFeTii3m4olI5GdtESc+zaB9a5XW8PPsM+dVRpNmos0ws+pcipzOpYv7
         07BcNtTBdliXG/P5/2TZgp+nT4wKJJCs3ljrc4VNVCeO3nFV1CY9qsSJWGaG3AMD4Ff5
         Uyd/EJLw6bldIT2kOscTAVw38QGOaQodASlP+3SFF2wpz6SjBUut9IN/Nwx8iHBZNDTt
         K2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822201; x=1731427001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j86P/j73xXbIc0Sgbkjbx26V1QvrkTI65ukghjFGMbQ=;
        b=M9cx2RvwOLlv1qz/IN5nf25jFp6xs5vch9YIOB3jCWrkf7lTSsokB63KCVY6Wguwxk
         sxWwqnaAQydGl3uopDEoYfZzqGUcS6mvmTM3cagY6IhjIMlyhWXwj1IU8R2q9QuCUHuS
         7NrBR6CpkRMVo1S1hvCo6QWF7TXYS2kAqYXmv10M/mJutzA7mbfsPENZbqxsrnqzSsZj
         1dTMNYdsxhbYjf/LfrKX9nVUIEUod38bG/52Z0N5/vVjJw1Fk7cbBsXU9WMSR1n5D2ah
         nD9eMl+trHeLBcPAymudXU7X6A1Zj70m7nrggY04YTMx4aAetjUUuBOTtDnE07GjwLja
         Uspw==
X-Forwarded-Encrypted: i=1; AJvYcCWQITSwHMovW//CBwXfd5J8W+xmrFJruXP6I8OTAKlgmRXFth7WlcsnrkIKa/brYl7OcEqcz4jdRxujaYLq@lists.linux.dev
X-Gm-Message-State: AOJu0YyHuCA4em2LjjHnZrTgh9Na0IWnn7kvbP3UWwF0zgma8GYJnTJx
	WQ9KZo310F6CwCMtxFVOruDglkpNsBYlZfKz2oWB/tZiCISYVlED/pWe+iOonfk=
X-Google-Smtp-Source: AGHT+IGilxiFrTN0q87owPzZjbrVhQuTpfBPdHKU0L9k7569VXUC7mgu1negXK7Gs7JhHxoT1KW3aA==
X-Received: by 2002:a05:6602:490:b0:835:3ec0:9 with SMTP id ca18e2360f4ac-83b71a1b34cmr1422609139f.15.1730822201494;
        Tue, 05 Nov 2024 07:56:41 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de0497812fsm2460484173.96.2024.11.05.07.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 07:56:40 -0800 (PST)
Message-ID: <5b55417d-6b27-4186-bcfa-d6952624e99f@kernel.dk>
Date: Tue, 5 Nov 2024 08:56:40 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: block/blk-zoned.c:579:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 583.
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <lkp@intel.com>, Damien Le Moal <dlemoal@kernel.org>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>
References: <202411050650.ilIZa8S7-lkp@intel.com>
 <20241105153422.GA7132@lst.de>
 <e86904d7-bf42-4b38-889e-3978e89358f2@kernel.dk>
 <20241105153733.GA7219@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241105153733.GA7219@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/24 8:37 AM, Christoph Hellwig wrote:
> On Tue, Nov 05, 2024 at 08:36:33AM -0700, Jens Axboe wrote:
>> On 11/5/24 8:34 AM, Christoph Hellwig wrote:
>>> On Tue, Nov 05, 2024 at 06:52:25AM +0800, kernel test robot wrote:
>>>>>> block/blk-zoned.c:579:5-24: WARNING: atomic_dec_and_test variation before object free at line 583.
>>>
>>> Does anyone know what this warning is supposed to mean?
>>
>> It's supposed to mean "use refcount_t for things like this".
> 
> Have we finally resolved the performance problems with refcount_t for
> fast path operations?

I mean it's closer, but it's still slower. Will always be so. Does it
matter for zoned devices? Probably not.

I don't think it matters for this case. It's not like the ref itself is
something that is user controllable in terms of being able to get
anywhere near an overflow.

-- 
Jens Axboe
