Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B2A23C8AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 04:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784693105; cv=none; b=OtL8rBow6ayT3nyy8w2j88FfDMpgW72dfmwOKn1QSDvRfyYT+pK5hFuJ69+pps/ocos/4/mQgYxfs3rJwqvaOcCAD99+ac674qTS98GsDEwtQgNBp6mexy//84OK0dhOVsGWDSFH4QtbpyZrttQxou3ojbkjXiaLZzNhsVpbXqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784693105; c=relaxed/simple;
	bh=do0S/KNLBUuJvfSJpjqwofl203oO3fZFMxEHnOXXGDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GykN2hj1fic/VVJhD8oTWVEw32yDb5JYWfisiFsNdnU0HFBM/Yn950QQVL28YgJBz8tP4SON3HlyHuBgepAQ0GR5pTEktPQWYqX5HMMwUDoEymm1pZ0k81LXdROdckCCdc6npcPq1Wc6oJTbziEssRxBGMphT6QdADiD0M9wGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmFO78Nb; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmFO78Nb"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so9370964a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 21:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784693103; x=1785297903; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPBjo6BGfk9k8cW5wKIuPZl/AzdZa3f9UG2VEy0pJ78=;
        b=RmFO78NbS3RNHM9yIe3CTcMEEomIjOOpA0jVoqc/kG757U6YCNfoLtjhIGc+XEwa5I
         SI+0zNBmxbP8iCfzq6o6HCgN9RZkmZtYPeeP6TXOTkBgWeiaARqdkPH8Y/2I/PMcp/TY
         wlSuUtwRmSq7GrMqiuOb55AsM/03ezt2StsrDOTeLQikNEDgXvZqgauRnwP97tsq6yzb
         IqSaPNOR2LGwRjdBDDcjnwqWCar0h2iwP/jq/5FqwKH4PHywL6tYj9nrgv6NwFkuUoDX
         LtwlwlQK4JI5vaIxNzy7Zu+PKdQ9f3Cvlmv2LsRGTO1/Wwk+PYJHCMNSVJmdvSd2DGye
         DOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784693103; x=1785297903;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SPBjo6BGfk9k8cW5wKIuPZl/AzdZa3f9UG2VEy0pJ78=;
        b=Jfu8Yam5MO59fJvFtwYUIEZwvTsGQAW4cb8ZDdXzOP2DZVDGdc94moNCgbcIEhfDXi
         HFU7xCTg55v1gG5SPvWuOqsFJ+wPgkWOOn1P9mqYtJGbx1HlzmMaP65+gbyGrOwBqi2E
         eqE/VGX0lGJa4vyiyumbEJbgClgtFgRXV3106wBvYVSQj4CB7rbdE6ORoaqIcxw04azV
         t1HjetoWfk8/EcthQ3pKhwYKEaBvJzb5If2j08+V1JNfW2pM7lhOZ5x/8VS1Dtna6XDJ
         9YlmPL9t47d12KgBSwRTeKPoqjNaHFbeA3vSASLCIhPjf39sAyEaonU/r1HabHawDS5v
         iJjA==
X-Gm-Message-State: AOJu0Yz48iQ7HcgzUxRp5qdAlwlE8koExYiAMk6N2/CkLyqnYE0RKqYW
	xPp/xqXtV1j4rQON+WTXmclWkn6byLOYBqjKa83nmRc2K1zIzp9de0dffCEkIQ==
X-Gm-Gg: AR+sD10P98SyBE6oOwGO3wYF0NLP7U4TWZqrOwdc8PHn8aV17ct/rC9lBRzovAHkzDw
	LBB2gqPxfdQzyrUOKSVaCvLVXOa1pfmyV9zSMiz5BV2u9MoWM7FyRasX58ucTjzOC7Oe6EshVY9
	4OO7Dqnq4wbfdr/Nt1t6BkHJUAQ1qBc/cpw4KntAvO0kE5pfIjY3CNGHZD6GhxFZ3vWUbiYZGgh
	o8qqtpInJxGDFZKlSA89TNyQfz3IMWuQFk6Anlm1A9ODN++dZWG8dhqjAE6jIICxGwGCbtzsImY
	hqy5EuoFVX/CxiBz1S8Ud+pi410jx355NaTAum0ZlwVT3U41oiE4Qkj4uRuzAWG2Rwp3gk2CoUs
	8dOZc8hj9z4PtV4YTR2IMlU1srIxxY5hf4mWhhyc6K3G52UEl71Mgr3PyebkD4it3468QwM/P/P
	etZ/Vq+6Hc/sfq0Bl+qudtO14t7TJEJEHQBB+nlBzJvz8XmOlNR0c=
