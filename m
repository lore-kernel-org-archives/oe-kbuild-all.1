Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062773D566D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990446; cv=none; b=ZkRgg7GGDeRLx0zUKMAzuIo7FCO3+5CcIkvZWkxhfa2VhVpfnpX8iRexLWsPsMtQRTpRt5GVlJvTGb7s76vsHFBqLI6bE4fAJMGrzYA2gTBQtRZ5D4F7FgJ3EuJ3RRJvxo5UTsYEKwHFBJgkFpF7LlcY+ie/Nw1gvxBL32IgN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990446; c=relaxed/simple;
	bh=xzZNSyXLHafrytf3VN4xGFqU7adjtRPPfSXD0Gs3mLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIulE4FRxEoB+ZfkgQgCyaHPw/aNcxmVreNsDHwmrT2KRXnxwRdi+vrbJCptJUYKpc8vdi5Y2DqNlCqwjZMj3Suy5QVKGZ6QGpEKeuJ4x60rTl5/00Jl+12QzFAQUnrvdOCK7WzYxXHpzbDap43mL1E/yB5EsWeaUmyELMJ0zkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpJbR9Bm; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpJbR9Bm"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c1632faeb9so11096200eec.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774990444; x=1775595244; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZspNX5rs+mbfHqezyzp4ll5OJtm1yyo5L/3asPtSr14=;
        b=EpJbR9BmBJ2ZmI1sbLGdRHaep6JBfqTbeFUSpkC79yRvpFsJ9kg/bR2OqoAaXe7fIx
         HTlfhLkH9QT9iMlnzZNXS+pFx8iRRtX9mfXnPkp0Dm/inB0Pn3h1pgO3X+E6svq+OaOR
         vTLiZNU+PBQvCWdKcvV5k5x1xO6+5aisSwP1qz2okGvne0ML46TViMB0CH/0gd/wZAmK
         13+zqFkmvAGjXHNnhVq0Q5lJRXrbPu8tvY9DPCz0bhD0Y9yU8x8C7+Ohw1aESi7Y14B5
         6ZS0BBeFklaOKoN5mb06JnuIqoCVxC7rxF3bOqTBwrNIzZfDZrhfl4Xo2jG4zr0Abk16
         wO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990444; x=1775595244;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZspNX5rs+mbfHqezyzp4ll5OJtm1yyo5L/3asPtSr14=;
        b=ItjvRqpbMHh9OsXEDLKYAWtyrtvjvnSXmqLyxly6cFMhc/vuKaOXXr7EQzQR/xltX4
         c5rwZt9L5xLA7lvMD3UlDJtsorhtgygqsWi2NoVaB7CQTiuS4mo7CX3tnN9xMen4qUfE
         REyUhA/9vLjSLR5iKJQLGGvRPsq0XZd1KoHnpx7S2EEozu52nujHlSqXrPJCg3Lg/+Y3
         2ccR01/41lEsQFZxZLpqaFm9NcIMbD/dxv88cc0SRiF08llUsuE4rmz8/y0Y7RfVToDP
         hIeXI+mDL0e0g0x2GOg0C5cPE3TKkbBizFEnUViVoPbWdrDbPwHh550Q5Qjj0eZgIoGD
         WPWw==
X-Gm-Message-State: AOJu0YzGZV6k6MbRahUDHiIz2wLhWHI+uWQdDL2gjkUo3M4pMtyaoH3a
	iwkCvXQ1STFN4mHnTtrFezgq93N+3Db/TEgOzeTFlb5VXr7B+ewj/TJR
X-Gm-Gg: ATEYQzzclhDTe7EL2E0vDdpRDthuzKWt8rNutO6bKro+G6Ufm4vdDC4J/waqLwfN/vd
	FtGGaDV8C9p5V6AbjLqqZdOOCRShNrEc1am6/sIGpSkM6mEdbFu1xrMy+1VbgU3aKXCEaZRi4wj
	FrYGlmwTgztzKZjZypoJSHGp0cD/fI8HzFGK/ZnqakujOrRVXm7igBxFwaqJp1IkrcxDiX6MEzT
	2l6XBVFTlzxNqZUd0iO96cDl7YL6jebn1zKCJiZ1/X0iq7fHKWypfauVoD8fxZiKsNbNqiV3T1E
	/he4zYoP77g0WPWuauVFcjr8He2G5ejayWXYi5sjt7O+yxNHRYnSlllSH8GQx2lbYXkFKwdN34f
	7zxqIrmBP+EunsaKshCbBKoqckL8EfLgE0vM12SQy5q7BemqPEVfx1Sl6RrGDaZ6vx6DODkGp4w
	YeRbHXubVkVcBCEPB8xuZa2KHlcOBNngDvDtu6Du1H64MkzmrLyc7+QgUcvrciUMHwPXxQML5MI
	/g=
