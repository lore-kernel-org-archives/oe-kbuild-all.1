Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794A21517C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280123; cv=none; b=uo8CmkmC8MxoPYPHJb+K0RenXYbnRl8b0BtXfdBw1sDzr44SR9ilcmwu15EsCzekyQ+6pwSMDErfaM/b/FVRrkOO1h0al6pvZSIfCne8ArfwD9XNUJAZ6k+7LqSf6KvONp8o6MnxYNs02TDYIDKkb4jn43CMd/mh6VhBrlut78c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280123; c=relaxed/simple;
	bh=+NpVQGFhmS4rPioi85uTEcjg6f+US4Dhi7gtR3weyBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LblovKCEPzKWhp2c4wwDUHoKwu161iqJdAoCX8iluWBDP+JNagQ8vWq46Jphb9Kh+ugvfJCLtw3Kso9nt3p5SDDSXNjqB9M4E5tqkb6fJ/JxRH8PbZ/RKugvg9FykI96AUa4ypxbUX8OQ1sRV65bfgUdnYMUSpCXYWatNB+1f5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ABeOLaYh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ABeOLaYh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f71831abso96212f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 13:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750280119; x=1750884919; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nRRhMFjufeLbp9SWZPabXIdBXStp8C4hFpfOMJXdYoA=;
        b=ABeOLaYhno+s5k2AVq5ty40+tUw6Guf2Ix+tgmb65ZOpbFwiXmz5K72z+YUvy9RsVQ
         whuDXyi9Ys8E8NcQ/ElgL1tOjjpxZqJ24el80gz5sxQuFbtdgOfqc/eQjsJjFKjDsr94
         a1IBrYZxI9PoamVEPZMD+V+9rPtlFCNTKRQzndXHtN7ChBGRSvAGw6f9kR8f5B5DJwPx
         uR/dIBwNVPbp+bGWyoInWM6mrIzdVC+vHeLfsiXZ0YZDLbZHhVqeDwNfa1ofhzRdDJBr
         JkjfqklOQCj7FV6YASwh3IPbYU2qAE+K9lfkPDA/FAKqeXsHUF3qD78YxQW3CdHxjgDQ
         7y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280119; x=1750884919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRRhMFjufeLbp9SWZPabXIdBXStp8C4hFpfOMJXdYoA=;
        b=V/04R7/gZ/CCeHwSmg14WLg4O4cwWVQT7p0ZKbnxgPhi1chs8vFc3TTnFNEb48hxGn
         0F/w2RHuwwaxE2qdNGmiYyybr0ugj2xKkqOECB5JJe/iMennoBBVGfAYnF6yeoz93Eaf
         nCND32Y9PNh4zLp5neAmxMfc0dBelPnO0f+cV6ei2qLDxoUqh+ZfPA37D/l2uwLn+LyO
         nWI6j5AityjXcyFXxkEpSWAhFg/bD8Rcv1oRMwuYIRyG/CSg9OtgWJm6x+/8191n6JDI
         RPSJEXJkSSeoNakmjehI4TAOBkG8LprWb4PU5S1saNGOLLg6NuZms37mcu9teinVgcj/
         IMWw==
X-Forwarded-Encrypted: i=1; AJvYcCUa2ICHM0ifLcV2Hxz4kobazTsPESHYBQgLM+StMaLkCA5g+dMqn87ZT3eMu2bfImdB614IHHWAQguR1qcL@lists.linux.dev
X-Gm-Message-State: AOJu0YyCuuNTjy/KZ46FZd4moTF/9Wdt6aUrmc9ZwqhQfQSTvmD3OWxD
	vJN4G01qWmYWAAfpeswaq4RbaRUGnzD+JIi0Dw+mm6L78bGWsAmkhXxKlOp+uzj9OsY=
X-Gm-Gg: ASbGncvHPQIE2itd7MsM0jqaLQfJluORCOtjGIvqAUyTzlm/zAVzxVQ9T6PwitfmOSW
	eNd+H+4T+LD5EMEZm3qP4dwC1PWtSYJVZh8A2Ayo3LyBpS3mMb8W5NlIxKmaUlACEzrMrkj2Hr3
	eFI0JR7Wyf1ybJhabWqyezcUQo+cbMP+24Eba3yOm9DeRmdOYaMeg5jy8SjvED4+771py1+rt1Q
	3pps9dHKYktmK7o4e2eqOMSRayYpwrWbPPZQdIcDczOVAevxbGPRghVrNxAUwiRokKgxA9Iyn6Y
	KeYzdrp7igRcGAO62qvip2zN+l0ugaUGsocIW/znTy6DMwhdJtjUXYbPVogpOrzNQSNTC7mP2tI
	2IJcxsqpHAuoLS5gjfxDruX7i
