Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CFE1527AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721814945; cv=none; b=p2JVMf6OYavFwiCpWyahXXCIaeT48zwBGpg4nyQDJJrMAUu7NHjVtxZ06KjcU4MkZ+YvKRoBh/FKGDQJfwgpfL7FMYkBr5BirISJeVVf8v/O0xD72lwaWvhL509g60GmHjHNzYVKHYeb2hYQmolRHgl8Ql+mfGYwRXHnA/jopZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721814945; c=relaxed/simple;
	bh=bEf9i3q8JWjymxq2kT+h7N83RW/E0uLwiGr7WaT9Dc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdjl7LbzQpyyj7Xx3/mTgRxss5AGhH7FBYNzW2KenRutgsawelvUcAwKhL727l9HhO15IeDkddgxWiW5CWUsp3LphgchVnMpdGX4/O647ony0rquZBSDpUtZINUofX8YduCvRuARmh5S0716GysV/0ijronOl8oc6dqbkkzL9Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZgwN/4ud; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZgwN/4ud"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52fc14d6689so2969182e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721814941; x=1722419741; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhpSEukQ6m/m2O/CMOQous3Lt4aKITZyFanRBaLnxHk=;
        b=ZgwN/4udWtR+Mc5uGkSkfdiJbShWJRlbzhoNT2pg0BS71LDiI8hAXnz+GVXhFkgxLW
         QwMZg8glOzNS/2DHIxkK1lkgkAF8aQf5Cyzt8e9kCn+EyTl/LW7ZiLxUmtYUu37X0wgP
         f8Nu6QWyGwFouqVLcpEVJjOxfXsWwIn9/a2RyvBvkP21+GVeSRFZR2t2prDc0WnjoYDL
         CGvqrCscBQcBOr8tVlk+afkdf/cz9Uqjvw1pyJSeG3umohKK2Jbjylf2lFlSXwFHAK7l
         xAlWONgBwkmXqtJfv7F8AfDpQJKL42onvKSbGXALZVhQIjxqeQ1EbotN5krL/jluiryA
         69mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721814941; x=1722419741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhpSEukQ6m/m2O/CMOQous3Lt4aKITZyFanRBaLnxHk=;
        b=XlM1MYdybyFRLQzPbQSOA8REi6LJwTDR/NssaOLOE1dR3D3ju5R76s5HjGHuEAtzCV
         5aNmhdNkjMNnzuV9Yvi5pK+FhpbWp6eraMZ0cF4opg3JUrAlOyoDD/WqNfPRMSdv32Zf
         7KqcAfaR39EwQX9lTLnpJ9ui6Sef6lD9pmVNlCyn+i1g2EygXIdgMdW6kzBSpTChk9fH
         Ig9kDfZLlU+Hl4lqunSvUrhe9FfHdIw/X8XpV6ukXV6/YR4XB3jTRE9BAuexlPcn5aBF
         zxLPC2uvn9VXyOvmzsvdxu7R0XsFu8YpPijas4gKr+9oAb3tIk1dNaH/Z8kJCPtyoJUB
         NzNQ==
X-Gm-Message-State: AOJu0YyvyE1pPPH+dulEPMhHAuHcbGMYIsBmwy+r8I5I6amus+Pdh/Xg
	zOglGOJp7fC06WZx/jwN5mDKddzQjxckG+0MNtxMSGPFJmAZDcz6IjsUW/8V+PM=
X-Google-Smtp-Source: AGHT+IHSkQpsRs7vF2BLN0MDZhxdQ+UXOH+qiSLTm++pHNnEuJkjIxa1gpinn8CjHy6QcQic+o/nnw==
X-Received: by 2002:a05:6512:1114:b0:52c:e03d:dfd7 with SMTP id 2adb3069b0e04-52efb7a0d3cmr9399006e87.39.1721814941243;
        Wed, 24 Jul 2024 02:55:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2? (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de. [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7ab1f45134sm49614266b.91.2024.07.24.02.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jul 2024 02:55:41 -0700 (PDT)
Message-ID: <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
Date: Wed, 24 Jul 2024 11:55:39 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
To: Jan Beulich <jbeulich@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel test robot <lkp@intel.com>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.07.24 08:54, Jan Beulich wrote:
> On 24.07.2024 08:07, Juergen Gross wrote:
>> On 24.07.24 03:08, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
>>> head:   368990a7fe30737c990f628a60d26d9854a9e690
>>> commit: 368990a7fe30737c990f628a60d26d9854a9e690 [12/12] xen: fix multicall debug data referencing
>>> config: x86_64-randconfig-012-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/config)
>>> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240907.u0NJHgTu-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
>>
>> With current infrastructure this is not easily fixable, as there is no way
>> to tag a percpu variable as __refdata.
> 
> Would it be an option to drop the static initializer and set CPU0's value
> from xen_parse_mc_debug()?

It would hide this warning, yes.

OTOH I have another patch pending which will have the same problem, and this
time the solution would be more ugly, as the code would always be active in
a PV guest (yes, I could add an init function called very early during boot,
but ...).

I'd prefer a general way to handle this problem, like e.g. some kind of
__refdata tagging for percpu variables.


Juergen
