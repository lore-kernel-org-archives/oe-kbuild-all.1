Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32C340282
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771429693; cv=none; b=SVSdIXHnjgYN40pGb2tjlXvdMs9WBTZeJRMmqL3EOzIdVlRXfCZfMFSZ2ismvXYHoX4v3S/IaPS73UvQqhMR8AvNmzh/SqFpq3Phg0IwCEYs7SO22+Fi+wxqEhJ3fHqJeEdKT2pqDINSiBKeNbkcgawuqDblKKJZSfzRLu+bbx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771429693; c=relaxed/simple;
	bh=JWCCSXQURaV+XR5T96s+s7We2igXVsy3K7xArtIwvVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3UPe7qtcrqIxf5LcXKpk0IiFKGAtMxhxUFBc8Hxn2KGbaIMsZZUfK5NSX26i7gunm+teCRn36nBf/bPkLDdlF2UXEStD9keenNQxaPK6hlTJgupmPw0eLE6JXOLE45o2IprTnTHrk/AdL0BC9OJF8HMdqCldjl/wN38hZdTgz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JSOaq14c; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JSOaq14c"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8fa79b9fcdso3557566b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 07:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771429690; x=1772034490; darn=lists.linux.dev;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JWCCSXQURaV+XR5T96s+s7We2igXVsy3K7xArtIwvVs=;
        b=JSOaq14cI/r0JZKbFKOUV2VBpDfV7+XxrPw5rBdx6pHm7YTDiKNAg7t2RN50owcYWJ
         0o/MlWypUWDSBT6PzQvpkURXPf0ynwEX4x8V5oX6IcSDj4aLD/EF6jhZvdefH12orEbz
         3ENJwGmZ6lNPpgTm4PA1SKF4NyBpStCVig90KlYtCwz3qvZJVbbPjOA1XnPYYNf5u5gR
         yNpuObWFlI30ivhJJrrHZoC3/phKrvzsAQCNKrluTLkl6YNWv3m7Ou0XFzEqQqjqjly5
         t6k/ZN38CXxeXFcHhXXBS4/G+fhtDZQ1jX7EGBgXcMohlGgxPhV6nyAZvxgLQYu2Mzey
         +H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429690; x=1772034490;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWCCSXQURaV+XR5T96s+s7We2igXVsy3K7xArtIwvVs=;
        b=PhuZWT/NeVEkNQNh0l2arYLnbNX9dC84/14idqSQKoY8npLP9cxBvIGkbikIAQ8po5
         jRWLi6LDZoN3RDXzrlZ69ihhZ9YijFREfREcROPskB9nMIgaNum5RDbcI2gwZ6XMKD8b
         eb+x7jyQ1FcW3aHO6gzgIVyfjfWBp1JURBrnc7OUf1aB5fI19OQogeEEuHQ39Pl/m4Qk
         9kivIvHmmZf/pfE8LYlXVTFFU2/sXJYVEYzxSt+sT1TS8xpFuMI/0I5sHzSe2rwhsGOU
         m3M+iPN42CgGRuIQrd/zbvej0dCvR1jhOyTpjyEdJ5t8qXrurv4gMOhJIoDY9GlceY7i
         VreA==
X-Gm-Message-State: AOJu0YwV7x0Gsy15/VOpo7Mojsi69pfv2L60SFSP0KEMSWsGOS+raGHX
	8tn176EG/sNg0+vne9NSoFRQMFwjImMgOjzCPsmRKIOOjYcIwNmqFCifAmTSNkHznq4=
X-Gm-Gg: AZuq6aLxN5IfIP7/keZ26KGmDlTAP61gPVl0N31O7Gj89IAzjmNl4n+rK71QlXR7fno
	Rt7U9C2Zgw3V2PcBZTL7GATbOVjjrtlT9eb9v1vFlZ7dYAxVlp+nfcBUURr24ABNuJ+Ic5Jmtof
	2UQEnAjpRW/Xgqi7WZULiJWnsTeycMUhgkBmLfnbMHUvtyf2Rf9sSwI1nqe/xVkclP2VgZpNObL
	3GGxt7h6/C7q44r5ncYaSn3c8iJN00NUJHYnB0KpIHKnb7pyO4mtklMteJoX/3y8FeFVP5iv8Sw
	drj5hd3HYxXQauhI2golgVqIpFrDCvvWO9cKGI7z6cod8CgVjyoyyvFQFYPnpu5GzRi0zRr3t2p
	cglxkefORSAg65YcC5od4BhstBDsAeZNqK7939iWUqfOL/J3f9H2SkPdlA+TTYtIqmbLAz+qwDS
	cirN9QRpbTcvTQzppck8FQIUC6XXeI7Qz7ghWrqbWBChyfVHs5vvRT6uWpZb+ihNjLxut3h6PeR
	pJN6IOkaf6kqcUJGu3s7zXm3/2CAFTTM49CoRd4X07sGWrEDg==