X-Google-Smtp-Source: AGHT+IGDSkKjEo5evK2cdRF7Dfkyixu/R8GRzZkXd330C6ZVRH56En8ZvkkHo05zOMDMsOa/udBO5w==
X-Received: by 2002:a05:6000:26c3:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3a5723aed82mr15789002f8f.40.1750280118863;
        Wed, 18 Jun 2025 13:55:18 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe16803c3sm11488101a12.41.2025.06.18.13.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:55:18 -0700 (PDT)
Message-ID: <ab681f30-1afb-47f7-afaa-6209fe56d4b3@suse.com>
Date: Thu, 19 Jun 2025 06:25:14 +0930
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [btrfs:pr/1157 1/1] fs/btrfs/qgroup.c:359
 qgroup_mark_inconsistent() warn: maybe use && instead of &
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Filipe Manana <fdmanana@suse.com>
References: <9ebc0142-96b2-45a4-94d2-5e3100c599f2@suswa.mountain>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <9ebc0142-96b2-45a4-94d2-5e3100c599f2@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/6/19 03:26, Dan Carpenter 写道:
> tree:   https://github.com/btrfs/linux.git pr/1157
> head:   b9b695688148bd512273989145bc6ca0e272a53c
> commit: b9b695688148bd512273989145bc6ca0e272a53c [1/1] btrfs: add extra warning when qgroup is marked inconsistent
> config: i386-randconfig-141-20250616 (https://download.01.org/0day-ci/archive/20250616/202506160432.y5tEff7D-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202506160432.y5tEff7D-lkp@intel.com/
> 
> smatch warnings:
> fs/btrfs/qgroup.c:359 qgroup_mark_inconsistent() warn: maybe use && instead of &
> 
> vim +359 fs/btrfs/qgroup.c
> 
> b9b695688148bd Qu Wenruo    2025-06-11  349  __printf(2, 3)
> b9b695688148bd Qu Wenruo    2025-06-11  350  static void qgroup_mark_inconsistent(struct btrfs_fs_info *fs_info, const char *fmt, ...)
> e562a8bdf652b0 Qu Wenruo    2022-08-24  351  {
> b9b695688148bd Qu Wenruo    2025-06-11  352  	bool old_flags = fs_info->qgroup_flags;
> 
> old_flags should be u64 type.
> 
> b9b695688148bd Qu Wenruo    2025-06-11  353
> 182940f4f4dbd9 Boris Burkov 2023-05-16  354  	if (btrfs_qgroup_mode(fs_info) == BTRFS_QGROUP_MODE_SIMPLE)
> 182940f4f4dbd9 Boris Burkov 2023-05-16  355  		return;
> e562a8bdf652b0 Qu Wenruo    2022-08-24  356  	fs_info->qgroup_flags |= (BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT |
> e15e9f43c7ca25 Qu Wenruo    2022-08-24  357  				  BTRFS_QGROUP_RUNTIME_FLAG_CANCEL_RESCAN |
> e15e9f43c7ca25 Qu Wenruo    2022-08-24  358  				  BTRFS_QGROUP_RUNTIME_FLAG_NO_ACCOUNTING);
> b9b695688148bd Qu Wenruo    2025-06-11 @359  	if (!(old_flags & BTRFS_QGROUP_STATUS_FLAG_INCONSISTENT)) {
> 
> This can never be true.

Already fixed in that tree.

Thanks,
Qu>
> b9b695688148bd Qu Wenruo    2025-06-11  360  		struct va_format vaf;
> b9b695688148bd Qu Wenruo    2025-06-11  361  		va_list args;
> b9b695688148bd Qu Wenruo    2025-06-11  362
> b9b695688148bd Qu Wenruo    2025-06-11  363  		va_start(args, fmt);
> b9b695688148bd Qu Wenruo    2025-06-11  364  		vaf.fmt = fmt;
> b9b695688148bd Qu Wenruo    2025-06-11  365  		vaf.va = &args;
> b9b695688148bd Qu Wenruo    2025-06-11  366
> b9b695688148bd Qu Wenruo    2025-06-11  367  		btrfs_warn_rl(fs_info, "qgroup marked inconsistent, %pV", &vaf);
> b9b695688148bd Qu Wenruo    2025-06-11  368  		va_end(args);
> b9b695688148bd Qu Wenruo    2025-06-11  369  	}
> e562a8bdf652b0 Qu Wenruo    2022-08-24  370  }
> 

