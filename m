Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8692B9C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 03:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720580622; cv=none; b=kT6zsews/8RoSW8Ko6wk4AquylW5ONu5McsCA4knKsrTkxQHPuoeCBGafsSu+VXlLsOa5iEb4iD7I/JzoQK/NqkxRugOaj4EaUmtx/wuzpR3gF3waiOdE6N0fG3M/DNeLshgcno4AOJ3qrpVkLbTa0Mp55n64+A21GAxHGFTzbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720580622; c=relaxed/simple;
	bh=tlwF+GqVgDmGxbGIB1sVzEy+PHeIxLFeqrd6ZM52SRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=beto010sxGxdgcI6anVmMS0tneievgNd+Ed3m23VgkitN/vX2YDmg+cMRxLo0a4hktno7iyvmB3bPg3w++P77SNNgTKNqYcZ0iaFnMpTt2cjgHyGscikQl2wTMgZSWIq0G4hQ0fC0ryJldcNfDEbenhsPJK7VshPIEtVv6BDuNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OAsbxGeV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OAsbxGeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720580619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XyPPqfQp9qSPs1l/QcTcBtu+sHsBQSt08JDgJab+NGo=;
	b=OAsbxGeVDK66Y186mTCCLQwqFC1BC6BqLtd1uO1rnHDXMv+dcEWY82XzyhNqE6ZJQOTuig
	YY5coeCCrBEAQ91FZ9oqjfu1KNvVLY6lAxV4TLc/t7ZP/AmhP84pcaPvA+67WcCFi8xI8P
	ewhkaufIdI53NEKZVTILP1TIuh/HSiY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-3o_Ngrr0OGKg83_GBZ6WpA-1; Tue, 09 Jul 2024 23:03:33 -0400
X-MC-Unique: 3o_Ngrr0OGKg83_GBZ6WpA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2c8402d08b4so3961554a91.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Jul 2024 20:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720580612; x=1721185412;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XyPPqfQp9qSPs1l/QcTcBtu+sHsBQSt08JDgJab+NGo=;
        b=R04YZeDOkVMQ5eutn3FhbCl1Ime6YweXpdXMC3vIAq5UFd6abhp/coq7smYxVD63wG
         RpA8vvuQtR9ERkh5LZPfaqYObIlod/eODECd3G/Ipot9nCcwW6/y/nvk3jkV5ln+FU5D
         2CEuOFfkuuoFNgXCcW05W5gU3dqsyLHRpHwiapiQ4Nh0GZsBZabinCCzAik8WvJLroyy
         AULmIfUfiw4NXsygm9SgF5YZZqTbn+kCH5bCGdAOkGMAB22IdF0dvIui03XuL8In9nl8
         erhxYyQgrHPyHmQ3nVkKDLocCBhZl8zh2ttojCDbx4oTT73MrSA1waeOX3sgx5MbHTmC
         W4Ow==
X-Gm-Message-State: AOJu0Yyg6Gc4Y6aabucydhl8Ri6P+RS1LEJ9bK1cvANZhPPaOyd6vqqc
	RmWS4jAm1GK3Q6VFNyzMyed/84eDEmgZHGdtFvL7e75Olj3Xhw0KRRRRU7uEg0QS2SQSsa++WtK
	Rc2n+HfFnQW7XM3Jv1h5Znsblo70jX9cu4aYzSbtWoClGOF8K3o7R2cPR4wSNNXU=
X-Received: by 2002:a05:6a20:3ca6:b0:1bc:ba48:15ae with SMTP id adf61e73a8af0-1c2984e1210mr4331279637.58.1720580611922;
        Tue, 09 Jul 2024 20:03:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb8tgnmtGh9HvWFbWsJUaDI3ODHRy36uIz9qutuvunNHtcntQGNcC8j3b27oIAcEaC8d+zLA==
X-Received: by 2002:a05:6a20:3ca6:b0:1bc:ba48:15ae with SMTP id adf61e73a8af0-1c2984e1210mr4331264637.58.1720580611416;
        Tue, 09 Jul 2024 20:03:31 -0700 (PDT)
Received: from [172.20.2.228] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad52ddsm22915335ad.303.2024.07.09.20.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 20:03:31 -0700 (PDT)
Message-ID: <6c6b2f14-9034-44c0-9ac2-81365086a788@redhat.com>
Date: Wed, 10 Jul 2024 05:03:28 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9094/10451] WARNING: modpost: vmlinux: section
 mismatch in reference: remove_device+0x4e (section: .text) -> .L604 (section:
 .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <202407100540.VWczFcnh-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202407100540.VWczFcnh-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.07.24 23:55, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   82d01fe6ee52086035b201cfa1410a3b04384257
> commit: cbdfb23849b330b0156760ee0d73348e020b8cdd [9094/10451] mm/zsmalloc: use a proper page type
> config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240710/202407100540.VWczFcnh-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100540.VWczFcnh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407100540.VWczFcnh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):

I assume this is completely unrelated to my commit. If not, please 
someone shout :)

-- 
Cheers,

David / dhildenb

