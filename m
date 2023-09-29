Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610D516E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 16:03:08 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c72e235debso6837265ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1696003388; x=1696608188; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxxOYCOcBAEgIYF5ux4H97KiIA06kyejBb/12t/8jPY=;
        b=eg4qMrUTgehgFW+P4e/webPttKx7a7RGH/30qJYa+WwsBUmoifeCk3+GtFhFYGAZ+5
         mQEmsFXd+MlXY776MMxWXgk4lSXhJGxTpLUc5dbobIISGKsG/x7JmjOPXaulP4ac9oLV
         AyE2BrwvbyXRHUBjQWFHozO8nDW2AL3ovpKphiFa6+Jb+IIiRE6RkthL2I8Swt9vcdQO
         DH0U84t0HJ2H4EOBDrUDuSXggU+FJckfb6Jqeo7B6Jr3azb5Xa7aARVyGxOUgvsvcVAL
         /4l4GptowrUoSQBBQBdH5cVadEBjMi2fhSAc2A13YkamVKNRx1/It7+u+fkZoG0LAFey
         KMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696003388; x=1696608188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxxOYCOcBAEgIYF5ux4H97KiIA06kyejBb/12t/8jPY=;
        b=T7wlC+0kJcMk8wDGprqPbr+i9FhfiikWYS+H47tI9Rbb1KzWkiya1no/7C7R3GuvP3
         6tjh0zuHex36AHIawuiL+2F7LBZmivHyamrbZ/uSxUMCbo7f+C9sJ8/VzSrtXW5TovKP
         LZhbOwDLv4mAysmKxay/o4iJHFkJrYiDM3/GJ2m2CQAzwkmHXLl10iD/jwt1fKQx3NEz
         /BhZtwdIcxsiRF+QkaRknv3iV8Z8mmExWSVY0t5wjHaR3SwKPiGEF3K6sJYexEbf5Ja4
         AX+uudm2lz5izHPnMjNDwwDAQeH0iP5BAgOeDPA7JckyMRspqc/R4qXPTRoztALUOS1o
         151w==
X-Gm-Message-State: AOJu0YwmaO1SqlD2wlB6yhq3V+0BNpnWad+WnK0n8SHPXRvN2F9mp+TX
	j2UgJOfj6Q/3fQvDQZiMhJBI/Q==
X-Google-Smtp-Source: AGHT+IEo9c0Z9thjc2US9kqnZKG6QU/rq3sYw4vNZkJK3FsntPQRNPSF32ptUAT1/+mOb360STF/JQ==
X-Received: by 2002:a17:903:22cc:b0:1b8:2ba0:c9a8 with SMTP id y12-20020a17090322cc00b001b82ba0c9a8mr4669460plg.2.1696003387929;
        Fri, 29 Sep 2023 09:03:07 -0700 (PDT)
Received: from [10.5.77.75] ([139.177.225.231])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ec8400b001c5f62a639asm13265774plg.196.2023.09.29.09.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 09:03:05 -0700 (PDT)
Message-ID: <b25c58b8-763d-7913-2d16-7f6bb53220f2@bytedance.com>
Date: Sat, 30 Sep 2023 00:03:00 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [linux-next:master 8008/8345] mm/shrinker.c:100:1-7: preceding
 lock on line 83 (fwd)
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Muchun Song <songmuchun@bytedance.com>, oe-kbuild-all@lists.linux.dev
References: <alpine.DEB.2.22.394.2309291632020.3137@hadrien>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <alpine.DEB.2.22.394.2309291632020.3137@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Julia,

On 2023/9/29 22:33, Julia Lawall wrote:
> Should shrinker_mutex be released on the error path?

Yes, and this has been fixed by 
https://lore.kernel.org/lkml/20230928141517.12164-1-zhengqi.arch@bytedance.com/.

Thanks,
Qi
	

