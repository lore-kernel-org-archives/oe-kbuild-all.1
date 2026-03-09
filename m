Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0EC254AFF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052270; cv=none; b=EFXFcIC2Lo6sH/5GWPP6iggwhul4KePNwvBsUF3F7WnY+RmGPTRvd3f8kwVaZJlKtqJFp6dwU5pEg2NARjO21JiRlJBS8rHq6yRQrpVSGAThR5jt5nWRWIUUtNx+xOVZgt7W1CyG4BMla5gRx6HoLA9sAHaJJTZCw9ZfI/a6oY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052270; c=relaxed/simple;
	bh=0wBglbdbgyiJwsBzxJASt8/d9BKvUo+GZcF1rrVwqeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7CooGfqyUMu4xmyYAWDgaUqZzJBDFy5uuOeX06ngxZkbwkokX1aAPmtvFlPZSAyU8jMhYlkZwZ//HSNtjuzdIpeq11YMIY4TJDijt/2yh91xtlxEdNZIU2RLrPnil4ypEbfNFCk6jnrinEjtEpcdGDRNBG9/kwbQ5Qtvs+DPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qzhkih9q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qzhkih9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773052267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6uDuPQs7d6skRF5tTd2jlNb7jo/fZnfZ7p1rRhnGX3E=;
	b=Qzhkih9qV/2xhhp5nc2IMkhB5BeX2MrzxZGBL3S8/dkK8pTW2kJZeRg7AegHiSUMOoXzII
	ucQTICJ0qh6OwOZtQxyUv5ASxCzzqx9AB1WRrHDbeDQSm6MpfnAzLQKcWVZc5WO1XU6qvZ
	aMUoQ/FPai0Q9fQ/x58t5m1lEmWuauI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-4oE7TEewOwGsbcxh0J03lA-1; Mon, 09 Mar 2026 06:31:05 -0400
X-MC-Unique: 4oE7TEewOwGsbcxh0J03lA-1
X-Mimecast-MFC-AGG-ID: 4oE7TEewOwGsbcxh0J03lA_1773052264
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b95c0d77b42so126572766b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Mar 2026 03:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052264; x=1773657064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6uDuPQs7d6skRF5tTd2jlNb7jo/fZnfZ7p1rRhnGX3E=;
        b=MD1X6/kmIuWYSyNKMX99hSSXr2HqcLvWzCAGoonOmgX6dXsBEhFphgKPvC/QuvguqE
         //pcdo6dr82d0lzmRPVAQzKxvGufHIBx0v7x0Vz9CswV2vlWE5mPBdLz/SSrRT3oaJIX
         yQrKyYuQryZN96vrM/O7fWLUocNpge2iH2Qp0d5ue4ghpIFZaVMYihRW2a1G8FSsrFoM
         ak8TJ3uo16RMCdaLxX4PtzajHSMVGocUoPEaT8ixsfa1+8/wL5Yl0Qdy39sCtWxM/N52
         S6ay316G0oNcaOIwZu0aEeUGQDb9kw2vFfTze9xOMtSb7iolMRg5B6UQC1QhqKf458Pp
         x2UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMHD2BZr6NteqV1e7jq36TcmPKrXroHmA1IVB89fmIu9GGtV9ACiIqb1G/kie5yJdIoTO5Bovq6dsgZEQD@lists.linux.dev
X-Gm-Message-State: AOJu0YycADQIAzV+4CURKcWCODQi3ahwFZdmUiKHduqc6QqZN+P03Onm
	AxxIiuGzsmTTd9PkqWhoH9q2uLpEgDdB6pe9ruVpElBg8CmHhX/1nGbNlYDNV93i+3K6swEIg+r
	rQSi3shI4w/N7IOS8Cgr4RgcB8pYUyLQCDsQiHER3K/xJOMo1A1YibJ1QTf2hqjWOasbi0VbqKo
	fWHPnP7ZiHmi+l2AYH8oMhSNVq5iNLUTWlEtyBA+j71Q==
X-Gm-Gg: ATEYQzzbR+UWPwsBLvcSG7CwtH1T2LkChs6R9pvH6dx0DnLzUkThglfSe2N/XaM+STt
	Af/UQ5oEo2aYD3AJC2H6JJPXOy5vweMhgkNvV/DWyNjEKM0OJ1Fj2XoubGqqStAikSzNojEil7F
	wJVxIaedrWz1bV/DB6xSzU3NQPA5Haa94ZX9mf4VP/F/FvuLDSpourUcm6T24VANH9Qop0RQ6Cs
	n/J5g==
X-Received: by 2002:a17:907:1c81:b0:b93:6b41:e394 with SMTP id a640c23a62f3a-b942dbced3bmr523912066b.3.1773052264054;
        Mon, 09 Mar 2026 03:31:04 -0700 (PDT)
X-Received: by 2002:a17:907:1c81:b0:b93:6b41:e394 with SMTP id
 a640c23a62f3a-b942dbced3bmr523909766b.3.1773052263586; Mon, 09 Mar 2026
 03:31:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306-clk-scaling-v5-2-d21b84ee6f27@redhat.com> <202603082228.3RYA8l9q-lkp@intel.com>
In-Reply-To: <202603082228.3RYA8l9q-lkp@intel.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 9 Mar 2026 06:30:51 -0400
X-Gm-Features: AaiRm51xv-5Fvpq28_DyyKVNTDjNUzh2q55dvvBrMPegtA0lGwMe9trv34GXR08
Message-ID: <CABx5tq+zKeMXt+dsfO3LNz-DrwG14zFiLznsS9ubTmRrRTeoMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 2/4] clk: test: introduce test suite for sibling
 rate changes on a divider
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XmncLPPERkwFA_VR_YBtrkxZz7lbjpzdzCh6VWDrcbo_1773052264
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 10:37=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-t=
est-introduce-clk_dummy_div-for-a-mock-divider/20260307-074328
> base:   fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
> patch link:    https://lore.kernel.org/r/20260306-clk-scaling-v5-2-d21b84=
ee6f27%40redhat.com
> patch subject: [PATCH RFC v5 2/4] clk: test: introduce test suite for sib=
ling rate changes on a divider
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
60308/202603082228.3RYA8l9q-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260308/202603082228.3RYA8l9q-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603082228.3RYA8l9q-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/clk/clk_test.c:686:26: error: use of undeclared identifier 'HZ=
_PER_MHZ'
>      686 |         ctx->parent.rate =3D 24 * HZ_PER_MHZ;
>          |                                 ^

Thanks for the report. I forgot to mark my series dependent on this on
series I had posted that includes units.h.

https://lore.kernel.org/linux-clk/20260304-clk-docs-v1-0-fee468db99f1@redha=
t.com/

Brian

