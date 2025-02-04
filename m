Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9B1946C7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738644409; cv=none; b=ShQQE2iiIACdxrvLD2ha8QAjMKzaaJFQODSw24d1np/56LUbXrrikXfNjARq3MiRExTqvJEhlk5kx49wjjHIZE+VkmDjv6N2hGpMkJiCI58Q83fyuzWOvs04jY+8p7iXke6cYwMKj4EM6+CPPE2zqwH9s1eI6+qwQBT37eg/gHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738644409; c=relaxed/simple;
	bh=hDjvWlONZQjRb3vrk6NfkgFo1ITMkQqO2OGQtuEiv5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR2nQVAb1dCPQR2Ys+FXiS96G1Do+BqxL+NHrfpJgr4VW74OuOEmT3poNJNX6pNzFT2oUvg+iy0cO25iA4Xe+Iqdf5SKafO9eyKlRSdnvr/iEkmB9grg3/zHcM7DCX1WlsJrloKXr5e5uM7Cp5XPpOmhqJQHKz8Ln/xDixLnxc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Bf6qttgn; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Bf6qttgn"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2a8690dcb35so1643980fac.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Feb 2025 20:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738644406; x=1739249206; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Coq7VrRCeqZM+h3IMGyNA7eOomhnM8uVe7fvtrV6QxU=;
        b=Bf6qttgn5r9aHfizp+moAou1bFtE/9454DWXqRkBRi4FPi4eLyTQzS+WI8OcnnDSXY
         rTlVN5v9M+21BPjWvgqjhOenEOuyKJQkzrqIn3tDGBh73L6Pc595JMB/wHe8uCOYISiP
         q+v/3ah2OLZg5DB4/BFNrF/b549qolAQ+/ENk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738644406; x=1739249206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Coq7VrRCeqZM+h3IMGyNA7eOomhnM8uVe7fvtrV6QxU=;
        b=SIe8lyEjRzWGms3axN/JnIxvFREXkScYP1PmTdhIN6V7qTd05dYczLOMP4yCrfFje7
         3uPDqvtdB/YVMN+XORoOLZzp9P888wLC2Si0iczSwUyGiJMBEwI99EUIj3Kh7eEBxXqr
         hKutDzYN0bwNzfyZczTF19V3qPqwI9vunZaZ4yZTGn0xiAZ5sYgj5logBc8g2PE2qSNK
         G6EyvOSmggZDVHEo98n/AxMdrjS+m+IGm8vX68D5SqxQ6hVlL4gopk6FXkjdhSFa8IeI
         XyOYywBB286slLBTyrGtSpzkdsn6SgYayjIwvBXA9QrB2DWS9yTO3ZkaUdd+H1GPOz51
         kt7w==
X-Gm-Message-State: AOJu0YwXtpFfwV8F3tqH8OKhSCMaRa90rnHpj1CM3p8aAGVZJq8t1KBK
	eFGi2LU70spoB2tE9nA/R1j3RAY860aL3w6NO8acxi8snhJzXWrwa9KRTrEWMNE7H2rRiW9Haz2
	4MJpp//TmbEwLN+r/FhSF5GwIjWKwBtAJvtai
X-Gm-Gg: ASbGncuZdKzhGXBrQ2TO3hhRp8NSf52V4hMdznrJA56cyFQ6xMcFwVqh7k876Hhvext
	vybNk/XSi0F2fwzTuvTqPv6Y8cWxLcY/RpkALUcaFqQMSK9v4QQJxiaqTJCJyQjy1RfzlacuYUQ
	==
X-Google-Smtp-Source: AGHT+IGHsSY17eFaV0BOKORiHD4pdaEZcexsfmbI6OpdFmvZK4nKzCMNceyz38ndnFFs1RN+9JwSGImSLcWc4h0tPqw=
X-Received: by 2002:a05:6870:2a46:b0:29d:ca24:c044 with SMTP id
 586e51a60fabf-2b32efe0a42mr14889609fac.8.1738644406521; Mon, 03 Feb 2025
 20:46:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502041114.K8XQYeJg-lkp@intel.com>
