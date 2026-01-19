Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC62F0C78
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768807682; cv=none; b=MynmqG63w8y0BE4FEj9/ewt6wsFK6Si1gYWmkUls4E93qimb1X7Ljp1C46LsP/OXIyQLRhsxMbpi4d1lZFf+TxonVFSkcyovKy0CbIUm/AGm9PeoHitaYu3S2DoCK0/84Eb9zHRGLL2Apzear7V2QPiR9xJLRO/E1MnesgbUpiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768807682; c=relaxed/simple;
	bh=d9xl/iI9UPX2IDDp1nKA5HJOuKaEYnYwT6b0wN7INJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH1+fgjLYReYMLPencc10pGAkQao6pKK9N8qNXj9CMtrQPFSRy6NoNms9rawInYf3MmOPZEi1MxarJg1s7PmSphuhhOfVjWxRbBcVYiJXFt74hPqvjHFT1TtSmjQaKB3OZ4voBqLHAFF/WphJ6lVcd6bthxBpkG+7R+voRD1bAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SwdFxYVB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwdFxYVB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801c314c84so22150805e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 23:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768807680; x=1769412480; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gjZF61Mob2R7lpJD1kAufU/8HzfWHmcAmOJYV9b0W4k=;
        b=SwdFxYVBWVUEp4kkYV2ehUteL3NjogoXwbdvF1Jm3gtl5mixJZCvjSn0mO7dX82dLW
         WnbAgH3RvFSdfwcSUcU4/EeIkiVVU5ncmPonFAo29jYT4nIXnRP2nbsm6e+7n2qm5wk/
         1see9O9JRlNyHfCEIizuwEpup530cy8pPTXB1wdfjctHaL7O0j3qMxKWp5Z97R5f1n4E
         npRFvwRkeNpcTDFTcs2t6sDUTkF4R8tnJyjtBjnZ0ZLTmeztv4Pd6zHrvxoTn/GBxFuO
         TuJTVkogv2x2UNvQFMQKCt9EHamRji7U+SSjayeWOjixqItZnLA7ghCkxlaZkkjHLBZ/
         9o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768807680; x=1769412480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjZF61Mob2R7lpJD1kAufU/8HzfWHmcAmOJYV9b0W4k=;
        b=j9zkc68O1Y3nLuFx3ChvYU8bEOTLQdPSf2Bg4SdhwhL5nE4nmPiAPNXDszLt3aX9A6
         eRV9jwz1eeUWZF1khm1QlLyqC0JgS0nEBxw7MheglYaXLI/GTceRxMV9Yxj0moo2tkLa
         U1dTppPfDM+9d2fhKsqScFWhjD9OU81FjqUGzicSrU1BriYYbPsooIsDj6QOZztkgPAL
         wrb3PbyO4W7O4EpAM1RHBBExr1MwAJCh8MbqH35ZVjQp5vbNG0TwMp6hDBLcBmG9Deup
         yxSg8Rmg3aunrT6I0uNtgsMaoi7yG8XFdhBN9NRLn9T7Qtxt9HiFOOYE6bm/ati4Zf6l
         4P6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRPibaf5C+B8VUsmEVpPxjVNwHEWOjQzU+7Fy/4CbZIi3Cj0dGgUTCLpuKygS1rh4xyBK7kcbON1gXXMNl@lists.linux.dev
X-Gm-Message-State: AOJu0YxsUzmVqrtSssKWQbhd47pkJF/5ZKfNmRfiyEK53WDAol1MCBNG
	BR4yPW1JzWNA3GMGFghyteUjpG8WDN0Dzn7matDeX3w2t6m3Msv5Wf+8A5lwN1xNy8I=
