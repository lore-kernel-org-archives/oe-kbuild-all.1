Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91975C618
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708417604; cv=none; b=cvU2Nh+bd+jH+q1EWwNDnslqArSQdOxeY8CweXr43J2XvMEfKTKPBw1bGjSpSVFVZjqCrhpPoVAnMqv8L71uoIBlFLcZ+IUsAWkqESqdq7d07CfqOUgS0rcRj76vbwHh2YhYr7O5S40oX4ieIuOmNtgG1cKoeUJchcMucA7KBRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708417604; c=relaxed/simple;
	bh=DQ1EMONEQg+hyOeWsVI197jFrB7eEBnObZDQNOV6pBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDPi35wwU6bkB7rCdPIz57AHeqUvLSQMVHeUg9eI9hLqmaygjjEBhXCvaHxv6wGAC6/6L9Rwo4t182HQuZO+VaJRA5fq1mrMKqrX8evmF5uMMuRM66UG7D6mX1xj+goSPG5LYerbhpEHe72fl88TY1tZZ97+0ty60lU4f6JMNRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LSBJH2ut; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LSBJH2ut"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d23d301452so21025161fa.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 00:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708417600; x=1709022400; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSGLHi46/BCGaJHFcy5mvilGU1yxYp2IJrJsOciQ/ZU=;
        b=LSBJH2utpYYa0sXFpnahw77aVFOZ6yBmCgqrk/sdLfnL3pC60CHikWEsq60J9KG9AP
         Vhw+UAEi1FsxibgTAHAi5lm6nl1zUSWRMS1rcF5BLLjWgOkUOI//EWn7FtoTOQBSnbzV
         qDjumDj0d4iVuQau8j4/vrM96d9jT5P4HggDcCK7jAmXWWA7DZ6tQHBcf0iZ7BAl+6g6
         i4xtPNTXERtzO5Sw8a9bfp/BNMsylPF8n9ZyubGk91rrKk/h75PsC51hR45eV8k9/wZu
         EqfBrNZ6ZAhXSmPJAaARzbFm634YPcJ/WM2eVI/xYFlABt/9ULzgn7wXfSWAOqUAcFCl
         ku+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708417600; x=1709022400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSGLHi46/BCGaJHFcy5mvilGU1yxYp2IJrJsOciQ/ZU=;
        b=frr6CVmTek3HEKu9rFNCtJ5KIGHsPwApCJWwaB7aeQqt4kjkvt4UN6MrCo6/YrttAA
         1nxto2ahYKvsIoRzE6Nd7OV3AVf4/PXgVrXMk7smFqBtDO4Zq89/ZS9NPY8WCdm20XoZ
         oy3gzsuThnTFiPIn2ayUwlufIiWGHthooQhmpMf4r6HR8a9Qhp7rJenQCH09Aigz5lRA
         nF+opzoS20R53jkWuKkRlFpV31l+drOUyuFvc5lyv+0dmpOp6h8XYHoq+Wv5XnpNweKO
         p0XfOekKx4pqfHUDxkUsdvmhTslu78kN1mG5fzy+jpG5iHgOHH7vi5jYcBpvIxVYg2Ws
         idvg==
X-Forwarded-Encrypted: i=1; AJvYcCX0KdQr3qhnHockTAcHjpCG+c0iOT86uFKFHGZrsByPlg5b/ha+L+JHnQZpIhDX6APnHCI+AvaleFGkg4EXWFJc0RUIkY+zS/k8Qbd6tA==
X-Gm-Message-State: AOJu0YyNXspxUThQS15IDFKrR+B3hUCNDrGJnQLkbqQmXuOTd8r9C2Oq
	GA3mApBkaZ/JoYPghCV9EZyWmkhjTcYZXkEuPhvGhEhL7Uj8yr6OsG+H/2uP5Ks=
X-Google-Smtp-Source: AGHT+IH+7KU4pxvMJsVYL6NIzH/IO6pQ83GJAuMYQ6ErXdZdwWTzlctIMQi/JWfLyWBnLG8AEgdKVg==
X-Received: by 2002:a05:651c:1a07:b0:2d2:399c:df25 with SMTP id by7-20020a05651c1a0700b002d2399cdf25mr4020755ljb.16.1708417599877;
        Tue, 20 Feb 2024 00:26:39 -0800 (PST)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id sw8-20020a17090b2c8800b0029732fc0154sm6905301pjb.3.2024.02.20.00.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 00:26:39 -0800 (PST)
Message-ID: <f4a2d37d-33fc-426d-975e-5408ada21710@suse.com>
Date: Tue, 20 Feb 2024 18:56:33 +1030
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] btrfs: subpage: introduce helpers to handle subpage
 delalloc locking
Content-Language: en-US
To: Yujie Liu <yujie.liu@intel.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: kernel test robot <lkp@intel.com>, linux-btrfs@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <02f5ad17b6415670bea37433c8ca332a06253315.1708322044.git.wqu@suse.com>
 <202402200823.Su3xBnia-lkp@intel.com>
 <549a5778-ee2f-4520-9147-f09854a50948@gmx.com> <ZdRbi3gumI2fGhUq@yujie-X299>
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
In-Reply-To: <ZdRbi3gumI2fGhUq@yujie-X299>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/2/20 18:28, Yujie Liu 写道:
> Hi Qu,
> 
> On Tue, Feb 20, 2024 at 11:46:17AM +1030, Qu Wenruo wrote:
>> 在 2024/2/20 11:22, kernel test robot 写道:
>>> Hi Qu,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on kdave/for-next]
>>> [also build test ERROR on linus/master v6.8-rc5 next-20240219]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>
>> This is applied without the previous preparation patches.
>>
>> Is it possible to teach LKP to fetch from certain branch other than
>> applying them directly to for-next?
>>
>> Do I need certain keyword in the cover letter?
> 
> Sorry for applying this patchset on an incorrect base. If the cover
> letter mentions that the patches has already been pushed to a certain
> branch, usually we will skip the patchset and directly test that branch,
> but seems the bot didn't recognize that there is a github link in the
> cover letter. We will investigate this and fix it ASAP.

My guess is, I'm using github's branch URL in the cover letter:

   https://github.com/adam900710/linux/tree/subpage_delalloc

I guess I should go something more traditional like?

   https://github.com/adam900710/linux.git subpage_delalloc

Thanks,
Qu
> 
> Best Regards,
> Yujie
