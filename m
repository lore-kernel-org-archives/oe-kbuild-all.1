Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9939BFEF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778716763; cv=pass; b=BiTV3u32YE+3bee4XLR5/rkNrSvnzQdgm5c9JlkXFSEX/RZrHM6vJpD458zPOysnT3i1olD6c6TWp42hF2DQNUvIAOE5jHeMjelrCZQl2gL87YSZ/CDQ2/Opwo5q357Rr0kgGF990kiN9UkY5r5+7gnxtnJVldLvz5C0FNGp3Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778716763; c=relaxed/simple;
	bh=Jsxm2gCFMqKSnYz9EupWvxwKz9PVoKEs1xVZVnq9Z6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8vy/8DryJwFCkjHzoGwlftOXaS4TTOVNNqsKwxp1b/Ed8rQWp6sPrOu5JLXxhdrDFfqf/OKnz8E8snLmRWztxWGohY8mhoIqGMUgMgDu1YpBpNf+0q792QuNu/zyWYf42bqYYi3jlP+WEo/LAwseOU1Lmi4d47B30vKYPwLBUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=MSth/hZ/; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="MSth/hZ/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso3680338b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 16:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778716761; cv=none;
        d=google.com; s=arc-20240605;
        b=a+Yn2cULNFxHMduF9vc35B1aDS/JEQGcWVkeHIfn5CTQSn69RegEcwsICBAMaXHcEt
         LMwMcVRRrZNYqst3qkGAoN8teoa91OvZYEH77MMBfox5WON7zg/aiQkvVcTl9ZqjQ3P7
         wJ0WIsAEE2OiFQM7Df8RFjmGhggWbLrYnBRlP1vxxwfjq34sn7g9wFAZprpZHQUo3xfp
         07OFRjSluLzg1fw5NcLc0GgnJRgV1V7bsw7dBZXmupG9wwQo/wQlErPzAwxtoKYOIyp1
         CWcPwDBo4NqBc8iOtaCYlleswGMRhqQGr5TEqx8W+Q0XXzZGBxPoc5BqJRdR5W4PwBFe
         i0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wa0DzZxPVuSSic9zPDFbA0mGeqsYCaysQLsixjl/QpY=;
        fh=ZX0PywdoQ6pqkB2JOGh5KctM9wr1S6qePJ6Hg0lzFAM=;
        b=WwMqJ62fcPlQD35NfnDg5IBxAjPidVrHgu1K5HXuuHRSfpAC8Y4/Nv1SyOeUf+Cwgt
         tageteEGF0UypIEVnscE6QWLme490kkI6Lh8KJ10IsQtuEvMzjPaK0YBQjBeIKde9EDj
         H3zjk56hdY43FfdpGgxHH4c1txwKb7QFhGvOSlklmgFpvFgsZIlcMamKWeHmKqH9gFIx
         4FVKkhN43H+lbuoKFXAB6vwOiXGEgcELumFx0jPCunJ0/hHOARYaFkYQbEyiI38QzsU9
         BN2gMQnh+KCYchiHp8r7C/4bd6/40ZWoTgkeEXKmJG/JWI9ow0wZsRei1CsCcFU1oVWl
         Jhvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778716761; x=1779321561; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wa0DzZxPVuSSic9zPDFbA0mGeqsYCaysQLsixjl/QpY=;
        b=MSth/hZ/IzEFXOEOQxb4nA1cx04et+LDaLGcHjNpZ5llXLx89oYMMJOXHVcm/P5nxA
         lHasFJDJeQb5yifgj3u52WclwhIsizhltLTYCqNcXcIk+o8YfS1fEn+RJXi6PVjp4PyX
         CiUaNWusCpNhWXUQwMwxtXiF9GPotKiZv2+jV5wgU0V/Kb7fDvMfBlGH5vba8qEGufMQ
         HmyhBCRMO10AnNjCs2HCEc+lpUI5QSSAlW1xsBv3tJTR0fVC8z2gqk2+RSie/r6KBdvC
         fVtQtcTXDzyETmCHBDw7JlKVWhcDLJoQZ7EUIJ7qzf526Dcbv4T8g/9RsJGWvfLTDgZK
         UWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778716761; x=1779321561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa0DzZxPVuSSic9zPDFbA0mGeqsYCaysQLsixjl/QpY=;
        b=kvb9aFseLALhmcLgM4In044EqEnzprfTtXQvvQ3OYLKTUGgYeKeGMElLCTl3QS7HNP
         /aJ0cNMwLOuW89/S5R0dB4R8NfPwtzcP3J/oS1CfbK7jxBnFgUebiJ6Sy2X3x8vMKkfB
         rxytQaoea9Rlnpas7SEFLlsUUFJ0ZKE/cKKs19N4LHhj88J35vg4zgaolth8BU2mgEHK
         smPFQ3c6vyTjwk1yMUdR6TeiIJBWtQySSsE8ev0x3noK7xo5ythrlpxbdiKu2CYbY7zj
         boI33NIWLmj4U6ODBbxRz+bO2pxOfs9yGyAb5ihv84oz9adAgNi4uN7bwtw3oLFfVRCV
         Ceyg==
