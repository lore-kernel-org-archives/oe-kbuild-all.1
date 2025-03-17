Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFC3200BB2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 21:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742247733; cv=none; b=Ofh9qmfUJkk64nO/P6TP+o75/gY0y6myVplIKhVsr5wi+TYHPJiDgpLyKxF1ey8mVEfRv8spzSYv7Lpu+Vf2vNDgzSJBJ3o4qVn7uAIgclOhKkFGCGwvGWhbgDxDpc72l+WPqedARSKEski4vnngDBuKHBRdT9Jxv5S10WJqBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742247733; c=relaxed/simple;
	bh=hAKhrjTJ8cW6tEcidxQFBrzMI2ePXYWnTzoCVDHHlgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LI16LgHGzmJpkQHB2DmgRmYZOcOUXaZ9JxwLBRt2Dcy7MRtbyBg/JRBMotiGismtP/v88hn9nha6wqbWujmkpWil0Zgl+o1Szyu0+Lr2JVFGPMfnvWVh3aQpI1/Ah9WX88HF244Rhf5RkmITOaPkhpsfjUKOeVWDaBqqO00aiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N0GiuxDC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N0GiuxDC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso27897435e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742247730; x=1742852530; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=POcHHQgaYgFLWQSUDJXfqUewrWAzGyNQUQAQf+FF/ag=;
        b=N0GiuxDCK1hMAhkLXcVTvIkSordT299vj+VRZvQT+IJk23Jm5nKwQfZBGZRtMOKtrT
         tBDSQ5fuwV9bewtwzHIz8FQGxpJ+NtUyz5td0HC9bAbdbZrHyI3EtAzapYhZu3HPNsd2
         kOWBD+DQRaDhUA7Glpmgq9hTWpxrpzAHPFebIyEghYR+sqE3fYDFfNn6+yo/BC2ibf8Q
         3xSTwxXTE7xcPPCwhAk2AU+XOFyyIO9J+MVqBjV5h8+RKNlr/denjxtwqa4VippNF8qh
         j/fWn1rta3ORW2nF06fZN4y99wvrxKi3Fcd+hgY5hsnD78D8ebF30moMLQyGBikz6H2h
         2yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742247730; x=1742852530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POcHHQgaYgFLWQSUDJXfqUewrWAzGyNQUQAQf+FF/ag=;
        b=vB4jYd7d+d9pnOCh7MXPGo2RldcwNU6GK+uf4JzXFVXGC4vxshAOuh7kUpTUzItKR0
         DcXRMv/uQtYBCsVSO0Nx06V3mI5YGMnK1BQNNwly+oPoCuYcJVvCVuLwSW6jbpRrzKAK
         3N7z12gUF/RNXRVmHfmCpKK2ZfQqW68RohdpVn65KOSHrKnoUq54gLoGaoIsT9sdJm2k
         3dJLyMxaZiHxdNc8HiTiAI0Xz86vV+F5K6tpW6g9YSuMVFH4xA0iGWQNb+rpflmUaOiT
         Vboj77uCEcL2B5rLwG3hk+uXYKxYJJ9/z1r6sCy3W+YtxymUJcXtLpWcVQVSNUN1/Ah/
         /ZMw==
X-Gm-Message-State: AOJu0YyvHJI0LFuD8N/PHl9VOQpXKj8qjyEb5d6n5dVVB8q7dyA+uCSr
	k4CpPAitC+7hLUv56TDRr61xZpbRB53uDrWARQy7Vo52HV2ii5/pMm8SRU0iVNY=
X-Gm-Gg: ASbGncv2HzN9neTSRi1S5GaVrugjhL6VY5Uf0dpiJNgSEDMoYnaAQp972iBAcCZKXxu
	lZHLdkfEOGlpqu0YmKKz3jMIG8TJQ/ZfeT1FYtcjqgMQ4E7XH/4ycz6Ist7Lidok9lkuMCUi7Ai
	qhrBjDSj2JttXvm0cn1yA48Mm9i7EYaVCzi5CzeBu2rhypvHvxjrgF2v3AWQec4DclhkWIaW3Bm
	IcSVkL2GeV1XcNMPKpzHZN76pzahWDMp+3pESeXY863D8Ezp+uYaQav0qUtZLYyUKKbtQGUDuC3
	t/Ax4sD8UVeGImkNxZNqNub6ZHLeBJyadeBFZjk5gB1BszSVRNMC/HF+kC1UtsSybsKgFLcT
X-Google-Smtp-Source: AGHT+IEPUeCiel2PAc1MhSAOFQXbMNgiQ0wr+tQKk0JwMYFrSYAwObFm9JZCiI0vNwCBZ4qDX+sc8g==
X-Received: by 2002:a5d:5f8f:0:b0:391:37e0:d40f with SMTP id ffacd0b85a97d-3971d237dd4mr11395415f8f.17.1742247729628;
        Mon, 17 Mar 2025 14:42:09 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea0408fsm7691594a12.42.2025.03.17.14.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 14:42:09 -0700 (PDT)
Message-ID: <b136b9a5-48b0-44b3-9f1f-a0e228e7c6dc@suse.com>
Date: Tue, 18 Mar 2025 08:12:04 +1030
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [btrfs:pr/1157 153/155] extent_io.c:undefined reference to
 `__udivdi3'
To: dsterba@suse.cz, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <202503151741.3rChx4vg-lkp@intel.com>
 <20250317131210.GV32661@suse.cz>
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
In-Reply-To: <20250317131210.GV32661@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/3/17 23:42, David Sterba 写道:
> On Sat, Mar 15, 2025 at 05:33:56PM +0800, kernel test robot wrote:
>> tree:   https://github.com/btrfs/linux.git pr/1157
>> head:   ba17f60c94e718376b5573cced1493563b1d4300
>> commit: 49c863d9d6690e1ba2ffa093994e03a0cefd50ad [153/155] btrfs: prepare extent_io.c for future large folio support
>> config: i386-buildonly-randconfig-001-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151741.3rChx4vg-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151741.3rChx4vg-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503151741.3rChx4vg-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     ld: fs/btrfs/extent_io.o: in function `writepage_delalloc':
>>>> extent_io.c:(.text+0x3095): undefined reference to `__udivdi3'
> 
> This is probably because of
> 
> DIV_ROUND_UP(delalloc_end + 1 - page_start, folio_size(folio));
> 
> as folio_size() returns size_t which is 64bit.

It turns out that we should not even use folio_size() in this case.

I'll change it back the PAGE_SIZE in for-next branch so that will solve 
the problem.

Thanks,
Qu
