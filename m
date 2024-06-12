Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DD71DDEB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206789; cv=none; b=K6j6sodm6hSXX4/uLFnwxXNwOrkRRjzYTRV9EyvZA87fQ4eUEUaNV71n9CmKTCFOvhXAd1/JsJsCW05EbI0T5IE0RX7t/rElk3layHJ0DH5yPPMKYebMVKrsjurPkK/PJK5v2fd1fex53VJLwgOMKDo3ONCvhl4Zt14UrNPPFn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206789; c=relaxed/simple;
	bh=xmG9vlR8zrshlFtVlVhpPjLHYWg1MfKwxFtGPIB0ilU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCCejOje3PaORE6MohTlO6sB5UBdSwhb7aVYjvLbnAjd0zTAq8vP9Toce24JAlrLlP2qdbAO3rwZGhWXkdJT2I35K/H46ACBJBi2rrnxAhiJMWog5WOTZGPYfKGAvS7lYllRBAexFyQQWhK1ASc7W0S7C9pylEBLKGOKX2PS5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZO5/6D30; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZO5/6D30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718206786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9cMrhoyR6CMe/LkRCEy0aXKlQDkFMe/otJAomuAxjgw=;
	b=ZO5/6D30mvAB1EJ32DADDaAPoenwGAim6JZOIuLCdnIVq/e3ZaCiYVHPgxaBa7l7O54gXk
	C+fWAZosyM45LWwjujKv81VKG0wW/XvhOPK+7AST3DZYjiH1p0sG71CFRakUn64sZQY25k
	KABQinSSg+f3njpA149CFg3u7SR6F2c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-kWyYiCknOF6HnwHqTiLmyQ-1; Wed, 12 Jun 2024 11:39:45 -0400
X-MC-Unique: kWyYiCknOF6HnwHqTiLmyQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-35f2030f868so6821f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 08:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718206784; x=1718811584;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9cMrhoyR6CMe/LkRCEy0aXKlQDkFMe/otJAomuAxjgw=;
        b=xIlfGZSypy/kvO9Eb+xYlhD2c174Ft1RBHBSKCCevBes07My+aNin3nnNct3xpHsOO
         ZSQVZnrSAsEaKCEEOD+mALN8tvLcxF0LVypAIr3JRrqLI7C6t7CPjWyK8CWMGNet5EhD
         N4fr+M4hnomfd7L0Ukpw6louu8Iek9fbeZTYm8lcFbU0JFz/IsGYLL4aiOuhxvC3ClgW
         Ri+FKKDRBzA36MgJJOUaeQniEkxjTfrYN7hpoZgd5CF+/H5ALXWX9XUBnyT5kTo5SP5n
         21qPw4D4RXrdKVrskA3IsvCO1vxWVf/LcREi8raj0BZXN3jIDXzwIzJKGFkN0U+dGCkV
         b7Bg==
X-Gm-Message-State: AOJu0YyA8Y0PFhvcucHdg7rZVxS72ydoQTjDP+UZCKBktMHnSYIJf2tY
	bSvdNA43lJ8dZ2+Wg1kx7b0bjLNhIqGT7XtaoMEZfALQ52k6K5nSzwJmxb/zg2dITtd4SoWQ4nt
	LIZWK6yJO/1piMbIs7iyFqkPqqJD+u/It+cZ6LfSIhTgCUAVOEtpGlwB1rZw+cJPHI9rSiZA=
X-Received: by 2002:a05:600c:358d:b0:422:89db:9e75 with SMTP id 5b1f17b1804b1-42289db9fb9mr26031705e9.32.1718206784399;
        Wed, 12 Jun 2024 08:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlc//3mdXiQ7u7xCz1IxbZVRal8NUS7yXKGshoVlhnA7anj6o/HycicYWXQ9l+rO13LJsQiQ==
X-Received: by 2002:a05:600c:358d:b0:422:89db:9e75 with SMTP id 5b1f17b1804b1-42289db9fb9mr26031505e9.32.1718206783998;
        Wed, 12 Jun 2024 08:39:43 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:bf00:abf6:cc3a:24d6:fa55? (p200300cbc702bf00abf6cc3a24d6fa55.dip0.t-ipconnect.de. [2003:cb:c702:bf00:abf6:cc3a:24d6:fa55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0eb36c72sm13084903f8f.85.2024.06.12.08.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:39:43 -0700 (PDT)
Message-ID: <ee3d20fa-1f7e-4d45-8d71-9a5778a1391f@redhat.com>
Date: Wed, 12 Jun 2024 17:39:42 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 175/198] WARNING: modpost:
 "__totalhigh_pages" [drivers/md/dm-bufio.ko] has no CRC!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202406122038.Py6sGDCp-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202406122038.Py6sGDCp-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.24 14:46, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   8a58962d482f5ab03d698f56fcbd5449757accfa
> commit: dae48e2d159fa9b7d6956b72cf3ebff6cd5e0de4 [175/198] mm-highmem-reimplement-totalhigh_pages-by-walking-zones-fix
> config: sparc-randconfig-001-20240612 (https://download.01.org/0day-ci/archive/20240612/202406122038.Py6sGDCp-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122038.Py6sGDCp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406122038.Py6sGDCp-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

That should be fixed now via the updated 
"mm-highmem-reimplement-totalhigh_pages-by-walking-zones-fix".

-- 
Cheers,

David / dhildenb