X-Forwarded-Encrypted: i=1; AFNElJ/LrmJZ4DB9/6x0lKgCj2E/gX1aNcS+goRqnOsEatZnw/NKIux3xl8tBUHUm/TI3T19Aule9mHvJSrhwm5X@lists.linux.dev
X-Gm-Message-State: AOJu0YwvZ2lT2aUZNMrtfLUmqCVaPgjUlWzbEK0+fWDAin39cwsm/+Rr
	T9UlW5W3WrC9fGBGYATNjTNLdl1q5OLznLl9cnQqOTQgAMuFIqagyVrLukopP8HKbYk8dlwAxNB
	hfXS+yK0vvlMY2fweIMyol9FCg1J/dfJMOKKfIw1D
X-Gm-Gg: Acq92OF7fEQN2hVc/sSXVZwcJvYhKBXJHiRq67gm/nIwgzYr24T5cdqA64LRKqmWD/8
	XbVqgTJnBwlLQIknqfoyg64RvpZ5l87kryfbKgOrU5zF8/VYayqOhr91NBUykd+9eATpFfakAYE
	cMdHQSRKhF9RMP5swTm4RsfW9TfD1JnM3lcfoPLT1fP9ahJ7DwDlkLyNZdJHNCHpqoXgWGnBLDR
	zLFr55/I+tsg28ocunlGpeSWdj6hQWdZ1ZCn0UYseT5l7hnxc/zvfCcpi8jvSz7665GXSuN2u3X
	WW890K5kwev9XetMCNYCo67GZknn
X-Received: by 2002:a05:6a00:2296:b0:82c:e60c:f36d with SMTP id
 d2e1a72fcca58-83f04308a1dmr5748031b3a.48.1778716760685; Wed, 13 May 2026
 16:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605140655.YX9jzufG-lkp@intel.com>
In-Reply-To: <202605140655.YX9jzufG-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 13 May 2026 19:59:09 -0400
X-Gm-Features: AVHnY4IOBDED2g31VvqS9J-rsm0Aa6WZ1IIlsZV22-q0JILMdkv7i5SYft1wO7Q
Message-ID: <CAHC9VhQtDd3OhZaimXXY22f7o=xgHn_WnLKB9pzN3DfNtyLtCQ@mail.gmail.com>
Subject: Re: [linuxsecuritymodule:next 7/11] security/hornet/hornet_lsm.c:51:25:
 error: 'struct bpf_prog_aux' has no member named 'security'
To: kernel test robot <lkp@intel.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, oe-kbuild-all@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000ad650f0651bbc43f"

