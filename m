Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5921422C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085310; cv=none; b=lPE6pNKEWysPP2Jb5MCN72DNu248QhWscmXWuzHgOPsR37UTDPn5KwHTPaZmjjRKwPG30TGJnLXsKGUk/VEq1KZUNCMP2xxgXCfov91U1KGIOOo7W0uIyjaSo+8GbemOexrQ9Xu+EPFAejjqYwl8+EoiZ754pzxQivvHZshXL2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085310; c=relaxed/simple;
	bh=YA8ArRovZcyU99UHeTX9YUKXyk6eIvGmN65bgsJbR7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFg0gO2b7IAfmImWWDLgePcSXBxe8rR1Jj+KnfUMiCapShaz6LA+hsc5SVzkCdNw3cVzbsqI4w3/qNrgAP4vjadQ6UGv9apK2KTV52Jja/EgdTJtGEy5jaXcFDFKnm4HjQtVfJq7XBBi5j2UKbz7eUZtU4DS3X9j2Hd+s2w9gvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RSl8gFqj; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RSl8gFqj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so1754289a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743085307; x=1743690107; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YA8ArRovZcyU99UHeTX9YUKXyk6eIvGmN65bgsJbR7M=;
        b=RSl8gFqjh7Os+Y+bmtrXH/CV06INoM2aGhIeIcrgpLFTos0UxTWrsviXXLzaWx59qR
         /zsThZuT8IgbOrdExeXwryifR+rFl12AI6ly28WygsGxWA4v/TfbF8/YosiBr8z9UKWP
         g0AGkF9+yWbMjjaPveiEyTXNtDbzNRw49VZKkql9im0JHfr/1xNl6qEoeK2h9oIxnaqK
         pzBuE/8vlYX8f/kvE7lCp6YWIFD7pPa6X6nwqVr+sNQfljIbrW/f23bqbLsHzFCmvT9s
         YQF+L4il1QIl8v4svzG2Q6UJV82QtsEO7BUotVHWAw/tWX3yQhK5y+2nzzTB/OWJ9jEJ
         tpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085307; x=1743690107;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YA8ArRovZcyU99UHeTX9YUKXyk6eIvGmN65bgsJbR7M=;
        b=hgkAWQ9nqbGvY6O2FgsUNYESZ/HwV0LLpXqiZWNSrEXZFNmiGcRC/WipYg/w3Vlxea
         EPKvZl6B/3m5S7kgpb3GQRASYAP8pL6GYL18g0Ff6S1jgdBWI95l/8ETJB6e7SFOriTg
         EOpzl/1V5f9ASEN7QFIB9h7MuPACT9Am6jsCC5H8uD3UoUbFoAe/0UVTOoMNRGg2uNIo
         p5qFv70qiILADprNJ6V8lyrZnKuYVRgTPKQGcD8SMWNZ6mL8VeV6MrmH34uuZyhdRDZe
         q9yrvT7lkOJuD2hIpegJLWuBgQzIh+UK/Du83jrm6Kf2rExa5wLywRS9CdcVjomjkN1m
         vDKA==
X-Forwarded-Encrypted: i=1; AJvYcCVE7TQW7PjgmmBCX6Aopd6y6iJoymNbRwZCtDOnAVkhk+3YqVl0QBqOWnaCL2OGL/Nli3wkgymXMcDrH7HO@lists.linux.dev
X-Gm-Message-State: AOJu0YzcNcNQ2cMV+ynk+SkNXFChVfcZnoJ+Zz5tBnlJxXoYa5kUd9eV
	jKOE7eyNgUPJZvq4m7awTJ8CAhX6fXbYyOPqMg1mySnFspno+i3DYBrVF7LS+4g=
X-Gm-Gg: ASbGnctaodR31uXLVLZWf5ns5z9rthTLCBrbOhV1emqKKxRKJiE6N8vxxqGW5S/hGl1
	umZ7yL9lUfa9RQO4pPsa5Cyz6nmTuOkatSkghOTjyqx4Di73FxIsBZNLoPyCd7OfofgiG4bGaE8
	S/tZGe1eeX7b94nZ2jUO1TGZsMfi+DQzOaSEX8MVAbtc4Tp4ZgE1yZTQyn63YPmH4Qlnk1hEqIm
	gwDgW7zlWiOmQaTOCgLg129OnqVV+MMfxAP5Qnx14bCNbMfJjraRkDU/I07aNWafpFhTvzlWn0k
	6GSUTyvu0twbYc/uF2/6f2ipoCqFV43aBRetLnu9YPxLyFXMpHcQoHQis9M4eoYNbKoGsx8uK5V
	IdutfZlj/my+pyk45iOtsJJqHpFfT3DF1M1DXQRvIb1mth/xqHs7sk400YwBmnVaTBGDX7g==
