Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FE734402D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089711; cv=none; b=T5VtkXhwURYKm5K17Syk5249FtPaQk/5++Qw5F1nBDahKuRnxEaH40SPLrMwi3wIR3Q2s8hKq/6RXnb2AM+KfIGNO3ooAlkz2eByIaFDk8W0PKA43Vd8MK2s5H5ZdCQRsqtWM7Ft4kPEUXXM/cl0UcLuv42N4hfSTH/J0dUKCjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089711; c=relaxed/simple;
	bh=PPyMxW4OQ9y9txXCzcxl91F/BsjgTm9umYKDg2/B5p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8/Pl1GSz+hyhLMfo3/bw0aQ3OKthmK4wrruEwV+JOsarkJZlm0kYp8YAeb5IALNR5rC1bCBAAK1DwPVSUiVms7D9fAba7WGYJPWQJZZU598r3YI9wVF1iUHoxUg2Cl1N4ilVSerdNJidwnUNCdZO0fSSTgYWMUDbjRSaW504V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L49+oW0o; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L49+oW0o"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8710c9cddbso130111266b.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769089707; x=1769694507; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PPyMxW4OQ9y9txXCzcxl91F/BsjgTm9umYKDg2/B5p4=;
        b=L49+oW0oDYflAhrFexgVn9QkFZ4x8Ud4RhsXdlCLN0x8wPOssqrMQn9P8vi+nND58B
         Kt/okFMWfW35MUO6zNaEQagNKfsHniAM66p64Owm3ZfEr9aXfnWva6VMRKABN8ADMbcZ
         G5VnCCOYBmaeE3fVWHmOcqaSkGgfVNj8IWMXGVq9otJ9iSvs5SVc1Cxt11a4ruQVh2AN
         fdt2RBCPRcoyHCHKx8D6Xlokirxrl7kSADQf6A58FpANJYje+V3Qg89cI/YbBY7gmsTz
         vOQIhHAp59GrrHxz05EMe9NX5/7TAN2XUlWcTZIZOpRU0vaG6WiFBVDKKfqDNqCFnVRz
         ae9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089707; x=1769694507;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPyMxW4OQ9y9txXCzcxl91F/BsjgTm9umYKDg2/B5p4=;
        b=c14G4JsH9AjEk0mjh4Cqpp4GOjiWKEjBqw66lNXQZBIOI9sHwBQ2uxOeRjzQhcUOdi
         pK3/AItDOR8mP2WrKw+dYqj5VxenUHflhwjATev0OTa3P0RbQOE4JoFBUtddP/XD0fXG
         1Q11HDzU+D1bntZ3FFXZ565R2OcDt+G1+QU1gFMWceFkDSRBV9/dmWseYQb11452uQ44
         yo+MPXei82f5LGsZIlF1eliqs394B95EezN0LKg3FNLcL9UVBVF1OHXsN7/TtKGb8fMU
         2qXQUWhWqhYK3PieUkWcR2NRGp8YrW5rr8u77KUq+PCrooMf41rVKmdw+KoRIQrOhgpb
         S5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCX0TBItD7KBVcKdAvsIk8M4zSmQiubpjuZrEOCvBO8l8WgMPoNUvwzWwfji9RcPe9utufB2nW4j8Q3nPTRS@lists.linux.dev
X-Gm-Message-State: AOJu0YwtPvWfZWJkDDJKG/q6xjX0Q4P0Fm3VQvJvAS41w5ixD9q5qwvK
	nwgi2weXx4mJBE3ztDL1sR9lKxvvBxgB2DQVh/ibj7huDbzTr1iVnBbmTnRYkQy9t50=
