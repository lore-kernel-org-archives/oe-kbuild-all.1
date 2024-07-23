Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA96134B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 05:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721713084; cv=none; b=ZSpTbqzFrdtaraJuUjJL9BHsEbP3XJZJdjIiMWtGyEqGtb+FItRts9b1YpgUB70JXw8AZHyLm8y5cWJ5ZrtLplCW1X52Hb084YQt6di+ksyWd2Y9/FihEf+13JAr9JUkbUUhVsbvTVVe/zLjatjD9mHdH/kajgunKpyJ+HZWThQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721713084; c=relaxed/simple;
	bh=07B8zQW2e6MJEUWUS3r6jlNE2x+GGxML5ROYg234HBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8fqZg8hC5fVkGG72gA7+gWmoBaj4gr4IVxNCC2hljZnF5T3Nocv/Tvdg5XLF6XrOhCh/BZCUfFnrzndYnVAfnaWEBTPV3C3iiKU9hRu8tpLim8j+7Jze4ZSRCZEfqHNYpBAGVkKHigPBG3kfv2LRdxeUKAbaBLibzP8qrcFHrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FmcUzkc9; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FmcUzkc9"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so62931131fa.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 22:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721713080; x=1722317880; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MhVxpGALzzOhSKfl7F3ZZPNcwL9E3a6Ged4o5h3oz2Y=;
        b=FmcUzkc95Zg+TvI2s/7JfRd+BuJ//pFNg4lEb8avytFygEacpg8g2PRulALiF9a0X+
         LPjTry1K2HutqggKpZvD3lZul0IAyHne+IygznjZppl+R9TmDsMKgm0STxxPPFyLBJkO
         4git3sON+ch1Ta4lZeMTOXJgOMYO/SzYtatifBrZMuk8FEfEc5YTDL0NkVFvk5SD6f5I
         kf24V3vI+WfzSZ45aBf+Kx3odaaglikoDhrbRFNsYiMte77PH1qPl/mHuQ+wvEN/1pHv
         XB0eA5cCAxMI/a24sXkblmJx81HpWMjOvw0gjjzi/mCBjbNAcCwm6EJsrS/CkryV8tmK
         JwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721713080; x=1722317880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhVxpGALzzOhSKfl7F3ZZPNcwL9E3a6Ged4o5h3oz2Y=;
        b=TnhGsDEbVuvp0WUJ7ZhbMh6rmEiLTSc+T0pAH1FC2b/SkdFvHmiNZXcDS7Oxsoakg9
         mYXHhbWE7rJHNetIeDiXP/2xckERA2BXgULRLpJ+mBylifx+fK+itJg/gTr8p8p7JcCI
         L1NhJ93H61Z4LwjU+9T/L8okb2Mk9F69mFFqrvuhT54OryCqXI5XZP32c+fXNycmaPO8
         a+WaZq4l6jxHrrpDcHfalWKrI42Eyj5L7GZ866+h9EqZVebLLsSYfUfQhuhjQ6GMzaeK
         mwHeBZT3icQwnP3lOgoyboCMGv+gJZS4K/nNKSboeJD8BF8nyukUKuIV8U4BN4COGYdS
         24gQ==
X-Gm-Message-State: AOJu0YwC3zDHB77x6Wt7rCqTCfTfbkYO5hKWBqWT/jnBbehCPPl0WgNn
	Z2yrYZ+Ui+d0iefpqcugeVfqRKDwzj5I9SptkH4utPGjUABlK9GMmw1DMwVdc68=
X-Google-Smtp-Source: AGHT+IHt+fRslPQyYUmEreRH5rHtJrKGvvXlZj2AUDmUCe4EZiRVHjW2fq54ka1RO/VI5bWXhCRoZg==
X-Received: by 2002:a2e:8005:0:b0:2ef:307a:9988 with SMTP id 38308e7fff4ca-2ef307aa0fcmr28362421fa.35.1721713079516;
        Mon, 22 Jul 2024 22:37:59 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f3184f9sm65431575ad.169.2024.07.22.22.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 22:37:59 -0700 (PDT)