X-Received: by 2002:a05:7300:fb8e:b0:2c7:11f2:d072 with SMTP id 5a478bee46e88-2c9323b8c8cmr558693eec.16.1774990443987;
        Tue, 31 Mar 2026 13:54:03 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-218.user3p.v-tal.net.br. [177.4.161.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c41c1513sm11457738eec.8.2026.03.31.13.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:54:03 -0700 (PDT)
Message-ID: <c1aac723-8a60-4b37-9c8b-74b2ea4daebb@gmail.com>
Date: Tue, 31 Mar 2026 17:53:59 -0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: aoa: i2sbus: clear stale prepared state
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260330-aoa-i2sbus-clear-stale-active-v1-1-47a6c0a3ac9e@gmail.com>
 <202604010125.AvkWBYKI-lkp@intel.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <202604010125.AvkWBYKI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/31/26 14:10, kernel test robot wrote:
> Hi Cássio,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 46a6512f4a74dd7b18d9a455669c226843fc49ce]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/C-ssio-Gabriel/ALSA-aoa-i2sbus-clear-stale-prepared-state/20260331-113724
> base:   46a6512f4a74dd7b18d9a455669c226843fc49ce
> patch link:    https://lore.kernel.org/r/20260330-aoa-i2sbus-clear-stale-active-v1-1-47a6c0a3ac9e%40gmail.com
> patch subject: [PATCH] ALSA: aoa: i2sbus: clear stale prepared state
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010125.AvkWBYKI-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010125.AvkWBYKI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604010125.AvkWBYKI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/aoa/soundbus/i2sbus/pcm.c:760:25: error: initialization of 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *)' [-Wincompatible-pointer-types]
>      760 |         .hw_params =    i2sbus_playback_hw_params,
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>    sound/aoa/soundbus/i2sbus/pcm.c:760:25: note: (near initialization for 'i2sbus_playback_ops.hw_params')
>    sound/aoa/soundbus/i2sbus/pcm.c:313:12: note: 'i2sbus_playback_hw_params' declared here
>      313 | static int i2sbus_playback_hw_params(struct snd_pcm_substream *substream)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>    sound/aoa/soundbus/i2sbus/pcm.c:829:25: error: initialization of 'int (*)(struct snd_pcm_substream *, struct snd_pcm_hw_params *)' from incompatible pointer type 'int (*)(struct snd_pcm_substream *)' [-Wincompatible-pointer-types]
>      829 |         .hw_params =    i2sbus_record_hw_params,
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~
>    sound/aoa/soundbus/i2sbus/pcm.c:829:25: note: (near initialization for 'i2sbus_record_ops.hw_params')
>    sound/aoa/soundbus/i2sbus/pcm.c:323:12: note: 'i2sbus_record_hw_params' declared here
>      323 | static int i2sbus_record_hw_params(struct snd_pcm_substream *substream)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +760 sound/aoa/soundbus/i2sbus/pcm.c
> 
>    756	
>    757	static const struct snd_pcm_ops i2sbus_playback_ops = {
>    758		.open =		i2sbus_playback_open,
>    759		.close =	i2sbus_playback_close,
>  > 760		.hw_params =	i2sbus_playback_hw_params,
>    761		.hw_free =	i2sbus_playback_hw_free,
>    762		.prepare =	i2sbus_playback_prepare,
>    763		.trigger =	i2sbus_playback_trigger,
>    764		.pointer =	i2sbus_playback_pointer,
>    765	};
>    766	
> 
Oops my bad!

I had added i2sbus_playback_hw_params(), i2sbus_record_hw_params(),
and the helper they use without the struct snd_pcm_hw_params *params argument
expected by struct snd_pcm_ops.hw_params, which caused the compilation error.

After fixing the callback signatures to match the ALSA API, the file
builds cleanly.

I will send a v2 patch with the proposed fixes.

-- 
Thanks,
Cássio

