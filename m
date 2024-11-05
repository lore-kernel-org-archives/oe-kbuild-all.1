Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F882488
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820998; cv=none; b=oJfCV9pbi7muQvIctJEeoclmKwlvuzhTN9VAr3bWc4YHnghaiwnY3IYTe3maa65NONIjEBUEzuBtivpheTIhPzIsZvUkfhfWwkcczdc/X+LsT+NZf398PbUZVvvZ7/M9x79QCNMzP0hwXZ1+U081Ochb05VnQAxu9e7d9qeIu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820998; c=relaxed/simple;
	bh=3qOAQweVx8go/6a8DGN19gQKBMpSOFnPNCJ71Hhovok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y57jk4bVBc6kfwnSQKDTxf63qsgHQwWBHnby3Iz+wtqyus5W3FNhpJHjNyWnuM3iBL0RMH0SB95J7XZzs412LVba4Gnx89YIk0zNav57Md4dNWPKq8ylHMbP0fDwZSJ02QIjpVVd20Lo0trMvtJTiJeNYBVG7kWfvElf4kyCOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=W2Nzso5d; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="W2Nzso5d"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-83abcfb9fd4so208256339f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Nov 2024 07:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730820995; x=1731425795; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmLLpOa66xKN7e/dPjNSt+R/ElYlNs09AMsOIw/+QDo=;
        b=W2Nzso5dWySa8J17lpPGEpRIy7uduYVqm7fg5cMPjhPV39S6rcaDpRKpKncj5LGXxM
         xzRy3u7c2DGuRYr5faBxMS70vyjSy+ja2wqT3mvLPavGBj3Ip8ZtPLtZDfth7RiqWrMv
         nkb1IW+3H6SWo4pdeg8XN0F/n7ESJ6ptz96NhkmCi2rF3er2XQq08CIXJ/fHfthXYiEc
         zrHOIqTt0cm8PAMgzHYxQbbW0gro9+HVPXKsbo0aRNIOOTa2xe4EWLrN0eMUyPOzhrCV
         geNOMXUcBET/p564MIFU7gkPxDYI+Y9qNh7sXAxM7h7zkEwzKTkVHtdbjRCieiXFGDXW
         45kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730820995; x=1731425795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmLLpOa66xKN7e/dPjNSt+R/ElYlNs09AMsOIw/+QDo=;
        b=T9xt6r7xGCFabo/Ltgi5iC4qd7Ad8sw2C2gts52gAs0Lq7emm0qjbFIcLroXcwyY7I
         1Qjz6LS/tyCQkhX2RzGvfyyeo86pjuh0mZKsVNrlWquRgHOvlmSrtEERs+EonIjPs7K0
         hOZFcRycSQPL1+N6VluML1vVK8tTu7YPfuanVpbp0mgkUCG2BoHFrV0/Tbb0unpjpjLT
         tZdBVbYKFKfdPx6gak3BeR+1MLr8gjUObBY/RvnqClQlwJF7Avorn4mCdMF10CR9Za78
         SL86UlvX2j2FWC1iyVasbbzSzaXkkpoosYjKaQs4tna/pWxowUCnUi2sDC485H6sBr25
         6JnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfrQbbopRkHh5uAfyoWo598nCRWEPMrBnfMMNTx6oxOf/gDpQFPmnlZ7AXDyAYUqaFqyJnLAR4SE55Kt1Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzBMBbGQbeAn2/h2O/BF4vZ5jfJUNUI4iA2uKikUHb0sHfp1q6N
	w2OUBrVOYxZ8E8mTtQpA/2nz6lUkFOmkzbK1/ecgQ4ut164BGbVxM/ClYaCZbVM=
X-Google-Smtp-Source: AGHT+IGb4EKj5FtrVMRuQmc46nAw7b8SHqOu6tMC41J8+QExMoMpOSEGSHwr+Hvnk6c2GHfwyX8Ksg==
X-Received: by 2002:a05:6602:3f85:b0:837:51ba:60c with SMTP id ca18e2360f4ac-83b7196161dmr1254163639f.7.1730820995052;
        Tue, 05 Nov 2024 07:36:35 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de04889516sm2472424173.20.2024.11.05.07.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 07:36:34 -0800 (PST)
Message-ID: <e86904d7-bf42-4b38-889e-3978e89358f2@kernel.dk>
Date: Tue, 5 Nov 2024 08:36:33 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: block/blk-zoned.c:579:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 583.
To: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>
References: <202411050650.ilIZa8S7-lkp@intel.com>
 <20241105153422.GA7132@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241105153422.GA7132@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/24 8:34 AM, Christoph Hellwig wrote:
> On Tue, Nov 05, 2024 at 06:52:25AM +0800, kernel test robot wrote:
>>>> block/blk-zoned.c:579:5-24: WARNING: atomic_dec_and_test variation before object free at line 583.
> 
> Does anyone know what this warning is supposed to mean?

It's supposed to mean "use refcount_t for things like this".

-- 
Jens Axboe

