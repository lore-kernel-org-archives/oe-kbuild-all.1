Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58567383A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724313212; cv=none; b=Ffl0Pmn2mUGHFLwOGA8n2D9tRTqK/v8WsxQ+C9ccXFD2L2lKJ334PA0QLWD6/DoJT11Cy+MvypEQ3Qk3adg+87HCH2wyxjOgRmdI1E+3sDEWoUrR8Hkv18/tbD36IKReOMXdoR5rRJMVOlgipbxk8sjjrvU44W4HVQgwbpKxf74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724313212; c=relaxed/simple;
	bh=RaIhx5O9tmpQeHwum71OiEOeHZKulJB0JQw36n+bhk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qn3G/R5Dp8HRVAKBESLmo67VjNZ0ssM0QFrDdWYA8MWIuQyCnuOPrA7L0IPFePt4+LFJGKe8B5/Ipvm4Ahtf7x04dxOgz9DwLXbslMfH7O3eAwmgAcG/mZdjP56tYRjw6QQ7YkeR2bG9FV5dAAWXCtHpZGg+V/4ghE38Yk6WsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ln4oWLCG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ln4oWLCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724313209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qz/tdls6cnOOu3JOwA/hHCLBawPXMSyqfmoIOx3PN+I=;
	b=Ln4oWLCGa+YUwHVvlUUi8Q3UD6O22KVm6QjwMtC7t2SgGfn0H+HVSF0UpKCBzrxlYIj6D7
	xd/UVFoS9ewjlVevNFpU/SFPXvIDHTyMn8euX/o8a8bqvUrI9sScJ+hT7TElEMFwIAbTGO
	MEVKu2N3ZO4/cERygIMPIin/Jzmylq4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-HeVIJWu-OoO2GTyzhujvpw-1; Thu, 22 Aug 2024 03:53:26 -0400
X-MC-Unique: HeVIJWu-OoO2GTyzhujvpw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4280f233115so3699795e9.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 00:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724313205; x=1724918005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz/tdls6cnOOu3JOwA/hHCLBawPXMSyqfmoIOx3PN+I=;
        b=Ft6J14R7zUi/WENo8dAM15P50vGCAAd0zPzhnxBS6S5Xaer1yOvdTH5r+IYYYWHMBc
         d/mZPGRB8ciTcjwa7Ydv0s962y2OvGF17aT3HKrchcB/nWADzDgChvwukTyaZYKhs+11
         9qwFx1LGeHyORhk7Ac1IN3gAcWc20GUo1hEmQk3bNvQJtvFtNgQnJ3IXhGwmMVSR00If
         nKWqJLTCE94Bg5PE36ECTQYCyIS2TwWSUE94TLZLVG9ndnJn7Z3I/Z9/Sbd6SHy0gsj0
         WaSq76fyPC+RxRRCPweQ9fk0STIgWpC6uzU7s5fDJWUp0o3ES5NP7gYjyu2wgRCDbj+u
         TStQ==
X-Gm-Message-State: AOJu0YzFwYj9jDzL68BqWj4q+vZl05vn3YinLYrJ/ZeMef3GXTi5aBCA
	jxl7CQjEpiyqTiI9FIspBVdlphAI5pgpJS9J14zIzpGda0Rx8QQT3BJ3zQ0jzZZ0boSoeEdXZPE
	gQhWZXmxwbtHX9zhsrabCbvWp3wRLLHS9CjAFbmPrzy2/nfLzH8608fv06a9JvV4=
X-Received: by 2002:a05:600c:5844:b0:426:67f0:b4fa with SMTP id 5b1f17b1804b1-42ac8805ff1mr607125e9.1.1724313205253;
        Thu, 22 Aug 2024 00:53:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9hrOYs2q4f+fjvNcWUy1j3HYdgAupUMULtmjUPxzO2bk4MeOzgLCUihit5Wg+JUg3IrLESg==
X-Received: by 2002:a05:600c:5844:b0:426:67f0:b4fa with SMTP id 5b1f17b1804b1-42ac8805ff1mr606945e9.1.1724313204747;
        Thu, 22 Aug 2024 00:53:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b51:3b10:b0e7:ba61:49af:e2d5? ([2a0d:3344:1b51:3b10:b0e7:ba61:49af:e2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee86e9fsm52044295e9.13.2024.08.22.00.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 00:53:24 -0700 (PDT)
Message-ID: <3b1ca110-d1e7-47c5-af31-360a233cb4aa@redhat.com>
Date: Thu, 22 Aug 2024 09:53:22 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 09/12] testing: net-drv: add basic shaper test
To: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, Madhu Chittim <madhu.chittim@intel.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Simon Horman <horms@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Donald Hunter <donald.hunter@gmail.com>
References: <4cf74f285fa5f07be546cb83ef96775f86aa0dbf.1724165948.git.pabeni@redhat.com>
 <202408220027.kA3pRF6J-lkp@intel.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <202408220027.kA3pRF6J-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/21/24 18:52, kernel test robot wrote:
> Hi Paolo,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/tools-ynl-lift-an-assumption-about-spec-file-name/20240820-231626
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/4cf74f285fa5f07be546cb83ef96775f86aa0dbf.1724165948.git.pabeni%40redhat.com
> patch subject: [PATCH v4 net-next 09/12] testing: net-drv: add basic shaper test
> config: hexagon-randconfig-r112-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220027.kA3pRF6J-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce: (https://download.01.org/0day-ci/archive/20240822/202408220027.kA3pRF6J-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408220027.kA3pRF6J-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> net/shaper/shaper.c:227:24: sparse: sparse: Using plain integer as NULL pointer

AFAICS this warning comes directly from/is due to the hexgon cmpxchg 
implementation:

#define arch_cmpxchg(ptr, old, new)                             \
({                                                              \
         __typeof__(ptr) __ptr = (ptr);                          \
         __typeof__(*(ptr)) __old = (old);                       \
         __typeof__(*(ptr)) __new = (new);                       \
         __typeof__(*(ptr)) __oldval = 0;                        \
				^^^^^^^ here.

Cheers,

Paolo