--000000000000ad650f0651bbc43f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 6:56=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://github.com/LinuxSecurityModule/kernel next
> head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
> commit: c62310df81899f7e14d632271aba08d0a55e2318 [7/11] lsm: introduce th=
e Hornet LSM
> config: csky-randconfig-r071-20260514 (https://download.01.org/0day-ci/ar=
chive/20260514/202605140655.YX9jzufG-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> smatch: v0.5.0-9185-gbcc58b9c
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260514/202605140655.YX9jzufG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605140655.YX9jzufG-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    security/hornet/hornet_lsm.c: In function 'hornet_bpf_prog_security':
> >> security/hornet/hornet_lsm.c:51:25: error: 'struct bpf_prog_aux' has n=
o member named 'security'
>       51 |         return prog->aux->security + hornet_blob_sizes.lbs_bpf=
_prog;
>          |                         ^~
>
>
> vim +51 security/hornet/hornet_lsm.c
>
>     47
>     48  static inline struct hornet_prog_security_struct *
>     49  hornet_bpf_prog_security(struct bpf_prog *prog)
>     50  {
>   > 51          return prog->aux->security + hornet_blob_sizes.lbs_bpf_pr=
og;
>     52  }
>     53

I believe this Kconfig one-liner should fix this, and if I recall
correctly the kernel test robot should be able to test the applied
patch, let's see ...

--=20
paul-moore.com

--000000000000ad650f0651bbc43f
Content-Type: text/x-patch; charset="US-ASCII"; name="12-XXX-hornet-kconfig_fixes.patch"
Content-Disposition: attachment; 
	filename="12-XXX-hornet-kconfig_fixes.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mp4pzs110>
X-Attachment-Id: f_mp4pzs110

aG9ybmV0OiBkZXBlbmQgb24gQ09ORklHX1NFQ1VSSVRZIGFuZCBDT05GSUdfQlBGX1NZU0NBTEwK
CkZyb206IFBhdWwgTW9vcmUgPHBhdWxAcGF1bC1tb29yZS5jb20+CgpIb3JuZXQgb25seSBtYWtl
cyBzZW5zZSBhcyBhIExTTSBpZiB0aGUgTFNNIGZyYW1ld29yayBpcyBlbmFibGVkCnZpYSBDT05G
SUdfU0VDVVJJVFkgYW5kIGVCUEYgaXMgZW5hYmxlZCB2aWEgQ09ORklHX0JQRl9TWVNDQUxMLgoK
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjA1MTQwNjU1LllYOWp6dWZH
LWxrcEBpbnRlbC5jb20vClNpZ25lZC1vZmYtYnk6IFBhdWwgTW9vcmUgPHBhdWxAcGF1bC1tb29y
ZS5jb20+Ci0tLQogc2VjdXJpdHkvaG9ybmV0L0tjb25maWcgfCAgICAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2hvcm5ldC9LY29uZmln
IGIvc2VjdXJpdHkvaG9ybmV0L0tjb25maWcKaW5kZXggNWJlNzFkOTdkYWVlLi41MzdhZDAxNTk1
OGMgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L2hvcm5ldC9LY29uZmlnCisrKyBiL3NlY3VyaXR5L2hv
cm5ldC9LY29uZmlnCkBAIC0xLDYgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiBjb25maWcgU0VDVVJJVFlfSE9STkVUCiAJYm9vbCAiSG9ybmV0IHN1cHBv
cnQiCisJZGVwZW5kcyBvbiBTRUNVUklUWSAmJiBCUEZfU1lTQ0FMTAogCXNlbGVjdCBDUllQVE9f
TElCX1NIQTI1NgogCXNlbGVjdCBQS0NTN19NRVNTQUdFX1BBUlNFUgogCXNlbGVjdCBTWVNURU1f
REFUQV9WRVJJRklDQVRJT04K
--000000000000ad650f0651bbc43f--