> 
> julia
> 
> ---------- Forwarded message ----------
> Date: Fri, 29 Sep 2023 21:31:25 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [linux-next:master 8008/8345] mm/shrinker.c:100:1-7: preceding lock on
>      line 83
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: Linux Memory Management List <linux-mm@kvack.org>
> TO: Qi Zheng <zhengqi.arch@bytedance.com>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Linux Memory Management List <linux-mm@kvack.org>
> CC: Muchun Song <songmuchun@bytedance.com>
> 
> Hi Qi,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
> commit: 3b0ec351e30dfbe71675deb22da8a9fe1894c87f [8008/8345] mm: shrinker: convert shrinker_rwsem to mutex
> :::::: branch date: 9 hours ago
> :::::: commit date: 3 days ago
> config: x86_64-randconfig-103-20230927 (https://download.01.org/0day-ci/archive/20230929/202309292114.VMjkyBBq-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230929/202309292114.VMjkyBBq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202309292114.VMjkyBBq-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
>>> mm/shrinker.c:100:1-7: preceding lock on line 83
> 
> vim +100 mm/shrinker.c
> 
> 2babd0d6e9cfca Qi Zheng 2023-09-11   76
> 2babd0d6e9cfca Qi Zheng 2023-09-11   77  int alloc_shrinker_info(struct mem_cgroup *memcg)
> 2babd0d6e9cfca Qi Zheng 2023-09-11   78  {
> 2babd0d6e9cfca Qi Zheng 2023-09-11   79  	struct shrinker_info *info;
> b6884b5f15cf5a Qi Zheng 2023-09-11   80  	int nid, ret = 0;
> b6884b5f15cf5a Qi Zheng 2023-09-11   81  	int array_size = 0;
> 2babd0d6e9cfca Qi Zheng 2023-09-11   82
> 3b0ec351e30dfb Qi Zheng 2023-09-11  @83  	mutex_lock(&shrinker_mutex);
> b6884b5f15cf5a Qi Zheng 2023-09-11   84  	array_size = shrinker_unit_size(shrinker_nr_max);
> 2babd0d6e9cfca Qi Zheng 2023-09-11   85  	for_each_node(nid) {
> b6884b5f15cf5a Qi Zheng 2023-09-11   86  		info = kvzalloc_node(sizeof(*info) + array_size, GFP_KERNEL, nid);
> b6884b5f15cf5a Qi Zheng 2023-09-11   87  		if (!info)
> b6884b5f15cf5a Qi Zheng 2023-09-11   88  			goto err;
> 2babd0d6e9cfca Qi Zheng 2023-09-11   89  		info->map_nr_max = shrinker_nr_max;
> b6884b5f15cf5a Qi Zheng 2023-09-11   90  		if (shrinker_unit_alloc(info, NULL, nid))
> b6884b5f15cf5a Qi Zheng 2023-09-11   91  			goto err;
> 2babd0d6e9cfca Qi Zheng 2023-09-11   92  		rcu_assign_pointer(memcg->nodeinfo[nid]->shrinker_info, info);
> 2babd0d6e9cfca Qi Zheng 2023-09-11   93  	}
> 3b0ec351e30dfb Qi Zheng 2023-09-11   94  	mutex_unlock(&shrinker_mutex);
> 2babd0d6e9cfca Qi Zheng 2023-09-11   95
> 2babd0d6e9cfca Qi Zheng 2023-09-11   96  	return ret;
> b6884b5f15cf5a Qi Zheng 2023-09-11   97
> b6884b5f15cf5a Qi Zheng 2023-09-11   98  err:
> b6884b5f15cf5a Qi Zheng 2023-09-11   99  	free_shrinker_info(memcg);
> b6884b5f15cf5a Qi Zheng 2023-09-11 @100  	return -ENOMEM;
> 2babd0d6e9cfca Qi Zheng 2023-09-11  101  }
> 2babd0d6e9cfca Qi Zheng 2023-09-11  102
> 
> :::::: The code at line 100 was first introduced by commit
> :::::: b6884b5f15cf5acf6886ec0704d799035477ad7e mm: shrinker: add a secondary array for shrinker_info::{map, nr_deferred}
> 
> :::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> 