X-Gm-Gg: AZuq6aL+qamqosDnYAGaVc1wFEuTonQCM9qau8A90r8FYFHIDcXlCwb0hF08Cymgx5d
	nJM9lBCN3N4IPFt5x656nQJURBMpVbiA/CTP+iyYAnKuHYEzuxhZRsCWRW+hBr0rCm41P3IqmDK
	8vbuhPn8cipjRKDo3gMLpmoXKKF9gn1c6lZXqBZUcY4Q/yJwGixHwSJa7MmXI8jP4/amLaD5zt6
	SM2zceyva3MwV21GTBXsBgmU5DrpQIy78y7x4a7+O3yr/zvFoU+cq4wvMwssygMtekEMknatI3u
	BR/Boro8+gBued2xriU3WcWBkPwGy/OJAdyKrZaMbz3pucaMdnUd3NRN0n9apm7L/nAERl11+T/
	Qn/Vx6COGMSlvBU3G8nvyezydw+N7SNKj1SZ9nTeM3C1AmikQJQxLEyLackhRRwciCSj3nwTpZn
	kzfrfRx08mPtITRn46K71O/+64dvYVMVjEiGuYh8cXu7HyHlR1Biv92f+PjPASqeAcvHpZGDZI1
	T1rCZdTct4/ZgggVvpxe/q84QZYKShoHWQxQA==