In-Reply-To: <202502041114.K8XQYeJg-lkp@intel.com>
From: Selvin Xavier <selvin.xavier@broadcom.com>
Date: Tue, 4 Feb 2025 10:16:35 +0530
X-Gm-Features: AWEUYZlqcKYl-fSNd3BWjngNUfedg4feyTYZaTp5E5NGpn9jkHyo4FB2y-KQAw4
Message-ID: <CA+sbYW2bq3M25aH9Jm-1T+5sE27pAfj73L7A1c_c_DsXE4z2jg@mail.gmail.com>
Subject: Re: [leon-rdma:rdma-next 17/75] drivers/infiniband/hw/bnxt_re/debugfs.h:34:40:
 error: variably modified 'gen0_parms' at file scope
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004416fd062d49b2aa"

--0000000000004416fd062d49b2aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 8:37=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.g=
it rdma-next
> head:   10565c5cadcb629f7780d24dd351878de9f46db5
> commit: a3c71713d9548f1a9ee141c7cfb35550c3487443 [17/75] RDMA/bnxt_re: Co=
ngestion control settings using debugfs hook
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/202502=
04/202502041114.K8XQYeJg-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250204/202502041114.K8XQYeJg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502041114.K8XQYeJg-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/infiniband/hw/bnxt_re/main.c:70:
> >> drivers/infiniband/hw/bnxt_re/debugfs.h:34:40: error: variably modifie=
d 'gen0_parms' at file scope
>       34 |         struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_P=
ARAM_GEN0];
>          |                                        ^~~~~~~~~~
>
>
Leon,
 I had a fix for it. Do you want to revert this check-in and want me
to post a v3 for this patch ? or shall i post a bug fix patch?

Thanks,
Selvin

> vim +/gen0_parms +34 drivers/infiniband/hw/bnxt_re/debugfs.h
>
>     32
>     33  struct bnxt_re_dbg_cc_config_params {
>   > 34          struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_PARA=
M_GEN0];
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--0000000000004416fd062d49b2aa
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
FYMZp2DojLAq9f4Oi2OBetbnWxo0WGycXpmq/jC4PUx2u9mazQ79i80VLagGRshWniESXuf+SYG8
+zBimjld9ZZnwm7itHAZdtme4YYFxx+EHa4PUxPV8t+hPHhsiIjirPa1pVXPbQIDAQABo4IB2zCC
AdcwDgYDVR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAu
Y3J0MEEGCCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29u
YWxzaWduMmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0
cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBA
MD6gPKA6hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2Ey
MDIwLmNybDAlBgNVHREEHjAcgRpzZWx2aW4ueGF2aWVyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAK
BggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU3TaH
dsgUhTW3LwObmZ20fj+8Xj8wDQYJKoZIhvcNAQELBQADggEBAAbt6Sptp6ZlTnhM2FDhkVXks68/
iqvfL/e8wSPVdBxOuiP+8EXGLV3E72KfTTJXMbkcmFpK2K11poBDQJhz0xyOGTESjXNnN6Eqq+iX
hQtF8xG2lzPq8MijKI4qXk5Vy5DYfwsVfcF0qJw5AhC32nU9uuIPJq8/mQbZfqmoanV/yadootGr
j1Ze9ndr+YDXPpCymOsynmmw0ErHZGGW1OmMpAEt0A+613glWCURLDlP8HONi1wnINV6aDiEf0ad
9NMGxDsp+YWiRXD3txfo2OMQbpIxM90QfhKKacX8t1J1oAAWxDrLVTJBXBNvz5tr+D1sYwuye93r
hImmkM1unboxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
IG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIw
Agxy+Cu4x/7lM0zxY7cwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIFMzqE9Utx70
ITKV/Hxk12EbpVqPspYRRLBsqIJzhNuGMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI1MDIwNDA0NDY0NlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcN
AQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCfpoV/sPfo/PtCgAqvIHbQr8YC8x9J
yxqKvyPaM1WVJ8TS8WfRbeJoN769ScwrpGs3J1ypGw8J1sSEF/iKiSuWu5i4+ZUpDpEPLpL5JfM9
lnxM4zo+E5oJtEWT3q8Ugcyx//Z8ofMs2yOlaJ5tKBU/mrAzFLycDPO4klVPWyQQEijzP+jbKxaI
+6RmMxCeFULoWiUod3wU/nb05YOEMB2fRotbhnmVZM1zE5ilvus2xNitkxxDO+/pT67l9AVWex/r
EBcL0dzH3vd/80zCmXR1txMrFm6l7OVJQ1XQ4pB/r8OKHjAbjOirIvGcsWptdrBHLgUIIuPP0OWc
plCv5jO6
--0000000000004416fd062d49b2aa--
