Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4F13D24C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722827093; cv=none; b=WNVF0fvpYhjKGdikSM32Da70ErNl6/BCqdP7DLQE0i22ynm7j6UBKh8PWRpLBMFK7qdIAPagzu2C/0pdiH+Obe5c57whX6aWGI7+GbOgD57YKmP9ZSwJwFhj79M/jbiZf4JskcCVfKcfWxC7JifHZtVw+ikuxTlovWlTPb1wMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722827093; c=relaxed/simple;
	bh=17hrF7NDASeOzAKfE0wgbVZHAWZiCsDox80RR8poFG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRxfmtHT8tiSsiYsHdXKo8rlyW6K066iQNvtQAcFcfBRHz7VbXAZIALnEBrkDAfW9PrC6FKMECqd7FM0mgn7udsuCe4W6WdHurTwDojmwLftPla+lyRJ1nNPUti69BEf/GuuEKQpDFss+ZA4AXUaAyqByGVRhzV3LrxVhi4YyRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlRIfB/G; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlRIfB/G"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fed72d23a7so73583465ad.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 04 Aug 2024 20:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722827092; x=1723431892; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCt8m+ZKYNh2UEFvQXA3vrNBfoxHfltWq0395Bem0Vg=;
        b=VlRIfB/GIDacxSjdMjgOjH5r9OeEUOZovFC4+7G1MfGeIXqD9CqeAAF6pD8Ze4oLxs
         nguuyxsE+NP6rRHi/BO11cVtvia276mbuwu6sXn25OXpMUKeyeG4kcjp6urQTBKNnk1K
         GRYqt3PZ+ECRdHxRt0AzTj35iMJcnM//HorTxkR5P+aYStJuOj/mZWmxIdmCpUtMrwIM
         9iAPErlDqVJs96KLj/G2h7xGpM3+h8M9rjqnNM39T8r0pNQht+g03elbsve+d6OS0QYx
         rJMX1C11GuqpACigip8YOWvrOL9E4+HCq/CdwDJXDSsrzkwdwz1oysToCJ+v901Dspo7
         8KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722827092; x=1723431892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCt8m+ZKYNh2UEFvQXA3vrNBfoxHfltWq0395Bem0Vg=;
        b=c8L+IsfMSRUowXP4HZwM1G1WETQmg5wCHlTErZ4w+aa+PfKKwFKeIWqkg/Ere0NydZ
         uSBLQzPDBcrHHl5o0m7VZD5gWuHoZreZtQiY8kQJpYPHmiD3uETdzGDIt/zdys4wf5yv
         tJeAX9uI9llVipt/cQzB58AmTGfysDpQGvUnb5ZP44kHrRlN0z2RTYF5sXIfWpcxnqY1
         B62IB9oouP+kNlTmBy8ERjtzGatHcONGaQDYZu6ujPdJsICiqIAWPKd2U4kSsW0a7Xxv
         KWI/klS5Pqloa9qP3eCcd5/RYdgyg7bMcbSuZIGaLdPX1cV0DnejiXEJjJz+DJzUSDnR
         Ufog==
X-Gm-Message-State: AOJu0YwCPWVTWLzRgv3nGBwn8YMqfxuz8n6S74RufxndivGaizy0IVBe
	YPmcrQRdNZImdENArUk2lM5htPZDraVUGvrNVdmNkTRsJFgWTVLQ
X-Google-Smtp-Source: AGHT+IEVGX1/3bYz3p/49QHYkcAu26ooDcIKSi1CaRtmjY+MWd33WyJ7pMuBv0QL22G7JfPn/CtkHg==
X-Received: by 2002:a17:902:d2cc:b0:1fd:8f2c:5dae with SMTP id d9443c01a7336-1ff572953bfmr98269945ad.24.1722827091602;
        Sun, 04 Aug 2024 20:04:51 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19bd5sm56478705ad.50.2024.08.04.20.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 20:04:51 -0700 (PDT)
Message-ID: <feeba873-32f4-4677-8eb4-743af24d50f2@gmail.com>
Date: Mon, 5 Aug 2024 11:04:48 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [alexshi:ptdesc 14/17]
 arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible
 pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc
 *'
To: kernel test robot <lkp@intel.com>, alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <202408031130.UnwgnuLS-lkp@intel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <202408031130.UnwgnuLS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/3/24 11:26 AM, kernel test robot wrote:
> tree:   https://github.com/alexshi/linux.git ptdesc
> head:   3735e634f8feb67c941d17222b53906ace2fd2b8
> commit: 8ac2ea5f299444d065b292043aed0a1e94996159 [14/17] mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031130.UnwgnuLS-lkp@intel.com/reproduce)

>    In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20:
>>> arch/powerpc/include/asm/book3s/64/pgtable.h:1372:52: error: incompatible pointer types passing 'struct ptdesc *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]

Hi guys,

I still don't understand this problem. what's the meaning of 'struct ptdesc *' incompatible with 'struct ptdesc *'?

Thanks
Alex
