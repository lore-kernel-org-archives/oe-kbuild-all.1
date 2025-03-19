Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB80216F858
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742417494; cv=none; b=YCiKqQRBzZ2BzuNuS9iJ6ucu4M3MKiLUgGqKsuG9NSvvNZ2i7H6R0HOHZFvRA03KcDl9UKydR4fp7+AqY32M+p0I1UbUdNxy/MuKk3mJhkfrhjopw5bT8w6hr/VA7pqIrUJnJw3+YU/eRWw8WmjrcsaBBm4lsMR3sobMDRzvJKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742417494; c=relaxed/simple;
	bh=ln/Fr93I2e1jK5J4KMKb29EJlMbEHlggqyA7RS5bT7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B80nHZVY8kKFRVoY3UDGe9jTboMK2DXadUlbV89Xra7WwLInwF0476mqq65N6CvhD4ul7XJxIF3BI/DHYkJ5n/RHd3+/ruG3L9tVP8ltFP6s+k2D8kaBFigO7ORZwIRoj6NQDJ4dEDzVrqA8vesb0MKYkTWo+cEmrQvk7fDcn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rlCtF1AI; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rlCtF1AI"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d57143ee39so821335ab.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1742417490; x=1743022290; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9e8IJw8LS9/MuZESFGFXisiSkYbyzDl7KEsnzbriAPY=;
        b=rlCtF1AIeclGwdPCRUJSQMGi5/BSqjHXv45J29rWgjEIf+6D12XjD/sowDh70Xd6e8
         Nb8gyA+i/UbqO544bf4SkNDW0/kS+P6gByazra93sOjPtq+nrNC2aHvdDHscK9RihQyN
         /luo5jmDtSarlgv+L6llSSjYzOVPr2faSmB88CU29Q9hDRflq1hgujDHl/vf6+bL/NFn
         Jw96C3bfIgAGuYyTBTawX2Vu7hEBC6f0Yr5hRcPGPacg08rE67QI2p1PEAlXkz2Hxah1
         ZHUuN2IiSqYFmHIVlbKvrk7KZr17AqWxB+ZUzERnAqJnX9OFlhVmyZxGxuLOwtCFiWSY
         U2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742417490; x=1743022290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9e8IJw8LS9/MuZESFGFXisiSkYbyzDl7KEsnzbriAPY=;
        b=ekScjjLZNuBxPkJkfJcha4f9jxfMW8PzgqT2jkXgabUSu7SIeFlcSfwaq1VIwwbSiY
         +wmu9Qdk4x9n5niC3E7NNhdaWbB8BHWUDC38H5wCwIpp9GkbwfDcFuYIkhfZWUZPFEYr
         6B3lsP16y+K6ZVgQ1NHrKTrguYFS4AfXJsVlfsHJmukwyQtb39C3MWxS0I2cSq/iyDl9
         UmzJt+mfqsnMVF7JyW0natVmGV6zi9w/0wtYx5YXeENYgKpWZfKbqe4T025TRKL+yuSm
         SWwlDRYeFHBqXxswfVt8+L/t64E39O6Vp885byB1rdm5YlU+sIo7rQkHs1xA1o0RGPPB
         MtSA==
X-Gm-Message-State: AOJu0Yx5KcIJueRjVCJBnGTXPpDP20YcTd5awqplVG1LZNy29p/pP8bu
	oKm4ipw5hpn+2BqCOg65ritEomz4fCL7J0/ZAG82WA6al4QSMn4/6B4iMCuypcQ=
X-Gm-Gg: ASbGncu2K5oqx8bMnMBS7lXcai49mdD4lR8PDA2WuodWMVsrG7zSUOQ6ys2v35M5JDO
	d4mZRcnOVBbtUZP87wzqGuazRes14OaqLZniFXWW1VYKMbNFjUMqNMYkKOSJISmcjiET59kIewW
	obPyZr9lRV16L63wA6EwLW97UgZrLPeY8vlYUzuj5ZCz9P2Mv0PHWVxLA4NKLc72/Jec1Px9B3z
	eljXGqnTizlRGGPC7aofrm+zvy/XjuARneCqNIjdnaZ2Whov3ilVUikXGvmJMEAqnnaEt3sPUCs
	zkhI1wuOakcirOjSGfAogWB4UFLo94LoIJrG16y6
X-Google-Smtp-Source: AGHT+IFZFvR4V+qnhwc1Z6vXpQ4nfi7Rzyto6JUn3DP7LUXPLW7XYTm/SsYFaDeMAlAKM9EXl84GnQ==
X-Received: by 2002:a05:6e02:1fe9:b0:3d4:244b:db20 with SMTP id e9e14a558f8ab-3d586b9eb5amr46201585ab.16.1742417489972;
        Wed, 19 Mar 2025 13:51:29 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a6475dasm40035755ab.2.2025.03.19.13.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 13:51:29 -0700 (PDT)
Message-ID: <47a8d28a-0d9b-474b-8b4b-e9aa090b798b@kernel.dk>
Date: Wed, 19 Mar 2025 14:51:28 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.15/block 68/68] block/blk-iocost.c:3232:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is true
To: kernel test robot <lkp@intel.com>, Nilay Shroff <nilay@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202503200454.QWpwKeJu-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202503200454.QWpwKeJu-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 2:17 PM, kernel test robot wrote:
>   3216	
>   3217	static ssize_t ioc_qos_write(struct kernfs_open_file *of, char *input,
>   3218				     size_t nbytes, loff_t off)
>   3219	{
>   3220		struct blkg_conf_ctx ctx;
>   3221		struct gendisk *disk;
>   3222		struct ioc *ioc;
>   3223		u32 qos[NR_QOS_PARAMS];
>   3224		bool enable, user;
>   3225		char *body, *p;
>   3226		unsigned long memflags;
>   3227		int ret;
>   3228	
>   3229		blkg_conf_init(&ctx, input);
>   3230	
>   3231		memflags = blkg_conf_open_bdev_frozen(&ctx);
>> 3232		if (IS_ERR_VALUE(memflags))
>   3233			goto err;
>   3234	

Yep that's broken... I fixed it up, thanks!

-- 
Jens Axboe
