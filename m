Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56226A1D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125005; cv=none; b=nYQB/K0waaRgO2PVUJwShLvnojW0T6nAqH18iKitL2d9znxf2CWvSu4Jx/RKCqaBhaBUZlqNnyGSR6MpZcuT74ImViEz+ptGj84zHXCa9nmzd1sUlhZv9eNtOYf6k6vwc+fDcd6n9K4sMiboSYAU+GAKynegjPaUs1SH/pmWiRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125005; c=relaxed/simple;
	bh=ExYtDl8b02EtpqCAt8WmRq9xU6azl3VSXlsL8MpzVzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXEdH77IIHKl5ITJ/xFnXktHR2gJM9UDGU7H63ILzjl8afIsNcnnFPrsqeU71LljpNpuAgic55lDkWmcula0VEdq4A1VlCytfXGZIwsW+s/BCBSH3rKL3plSv5BhFXUgPUGeqV9+ygxiLLLANT1RtFQ0KpsnocNhKAZTmY5Az60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N92dL++x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N92dL++x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756125003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1qkP7cC48R3McdGtVAl1xmnxt2NnQDjW6KguPLzrpC8=;
	b=N92dL++xSAOrZES8dtD4a8e71m1fnmgiuwdb3x3BPE7aVQgTT/zwkVt+xdu39TOweEL65u
	IPdPQsoyIXUEuFP0IY1x9QJDbDHmhEc8iQE002CNw6ikkMs1Ny+YUCI34Xi8EEZ3ga3jjv
	4svSyWIkqQbOKwnWnBdkH/JHOvLugYA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-JHqfwUDZPruFsvVyBKmXGw-1; Mon, 25 Aug 2025 08:30:01 -0400
X-MC-Unique: JHqfwUDZPruFsvVyBKmXGw-1
X-Mimecast-MFC-AGG-ID: JHqfwUDZPruFsvVyBKmXGw_1756125000
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3c8bc2914a9so623498f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 05:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756125000; x=1756729800;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qkP7cC48R3McdGtVAl1xmnxt2NnQDjW6KguPLzrpC8=;
        b=o8XAnSLpEH6isN62cwrVO/D5mdKBMiJPTIEx0fO9LjyaUCDlbUGdSoW/D1Dsa6gHlM
         nfOROZSJyHYa9AV1xK1E6LnQy7Tn0zb7m3kc45dHt6ytF/Fg4ZqAoORgofyrzACW2jTQ
         GfX7ZP5Bnjxk8vcCZSzDGhvGIffw8PWPiRUNjZm3wsPlRgubeX/A7BsKT4mHc4bR7pEe
         sb2elxpQKJ5ho0nWhJuy38V06KZCzXt8mdYv95XXGxwvten5bS4wdv0ql3nuAu4H44Tz
         kNsE5M3AIIHcJPji0qAlkMafdTYDEEl3C0F5eCF3pyLCkwj/3Cqf/dsUJQkE8VFyhu4/
         PmfQ==
X-Gm-Message-State: AOJu0YxGw1f83qCuJpJkvJC+wwHdxQQbA2TUO3Sed0RB6wGXzZzo7vIS
	Hl4t5B7fMDJelNLMYSX9BhB2HdpP1id5wUy8Y3PVkvvfE/iLSfSOyW8MDfqUlyIRMM5nBdUwvvJ
	ExYI2CftWN4HhgPmeXYk1cxgGmj+nnu3K7sL3rn6lWE1KmcP6uYF0Z0fnjuBT02M2xbE=
X-Gm-Gg: ASbGncsqMI8gHyaLA0MqV+6ayZBV8/V28AJHs5nt34NOyH79hv/nls/FUVwCSE/Ehaq
	JTuaXorCh+MjOOylCAewavT+C/Ul0jVVbgvtAv6Pq78NWW9xBDsxsR5OtlRyyBlxxhMaMkxzfa2
	nZgMZrniF/k6iTFfoGGeVi0R3jkVWi9i7qkilUwM/X5PTpK4qkkvzOFfswQi6gLu6+PFmF1irVW
	Nlo9lWXMxZVBapZT/SJ8ikxzIKYJRLzJwZGjzU+OCP2l1cw1ojXK9Izs4MJm345g2xPyzoZcyR9
	tku3FmhdHTQxBs0clygsdNcZqAsMDNEDOs4DKmoDJnIlKM3Wtr81OxQ/xeJQiTMe0sKjB6uTjaR
	j/SBaNIV/U3C1pt80u6nUGQBKebVGSsz9bUI4K2HQEWZ0pyWm94awpdJq2aN9gAv6mJA=
X-Received: by 2002:a05:6000:4287:b0:3b8:ffd1:80d2 with SMTP id ffacd0b85a97d-3c5dac1aae7mr11054364f8f.24.1756125000385;
        Mon, 25 Aug 2025 05:30:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyzvAMPfQuR1qLbhAVikypL96VkyB/QYgs0RchKjLOu+NkcDo15lGJc6glNklhghjHWJxl4A==
X-Received: by 2002:a05:6000:4287:b0:3b8:ffd1:80d2 with SMTP id ffacd0b85a97d-3c5dac1aae7mr11054345f8f.24.1756124999946;
        Mon, 25 Aug 2025 05:29:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76? (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de. [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5f28fa02sm50710175e9.11.2025.08.25.05.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:29:59 -0700 (PDT)
Message-ID: <b066d806-5fc5-42a8-b0db-74ca5b454683@redhat.com>
Date: Mon, 25 Aug 2025 14:29:58 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 102/221] include/linux/pgtable.h:2000:17:
 error: implicit declaration of function 'VM_WARN_ON_ONCE'; did you mean
 'WARN_ON_ONCE'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <202508250425.yEOYgcC5-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <202508250425.yEOYgcC5-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oUSOYoiMojwifAbgI_Trsfr7JaiUvGk-Hq_WMfFLxvI_1756125000
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.08.25 22:10, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   3c3393d4b766eebdc475ea5bd6bbd3a221e2526e
> commit: d2e502b0fe1166f68c7ca5815e73ad12bf87e74d [102/221] mm/memory: convert print_bad_pte() to print_bad_page_map()
> config: xtensa-nommu_kc705_defconfig (https://download.01.org/0day-ci/archive/20250825/202508250425.yEOYgcC5-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250425.yEOYgcC5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508250425.yEOYgcC5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from arch/xtensa/include/asm/io.h:19,
>                      from include/linux/io.h:12,
>                      from lib/iomem_copy.c:8:
>     include/linux/pgtable.h: In function 'pgtable_level_to_str':
>>> include/linux/pgtable.h:2000:17: error: implicit declaration of function 'VM_WARN_ON_ONCE'; did you mean 'WARN_ON_ONCE'? [-Wimplicit-function-declaration]
>      2000 |                 VM_WARN_ON_ONCE(1);
>           |                 ^~~~~~~~~~~~~~~
>           |                 WARN_ON_ONCE
> 

The bot really had to try hard finding a config where that doesn't work :)

#syz test

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 9f0329d45b1e1..94249e671a7e8 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1997,7 +1997,6 @@ static inline const char 
*pgtable_level_to_str(enum pgtable_level level)
  	case PGTABLE_LEVEL_PGD:
  		return "pgd";
  	default:
-		VM_WARN_ON_ONCE(1);
  		return "unknown";
  	}
  }

-- 
Cheers

David / dhildenb