X-Google-Smtp-Source: AGHT+IFCABOwtVH40dgEIF/v3SC5sQsG/SkmVq9OmnVTD5wSrbXQiYlHPDk40SIcgalxhj/beTU0Pg==
X-Received: by 2002:a17:907:3fa3:b0:abf:6ebf:5500 with SMTP id a640c23a62f3a-ac6faeb7134mr340592566b.16.1743085306432;
        Thu, 27 Mar 2025 07:21:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b? (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de. [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb52c0bsm1249345966b.91.2025.03.27.07.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 07:21:46 -0700 (PDT)
Message-ID: <c18a543c-4df2-4744-bf16-e888a832d634@suse.com>
Date: Thu, 27 Mar 2025 15:21:45 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
To: Borislav Petkov <bp@alien8.de>
Cc: Jan Beulich <jbeulich@suse.com>, oe-kbuild-all@lists.linux.dev,
 xen-devel@lists.xenproject.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel test robot <lkp@intel.com>,
 x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
 <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
 <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YeV86QOqDWmfRVo404l9CPE1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YeV86QOqDWmfRVo404l9CPE1
Content-Type: multipart/mixed; boundary="------------w3AQEZipCb3IgL39gNqeALp9";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jan Beulich <jbeulich@suse.com>, oe-kbuild-all@lists.linux.dev,
 xen-devel@lists.xenproject.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel test robot <lkp@intel.com>,
 x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Message-ID: <c18a543c-4df2-4744-bf16-e888a832d634@suse.com>
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
 <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
 <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
In-Reply-To: <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------w3AQEZipCb3IgL39gNqeALp9
Content-Type: multipart/mixed; boundary="------------55vb6jP6OXkfhRxpOPx3b5GE"

--------------55vb6jP6OXkfhRxpOPx3b5GE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDMuMjUgMTU6MTMsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gV2VkLCBK
dWwgMjQsIDIwMjQgYXQgMTE6NTU6MzlBTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToN
Cj4+IEknZCBwcmVmZXIgYSBnZW5lcmFsIHdheSB0byBoYW5kbGUgdGhpcyBwcm9ibGVtLCBs
aWtlIGUuZy4gc29tZSBraW5kIG9mDQo+PiBfX3JlZmRhdGEgdGFnZ2luZyBmb3IgcGVyY3B1
IHZhcmlhYmxlcy4NCj4gDQo+IEFueSByZWFzb24gZm9yIG5vdCBkb2luZyB0aGUgdHJpdmlh
bCB0aGluZz8NCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vbXVsdGljYWxscy5j
IGIvYXJjaC94ODYveGVuL211bHRpY2FsbHMuYw0KPiBpbmRleCAxMGM2NjBmYWU4YjMuLjEw
MGJmYWJhM2Y0ZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYveGVuL211bHRpY2FsbHMuYw0K
PiArKysgYi9hcmNoL3g4Ni94ZW4vbXVsdGljYWxscy5jDQo+IEBAIC01Myw3ICs1Myw3IEBA
IHN0cnVjdCBtY19kZWJ1Z19kYXRhIHsNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBERUZJ
TkVfUEVSX0NQVShzdHJ1Y3QgbWNfYnVmZmVyLCBtY19idWZmZXIpOw0KPiAtc3RhdGljIHN0
cnVjdCBtY19kZWJ1Z19kYXRhIG1jX2RlYnVnX2RhdGFfZWFybHkgX19pbml0ZGF0YTsNCj4g
K3N0YXRpYyBzdHJ1Y3QgbWNfZGVidWdfZGF0YSBtY19kZWJ1Z19kYXRhX2Vhcmx5Ow0KPiAg
IHN0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgbWNfZGVidWdfZGF0YSAqLCBtY19kZWJ1
Z19kYXRhKSA9DQo+ICAgCSZtY19kZWJ1Z19kYXRhX2Vhcmx5Ow0KPiAgIHN0YXRpYyBzdHJ1
Y3QgbWNfZGVidWdfZGF0YSBfX3BlcmNwdSAqbWNfZGVidWdfZGF0YV9wdHI7DQoNCldlbGws
IHRoYXQgaXMgd2FzdGluZyBuZWFybHkgM2tCIG9mIHRoZSBkYXRhIHNlY3Rpb24uDQoNCk1h
eWJlIG5vdCBhIGJpZyBkZWFsLCBidXQgc3RpbGwuLi4NCg0KDQpKdWVyZ2VuDQo=
--------------55vb6jP6OXkfhRxpOPx3b5GE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------55vb6jP6OXkfhRxpOPx3b5GE--

--------------w3AQEZipCb3IgL39gNqeALp9--

--------------YeV86QOqDWmfRVo404l9CPE1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmflXvkFAwAAAAAACgkQsN6d1ii/Ey+D
mwf8CB4yqf5jmA/ogrCjqXVUl+WOaKtKrKzZHAigKHobCnD1iv2TL/w9MDf0RP9KrlfwhmBqR9h7
1M11onb+9Ijpxn23SYi/pF1U8oylIaavnQjD9r+uV4tvObSsNZdjUT5YphFbnbDwGY0X5W32utQW
IsPab20ZsTnMwsqls2iOPWZDjjjYFHk5OOK/TsgakzzH/op8Y0pfHVnSUGWp+lv4N69wLX5O0dtu
kvrMM/k+3DbTZyvGD9wh1tjR/k+e/1qBTB6WB9I4EwrMIh516x5NyhxAHrVM22KPR84abNC3rm7l
RIkqGT8YpTGt0Pn595QGaZHpp5NujjNQegae03Ta9Q==
=57eC
-----END PGP SIGNATURE-----

--------------YeV86QOqDWmfRVo404l9CPE1--