X-Received: by 2002:a17:907:6d15:b0:b87:65c5:602f with SMTP id a640c23a62f3a-b8796afd5c2mr1765079466b.34.1769089707396;
        Thu, 22 Jan 2026 05:48:27 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1? (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de. [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795c38208sm1710572066b.71.2026.01.22.05.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 05:48:27 -0800 (PST)
Message-ID: <63e7d23f-8c28-40cb-9fb5-18ee392002fd@suse.com>
Date: Thu, 22 Jan 2026 14:48:26 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/mtrr: Introduce MTRR work state structure
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20260121141106.755458-3-jgross@suse.com>
 <202601220306.FavyG0wD-lkp@intel.com>
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
In-Reply-To: <202601220306.FavyG0wD-lkp@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1wO3Ug7vhppc051lDCVfZP0e"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1wO3Ug7vhppc051lDCVfZP0e
Content-Type: multipart/mixed; boundary="------------PHRQCULbwCbC5Dy5ui2bobzs";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <63e7d23f-8c28-40cb-9fb5-18ee392002fd@suse.com>
Subject: Re: [PATCH 2/4] x86/mtrr: Introduce MTRR work state structure
References: <20260121141106.755458-3-jgross@suse.com>
 <202601220306.FavyG0wD-lkp@intel.com>
In-Reply-To: <202601220306.FavyG0wD-lkp@intel.com>

--------------PHRQCULbwCbC5Dy5ui2bobzs
Content-Type: multipart/mixed; boundary="------------OWNn00tbBsgy34OsEA7qtBNd"

--------------OWNn00tbBsgy34OsEA7qtBNd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDEuMjYgMjA6NTgsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0KPiBIaSBKdWVy
Z2VuLA0KPiANCj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1
aWxkIHdhcm5pbmdzOg0KPiANCj4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHRpcC94
ODYvY29yZV0NCj4gW2Fsc28gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHRpcC9tYXN0ZXIgbGlu
dXMvbWFzdGVyIHY2LjE5LXJjNiBuZXh0LTIwMjYwMTIxXQ0KPiBbY2Fubm90IGFwcGx5IHRv
IHRpcC9hdXRvLWxhdGVzdF0NCj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUg
d3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4NCj4gQW5kIHdoZW4gc3Vi
bWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRl
ZCBpbg0KPiBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1wYXRjaCNfYmFz
ZV90cmVlX2luZm9ybWF0aW9uXQ0KPiANCj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20v
aW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0p1ZXJnZW4tR3Jvc3MveDg2LW10cnItTW92
ZS1jYWNoZV9lbmFibGUtYW5kLWNhY2hlX2Rpc2FibGUtdG8tbXRyci1nZW5lcmljLWMvMjAy
NjAxMjEtMjMwMzIwDQo+IGJhc2U6ICAgdGlwL3g4Ni9jb3JlDQo+IHBhdGNoIGxpbms6ICAg
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAxMjExNDExMDYuNzU1NDU4LTMtamdy
b3NzJTQwc3VzZS5jb20NCj4gcGF0Y2ggc3ViamVjdDogW1BBVENIIDIvNF0geDg2L210cnI6
IEludHJvZHVjZSBNVFJSIHdvcmsgc3RhdGUgc3RydWN0dXJlDQo+IGNvbmZpZzogeDg2XzY0
LWFsbG5vY29uZmlnIChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUv
MjAyNjAxMjIvMjAyNjAxMjIwMzA2LkZhdnlHMHdELWxrcEBpbnRlbC5jb20vY29uZmlnKQ0K
PiBjb21waWxlcjogY2xhbmcgdmVyc2lvbiAyMC4xLjggKGh0dHBzOi8vZ2l0aHViLmNvbS9s
bHZtL2xsdm0tcHJvamVjdCA4N2YwMjI3Y2I2MDE0N2EyNmExZWViNGZiMDZlM2I1MDVlOWM3
MjYxKQ0KPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3du
bG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjYwMTIyLzIwMjYwMTIyMDMwNi5GYXZ5
RzB3RC1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkNCj4gDQo+IElmIHlvdSBmaXggdGhlIGlz
c3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZl
cnNpb24gb2YNCj4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dp
bmcgdGFncw0KPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVs
LmNvbT4NCj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1h
bGwvMjAyNjAxMjIwMzA2LkZhdnlHMHdELWxrcEBpbnRlbC5jb20vDQo+IA0KPiBBbGwgd2Fy
bmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4gDQo+Pj4gV2FybmluZzogYXJj
aC94ODYva2VybmVsL2NwdS9tdHJyL2dlbmVyaWMuYzo5MjAgZnVuY3Rpb24gcGFyYW1ldGVy
ICdzdGF0ZScgbm90IGRlc2NyaWJlZCBpbiAnc2V0X210cnJfc3RhdGUnDQo+Pj4gV2Fybmlu
ZzogYXJjaC94ODYva2VybmVsL2NwdS9tdHJyL2dlbmVyaWMuYzo5MjAgZnVuY3Rpb24gcGFy
YW1ldGVyICdzdGF0ZScgbm90IGRlc2NyaWJlZCBpbiAnc2V0X210cnJfc3RhdGUnDQo+IA0K
DQpKdXN0IGEgbm90ZTogSSBoYXZlIGEgbG9jYWwgZml4IGZvciB0aGF0LCBidXQgd2lsbCBz
ZW5kIFYyIG9ubHkgYWZ0ZXIgc29tZQ0KbW9yZSBmZWVkYmFjay4NCg0KDQpKdWVyZ2VuDQo=

--------------OWNn00tbBsgy34OsEA7qtBNd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------OWNn00tbBsgy34OsEA7qtBNd--

--------------PHRQCULbwCbC5Dy5ui2bobzs--

--------------1wO3Ug7vhppc051lDCVfZP0e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlyKqoFAwAAAAAACgkQsN6d1ii/Ey9+
3Qf/SQEFTOrD3K73heFCNcJYYJdNunLkbTQvcWqnaZkoaFI9tl6PfMl1a+JWLLbHAIZkx1hQ+R6y
6/mQOQ/9z1mlgHGVemz4kWkcvUQ+Hy0a29MR1DQx0QffZQWxYRBadzY2fakiOXf2JO/aVGTatQt8
nrfbsPEzJW4nQi2CzPFdVo+zXmExYT4AGxQUgutVsm4X0Mr+BqhPtOdeynSKnCfDt5jCzv6e84CC
yVTD14RCkBJgv9eor2srPNGjPe6f2S4EymdXhLFfwxJ/QtTsRDimw76aejTXZRARxB3qLVcw8omI
hceZCDsM8JHEpnTKSa1uoHs0vV5HlFORFkVFzSas7g==
=13Yc
-----END PGP SIGNATURE-----

--------------1wO3Ug7vhppc051lDCVfZP0e--