X-Gm-Gg: AY/fxX5M7hRxpx9r3bi3rWI/v0ZWEJw8e2GZLa7IQHEVUnj8UVm0ZhZ+BPEaS+uu24p
	3izSQSAEt9OsV6ss3aFFghO5NVkLF0YB8/zrtuzO9o8xmqxpGkAbQyoi/D6+CzqP71c35WIjyMr
	RzcVEeoCIhPYf9MXMtV4Xr5C6Lec1LOr2CnYjStzTxiUL+hfp8CLg7mYBuebAqvd5mO2ujRuIMe
	8HLuAGk4txYAsPkSREs20gHCdxKXlwNjGr6P/zbIXwDH9qgoibn2NUJ2L79/U0qVxvjUBMSCSWB
	fefUg5pcH46vANf4ou7WfE+3Db9jgaivhuKuE8GVSu0y/drP3wzqWO25EMkiIPr0LZRCz1TyHRc
	843UtfG+CcxiVJESWIU18l3klI82OpR/DgaDSOCT6ZO4xGTGEjq4ffmnh+p+ry+TDUxaBQF6y+v
	epRtBZQ9yGFEYQTaiW
X-Received: by 2002:a05:600c:4449:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-4801e34318cmr129707365e9.21.1768807679568;
        Sun, 18 Jan 2026 23:27:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0475sm212576225e9.10.2026.01.18.23.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:27:59 -0800 (PST)
Date: Mon, 19 Jan 2026 10:27:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	"fdmanana@kernel.org" <fdmanana@kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH] btrfs: use the btrfs_block_group_end() helper everywhere
Message-ID: <aW3c_HzQw-dfQUeg@stanley.mountain>
References: <202601170636.WsePMV5H-lkp@intel.com>
 <9398ca7c-f114-47f9-ac22-8fd8f67214a7@wdc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9398ca7c-f114-47f9-ac22-8fd8f67214a7@wdc.com>

On Mon, Jan 19, 2026 at 06:49:34AM +0000, Johannes Thumshirn wrote:
> On 1/19/26 7:40 AM, Dan Carpenter wrote:
> > d4452bc526c431 Chris Mason     2014-05-19  1202  	u64 start, extent_start, extent_end, len;
> > 7fc5a6968403c7 Filipe Manana   2026-01-16 @1203  	const u64 block_group_end = btrfs_block_group_end(block_group);
> >                                                                                                            ^^^^^^^^^^^^
> > Dereferenced.
> >
> > d4452bc526c431 Chris Mason     2014-05-19  1204  	struct extent_io_tree *unpin = NULL;
> > d4452bc526c431 Chris Mason     2014-05-19  1205  	int ret;
> > 43be21462d8c26 Josef Bacik     2011-04-01  1206
> > 5349d6c3ffead2 Miao Xie        2014-06-19 @1207  	if (!block_group)
> >                                                               ^^^^^^^^^^^
> > Too late.
> 
> I _think_ this check is bogus.
> 
> On one hand  write_pinned_extent_entries() gets called by 
> __btrfs_write_out_cache(), which has the following comment at the top:
> 
> /*
>   * Write out cached info to an inode.
>   *
>   * @inode:       freespace inode we are writing out
>   * @ctl:         free space cache we are going to write out
>   * @block_group: block_group for this cache if it belongs to a block_group
> 
> but then __btrfs_write_out_cache() is only called by 
> btrfs_write_out_cache() which looks like this:
> 
>      ret = __btrfs_write_out_cache(inode, ctl, block_group,
>                        &block_group->io_ctl, trans);
> 
> so iff block_group really is NULL, we'd have a NULL pointer dereference 
> when accessing block_group::io_ctl.
> 
> 
> Same for all the if (block_group) constructs in __btrfs_write_out_cache().
> 

The zero day bot can't use cross function analysis because it doesn't
scale to the number of trees which the bot tests...  Otherwise, sure,
Smatch would silence this warning.

If we remove the NULL check here, should we also remove the NULL checking
in __btrfs_write_out_cache()?  Otherwise there is still a potential that
something will complain about inconsistent NULL checking.

regards,
dan carpenter


