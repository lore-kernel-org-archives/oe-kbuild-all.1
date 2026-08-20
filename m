Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29E3A63E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211423; cv=none; b=td8mG2jEMCfBZAaEFVCSJjf3vtaRCXnPW4i1bzmMC5JJhvkByeuY4k9DH7y8VuaGstbSLLs3GYj3/MkT6CGnR0WmyhQRYembVK5mOKxx/YLatTNom0gIealmr+tezYAYfxeMltiKUm9P6ehNJJOe0JpXcy8aL4jzuezY6p9TbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211423; c=relaxed/simple;
	bh=xlTg7EvbGSIUrnqCzEzXf8yzgJqpfux/IKue7xLeNgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbLCm07hSTA5fhdZkwlLX4KQiwtMw7913BZ+T9IRrWmabkGdYQd0G2DHgjpjFFM62xS0L/LXMQjRTPlTL5MeAaCUQKutkHmdig7KxWz/74jGUZ6Wffi14iRAtlA1/GBo7y7UsiRl3M05sv4tXRP7uK98yl2CEdgtAVfHzs3jyYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AqqQyVxh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AqqQyVxh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4998e0916faso15117055e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787211420; x=1787816220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNsMSJHsfVVjwAdqv5CH5q3Y+Ts0/jXpzfWxgDPSqmg=;
        b=AqqQyVxhziflwFSzwt/RvLBrWDSXRPeBdUQlRoeMw4kxrJkZq0pyKW/WxvkMpkiZ0E
         2KHP9UkrgbQkKX1sg2pDEfaK9kzg4eg88m903JD2xVjzZz15VaFNP+6UrFQ7f1QofuSm
         74bRGJJ6Yqxj8BeEFwPsafOKVufBP0JBo5CwgGffMQ/9eseJGT2wqZYQZa1Y34KaTZZF
         HMDg+VHsdhyKLwzrWL0RyEugF5jZ6Ve6vK/ifNBjx01H1u4zsII5ibxLbYzCDMfFMa72
         8j8ccAkUcJdMz2alpIJQeziK8YIiTmcfyNyOIuTHPHl2VcjbKlzuMZtOwwR0CVi2uYI1
         annQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211420; x=1787816220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNsMSJHsfVVjwAdqv5CH5q3Y+Ts0/jXpzfWxgDPSqmg=;
        b=X5iQYd3JMwfBROlnRqLdKT+39cRCKhi/Wh34SRFmWPYxGnQNkHxZ2UvofxTtpWOzch
         j79MljnFgaKyYQmtqWtAojFcCDqgr8jJa36TTlBhi2gD5bEbGvcacCnxxCaM1kgfDbeT
         smviEGKv1Fc8An50ZQ2WRWZXfZFUXC8hat/2D6gV4HKogxGx9yQfAnZDUCx5n9TU+Kho
         FsegnZ9ld6awTIeNsvBwzxWj5S78uRcRWOc1GG02UBtHLbJqFY/fLGqMZMM9bulT5wW0
         IbLoEgJnHO4e5oTr88rRKSTgn/iFd5+gu+LE97QM4TINcJAGJdj8W0WzDMVYiOt0k1W4
         dR6w==
X-Gm-Message-State: AOJu0YzdNstnBUpkKK2MleRWGRGWl6YXifsszfKecyYMrksaWNv+1iZ0
	W+BxSEkmpHujNEXhU8Z8uaKOPe/vU1XWYmqNG5+9Yfs4bThrP9ajHKuOKFGxXW5ABs4=
X-Gm-Gg: AR+sD12JvSZ5NwjK8IuoXHI6iXF3PxO0EJLTG56reBFFzrOGvlXumT1ADb5cjZp0w/Q
	rXV2iX6fzAD3v3FL6DUe9ykh/nzEEqjypLstq2xZ/6H93IBZsYk7x9JBKCUF+XspUwwqlxvcIs3
	LyADObL6JR237YQ83GfaFVVETmPvq5LN4EsU1C0Y39yKEI3X63Ls8NLKn2mPPdOY5v512BaZ847
	BI8KYQWBaS1gh9ZZgi5NiyV4xwiM5tiViARbLI80Gy6kn02m/NTNqrsaBD70COwPvJ0eDG1dRDW
	KeAR28jaW6yxTFCoLNHDr4QO/2lZCXCr/OqLShu6SuZQA0HmcbK4ORT/jNHBHG1TOrGtuc1ITyn
	GLt1mv5q5+AJfFuYWRLE4YocCteAmA0c7G0n6XzvAwY6TUhjRJWmSYZLiVlBEMksSDcXH7kR0rC
	vs1bk1g3pv/6AOi9UzJgM4O7jaGm6B77CQEyEXQZDB6qTUrP/3d4qM1pQst2Ge8gyB5Sac7Dat4
	uzTY+dj3Mzj3ua1ytmScdgN
X-Received: by 2002:a05:600c:37c6:b0:499:87f3:a2a3 with SMTP id 5b1f17b1804b1-499aa1c7bafmr193343735e9.15.1787211420230;
        Thu, 20 Aug 2026 00:37:00 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2af8424sm24307625e9.0.2026.08.20.00.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:36:59 -0700 (PDT)
Message-ID: <53f739af-6408-4cd6-bc12-ca7516ad2f6d@suse.com>
Date: Thu, 20 Aug 2026 09:36:58 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [modules:ppavlu-module-include 35/37] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@kernel.org>,
 linux-modules@vger.kernel.org
References: <202608191847.ew1wQKaQ-lkp@intel.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <202608191847.ew1wQKaQ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/19/26 6:11 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git ppavlu-module-include
> head:   fcbfd3cbe0a054838436812cc0b664f71ba1d0a4
> commit: 2021aa3988f7a166b2be26c84d10fc6d1cc3d913 [35/37] module: Move module information macros into their own header
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260819/202608191847.ew1wQKaQ-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191847.ew1wQKaQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608191847.ew1wQKaQ-lkp@intel.com/

Sorry for the noise. I didn't realize lkp-tests watches all branches in
the modules Git repository. That is useful, although this one is really
a work-in-progress branch, so I've renamed it to
ppavlu-module-include-experimental to avoid being picked up by.

-- 
Cheers,
Petr
