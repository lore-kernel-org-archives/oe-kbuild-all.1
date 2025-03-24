Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B700267390
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742842905; cv=none; b=GU8q6iXiIqpLU7U1Zu0dMBFbzNqnYSfEDr7Gwx1XreJy/rz85mqm08BcbrApQoT5mO2jS6EBwl89j3ajnR9cjrGAomptowcjvG0UHffxT1Q29p4gxt6AO0aeFVUf4OVqfFg2oTSuavq1gZHGd8nr95Vx1YnimDE/8vXoH4JxoHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742842905; c=relaxed/simple;
	bh=g7I9zs14TzJ9Q7NxvG/b7PfoqGP8O7udKxGBbnVd19E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7OoPUyU7NyTmLIbGET3H5DCUpHN7ZT82WBLi4Wl7oM2bkOnE+jwDoLhSwWgj7G3/oe5/S1+3Aty/f9GrcqFX6TSvyjfixsXUepztGHctbPIRYh0WfMnQCUCctB21KNyECwglxlv3zZDYmkonj3V8Lz+KvE+bqQoBn+m0oeLpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewCnNs0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewCnNs0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742842902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XUMdZ7FUAfrnrQy5VGkYNfYePW/HGcvwjcpf5IdbmVo=;
	b=ewCnNs0v3/ICNDKJEFkMCwZwXFecrnRF4SUkNnhdNDhRkaUrDUsdDSajDILHu5VTArmX0s
	Y2BjToOG85UaIQC1Rnb8x+RsWqLZAm9xh3svAZfTNqxnEWspfTmQneI21DzFqf7eYszuU7
	/j8a20u/uwZawAKMHpC4aUaUuF6f1FM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-5LBoj81PM9i2mdsZoxpPYQ-1; Mon, 24 Mar 2025 15:01:38 -0400
X-MC-Unique: 5LBoj81PM9i2mdsZoxpPYQ-1
X-Mimecast-MFC-AGG-ID: 5LBoj81PM9i2mdsZoxpPYQ_1742842898
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e917965e3eso64452476d6.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 12:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742842898; x=1743447698;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XUMdZ7FUAfrnrQy5VGkYNfYePW/HGcvwjcpf5IdbmVo=;
        b=G8Dym7vTVlWs3kc7oDk4DRgpQ40+cWmI8uuXyWZAs8eXtiPEAgY1fQ48sjrU5jkY+l
         m6AjV1GvVkF0SErlXl5P5ceOSh8wtfG0XxhMRhqRWZEl8QVzlFD8TR1PfMVA/BLVPvoV
         fj6shF5VcBv0RdPIYRB7Jm9FCg1qw71pP0Hqlo31kB3qZknGVMuv1h2HBlXkKnHFA3LC
         hm/cyQs8+SUkS5401TG7qy3lBBhP2wB/swCOhnd83XUUsmRyIvWgZJo5cYWQ2qd7CWdZ
         VhZjwBeFbM18JwB7KOdskgvnZCv9bWfgmkf35EU3PQGcv+sh9hmlEJ5wyAbGHPh1SAQF
         xSUw==
X-Gm-Message-State: AOJu0Yy6d/L0llabfqcvOf81yln0lIXLro5V702oGNyp/ZkGAZzO/TLm
	qwggu/7pIHPvhd5msj5XnOKQaIPFnGdt/Pxps6Vcv0vfDuh1cId+F/eaH+SfH1C8/w3F3+tzpg6
	BkyrwvTUxYBgCrWooafZ244Gp6/MvvJCc6ANwC8dO2KJbMEpf0Kf5/19zqyOhE2Y=
X-Gm-Gg: ASbGncu6Y4YgRg8ak4+NSvujI314isPKP9zvX/VHwDkEznZeR2KNjUFLltbmAOkMB/4
	i8s7Uy5h5fcb2u9BsziJXYQS+OF+Go4i2WUsJ4acw1/Tm5MmpiV0eM3L2yZKyUGGmCBx6JFrgbH
	lOOj2CngEOzxNVJE0jHgx/y4IiyBmcq4N9qcpEv2CYiADh5lr5qH7FqM3AjHPt2+7TZwziUomBP
	I03obhGl49qN2T1ic5xp7Eijo4PNTWy66d6TlJqSvhOrsleKpwoVMEL1SJCjhNe25VUOMh/HHpQ
	wqN2oXsHPx1j
X-Received: by 2002:a05:6214:d6b:b0:6e8:f949:38c6 with SMTP id 6a1803df08f44-6eb3f3302b0mr254247726d6.33.1742842898175;
        Mon, 24 Mar 2025 12:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtCb/NO+kqUMFpxeegHjsiW2QGDq3ij4AYLtyta28Al7q+A6goLA8S7aRoz0fVWXEESA3+aA==
X-Received: by 2002:a05:6214:d6b:b0:6e8:f949:38c6 with SMTP id 6a1803df08f44-6eb3f3302b0mr254247066d6.33.1742842897683;
        Mon, 24 Mar 2025 12:01:37 -0700 (PDT)
Received: from [172.22.33.10] ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efdc043sm47397506d6.104.2025.03.24.12.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:01:37 -0700 (PDT)
Message-ID: <856f7be5-ec71-45b2-bd42-f34e3beb6540@redhat.com>
Date: Mon, 24 Mar 2025 20:01:36 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20250321112323.153741-1-david@redhat.com>
 <202503241546.BdUEsLMd-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202503241546.BdUEsLMd-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mx9mSJ_6ohndcMkLoJVO3oFD-MerQ2azOjy8IgR5UGs_1742842898
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.03.25 08:28, kernel test robot wrote:
> Hi David,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on b3ee1e4609512dfff642a96b34d7e5dfcdc92d05]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250321-192604
> base:   b3ee1e4609512dfff642a96b34d7e5dfcdc92d05
> patch link:    https://lore.kernel.org/r/20250321112323.153741-1-david%40redhat.com
> patch subject: [PATCH v2] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
> config: xtensa-nommu_kc705_defconfig (https://download.01.org/0day-ci/archive/20250324/202503241546.BdUEsLMd-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241546.BdUEsLMd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503241546.BdUEsLMd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from arch/xtensa/include/asm/io.h:19,
>                      from include/linux/io.h:14,
>                      from lib/iomem_copy.c:8:
>     include/linux/pgtable.h: In function 'untrack_pfn_copy':
>>> include/linux/pgtable.h:1561:42: error: invalid use of undefined type 'struct vm_area_struct'
>      1561 |         untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
>           |                                          ^~
>     include/linux/pgtable.h:1561:60: error: invalid use of undefined type 'struct vm_area_struct'
>      1561 |         untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
>           |                                                            ^~
> 

Interesting (I did a bunch of cross-compiles even with some NOMMU 
targerts), but looks like we just want to move that under the CONFIG_MMU 
part.

Will retest and resend.

-- 
Cheers,

David / dhildenb