X-Received: by 2002:a05:6a20:a10a:b0:3c3:88a5:83db with SMTP id adf61e73a8af0-3c3ad6036b0mr22873248637.5.1784693103235;
        Tue, 21 Jul 2026 21:05:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0686fsm3918762eec.14.2026.07.21.21.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 21:05:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <55920902-7b86-43e5-b22d-8c2794d1b3fa@roeck-us.net>
Date: Tue, 21 Jul 2026 21:05:01 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6914/8209]
 drivers/watchdog/watchdog_core.c:283:65: warning: '%d' directive output may
 be truncated writing between 1 and 10 bytes into a region of size 8
To: kernel test robot <lkp@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: oe-kbuild-all@lists.linux.dev
References: <202607221029.3DpWtIFm-lkp@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <202607221029.3DpWtIFm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 19:49, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   290aaf24a551d5a0dce037e3fab30820f9113a10
> commit: e9f47fe866d6b0aa026fe99df94f8cc2fadc2638 [6914/8209] watchdog: take all OF aliases into account when assigning id
> config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260722/202607221029.3DpWtIFm-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607221029.3DpWtIFm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607221029.3DpWtIFm-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/watchdog/watchdog_core.c: In function '___watchdog_register_device':
>>> drivers/watchdog/watchdog_core.c:283:65: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
>       283 |                         snprintf(alias, sizeof(alias), "watchdog%d", id);
>           |                                                                 ^~
>     drivers/watchdog/watchdog_core.c:283:56: note: directive argument in the range [0, 2147483647]
>       283 |                         snprintf(alias, sizeof(alias), "watchdog%d", id);
>           |                                                        ^~~~~~~~~~~~
>     drivers/watchdog/watchdog_core.c:283:25: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
>       283 |                         snprintf(alias, sizeof(alias), "watchdog%d", id);
>           |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +283 drivers/watchdog/watchdog_core.c
> 
>     240	
>     241	static int ___watchdog_register_device(struct watchdog_device *wdd)
>     242	{
>     243		int ret, min_id, id = -1;
>     244		struct device_node *np;
>     245		char alias[16];
>     246	
>     247		if (wdd == NULL || wdd->info == NULL || wdd->ops == NULL)
>     248			return -EINVAL;
>     249	
>     250		/* Mandatory operations need to be supported */
>     251		if (!wdd->ops->start || (!wdd->ops->stop && !wdd->max_hw_heartbeat_ms))
>     252			return -EINVAL;
>     253	
>     254		watchdog_check_min_max_timeout(wdd);
>     255	
>     256		/*
>     257		 * Note: now that all watchdog_device data has been verified, we
>     258		 * will not check this anymore in other functions. If data gets
>     259		 * corrupted in a later stage then we expect a kernel panic!
>     260		 */
>     261	
>     262		/* Use alias for watchdog id if possible */
>     263		if (wdd->parent) {
>     264			ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
>     265			if (ret >= 0)
>     266				id = ida_alloc_range(&watchdog_ida, ret, ret,
>     267						     GFP_KERNEL);
>     268		}
>     269	
>     270		/*
>     271		 * Find an id which is not pre-assigned via a DT alias to some
>     272		 * other, possibly not yet probed, watchdog device.
>     273		 */
>     274		if (id < 0) {
>     275			np = of_find_node_by_path("/aliases");
>     276	
>     277			for (min_id = 0; ; min_id = id + 1) {
>     278				id = ida_alloc_range(&watchdog_ida, min_id, MAX_DOGS - 1,
>     279						     GFP_KERNEL);
>     280				if (!np || id < 0)
>     281					break;
>     282	
>   > 283				snprintf(alias, sizeof(alias), "watchdog%d", id);

Sure, never mind that id can only be in the range of 0 .. MAX_DOGS - 1, or 1 .. 31.

I hate clueless compilers, but then I don't want to be bugged by this until
I die either. Rasmus, any suggestion ? We could make alias a 20-byte string,
or validate check the range of id. Not sure what would be less annoying.
Any preference or other idea ?

Don't resend the patch, I'll rebase and take care of it after we figure out
how to silence the compiler.

Thanks,
Guenter