Message-ID: <8afac96c-979e-47b4-8416-c26ba4c4a348@suse.com>
Date: Tue, 23 Jul 2024 15:07:54 +0930
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fs/btrfs/inode.o: warning: objtool: insert_inline_extent+0xa8:
 unreachable instruction
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 David Sterba <dsterba@suse.com>
References: <202407231331.vNHHJPnu-lkp@intel.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJjTSJVBQkNOgemAAoJEMI9kfOh
 Jf6oapEH/3r/xcalNXMvyRODoprkDraOPbCnULLPNwwp4wLP0/nKXvAlhvRbDpyx1+Ht/3gW
 p+Klw+S9zBQemxu+6v5nX8zny8l7Q6nAM5InkLaD7U5OLRgJ0O1MNr/UTODIEVx3uzD2X6MR
 ECMigQxu9c3XKSELXVjTJYgRrEo8o2qb7xoInk4mlleji2rRrqBh1rS0pEexImWphJi+Xgp3
 dxRGHsNGEbJ5+9yK9Nc5r67EYG4bwm+06yVT8aQS58ZI22C/UeJpPwcsYrdABcisd7dddj4Q
 RhWiO4Iy5MTGUD7PdfIkQ40iRcQzVEL1BeidP8v8C4LVGmk4vD1wF6xTjQRKfXHOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJjTSJuBQkNOge/AAoJEMI9kfOhJf6o
 rq8H/3LJmWxL6KO2y/BgOMYDZaFWE3TtdrlIEG8YIDJzIYbNIyQ4lw61RR+0P4APKstsu5VJ
 9E3WR7vfxSiOmHCRIWPi32xwbkD5TwaA5m2uVg6xjb5wbdHm+OhdSBcw/fsg19aHQpsmh1/Q
 bjzGi56yfTxxt9R2WmFIxe6MIDzLlNw3JG42/ark2LOXywqFRnOHgFqxygoMKEG7OcGy5wJM
 AavA+Abj+6XoedYTwOKkwq+RX2hvXElLZbhYlE+npB1WsFYn1wJ22lHoZsuJCLba5lehI+//
 ShSsZT5Tlfgi92e9P7y+I/OzMvnBezAll+p/Ly2YczznKM5tV0gboCWeusM=
In-Reply-To: <202407231331.vNHHJPnu-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi LKP team,

Thanks a lot of your reports.

在 2024/7/23 15:02, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   66ebbdfdeb093e097399b1883390079cd4c3022b
> commit: eb1fa9ab470285d39bee268bc2a90d1786610711 btrfs: make insert_inline_extent() accept one page directly
> date:   3 months ago
> config: loongarch-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231331.vNHHJPnu-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0

> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231331.vNHHJPnu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407231331.vNHHJPnu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> fs/btrfs/inode.o: warning: objtool: insert_inline_extent+0xa8: unreachable instruction

However for those not-so-common archs, mind to provide the code line 
number if possible?
(Better for all archs)

Although unreachable instruction warning is mostly false alerts, I still 
want to be sure.

Thanks,
Qu
>     fs/btrfs/inode.o: warning: objtool: btrfs_del_delalloc_inode+0xb0: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: btrfs_set_delalloc_extent+0x18c: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: btrfs_evict_inode+0x9c: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: btrfs_get_extent+0x3d0: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: btrfs_set_range_writeback+0x7c: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: compress_file_range+0x388: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: cow_file_range+0x128: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: btrfs_finish_one_ordered+0x174: unreachable instruction
>     fs/btrfs/inode.o: warning: objtool: btrfs_invalidate_folio+0x1b8: unreachable instruction
> 
> 
> objdump-func vmlinux.o insert_inline_extent:
> 