X-Received: by 2002:a17:907:3e9e:b0:b8f:dec3:6606 with SMTP id a640c23a62f3a-b903cfc24e4mr136335966b.23.1771429689747;
        Wed, 18 Feb 2026 07:48:09 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1? (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de. [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691f0esm468597566b.60.2026.02.18.07.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 07:48:09 -0800 (PST)
Message-ID: <732e456f-c4a2-4d21-844e-597b7cc4f7ab@suse.com>
Date: Wed, 18 Feb 2026 16:48:08 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/16] x86/msr: Use the alternatives mechanism for
 RDMSR
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Xin Li (Intel)" <xin@zytor.com>
References: <20260218082133.400602-11-jgross@suse.com>
 <202602182222.WEBLSQRj-lkp@intel.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <202602182222.WEBLSQRj-lkp@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Tx26W9oYrmAydfR2FgsQ76PC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Tx26W9oYrmAydfR2FgsQ76PC
Content-Type: multipart/mixed; boundary="------------pz2IBzN77qFiOcRzikOSBsf4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Xin Li (Intel)" <xin@zytor.com>
Message-ID: <732e456f-c4a2-4d21-844e-597b7cc4f7ab@suse.com>
Subject: Re: [PATCH v3 10/16] x86/msr: Use the alternatives mechanism for
 RDMSR
References: <20260218082133.400602-11-jgross@suse.com>
 <202602182222.WEBLSQRj-lkp@intel.com>
In-Reply-To: <202602182222.WEBLSQRj-lkp@intel.com>

--------------pz2IBzN77qFiOcRzikOSBsf4
Content-Type: multipart/mixed; boundary="------------J2gcFFBt0ozc7HkgYKhrK97I"

--------------J2gcFFBt0ozc7HkgYKhrK97I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDIuMjYgMTY6MTIsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0KPiBIaSBKdWVy
Z2VuLA0KPiANCj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1
aWxkIGVycm9yczoNCj4gDQo+IFthdXRvIGJ1aWxkIHRlc3QgRVJST1Igb24gbGludXMvbWFz
dGVyXQ0KPiBbYWxzbyBidWlsZCB0ZXN0IEVSUk9SIG9uIHY2LjE5IG5leHQtMjAyNjAyMThd
DQo+IFtjYW5ub3QgYXBwbHkgdG8gdGlwL3g4Ni9jb3JlIGt2bS9xdWV1ZSBrdm0vbmV4dCBr
dm0vbGludXgtbmV4dCB0aXAveDg2L3RkeF0NCj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGll
ZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4NCj4gQW5k
IHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMg
ZG9jdW1lbnRlZCBpbg0KPiBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1w
YXRjaCNfYmFzZV90cmVlX2luZm9ybWF0aW9uXQ0KPiANCj4gdXJsOiAgICBodHRwczovL2dp
dGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0p1ZXJnZW4tR3Jvc3MveDg2
LWFsdGVybmF0aXZlLVN1cHBvcnQtYWx0X3JlcGxhY2VfY2FsbC13aXRoLWluc3RydWN0aW9u
cy1hZnRlci1jYWxsLzIwMjYwMjE4LTE2MzAzMQ0KPiBiYXNlOiAgIGxpbnVzL21hc3Rlcg0K
PiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMjE4MDgy
MTMzLjQwMDYwMi0xMS1qZ3Jvc3MlNDBzdXNlLmNvbQ0KPiBwYXRjaCBzdWJqZWN0OiBbUEFU
Q0ggdjMgMTAvMTZdIHg4Ni9tc3I6IFVzZSB0aGUgYWx0ZXJuYXRpdmVzIG1lY2hhbmlzbSBm
b3IgUkRNU1INCj4gY29uZmlnOiB4ODZfNjQtcmFuZGNvbmZpZy0wNzYtMjAyNjAyMTggKGh0
dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI2MDIxOC8yMDI2MDIx
ODIyMjIuV0VCTFNRUmotbGtwQGludGVsLmNvbS9jb25maWcpDQo+IGNvbXBpbGVyOiBnY2Mt
MTQgKERlYmlhbiAxNC4yLjAtMTkpIDE0LjIuMA0KPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBX
PTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIw
MjYwMjE4LzIwMjYwMjE4MjIyMi5XRUJMU1FSai1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkN
Cj4gDQo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0
IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YNCj4gdGhlIHNhbWUgcGF0Y2gvY29t
bWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncw0KPiB8IFJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjAyMTgyMjIyLldFQkxTUVJqLWxrcEBp
bnRlbC5jb20vDQoNCldpbGwgYWRkIGEgbmV3IHBhdGNoIGZpeGluZyB0aGlzLg0KDQoNCkp1
ZXJnZW4NCg==
--------------J2gcFFBt0ozc7HkgYKhrK97I
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------J2gcFFBt0ozc7HkgYKhrK97I--

--------------pz2IBzN77qFiOcRzikOSBsf4--

--------------Tx26W9oYrmAydfR2FgsQ76PC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmV3zkFAwAAAAAACgkQsN6d1ii/Ey9d
+AgAl2W/fE8AHW2R4o0iNPk1LLtyCvFBYDEbEsRtppWbO2mBV0X0tNvtckeroWnBxGikHSarenBa
Hn5q3C0VhEy5vYN9B3jl8+KZZQF3+bLh4Xch1ybhHFFhPa7HhHnQagOiABDNlozjTbc9Nt6WpY1p
nQtfXGblZZjFmBM3gMNoUJCG4ZL2DtW0DyovNSSuOgQ/pQmrpcidE4HNqnkW9Cjn6293kbw+Fa4g
pmtB2ukktP6R/Q+gyy+7GMhqT7dsm39aNtupnNBUlg2Aki0XNkHRM+zAOzLZnImZxW0jvK+mu6B2
x++X3y2lUmvaWL6C1uWqDH/S0lFxWEd2NHWh6OCvfA==
=GZhU
-----END PGP SIGNATURE-----

--------------Tx26W9oYrmAydfR2FgsQ76PC--
