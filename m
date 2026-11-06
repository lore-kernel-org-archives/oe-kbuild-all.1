Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999116;
	b=x5yGl7XylVBCilpaaxJIY5fir17AT4kT2Jh+fNPJ+tilVrRZA9HStG1s56AJU3AoC6Ct
	 RxqWAKlp1wRuu7NRiujeJuRfw/aSq83PRN8AIzTrYEYRpZTtIKzQoAWXmqHBA7TiFdJwO
	 dmfDlRwWrxNUPfrCTFtqux5R3m9OZW6q429HKOptN2mBIgeOIWOgjGruX1m0icz3nS2KD
	 o4JNst42bAfv/PiZWmTn1LVeR/y3nDNl6PSWrt33ZToqV9OYv4X9nJqHfaB0MjsROr4ke
	 CbMulLxzrx5Y+/owhRyz3FiPNSAjhFWY8fztLtmWqtX5YEU1iSilCkm1jvK1512rcvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BgrNDCfl/SsrxMRmYKjeSVWOsuxznwiJaBqgWxOgZOI=;
	b=rFyDRSs0c1AKr255lAdcWzLmTxgLOnPz8yCtsGcC9mFV1LobTpAhA8l0hMgxMpTh9L+g
	 hb2HNC2iXlEYH7MqKiuHZtqVs1HdsTrZ0VRabCEqQSZcfeCa+e/XOIIR/3slVjCQZ1EvI
	 AuwDgBHQiLUIVzwhxwXaoy51xWYGVZnOrFoCDG9CKFz3BjoD/Cj2697yH5vlVqPlFV0Bw
	 PK3RXrR4XnjWJ0FWU9xBEW9xXKa+vkU49rxeM9KlSlcRTYr3BhQVLVAc7ACYUDxT7fgx7
	 hMVillqdKQ91tSNWdbd7QswO08ce7dDjJghc3BI4/r6kW3gqFxA3MuRUZbZiY4toswA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lkr5wjCw;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB43606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 21:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB43606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Lkr5wjCw
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10782375e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Nov 2026 13:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793999114; x=1794603914; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgrNDCfl/SsrxMRmYKjeSVWOsuxznwiJaBqgWxOgZOI=;
        b=Lkr5wjCwVyrbfsaeAaecODAhZYQA6vZU9dISgz0CsH4xkm0x+85s9lAoM6KyekGc8u
         hW43GWslBlWBHYGOPQZQ20kUvRklyslrSLg4gfDzIipnyLs6J/0dzQd20uV+NI+BaJzE
         0FUSkEY9MZMmT+0h6MWZC3iaER7JVQkQuUu0p8A9ABisYkFuYDoYasvLypPDjtok9dVD
         wtv8YkzrBNeqV83uDIrD5oCTeoXpe1D9IIWESGg3vR7MCKhadLeKTOVIT7Xr/18JYuUl
         rjxV1BViKGDjPBGhlf5XZNOcj9ea347292E2Nb7QPo/MDbP7apWKNyQFIq1vaO6bY/M5
         DoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999114; x=1794603914;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgrNDCfl/SsrxMRmYKjeSVWOsuxznwiJaBqgWxOgZOI=;
        b=bTnn2D+VYcDzWoOFHIZOENn8+cUG8aeQndVz6zvizPoLCflYPvCj2PRYl4/FtNTVgL
         gVcPlXg6s9UfxO8BSwYlwrkxWmoMs+n4LW/HjxWgrNZ7NkDz0xAcC5+RTvvrj+oDSXEy
         PqOfY/+QgrCjkXCBary3kYB1w7VWwmsR2C+dtvT4YTRL4FrLTacpry6prKoremAx7eFK
         j0QKaSwyN+RK5ACCh3C6Zrfy3Fu9VE+P3xSWGoCKYRera4ikXUe/HqjbFDmrot+YoDP8
         lefVPSwtgLPYCL/Gg+psHfGfLPsHpyF1ZVV9gzzG5rCmXfswWgoxDqUZ10Gr8w/R5Q5A
         +fAw==
X-Gm-Message-State: APuU4Z+KukNG1VvMOXt3g3fv//n+X5j8hp7dMuljMQzj78MQNorP2WPF
	lfjHkf3HRIOHsgo5qG3FzomXdhI4vY4tj7XPoDGzN1+nkhKCzJgN2sjc59EOSQ/jp8U=
X-Gm-Gg: AYBFou3ujW80nHpBSVByyrWaHwcNNxDPPao2SX1lin+jfZntRlRsQCWh1Szc3kVnTKv
	FKUMwZImHivOaCeLQM1TKf0JqUFHE7YV9TESXyLO/eWEDcXQ3Qf/A5yFdBSvHe0N1UT6iBwo3YB
	oJ3XGbzCU1cXZZznC/hOOFLAaXn7oZHBgIvlwh29IWfCslatiFW32Ba6DAterD09u1CziqAK9Hp
	g8tgYi57k6WtOwH++vR3ewhlGBHGfh5MtrzR3f+B5YEeoCcii1fiKeNfZE4iiOzN1VNlHdB6Zil
	Rs23BdtxjXXZksP/h+FiAFAbwoBKCihyt9kBug38gEKGsRxRp5owO4z7JfkBycfylWm//wCtWXL
	Z4HOmNVIKt0kNu09uoxX4QKb5Nxq4J6OJgJAVSVK1bCvOE6B9uEk7SNdH7Fyldvj44JkjLdkPZb
	MSZtK8WBn5yQXnuyC0gp2X5hnBgtsMPPln7CIL5uBtYKWITOb8QS/j5DQIaL1lz2dvNCuvSxh9M
	AxKoeV/YgRA6/oVA1GFLul1v/KECTyDa6L3YR/r8BDVdBxfFJVBKSr9j6nr8RaHCIxmIFEPul8I
	dmo0WIxDwHHuMu7/Em/l
X-Received: by 2002:a05:600c:3541:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4b6df029074mr64705635e9.13.1793999114383;
        Fri, 06 Nov 2026 13:05:14 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c1df6sm8239720c88.14.2026.11.06.13.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:05:13 -0800 (PST)
Message-ID: <8523ef0e-426e-4be4-8061-27f69c65f589@suse.com>
Date: Sat, 7 Nov 2026 07:35:09 +1030
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1261/4145] {standard input}:61662: Error:
 operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r27,r28,-1'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <202611061612.twOQJVLd-lkp@intel.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <202611061612.twOQJVLd-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/7 01:43, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> commit: 8a13fc366acd07c58a72b0eaee2c1e38f9280cee [1261/4145] btrfs: convert volumes.c and block-group.c to use map->stripe_len
> config: openrisc-randconfig-r2109-20261106 (https://download.01.org/0day-ci/archive/20261106/202611061612.twOQJVLd-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061612.twOQJVLd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611061612.twOQJVLd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     {standard input}: Assembler messages:
>>> {standard input}:61662: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r27,r28,-1'

Not an expert on compiler nor openrisc, but it looks like it's some 
special path on ilog2(), which is mostly fls() - 1.
Most architectures has dedicated fls() instructions, but for openrisc it 
can falls back to generic_fls(), and it can return 0 if the parameter is 0.

This fallback path results -1, leading to the above warning.

But the problem is, the stripe_len parameter is already verified by 
tree-checker at read time, any value not 64KiB is already rejected.

So the fallback path should never be reached.

To me, this looks like a false alert.

> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

