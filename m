Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91588158535
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 00:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743123347; cv=none; b=Mf2xYrTctXM/5fMZr2vt2R551dgWgPoqEBVQG+FnzIsngx38cwbV0DASBhabKRJBjtqhujyzcvJo1v1rugA3gb5G3iavUFFpcRb/9hhDHi3r+5ritGuX905pxxTW5tQnvQi0HeJ8ffaGpqnF3iECc8arOSfUel1EF2vEQxPlXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743123347; c=relaxed/simple;
	bh=OjLhi8L/AkXCkcXackWSSokwtCg9FEOekmeNmSMyg30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUe6r1cNz7BQZAL9u4RaBVeyxMXpe503ikYw8EjqO4eRbYFdrvyv3d6F0CGi4gUCs+0C6uNaHPgUe0R4txBam4lDAAPHlXYBizkpXF8N789ghJpFl+pdwVPZW0z9KvAMbgfp+84eBV1rEn3HhrR++/wWi/owgtWLJPxRbZdAWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1dZ7bxk; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1dZ7bxk"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3092670a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 17:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743123344; x=1743728144; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8G81JEz2uI2RDXTwyc99Q5aIzsfFZJ1dMtQvoEzCQ4=;
        b=V1dZ7bxkQWjuA+Xi9kfgNblbl7fpEvxlZTk78/LqfytT4zFXU4S71Q1RaxSPW3lApL
         hx4Vs/CcXFnpdsEMlrn70r6rpBvhuqHNhM50A2YHpZEBcEUi+99wUJEjbv6jPW0+EZYN
         s5CPO5bjN6oEdmztQQS+jdPBifAPD2ee5CuPPfCneHb47b3FGCTmjdLQJmr8yj3OZMBe
         BE/bok0nbwwcnFuW1ozJpL/JNqtbh8YOY7QGgfvrxSy/ew+1SMHrx3xD0qKQUzoaVRRN
         /WuwGI5zj35svJV4ijWo66ERPuA+YZrjv8WQZd2RqeXxZ7z7CO8QmHkWiGVUHBR4uHbu
         6Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743123344; x=1743728144;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y8G81JEz2uI2RDXTwyc99Q5aIzsfFZJ1dMtQvoEzCQ4=;
        b=orcZ58bSullCKeYcdJtheHYSGw74Eo9sQfj4XigHKC8mruqXktSVz/8+Z+qKBoG1N2
         Qfju5VCiWNa4CJZI23qdtkuI4GNEJzk1d/43eU61OH7cuvqYmwmdQ7qjuoxPFAaR2/4V
         ync5MMgj80hU4HyfFwz2yNcK+fQZSyJ6GHfIVe0y6yKJiZVo1EBMHg5GOuwxIdUHPwtw
         OJjoXhH0NOlywZfUGxqOBG1RDliyDDwOc1uSxdIgU06s5kzZ3oLn746cO1Fr4R7HhrBS
         MaET+JgD+hoZq5eW5mvrvJ1EZOzt6rlduadPX52hO8QopLLxlETIVoMn0+8UF/uMI6NV
         0rYw==
X-Forwarded-Encrypted: i=1; AJvYcCVcKGggtmDG1l9U3C2UyFRdygGxRlk7yvHkpBnCCq02EIaMjWiT8yLoWtWii2HdLrbJMsIpvg0wUxVKas/S@lists.linux.dev
X-Gm-Message-State: AOJu0YzypjBwxhoPcic8gzUcXD5RSdtkX3GYsLAMC0/sSUrrzztq+nLD
	C2qNbpZlSCs9dY6IoDX8dYTYJQ7K81/xq09+1GPtgG12uwFth369
X-Gm-Gg: ASbGnctkJ0y+vpxNHSfW5AEZ9tH9xfzC3Z3PZyGz7pDl/kYzNk7PhO0Pe9AfPY+TDrz
	pPTP2CGWae3hNx2F743763Bx/0qPfCjONyu7BvJZu3LFICWlrCCqiEWe32Vh7gmNvmcGWrT8GoY
	QB4lx+LoA61fW10OiKaiPbP5cJBJLvLadfhdfcux3l0nWKxiqiX/NesjyUZodEN8w4DG5+G5oJE
	O0X1r6aWSG0sUpNCdcCgVO2MEY5Y/pcoEc+IdHi9GJ1XDN7wM36d9Ebq4yM1WuPq8vUOFzICpOA
	vKv+2Ps3itGbVmpiamTeho7ZtBcjxURVkGuL4FJtdUOs
X-Google-Smtp-Source: AGHT+IGDo0+yCIbyrvl6erWfoKV5FSSUnDNahplQfwCA25cuWKidVAHgKmI6fhzo4C8M81dxJCIWqA==
X-Received: by 2002:a17:907:9611:b0:ac2:7d72:c2aa with SMTP id a640c23a62f3a-ac6fb1bd18dmr568959066b.51.1743123343637;
        Thu, 27 Mar 2025 17:55:43 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8b7sm73949566b.121.2025.03.27.17.55.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 17:55:42 -0700 (PDT)
Date: Fri, 28 Mar 2025 00:55:42 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, kernel test robot <lkp@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 mm_cmdline_setup+0x94 (section: .text.unlikely) -> memblock (section:
 .init.data)
Message-ID: <20250328005542.q7oumy7v2bvpuyyd@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <202503241259.kJV3U7Xj-lkp@intel.com>
 <20250327011312.mj55byrfatiprddh@master>
 <20250327123624.bd59f1307d5c5b29b1b9ac08@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327123624.bd59f1307d5c5b29b1b9ac08@linux-foundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Mar 27, 2025 at 12:36:24PM -0700, Andrew Morton wrote:
>On Thu, 27 Mar 2025 01:13:12 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> Since it is only used by mmu_init() which is annotated by __init, I think the
>> proper way is to add __init to mm_cmdline_setup.
>> 
>> 
>> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
>> index 4520c5741579..e98cfaf1c62b 100644
>> --- a/arch/microblaze/mm/init.c
>> +++ b/arch/microblaze/mm/init.c
>> @@ -143,7 +143,7 @@ int page_is_ram(unsigned long pfn)
>>  /*
>>   * Check for command-line options that affect what MMU_init will do.
>>   */
>> -static void mm_cmdline_setup(void)
>> +static void __init mm_cmdline_setup(void)
>>  {
>>  	unsigned long maxmem = 0;
>>  	char *p = cmd_line;
>
>That's a correct change anyway.  Please send along a patch sometime?

Sure.

-- 
Wei Yang
Help you, Help me
