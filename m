Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACBE2C11EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 04:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763095094; cv=none; b=Ty1eFEEO65A8MAerXO8IYtXSCMwEaagmXCLuikSGMHo4+r6VJJNjl/Z0Q9VozJx2YMvMAdf1nzi9jbBWqUWPl6yGvV9nxojkZuFM80pvebNdQfSNCMaOBnEOYnZVSdYu3Qx2+Hy9MyBiC+2L+jL8iltZRwjDsL0fdeYGEBDB1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763095094; c=relaxed/simple;
	bh=5on/wD4VanNwCM6L1DtiKjfJ2j+2aMTXS3iCpSJgpXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHTMyeR/ItkSE/Fn6UGJU4qiLshzn0ChpO5B7UsiVAAmE2nixCPW3XoB0B8dmA+LzGda9EER9nQOFjVq6gwbd0mfWfT2qpRb8oNdyyx2UuI4H5rGatabCKIcHVGgL11IKOcdtVe/HcF7soy70RNujcOqP3dWM1dQAvrbYPqTLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=jSXeW1/y; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="jSXeW1/y"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso2791834a12.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 20:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763095090; x=1763699890; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75LsZlrkz19mYBMXdx3jHbjL15XI4sQkrG/ZqqsZljk=;
        b=jSXeW1/yG27Anc5y9be+wTQr5H5zHtxcOrFEBitZuohUGj7O447vhPnskRC391b3z5
         0EUUCgqabOdoY2/cuqKDrlWTanH6hW76f7DjXz5IWWp8CzgrPyAPFYbUCV56PBv1ezM4
         jcmFy3IW+bHqDP86pVGnIWvq5zVtbioeGR7u23BQlBAPyVeqIcYcA4mTA3j1S81Up1r2
         A+5LVBaj5zPgSs025+xpEEA+k8Ach3kmVMCeZ+PDXS3eXhxTnGgnI8HEZTfcjADz4vHC
         2VMqzgOewMHfVcS1Cu/G9kO6nKt+DZU0LHFmilko1HA0sjE08dVGsy8DOBfeUWHhZLXv
         x6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763095090; x=1763699890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75LsZlrkz19mYBMXdx3jHbjL15XI4sQkrG/ZqqsZljk=;
        b=L1T7oqU4d57BA2nTkFTArMht6AhIzlJ6GMfr6SKJcH5W6tuZ7P486uhlyZV+CixLfA
         3MaBLZG0mQxXUUx02vW2vIld8wJCGBGi3eKygKfqf3s0OMrELC12YLy4rrpF6esmTfu8
         wfLx7NHQY96GfgjT3vYlgjEkB3myrvOUJEmHstIdTV+c/gnGB671OaNbyGRdHLgVOdFj
         mIqjZ8Uyj7MYzVQJ+mHIPPqcwqeMe3XVh3/LtJuXx9/X8lscPKETemrlU203CsQOR7k+
         mH9l5DKICZRExTzUASVOJaSO1iDWrxVgJuF2DmkGPOVTJU0MRKF3nNWWZbLhBjoOb6AL
         GV4w==
X-Gm-Message-State: AOJu0Yyo+NoixaFYybJ4zkLPoERP6d/Ax9ZIcIzCkHToHz/oZk1Zxld3
	7gpUGR+X29sAd5PcEtmRfW6xWxFg5guFjvurfyOqxrpiZCahQDfzyG8kibvmFBwL9Q8YLkjTHgz
	TAVE4L/3YLAZs0z2ZK/jtSgCUZLdEOxJuo9Oz0na4mQ==
X-Gm-Gg: ASbGnct4rbemcVjrPdqduX1OuN75Hkku1Pc7gpKziqaJghD2EDARLMN7v45jgYIdCUj
	pX1kzDB17ocaKwjbWqxT6XwzQwaAKKVUQ4wwDUm5Mp8uJDpIS7crLkV0Hc6tZ0mw4NauCfctOkz
	E7C6eqju6uE/KVuHoyIGTz+DBdyFHQBySq19yoNlxBL+JCzHsilJt50J0fx92JHIORzQ7TZKgqW
	kOJ8/2BFr/ysZZ/4yfaJzShvkqCBuA05bNOdLGjuf0N2AfhQGL5yKbKcJqxcGOp8BTD
X-Google-Smtp-Source: AGHT+IH5rJ8YaoOZJ/bljbGnJEtpsMqaJ/zjTHTHaUgm7y1k6s4PlCcpG4rSsf9/sg1rVEhMd6xOPfkaRP0BAtS2RLE=
X-Received: by 2002:a05:6402:2115:b0:640:ef03:82c9 with SMTP id
 4fb4d7f45d1cf-64350e1fa2cmr1323111a12.11.1763095089974; Thu, 13 Nov 2025
 20:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511140809.4JN2GCxV-lkp@intel.com>
In-Reply-To: <202511140809.4JN2GCxV-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 13 Nov 2025 23:37:32 -0500
X-Gm-Features: AWmQ_bmvVrEBXZ1NreajG0yZ7MNUMcDUJEYu2_AG45IpCCW1b9-zmyc88OFNQWY
Message-ID: <CA+CK2bBR5qqRMNKVYezCn3RsHx4=YLGsPaCb5DhveEQi3k6N+Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 84/106] kernel/liveupdate/luo_session.c:101:3:
 sparse: sparse: symbol 'luo_session_global' was not declared. Should it be static?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 7:29=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> head:   c3e0350a1f9934c5e56d859a26bf37a15ab7bb25
> commit: 877409d046405d44ba7e15e19345239c1affa4a5 [84/106] liveupdate: luo=
_session: add sessions support
> config: x86_64-randconfig-123-20251114 (https://download.01.org/0day-ci/a=
rchive/20251114/202511140809.4JN2GCxV-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251114/202511140809.4JN2GCxV-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511140809.4JN2GCxV-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> kernel/liveupdate/luo_session.c:101:3: sparse: sparse: symbol 'luo_ses=
sion_global' was not declared. Should it be static?
>
> vim +/luo_session_global +101 kernel/liveupdate/luo_session.c
>
>     89
>     90  /**
>     91   * struct luo_session_global - Global container for managing LUO =
sessions.
>     92   * @incoming:     The sessions passed from the previous kernel.
>     93   * @outgoing:     The sessions that are going to be passed to the=
 next kernel.
>     94   * @deserialized: The sessions have been deserialized once /dev/l=
iveupdate
>     95   *                has been opened.
>     96   */
>     97  struct luo_session_global {
>     98          struct luo_session_head incoming;
>     99          struct luo_session_head outgoing;
>    100          bool deserialized;
>  > 101  } luo_session_global;
>    102

Thank you, the fix is:

From 3c561cef2649c368b8aeb8e6e16fd096fd8634a7 Mon Sep 17 00:00:00 2001
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 13 Nov 2025 23:29:18 -0500
Subject: [PATCH] Fixup: liveupdate: luo_session: add sessions support

---
 kernel/liveupdate/luo_session.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_sessio=
n.c
index ec526de83987..e1a45af892eb 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -98,7 +98,9 @@ struct luo_session_global {
  struct luo_session_head incoming;
  struct luo_session_head outgoing;
  bool deserialized;
-} luo_session_global;
+};
+
+static struct luo_session_global luo_session_global;

 static struct luo_session *luo_session_alloc(const char *name)
 {
--=20
2.52.0.rc1.455.g30608eb744-goog
